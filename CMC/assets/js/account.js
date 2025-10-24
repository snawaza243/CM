function populateClientDropdown(ddlId, logId, logName) {
    /*
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

// Store session data for 10 minutes (600,000 ms)
function setClientSession(clientID) {
    const expiryTime = Date.now() + (10 * 60 * 1000); // 10 minutes in ms
    const sessionData = {
        value: clientID,
        expiry: expiryTime
    };
    sessionStorage.setItem("clientID", JSON.stringify(sessionData));
}

// Retrieve client session (auto-clear if expired)
function getClientSession() {
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

function wantToLogin() {
    $('#loginModal').modal('show');
    $('#loginModal').on('shown.bs.modal', function () {
        $('#loginEmail').focus();
    });
}



/**
 * Handles "Remember Me" logic for any modal form
 * @param {string} modalId - The ID of the Bootstrap modal (without #)
 * @param {object} options - Configuration options
 *   options.storageKey - The key name for localStorage
 *   options.emailField - Selector for email input
 *   options.passwordField - Selector for password input
 *   options.rememberCheck - Selector for "Remember me" checkbox
 */
function setupRememberMe(modalId, options, action= null) {
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

$(document).on('click', '.logout-btn', function (e) {
    e.preventDefault();
    sessionStorage.removeItem("clientID");
    updateUserInterface(false);
    showAlert('You have been logged out', 'info');
    window.location.replace('/');
});

// Open profile
$(document).on('click', '.profile-link', function (e) {
    e.preventDefault();

    const userType = getClientSession();
    if (!userType) {
        showAlert('Please log in to view your profile', 'error');
        return;
    }

    window.location.href = `/Pages/Account.aspx?action=view`;
});

$(document).ready(function () {

    setupRememberMe("loginModal", {
        storageKey: "cmUserLoginInfo",
        emailField: "#loginEmail",
        passwordField: "#loginPassword",
        rememberCheck: "#md-login-rememberMe"
    });


    $('.btn').click(function (e) {
        e.preventDefault();
        e.stopPropagation();
    });

    // Optional: check every minute and auto-remove if expired
    setInterval(() => {
        if (!getClientSession()) {

            sessionStorage.removeItem("clientID");
        }
    }, 60000); // 1 minute check


    updateUserInterface(); // loggedStatus

    // Event handlers
    $('.login-link').click(function (e) {
        e.preventDefault();
        e.stopPropagation();
        wantToLogin();
    });

    $('#btn-login').click(function (e) {
        e.preventDefault();
        e.stopPropagation();
        performLoginAjax();
    });

    // Handle Enter key in login form
    $('#loginEmail, #loginPassword').on('keypress', function (e) {
        if (e.which === 13) {
            performLoginAjax();
        }
    });
});
