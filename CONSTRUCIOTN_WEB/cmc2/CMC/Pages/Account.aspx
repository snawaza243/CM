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
                                                    <label for="profileEmail" class="form-label">Email Address</label>
                                                    <input type="email" class="form-control" id="profileEmail" value="">
                                                </div>

                                                <div class="col-md-6">
                                                    <label for="profilePhone" class="form-label">Phone Number</label>
                                                    <input type="tel" class="form-control" id="profilePhone" value="">
                                                </div>

                                                <div class="col-md-12">
                                                    <label for="profileAddress" class="form-label">Address</label>
                                                    <textarea class="form-control" id="profileAddress" rows="2"></textarea>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="d-flex justify-content-end">
                                                        <button type="button" class="btn btn-secondary me-2">Cancel</button>
                                                        <button type="button" class="btn btn-secondary me-2" id="resetProfile">Reset</button>


                                                        <button type="submit" class="btn btn-primary" id="saveProfile">Save Changes</button>
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


    <script>
        // ------------------------
        // Helper: Show alert
        // ------------------------
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

        // ------------------------
        // Load profile data
        // ------------------------
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

        // ------------------------
        // Reset profile form (new action or reset button)
        // ------------------------
        function resetProfileForm() {
            $('#profileFirstName, #profileLastName, #profileEmail, #profilePhone, #profileAddress').val('');
            $('#profileName').text('New Client');
            $('#profileRole').text('New Account');
            $('#profileImage').attr('src', 'https://via.placeholder.com/140');
        }

        // ------------------------
        // Parse URL for "new" action
        // ------------------------

        function isClientNew() {

            const urlParams = new URLSearchParams(window.location.search);
            const action = urlParams.get('action');

            if (action === "new") {
                resetProfileForm();
                $("#saveProfile").text("Create Profile");
            }
        }



        function profileAddUpdate() {
            const firstName = $('#profileFirstName').val().trim();
            const lastName = $('#profileLastName').val().trim();
            const email = $('#profileEmail').val().trim();
            const phone = $('#profilePhone').val().trim();
            const address = $('#profileAddress').val().trim();
            const fullName = `${firstName} ${lastName}`.trim();

            if (!firstName || !email) {
                showAlert('Please fill required fields.', 'error');
                return;
            }            

            //showAlert(action === "new" ? "Profile created!" : "Profile updated!", 'success');

            showAlert(`Going into ajax`);
            $.ajax({
                type: "POST",
                url: "/Pages/Account.aspx/CreateProfile",
                data: JSON.stringify({ firstName, lastName, email, phone, address }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    const serverMessage = response.d || "Profile saved successfully!";
                    //alert("✅ " + serverMessage);
                    showAlert("✅ " + serverMessage, 'infor')
                },
                error: function (xhr, status, error) {
                    let errorMessage = xhr.responseText || error || "Unknown error occurred.";
                    showAlert("❌ Error: " + errorMessage,'error');
                }
            });
        }


        $(document).ready(function () {

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
            isClientNew();
        });
    </script>


</asp:Content>

