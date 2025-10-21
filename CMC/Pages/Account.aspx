<%@ Page Language="C#" Title="Account" AutoEventWireup="true" MasterPageFile="~/Site.Master" 
    CodeBehind="Account.aspx.cs" Inherits="CMC.Pages.Account"
    EnableSessionState="true"
    
    %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- User Profile Section -->
    <main class="content">
        <section id="profile" class="section d-block ">
            <div class="container">
                <h2 class="mb-5 text-center">My Profile</h2>
                <div class="row justify-content-center">
                    <div class="col-md-10">
                        <div class="card glass">
                            <div class="card-body">
                                <div class="row">
                                    <!-- Left Profile Info -->
                                    <div class="col-md-4 text-center border-end">
                                        <div class="mb-3">
                                            <img id="profileImage" src="https://randomuser.me/api/portraits/men/1.jpg" alt="Profile" class="rounded-circle shadow" width="140" height="140">
                                        </div>
                                        <h5 id="profileName" class="fw-bold">Client Name</h5>
                                        <p class="text-muted" id="profileRole">Customer</p>
                                        <button class="btn btn-outline-primary mt-2" id="changePhotoBtn">
                                            <i class="fas fa-camera me-1"></i>Change Photo
                                        </button>
                                    </div>

                                    <!-- Right Profile Form -->
                                    <div class="col-md-8">
                                        <div id="profileForm">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label for="profileFirstName" class="form-label">First Name</label>
                                                        <input type="text" class="form-control" id="profileFirstName" value="">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label for="profileLastName" class="form-label">Last Name</label>
                                                        <input type="text" class="form-control" id="profileLastName" value="">
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="mb-3">

                                                        <label for="profileEmail" class="form-label">Email Address</label>
                                                        <input type="email" class="form-control" id="profileEmail" value="">
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label for="profilePhone" class="form-label">Phone Number</label>
                                                        <input type="tel" class="form-control" id="profilePhone" value="">
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label for="profileAddress" class="form-label">Address</label>
                                                        <textarea class="form-control" id="profileAddress" rows="1"></textarea>
                                                    </div>
                                                </div>

                                                <div class="col-md-6 ctmHide">
                                                    <div class="mb-3">
                                                        <label for="oldPassword" class="form-label">Old Password</label>
                                                        <input type="password" id="oldPassword" class="form-control" >
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label for="newPassword" class="form-label">New Password</label>
                                                        <input type="password" id="newPassword" class="form-control" >
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label for="confirmPassword" class="form-label">Confirm New Password</label>
                                                        <input type="password" id="confirmPassword" class="form-control" >
                                                    </div>
                                                </div>







                                                <div class="col-md-6">
                                                    <div class="d-flex justify-content-start mt-4">
                                                        <button type="button" class="btn btn-secondary me-2">Cancel</button>
                                                        <button type="button" class="btn btn-secondary me-2" id="resetProfile">Reset</button>


                                                        <button type="submit" class="btn btn-primary" id="saveProfile">Save</button>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <!-- row end -->
                            </div>
                            <!-- card-body end -->
                        </div>
                        <!-- card end -->
                    </div>
                    <!-- col end -->
                </div>
                <!-- row end -->
            </div>
            <!-- container end -->
        </section>
    </main>

    <style>
        .hide {
    display: none !important;
}

    </style>
    <script>
        function showAlert(message, type = 'info') {
            const alertClass = type === 'error' ? 'danger' : type === 'success' ? 'success' : 'info';
            const alertBox = $(`
            <div class="alert alert-${alertClass} alert-dismissible fade show position-fixed top-0 end-0 m-3" style="z-index:1055;">
                ${message}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        `);
            $('body').append(alertBox);
            setTimeout(() => alertBox.alert('close'), 3000);
        }

        function loadProfileData() {
            const isLoggedIn = localStorage.getItem('isLoggedIn');
            const userType = localStorage.getItem('userType');

            if (!isLoggedIn || !userType) return; // not logged in, skip

            const userName = localStorage.getItem('userName') || '';
            const userEmail = localStorage.getItem('userEmail') || '';
            const userRole = localStorage.getItem('userRole') || 'Customer';
            const userPhone = localStorage.getItem('userPhone') || '';
            const userAddress = localStorage.getItem('userAddress') || '';
            const userPhoto = localStorage.getItem('userPhoto') || 'https://randomuser.me/api/portraits/men/1.jpg';

            $('#profileName').text(userName);
            $('#profileRole').text(userRole);
            $('#profileEmail').val(userEmail);
            $('#profilePhone').val(userPhone);
            $('#profileAddress').val(userAddress);
            $('#profileImage').attr('src', userPhoto);

            const nameParts = userName.split(' ');
            $('#profileFirstName').val(nameParts[0] || '');
            $('#profileLastName').val(nameParts[1] || '');
        }

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
            //console.warn(invalidMessage);
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

            return true; // ✅ passwords are valid or not entered
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

            var checkNew = isNewClient();
            const isNew = checkNew.action; // "new" or "view"

            // Password validation function
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
                passwordHash: newPass || null, // send new password only if changing
                clientId: isNew === "view" ? $('#clientId').val() : null
            };


            $.ajax({
                type: "POST",
                url: "/Pages/Account.aspx/SaveProfile",
                data: JSON.stringify(dataToSend),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log(response);
                    let res;
                    try {
                        res = JSON.parse(response.d);

                        console.log('PARSED');
                        console.log(response);
                    } catch {
                        res = { p_Success: 1, p_Message: response.d || "Profile saved successfully!" };
                    }
                    showAlert(
                        res.p_Success == 1
                            ? (isNew === 'new' ? "✅ Profile created!" : "✅ Profile updated!")
                            : "❌ " + res.p_Message,
                        res.p_Success == 1 ? 'success' : 'error'
                    );
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
            const clientCode = localStorage.getItem('clientID');
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

    


        $(document).ready(function () {

            loadClientProfile();

            // ------------------------
            // Save/Create profile
            // ------------------------
            $('#saveProfile').on('click', function (e) {
                e.preventDefault();

                profileAddUpdate();

            });


            // ------------------------
            // Reset button click
            // ------------------------
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

            // ------------------------
            // Initialize
            // ------------------------
            //loadProfileData();
            isNewClient();
        });
    </script>


</asp:Content>

