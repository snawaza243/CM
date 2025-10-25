
function handleLogin() {
  
    $('.login-link').click(function (e) {
        e.preventDefault();
        e.stopPropagation();

        $('#loginModal').modal('show');
        $('#loginModal').on('shown.bs.modal', function () {
            $('#loginEmail').focus();
        });
    });
}

function handlLoginClick() {
    $('#btn-login').click(function (e) {
        e.preventDefault();
        e.stopPropagation();
        performLoginAjax();
    });
}

function handleLoginOnEnter() {
    // Handle Enter key in login form
    $('#loginEmail, #loginPassword').on('keypress', function (e) {
        if (e.which === 13) {
            performLoginAjax();
        }
    });

}


function setupRememberMe(modalId, options, action = null) {

    /**
 * Handles "Remember Me" logic for any modal form
 * @param {string} modalId - The ID of the Bootstrap modal (without #)
 * @param {object} options - Configuration options
 *   options.storageKey - The key name for localStorage
 *   options.emailField - Selector for email input
 *   options.passwordField - Selector for password input
 *   options.rememberCheck - Selector for "Remember me" checkbox
    */

    const key = options.storageKey || "cmUserLoginInfo";

    // === Load data when modal opens ===
    $("#" + modalId).on("show.bs.modal", function () {
        const savedData = localStorage.getItem(key);
        if (savedData) {
            const info = JSON.parse(savedData);
            if (info.remember) {
                $(options.emailField).val(info.email || "");
                $(options.passwordField).val(info.password || "");
                $(options.rememberCheck).prop("checked", true);
            } else {
                $(options.emailField).val("");
                $(options.passwordField).val("");
                $(options.rememberCheck).prop("checked", false);
            }
        }
    });

    if (action === '1') {

        const email = $(options.emailField).val().trim();
        const password = $(options.passwordField).val().trim();
        const remember = $(options.rememberCheck).is(":checked");

        const data = { email, password, remember };

        if (remember) {
            localStorage.setItem(key, JSON.stringify(data));
        } else {
            localStorage.removeItem(key);
        }
    }

}

function performLoginAjax() {
    const identifier = $('#loginEmail').val().trim();
    const password = $('#loginPassword').val().trim();

   

     


    if (!identifier || !password) {
        showAlert('Please fill in all fields', 'error');
        return;
    }

    $('#btn-login').prop('disabled', true).text('Logging in...');

    $.ajax({
        type: "POST",
        url: "/Pages/Account.aspx/ClientLogin",
        data: JSON.stringify({ identifier: identifier, inputPassword: password }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            const data = response.d || response; // depending on ASP.NET serialization

            if (data.success) {
                //localStorage.setItem("clientID", data.clientCode);

                setClientSession(data.clientCode);

                updateUserInterface(true);
                $('#loginModal').modal('hide');
                showAlert(`✅ Welcome!`, 'success');

                setupRememberMe("loginModal", {
                    storageKey: "cmUserLoginInfo",
                    emailField: "#loginEmail",
                    passwordField: "#loginPassword",
                    rememberCheck: "#md-login-rememberMe"
                }, "1");

                window.location.replace('/Pages/Account.aspx?action=view');
            } else {
                showAlert('❌ ' + (data.message || 'Login failed'), 'error');
                $('#loginPassword').val('').focus();
            }
        },
        error: function (xhr, status, error) {
            console.error('AJAX Error:', status, error, xhr.responseText);
            showAlert('❌ Login error. Please try again.', 'error');
        },
        complete: function () {
            $('#btn-login').prop('disabled', false).text('Login');
        }
    });
}

function setClientSession(clientID) {

    // Store session data for 10 minutes (600,000 ms)
    const expiryTime = Date.now() + (10 * 60 * 1000); // 10 minutes in ms
    const sessionData = {
        value: clientID,
        expiry: expiryTime
    };
    sessionStorage.setItem("clientID", JSON.stringify(sessionData));
}

function getClientSession() {
// Retrieve client session (auto-clear if expired)

    const data = sessionStorage.getItem("clientID");
    if (!data) return null;

    const session = JSON.parse(data);
    if (Date.now() > session.expiry) {
        showAlert('Session expire, kindly login!');
        sessionStorage.removeItem("clientID");
        window.location.href = '/';
        return null;
    }

    return session.value;
}

