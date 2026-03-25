<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="FSCN.Login"
    EnableSessionState="true" EnableEventValidation="false" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">


    <!-- Page Hero Section -->
    <section class="page-hero">
        <div class="container">
            <h1 class="display-4 fw-bold">Account Access</h1>
            <p class="lead">Login to your account or create a new one to access all features</p>
        </div>
    </section>


    <!-- Login/Signup Section -->
    <section class="py-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10">


                    <ul class="nav nav-pills nav-justified mb-4" id="authTabs" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="login-tab" data-bs-toggle="pill" data-bs-target="#login" type="button" role="tab" aria-controls="login" aria-selected="true">Login</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="signup-tab" data-bs-toggle="pill" data-bs-target="#signup" type="button" role="tab" aria-controls="signup" aria-selected="false">Sign Up</button>
                        </li>
                    </ul>

                    <div class="tab-content" id="authTabsContent">
                        <!-- Login Form -->
                        <div class="tab-pane fade show active" id="login" role="tabpanel" aria-labelledby="login-tab">
                            <div class="card shadow">
                                <div class="card-body p-0">
                                    <div class="row g-0">
                                        <!-- Left side - login form -->
                                        <div class="col-md-7">
                                            <div class="p-5">
                                                <h3 class="text-center mb-4">Sign In to Your Account</h3>

                                                <asp:Panel ID="loginForm" runat="server">
                                                    <!-- Email -->
                                                    <div class="mb-3">
                                                        <asp:Label ID="Label1" runat="server" Text="Email Address" AssociatedControlID="txtEmail" CssClass="form-label"></asp:Label>
                                                        <asp:TextBox ID="txtLoginEmail" runat="server" CssClass="form-control form-control-lg" TextMode="Email"></asp:TextBox>
                                                    </div>

                                                    <!-- Password -->
                                                    <div class="mb-3">
                                                        <asp:Label ID="Label2" runat="server" Text="Password" AssociatedControlID="txtPassword" CssClass="form-label"></asp:Label>
                                                        <asp:TextBox ID="txtLoginPassword" runat="server" CssClass="form-control form-control-lg" TextMode="Password"></asp:TextBox>
                                                        <div class="form-text">
                                                            <a href="#forgotPasswordModal" data-bs-toggle="modal">Forgot password?</a>
                                                        </div>
                                                    </div>

                                                    <!-- Login As -->
                                                    <div class="mb-3">
                                                        <asp:Label ID="lblLoginAs" runat="server" Text="Login As" AssociatedControlID="ddlLoginAs" CssClass="form-label"></asp:Label>
                                                        <asp:DropDownList ID="ddlLoginAs" runat="server" CssClass="form-select form-select-lg">
                                                            <asp:ListItem Text="-- Select --" Value=""></asp:ListItem>
                                                            <asp:ListItem Text="Admin" Value="admin"></asp:ListItem>
                                                            <asp:ListItem Text="User" Value="user"></asp:ListItem>

                                                            <asp:ListItem Text="Manager" Value="manager"></asp:ListItem>
                                                            <asp:ListItem Text="Employee" Value="employee"></asp:ListItem>
                                                            <asp:ListItem Text="Customer" Value="customer"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>

                                                    <!-- Remember Me -->
                                                    <div class="mb-3 form-check">
                                                        <asp:CheckBox ID="chkLoginRememberMe" runat="server" CssClass="form-check-input" />
                                                        <asp:Label ID="lblRememberMe" runat="server" Text="Remember me" AssociatedControlID="chkLoginRememberMe" CssClass="form-check-label"></asp:Label>
                                                    </div>

                                                    <!-- Login Button -->
                                                    <asp:UpdatePanel ID="UpdatePanelLogin" runat="server">
                                                        <ContentTemplate>
                                                            <div class="d-grid">
                                                                <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary btn-lg"
                                                                    Text="Login" OnClick="btnLogin_Click" />
                                                            </div>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>

                                                    <!-- Social Login -->
                                                    <div class="text-center mt-4">
                                                        <p>Or login with</p>
                                                        <div class="d-flex justify-content-center gap-3">
                                                            <button type="button" class="btn btn-outline-primary">
                                                                <i class="fab fa-google"></i>Google
                                                            </button>
                                                            <button type="button" class="btn btn-outline-primary">
                                                                <i class="fab fa-facebook-f"></i>Facebook
                                                            </button>
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>

                                        </div>

                                        <!-- Right side section -->
                                        <div class="col-md-5 d-none d-md-block bg-primary">
                                            <div class="h-100 d-flex flex-column justify-content-center text-center text-white p-4">
                                                <i class="fas fa-user-lock display-1 mb-4"></i>
                                                <h3>Welcome Back!</h3>
                                                <p class="mb-4">Sign in to access your personalized dashboard, settings, and more.</p>
                                                <div class="bg-white p-2 rounded">
                                                    <p class="text-dark mb-0">New here? <a href="#" class="text-primary" onclick="event.preventDefault(); new bootstrap.Tab(document.querySelector('#signup-tab')).show();">Create an account</a></p>
                                                </div>
                                                <div class="mt-4">
                                                    <div class="d-flex align-items-center justify-content-center mb-2">
                                                        <i class="fas fa-shield-alt me-2"></i>
                                                        <span>Secure & Encrypted Login</span>
                                                    </div>
                                                    <div class="d-flex align-items-center justify-content-center mb-2">
                                                        <i class="fas fa-bolt me-2"></i>
                                                        <span>Fast & Easy Access</span>
                                                    </div>
                                                    <div class="d-flex align-items-center justify-content-center">
                                                        <i class="fas fa-headset me-2"></i>
                                                        <span>24/7 Support</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Signup Form -->
                        <div class="tab-pane fade" id="signup" role="tabpanel" aria-labelledby="signup-tab">
                            <div class="card shadow">
                                <div class="card-body p-0">
                                    <div class="row g-0">
                                        <!-- Left side section -->
                                        <div class="col-md-5 d-none d-md-block bg-primary">
                                            <div class="h-100 d-flex flex-column justify-content-center text-center text-white p-4">
                                                <i class="fas fa-user-plus display-1 mb-4"></i>
                                                <h3 class="mb-3">Create Your Account</h3>
                                                <p class="mb-4">Join our community and access exclusive features, content, and more.</p>
                                                <div class="bg-white p-2 rounded mb-4">
                                                    <p class="text-dark mb-0">Already have an account? <a href="#" class="text-primary" onclick="event.preventDefault(); new bootstrap.Tab(document.querySelector('#login-tab')).show();">Sign in here</a></p>
                                                </div>
                                                <div>
                                                    <div class="d-flex align-items-center justify-content-center mb-2">
                                                        <i class="fas fa-check-circle me-2"></i>
                                                        <span>Quick and easy registration</span>
                                                    </div>
                                                    <div class="d-flex align-items-center justify-content-center mb-2">
                                                        <i class="fas fa-lock me-2"></i>
                                                        <span>Secure data protection</span>
                                                    </div>
                                                    <div class="d-flex align-items-center justify-content-center">
                                                        <i class="fas fa-gift me-2"></i>
                                                        <span>Get started with free trial</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Right side signup form -->
                                        <div class="col-md-7">
                                            <div class="p-5">
                                                <h3 class="text-center mb-4">Create Your Account</h3>

                                                <asp:Panel ID="signupForm" runat="server">
                                                    <div class="row">
                                                        <div class="col-md-6 mb-4">
                                                            <asp:Label ID="lblFirstName" runat="server" AssociatedControlID="txtFirstName" CssClass="form-label" Text="First Name"></asp:Label>
                                                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control form-control-lg" ></asp:TextBox>
                                                        </div>
                                                        <div class="col-md-6 mb-4">
                                                            <asp:Label ID="lblLastName" runat="server" AssociatedControlID="txtLastName" CssClass="form-label" Text="Last Name"></asp:Label>
                                                            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control form-control-lg" ></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-6 mb-4">
                                                            <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail" CssClass="form-label" Text="Email Address"></asp:Label>
                                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control form-control-lg" TextMode="Email" ></asp:TextBox>
                                                        </div>
                                                        <div class="col-md-6 mb-4">
                                                            <asp:Label ID="lblPhone" runat="server" AssociatedControlID="txtPhone" CssClass="form-label" Text="Phone Number"></asp:Label>
                                                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control form-control-lg" TextMode="Phone"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-6 mb-4">
                                                            <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword" CssClass="form-label" Text="Password"></asp:Label>
                                                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control form-control-lg" TextMode="Password" ></asp:TextBox>
                                                            <small class="form-text">Must be at least 8 characters</small>
                                                        </div>
                                                        <div class="col-md-6 mb-4">
                                                            <asp:Label ID="lblConfirmPassword" runat="server" AssociatedControlID="txtConfirmPassword" CssClass="form-label" Text="Confirm Password"></asp:Label>
                                                            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control form-control-lg" TextMode="Password" ></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="mb-4 form-check">
                                                        <asp:CheckBox ID="chkTermsAgreement" runat="server" CssClass="form-check-input" />
                                                        <label class="form-check-label" for="chkTermsAgreement">
                                                            I agree to the <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a>
                                                        </label>
                                                    </div>

                                                    <div class="mb-4 form-check">
                                                        <asp:CheckBox ID="chkMarketingEmails" runat="server" CssClass="form-check-input" />
                                                        <label class="form-check-label" for="chkMarketingEmails">
                                                            Send me marketing promotions and updates
                                                        </label>
                                                    </div>

                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                        <ContentTemplate>
                                                            <div class="d-grid">
                                                                <asp:Button ID="btnSignup" runat="server" CssClass="btn btn-primary btn-lg"
                                                                    Text="Create Account" OnClick="btnSignup_Click" />
                                                            </div>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>

                                                    <div class="text-center mt-4">
                                                        <p>Or sign up with</p>
                                                        <div class="d-flex justify-content-center gap-3">
                                                            <asp:Button ID="btnGoogle" runat="server" CssClass="btn btn-outline-primary" Text="Google" />
                                                            <asp:Button ID="btnFacebook" runat="server" CssClass="btn btn-outline-primary" Text="Facebook" />
                                                        </div>
                                                    </div>
                                                </asp:Panel>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>



    <!-- Forgot Password Modal -->
    <div class="modal fade" id="forgotPasswordModal" tabindex="-1" aria-labelledby="forgotPasswordModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="forgotPasswordModalLabel">Reset Password</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Enter your email address and we'll send you instructions to reset your password.</p>
                    <div id="forgotPasswordForm">
                        <div class="mb-3">
                            <label for="resetEmail" class="form-label">Email Address</label>
                            <input type="email" class="form-control" id="resetEmail">
                        </div>
                        <div class="d-grid">
                            <button id="btnForgotPasswordForm" class="btn btn-primary">Send Reset Instructions</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {


            // Re-enable the ASP.NET button if any global preventDefault is blocking it
          <%--  $('#<%= btnSignup.ClientID %>').off('click'); // Remove any attached click event

            // Rebind a normal postback action
            $('#<%= btnSignup.ClientID %>').on('click', function (e) {
                // Allow ASP.NET to handle postback normally
                __doPostBack('<%= btnSignup.UniqueID %>', '');
            });--%>

         
        });
    </script>
</asp:Content>

