<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="CMA.Pages.Account" %>

<asp:Content id="acc_BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Projects Section -->
    <section id="acc_projects" class="section d-block">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Account Management</h2>
             <div>
                    <button class="btn btn-secondary me-2" id="acc_cancelProfileBtn">
                        <i class="fas fa-times me-1"></i>Cancel
                    </button>

                    <button class="btn btn-primary" id="acc_saveProfile">
                        <i class="fas fa-save me-1"></i>Save Changes
                    </button>
                </div>

        </div>

        <!-- New Project Requests Section -->
        <div class="card glass mb-4" id="acc_newProjectsSection"  >
            <div class="card-header bg-warning text-dark d-none">
                <h5 class="mb-0">
                    <i class="fas fa-hourglass-half me-2"></i>New Project Requests - Pending Review
                </h5>
            </div>
            <div class="card-body">
                    <div class="row">
                            <div class="col-md-4 text-center">
                                <div class="mb-3">
                                    <img src="https://randomuser.me/api/portraits/men/1.jpg" alt="Profile"
                                        class="rounded-circle" width="120" height="120">
                                    <div class="mt-2">
                                        <button class="btn btn-sm btn-outline-primary">Change Photo</button>
                                    </div>
                                </div>
                                <h5 id="acc_profileName">John Doe</h5>
                                <p class="text-muted" id="acc_acc_profileRole">Administrator</p>
                                <div class="badge bg-success">Active</div>
                            </div>
                            <div class="col-md-8">
                                <dif id="acc_profileForm">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label for="profileFirstName" class="form-label">
                                                    First
                                                Name</label>
                                                <input type="text" class="form-control" id="acc_profileFirstName" value="John">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label for="profileLastName" class="form-label">
                                                    Last
                                                Name</label>
                                                <input type="text" class="form-control" id="acc_profileLastName" value="Doe">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="profileEmail" class="form-label">Email Address</label>
                                        <input type="email" class="form-control" id="acc_profileEmail"
                                            value="john.doe@buildright.com">
                                    </div>
                                    <div class="mb-3">
                                        <label for="profilePhone" class="form-label">Phone Number</label>
                                        <input type="tel" class="form-control" id="acc_profilePhone" value="(555) 123-4567">
                                    </div>
                                    <div class="mb-3">
                                        <label for="profileAddress" class="form-label">Address</label>
                                        <textarea class="form-control" id="acc_profileAddress"
                                            rows="2">123 Construction Ave, Building City</textarea>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label for="profileDepartment" class="form-label">Department</label>
                                                <select class="form-select" id="acc_profileDepartment">
                                                    <option value="management">Management</option>
                                                    <option value="construction" selected>Construction
                                                    </option>
                                                    <option value="design">Design</option>
                                                    <option value="finance">Finance</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label for="profileRole" class="form-label">Role</label>
                                                <select class="form-select" id="acc_profileRole">
                                                    <option value="admin" selected>Administrator</option>
                                                    <option value="manager">Project Manager</option>
                                                    <option value="contractor">Contractor</option>
                                                    <option value="viewer">Viewer</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <h6 class="mb-3">Change Password</h6>
                                    <div class="mb-3">
                                        <label for="currentPassword" class="form-label">
                                            Current
                                        Password</label>
                                        <input type="password" class="form-control" id="acc_currentPassword">
                                    </div>
                                    <div class="mb-3">
                                        <label for="newPassword" class="form-label">New Password</label>
                                        <input type="password" class="form-control" id="acc_newPassword">
                                    </div>
                                    <div class="mb-3">
                                        <label for="confirmPassword" class="form-label">
                                            Confirm New
                                        Password</label>
                                        <input type="password" class="form-control" id="acc_confirmPassword">
                                    </div>
                                </dif>
                            </div>
                        </div>


            </div>
        </div>

        
    </section>



</asp:Content>