function populateClientDropdown(ddlId, logId, logName) {
    /* for prepare the ddl option for add quote request
    ddlId  : ID of the <select> element (e.g., "projectClient")
    logId  : client code of the logged-in user (e.g., "CL_001")
    logName: name of the logged-in user (e.g., "John Doe")
    */

    /*  WIth Hidden Elements
 < !--Hidden element storing logged -in user info-- >
     <span id="user-name" data-client-code="CL_001" style="display:none;">John Doe</span>

 var currentUserEl = $(currentUserSelector);
 var currentClientCode = currentUserEl.data("client-code") || "";
 var currentClientName = currentUserEl.text() || "Current User";

 */

    var ddl = $("#" + ddlId);
    ddl.empty();

    // 1. First option: "Select Client" (disabled)
    ddl.append('<option value="" selected disabled>Select Client</option>');

    // 2. Current logged-in user
    ddl.append('<option value="' + logId + '">' + logName + '</option>');

    // 3. Other option
    ddl.append('<option value="">Other</option>');

    // 4. Add New Client
    ddl.append('<option value="new">+ Add New Client</option>');
}

function updateUserInterface() {
    const clientCode = getClientSession();
    if (!clientCode) {
        $('.login-link').show();
        $('.logged-in-options').hide();
        return;
    }

    $.ajax({
        type: "POST",
        url: "/Pages/Account.aspx/GetClientProfile",
        data: JSON.stringify({ clientCode: clientCode }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            const data = response.d || response; // Handle JSON serialization

            if (data.success && data.data) {
                const profile = data.data;

                const userName = profile.FIRSTNAME || '' + profile.LASTNAME || '';
                const userRole = profile.USERROLE || '';

                populateClientDropdown("projectClient", clientCode, userName);


                // Hide login link, show user options
                $('.login-link').hide();
                $('.logged-in-options').show();

                // Update user info
                $('.user-name').text(userName);
                $('.user-role').text(userRole.charAt(0).toUpperCase() + userRole.slice(1));
            } else {
                showAlert('❌ Could not load profile data', 'error');
            }
        },
        error: function (xhr, status, error) {
            //console.error('Error fetching client profile:', status, error, xhr.responseText);
            showAlert('❌ Error loading profile. Please try again.', 'error');
        }
    });
}

function handleProfileClick() {
    $(document).on('click', '.profile-link', function (e) {
        e.preventDefault();

        const userType = getClientSession();
        if (!userType) {
            showAlert('Please log in to view your profile', 'error');
            return;
        }

        window.location.href = `/Pages/Account.aspx?action=view`;
    });
}

function handleLogout() {
    $(document).on('click', '.logout-btn', function (e) {
        e.preventDefault();
        sessionStorage.removeItem("clientID");
        updateUserInterface(false);
        showAlert('You have been logged out', 'info');
        window.location.replace('/');
    });
}


function checkPageForProjectLoad() {
    const urlParams = new URLSearchParams(window.location.search);
    const action = urlParams.get('action');

    if (action === 'view') {
        const user = getClientSession();
        if (user) {
            loadProjects(user);
        }


    }

}


function handleProfImgChagneClick() {

    // When the "Change Photo" button is clicked
    $('#changePhotoBtn').on('click', function () {
        $('#fileInput').click(); // trigger hidden file input
    });

    // When an image file is selected
    $('#fileInput').on('change', function (event) {
        const file = event.target.files[0];

        if (file && file.type.startsWith('image/')) {
            const reader = new FileReader();

            reader.onload = function (e) {
                $('#profileImage').attr('src', e.target.result); // preview new image
            };

            reader.readAsDataURL(file);
        } else {
            alert('Please select a valid image file.');
        }
    });
}



// Helper function to format status badge
function getStatusBadge(status) {
    if (!status) return '';

    const s = status.toLowerCase().trim();

    // Map of keywords to badge HTML
    const statusMap = [
        { keywords: ["in progress", "progress"], badge: '<span class="badge bg-success">In Progress</span>' },
        { keywords: ["pending", "pending approval"], badge: '<span class="badge bg-warning text-dark">Pending Approval</span>' },
        { keywords: ["approved"], badge: '<span class="badge bg-primary">Approved</span>' },
        { keywords: ["rejected"], badge: '<span class="badge bg-danger">Rejected</span>' },
        { keywords: ["completed", "done"], badge: '<span class="badge bg-info text-dark">Completed</span>' },
        { keywords: ["cancel", "cancelled"], badge: '<span class="badge bg-danger">Cancelled</span>' },
        { keywords: ["on hold"], badge: '<span class="badge bg-secondary">On Hold</span>' },
        { keywords: ["draft", "initiated"], badge: '<span class="badge bg-light text-dark">Draft</span>' }
    ];

    // Find matching badge
    for (const item of statusMap) {
        for (const keyword of item.keywords) {
            if (s.includes(keyword)) return item.badge;
        }
    }

    // Default badge if no match
    return `<span class="badge bg-light text-dark">${status}</span>`;
}

