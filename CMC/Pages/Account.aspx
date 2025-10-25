<%@ Page Language="C#" Title="Account" AutoEventWireup="true" MasterPageFile="~/Site.Master"
    CodeBehind="Account.aspx.cs" Inherits="CMC.Pages.Account"
    EnableSessionState="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
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

                                    <!-- Profile Section -->
                                    <div class="col-md-4 text-center border-end">
                                        <div class="mb-3">
                                            <img id="profileImage" src="https://randomuser.me/api/portraits/men/1.jpg"
                                                alt="Profile" class="rounded-circle shadow" width="140" height="140">
                                        </div>
                                        <h5 id="profileName" class="fw-bold">Client Name</h5>
                                        <p class="text-muted" id="profileRole">Customer</p>

                                        <button class="btn btn-outline-primary mt-2" id="changePhotoBtn">
                                            <i class="fas fa-camera me-1"></i>Change Photo
                                        </button>

                                        <input type="file" id="fileInput" accept="image/*" style="display: none;" />
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
                                                        <input type="password" id="oldPassword" class="form-control">
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label for="newPassword" class="form-label">New Password</label>
                                                        <input type="password" id="newPassword" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label for="confirmPassword" class="form-label">Confirm New Password</label>
                                                        <input type="password" id="confirmPassword" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-md-12 text-end">
                                                    <div class=" btn-group mt-4 text-end" role="group" aria-label="Project Actions">
                                                        <button type="submit" class="btn btn-primary" id="saveProfile">Save</button>
                                                        <button type="button" class="btn btn-secondary me-2" id="resetProfile">Reset</button>
                                                        <%--<button type="button" class="btn btn-secondary me-2">Cancel</button>--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- col end -->
                </div>
                <!-- row end -->
            </div>
            <!-- container end -->
        </section>

        <section id="profile-projects" class="section d-block">
            <div class="container">
                <h2 class="mb-4 text-center">My Projects</h2>

    

                <!-- Projects Table -->
                <div class="row justify-content-center">
                    <div class="col-md-10">


                        <div class="card glass">

                            <div class="card-body">
                                <!-- Action Buttons -->
                                <div class="row justify-content-end">
                                    <div class="col-md-12 text-end mb-3">
                                        <div class="btn-group" role="group" aria-label="Project Actions">
                                            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#quoteModal">
                                                <i class="fas fa-folder-open me-1"></i>New Project
                                            </button>


                                            <button type="button" class="btn btn-secondary" id="btn-ac-project-report">
                                                <i class="fas fa-chart-bar me-1"></i>Report
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="table-responsive">

                                        <table id="projectListTable" class=" glass table table-hover theme-table ">
                                            <thead class="table-dark">
                                                <tr>
                                                    <th style="width:50px">#</th>
                                                    <th style="display:none;">Project Code</th> 
                                                    <th>Project</th>
                                                    <th>Client Name</th>
                                                    <th>Email</th>
                                                    <th>Phone</th>
                                                    <th>Project Type</th>
                                                    <th>Address</th>
                                                    <th>Budget</th>
                                                    <th>Timeline</th>
                                                    <th>Start Date</th>
                                                    <th>Deadline</th>
                                                    <th>Status</th>
                                                    <th>Progress</th>
                                                    <th>Last Updated</th>
                                                    <th class="text-center">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody id="projectListBody">
                                                <!-- Rows will be dynamically added here -->
                                            </tbody>
                                        </table>

                                         
                                    </div>

                                </div>
                                <div class="row ">
                                    <!-- Footer Buttons -->
                                    <div class="text-center mt-4 ">
                                        <button class="btn btn-outline-primary me-2">
                                            <i class="fas fa-sync-alt me-1"></i>Refresh List
                                        </button>
                                        <button class="btn btn-outline-secondary">
                                            <i class="fas fa-file-export me-1"></i>Export Report
                                        </button>
                                    </div>
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modals for Project Details -->
            <!-- Modal Example 1 -->
            <div class="modal fade" id="projectDetailsModal1" tabindex="-1" aria-labelledby="projectDetailsLabel1" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-scrollable">
                    <div class="modal-content glass">
                        <div class="modal-header">
                            <h5 class="modal-title" id="projectDetailsLabel1">Residential Complex A - Project Details</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p><strong>Status:</strong> In Progress</p>
                            <p><strong>Progress:</strong></p>
                            <ul>
                                <li>Foundation completed ✅</li>
                                <li>Structure framed 🏗️</li>
                                <li>Electrical rough-in ongoing ⚡</li>
                                <li>Interior finishing scheduled</li>
                            </ul>
                            <p><strong>Remarks/Queries:</strong></p>
                            <ul>
                                <li>No delays reported</li>
                            </ul>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Example 2: Add Query/Remark -->
            <div class="modal fade" id="projectQueryModal1" tabindex="-1" aria-labelledby="projectQueryLabel1" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content glass">
                        <div class="modal-header">
                            <h5 class="modal-title" id="projectQueryLabel1">Submit Query</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row g-3">
                                <!-- g-3 adds gutter spacing between columns -->
                                <div class="col-12">
                                    <label for="queryText1" class="form-label">Please Enter Your Query...</label>
                                    <textarea class="form-control w-100" id="queryText1" rows="4"
                                        placeholder="Enter your query or remark" spellcheck="false"
                                        aria-label="To enrich screen reader interactions, please activate Accessibility in Grammarly extension settings"></textarea>
                                </div>
                            </div>
                        </div>



                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                </div>
            </div>

        </section>


    </main>

    <style>
        .hide {
            display: none !important;
        }


        .theme-table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    font-size: 0.9rem;
    color: var(--dark-color);
}

.theme-table thead {
    background-color: var(--secondary-color);
    color: var(--light-color);
    font-weight: 600;
}

.theme-table th, 
.theme-table td {
    padding: 12px 15px;
    text-align: left;
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

.theme-table tbody tr:hover {
    background-color: rgba(255, 255, 255, 0.05);
}

.theme-table .badge {
    padding: 5px 8px;
    font-size: 0.75rem;
    border-radius: 8px;
    font-weight: 500;
}

.theme-table .text-center {
    text-align: center;
}



#queryText1 {
    width: 100% !important;
    min-width: 0; /* Prevent inherited min-width from parent */
}


.modal-body .row {
    width: 100%;
    margin: 0;
}




    </style>










</asp:Content>