// Example usage
// console.log(getStatusBadge("Approved"));
// console.log(getStatusBadge("Rejected"));
// console.log(getStatusBadge("In Progress"));
// console.log(getStatusBadge("Pending Approval"));


// Helper function to format date as dd/mm/yyyy
function formatDate(dateVal) {
    if (!dateVal) return '';
    const date = new Date(dateVal);
    const dd = String(date.getDate()).padStart(2, '0');
    const mm = String(date.getMonth() + 1).padStart(2, '0');
    const yyyy = date.getFullYear();
    return `${dd}/${mm}/${yyyy}`;
}

function loadProjectOnClientChange(ddl) {
    $(ddl).on("change", function () {
        const clientCode = $(this).val();
        if (clientCode) loadProjects(clientCode);
    });
}


// ADD/ UPDATE CLIENT



function resetProfileForm() {
    $('#profileFirstName, #profileLastName, #profileEmail, #profilePhone, #profileAddress').val('');
    $('#profileName').text('New Client');
    $('#profileRole').text('New Account');
    $('#profileImage').attr('src', 'https://via.placeholder.com/140');
}



function isNewClient() {
    const urlParams = new URLSearchParams(window.location.search);
    const action = urlParams.get('action');

    if (action === null) {
        const message = "❌ Error: Missing 'action' parameter. Redirecting to home...";
        //alert(message);
        window.location.href = "/";
        return { success: false, action: null, message: message };
    }

    if (action === "new") {
        resetProfileForm();

        $('.ctmHide').addClass('hide');
        $("#saveProfile").text("Create");
        return { success: true, action: "new", message: "New client profile mode activated." };
    }

    if (action === "view") {
        $("#saveProfile").text("Update");
        return { success: true, action: "view", message: "Client profile view/edit mode activated." };
    }

    const invalidMessage = `⚠️ Invalid 'action' value '${action}'. Redirecting to home...`;
    //alert(invalidMessage);
    window.location.href = "/";
    return { success: false, action: action, message: invalidMessage };
}

function validatePasswords(isNewMode, oldPass, newPass, confirmPass) {
    if (isNewMode === "view") {
        const isPasswordChangeAttempt = oldPass || newPass || confirmPass;

        if (isPasswordChangeAttempt) {
            if (!oldPass || !newPass || !confirmPass) {
                showAlert("⚠️ Please fill in all password fields to change your password.", "error");
                return false;
            }

            if (newPass === oldPass) {
                showAlert("❌ New password cannot be the same as old password.", "error");
                return false;
            }

            if (newPass !== confirmPass) {
                showAlert("❌ New password and confirm password do not match.", "error");
                return false;
            }
        }
    } else if (isNewMode === "new") {
        const isPasswordChangeAttempt = newPass || confirmPass;

        if (isPasswordChangeAttempt) {
            if (!newPass || !confirmPass) {
                showAlert("⚠️ Please fill in both new and confirm password fields.", "error");
                return false;
            }

            if (newPass !== confirmPass) {
                showAlert("❌ New password and confirm password do not match.", "error");
                return false;
            }
        }
    }

    return true;
}




function profileAddUpdate() {
    const firstName = $('#profileFirstName').val().trim();
    const lastName = $('#profileLastName').val().trim();
    const email = $('#profileEmail').val().trim();
    const phone = $('#profilePhone').val().trim();
    const address = $('#profileAddress').val().trim();
    const oldPass = $("#oldPassword").val().trim();
    const newPass = $("#newPassword").val().trim();
    const confirmPass = $("#confirmPassword").val().trim();
    const imageData = $('#profileImage').attr('src');


    var checkNew = isNewClient();
    const isNew = checkNew.action;

    const passwordsValid = validatePasswords(isNew, oldPass, newPass, confirmPass);
    if (!passwordsValid) return;

    // Required fields validation
    if (!firstName || !email) {
        showAlert('⚠️ Please fill required fields.', 'error');
        return;
    }

    // Prepare data for AJAX
    const dataToSend = {
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        address: address,
        isNew: isNew,
        passwordHash: newPass + '@#$PASS@#$' + oldPass || null, // send new password only if changing
        clientId: isNew === "view" ? getClientSession() : null,
        avatar: imageData
    };


    $.ajax({
        type: "POST",
        url: "/Pages/Account.aspx/SaveProfile",
        data: JSON.stringify(dataToSend),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            console.log(response);
            // Assuming `response` is the AJAX success result
            let res;

            try {
                // If response.d is already an object (not a string), no need to parse again
                res = typeof response.d === "string" ? JSON.parse(response.d) : response.d;

                console.log("Parsed Response:", res);

                // ✅ Set session only if success and clientCode exist
                if (res.success && res.clientCode) {
                    setClientSession(res.clientCode);
                }

                // ✅ Prepare alert message
                const msg = res.success
                    ? (isNew === 'new'
                        ? " Profile created successfully!"
                        : " Profile updated successfully!")
                    : " " + (res.message || "Operation failed.");

                const type = res.success ? 'success' : 'error';
                const icon = res.success ? "✅" : "❌";

                showAlert(`${icon} ${msg}`, type);

            } catch (err) {
                console.error("Response parse error:", err, response);
                showAlert("⚠️ Unexpected response format.", "error");
            }


        },
        error: function (xhr, status, error) {
            let errorMessage = xhr.responseText || error || "Unknown error occurred.";
            showAlert("❌ Error: " + errorMessage, 'error');
        }
    });
}

function clientLogin() {
    var data = {
        clientId: $('#loginClientID').val(),
        email: $('#loginEmail').val(),
        phone: $('#loginPhone').val(),
        passwordHash: $('#loginPassword').val()
    };

    $.ajax({
        type: "POST",
        url: "YourPage.aspx/ClientLogin",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var res = JSON.parse(response.d);
            if (res.p_Success == 1) {
                alert("Welcome! ClientCode: " + res.p_ClientCode);
            } else {
                alert(res.p_Message);
            }
        },
        error: function (xhr, status, error) {
            alert("Error: " + error);
        }
    });
}


function loadClientProfile() {
    // Only run if the page is in 'view' mode
    const urlParams = new URLSearchParams(window.location.search);
    const action = urlParams.get('action');
    if (action !== 'view') return;

    // Check for clientID in localStorage (or session)
    const clientCode = getClientSession();
    if (!clientCode) {
        showAlert('Client not logged in. Redirecting to login...', 'info');
        //wantToLogin();
        window.location.replace('/');
        return;
    }

    // Call WebMethod to fetch profile
    $.ajax({
        type: "POST",
        url: "/Pages/Account.aspx/GetClientProfile",
        data: JSON.stringify({ clientCode: clientCode }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            const data = response.d || response; // Handle JSON serialization

            if (data.success && data.data) {
                const profile = data.data;

                // Populate UI fields
                $('#profileFirstName').val(profile.FIRSTNAME || '');
                $('#profileLastName').val(profile.LASTNAME || '');
                $('#profileEmail').val(profile.EMAIL || '');
                $('#profilePhone').val(profile.PHONE || '');
                $('#profileAddress').val(profile.ADDRESS || '');
                $('#profileName').text(`${profile.FIRSTNAME || ''} ${profile.LASTNAME || ''}`.trim());
                $('#profileRole').text(profile.ROLE || 'Customer');
                $('#profileImage').attr('src', profile.PROFILE_IMAGE);


                if (profile.IMAGEURL) {
                    $('#profileImage').attr('src', profile.IMAGEURL);
                }
            } else {
                showAlert('❌ Could not load profile data', 'error');
            }
        },
        error: function (xhr, status, error) {
            console.error('Error fetching client profile:', status, error, xhr.responseText);
            showAlert('❌ Error loading profile. Please try again.', 'error');
        }
    });
}


function handleProfReset() {

    $('#resetProfile').on('click', function () {

        if (confirm('Do you want to reset the form?')) {
            if (action === "new") {
                resetProfileForm(); // clear for new
            } else {
                loadProfileData(); // revert to saved values
            }
            showAlert('Form reset.', 'info');
        }
    });
}

function handleAddUpdateClient() {
    $('#saveProfile').on('click', function (e) {
        e.preventDefault();
        profileAddUpdate();
    });

}


$(document).ready(function () {

    setupRememberMe("loginModal", {
        storageKey: "cmUserLoginInfo",
        emailField: "#loginEmail",
        passwordField: "#loginPassword",
        rememberCheck: "#md-login-rememberMe"
    });

    // Keep check and logout on session expire
    setInterval(() => {
        if (!getClientSession()) {

            sessionStorage.removeItem("clientID");
        }
    }, 60000); // 1 minute check

    updateUserInterface(); // loggedStatus

    checkPageForProjectLoad();

    handleLogin();

    handleLogout();

    handleProfileClick();

    handlLoginClick();

    handleLoginOnEnter();

    handleProfImgChagneClick();

    handleProfReset();

    loadClientProfile();

    handleAddUpdateClient();

    //isNewClient();

});
