<%@ Page Title="Projects" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="CMA.Pages.Projects" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Projects Section -->
    <section id="projects" class="section d-block">
        <div class="row mb-4">
            <!-- Total Projects -->
            <div class="col-md-3 col-sm-6 mb-3">
                <div class="card glass stats-card">
                    <div class="card-body">
                        <div class="stats-icon bg-primary text-white">
                            <i class="fas fa-folder-open"></i>
                        </div>
                        <div class="stats-value">18</div>
                        <div class="stats-label">Total Projects</div>
                        <div class="stats-change change-up">
                            <i class="fas fa-arrow-up"></i>+3 new this month
                        </div>
                    </div>
                </div>
            </div>

            <!-- Completed Projects -->
            <div class="col-md-3 col-sm-6 mb-3">
                <div class="card glass stats-card">
                    <div class="card-body">
                        <div class="stats-icon bg-success text-white">
                            <i class="fas fa-check-circle"></i>
                        </div>
                        <div class="stats-value">10</div>
                        <div class="stats-label">Completed Projects</div>
                        <div class="stats-change change-up">
                            <i class="fas fa-arrow-up"></i>+2 since last week
                        </div>
                    </div>
                </div>
            </div>

            <!-- Ongoing Projects -->
            <div class="col-md-3 col-sm-6 mb-3">
                <div class="card glass stats-card">
                    <div class="card-body">
                        <div class="stats-icon bg-warning text-dark">
                            <i class="fas fa-spinner"></i>
                        </div>
                        <div class="stats-value">6</div>
                        <div class="stats-label">Ongoing Projects</div>
                        <div class="stats-change change-down">
                            <i class="fas fa-arrow-down"></i>-1 this month
                        </div>
                    </div>
                </div>
            </div>

            <!-- Overdue Tasks -->
            <div class="col-md-3 col-sm-6 mb-3">
                <div class="card glass stats-card">
                    <div class="card-body">
                        <div class="stats-icon bg-danger text-white">
                            <i class="fas fa-exclamation-triangle"></i>
                        </div>
                        <div class="stats-value">4</div>
                        <div class="stats-label">Overdue Tasks</div>
                        <div class="stats-change change-up">
                            <i class="fas fa-arrow-up"></i>+1 since last week
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Project Management</h2>
            <div class="btn-group">
                <button class="btn btn-primary" id="addProjectBtn">
                    <i class="fas fa-plus me-2"></i>Add New
                </button>
                <button class="btn btn-secondary me-2" id="viewNewProjectsBtn">
                    <i class="fas fa-clock me-1"></i>New Requests
                    <span class="badge bg-danger ms-1" id="newProjectsBadge">1</span>
                </button>
            </div>
        </div>

        <!-- New Project Requests Section -->
        <div class="card glass mb-4" id="newProjectsSection" style="display: none;">
            <div class="card-header">
                <h5 class="mb-0">
                    <i class="fas fa-hourglass-half me-2"></i>New Project Requests - Pending Review
                </h5>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="table-responsive">

                        <table id="projectListTable" class="glass table table-hover theme-table">
                            <thead class="table-dark">
                                <tr>
                                    <th style="width: 50px">#</th>
                                    <th style="display: none;">Project Code</th>
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
                                <tr>
                                    <td>1</td>
                                    <td style="display: none;">PRJ001</td>
                                    <td>WealthMaker Revamp</td>
                                    <td>ABC Capital Ltd</td>
                                    <td>client@abccapital.com</td>
                                    <td>+91 9876543210</td>
                                    <td>Web Application</td>
                                    <td>Gurgaon, Haryana</td>
                                    <td>₹12,00,000</td>
                                    <td>6 Months</td>
                                    <td>2025-01-10</td>
                                    <td>2025-07-10</td>
                                    <td><span class="badge bg-warning">Pending</span></td>
                                    <td>60%</td>
                                    <td>2025-10-28</td>
                                    <td>
                                        <button class="action-btn view-project-btn" title="View Details"
                                            data-project-id="102">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button class="action-btn manage-project-btn"
                                            title="Manage Project" data-project-id="102"
                                            data-action-type="update">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td style="display: none;">PRJ002</td>
                                    <td>SmartRetail Dashboard</td>
                                    <td>NextGen Retail Pvt Ltd</td>
                                    <td>info@nextgenretail.in</td>
                                    <td>+91 9123456789</td>
                                    <td>Analytics Platform</td>
                                    <td>Bangalore, Karnataka</td>
                                    <td>₹8,50,000</td>
                                    <td>4 Months</td>
                                    <td>2025-02-15</td>
                                    <td>2025-06-15</td>
                                    <td><span class="badge bg-success">Approved</span></td>
                                    <td>100%</td>
                                    <td>2025-10-25</td>
                                    <td>
                                        <button class="action-btn view-project-btn" title="View Details"
                                            data-project-id="102">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button class="action-btn manage-project-btn"
                                            title="Manage Project" data-project-id="102"
                                            data-action-type="update">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>



                    </div>

                </div>


            </div>
        </div>

        <!-- Active Projects Section -->
        <div class="row">
            <div class="col-12">
                <div class="card glass">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="data-table" id="prj_apv_projects">
                                <thead>
                                    <tr>
                                        <th>Project Name</th>
                                        <th>Type</th>
                                        <th>Client</th>
                                        <th>Budget</th>
                                        <th>Start Date</th>
                                        <th>Deadline</th>
                                        <th>Progress</th>
                                        <th>Status</th>
                                        <th class="d-flex">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Hilltop Residence</td>
                                        <td>Residential</td>
                                        <td>Jennifer Martinez</td>
                                        <td>$350,000</td>
                                        <td>15 Mar 2023</td>
                                        <td>15 Sep 2023</td>
                                        <td>
                                            <div class="progress">
                                                <div class="progress-bar bg-success" style="width: 100%">
                                                </div>
                                            </div>
                                        </td>
                                        <td><span class="status-badge status-completed">Completed</span>
                                        </td>
                                        <td>
                                            <button class="action-btn view-project-btn" title="View Details"
                                                data-project-id="101">
                                                <i class="fas fa-eye"></i>
                                            </button>
                                            <button class="action-btn manage-project-btn"
                                                title="Manage Project" data-project-id="101"
                                                data-action-type="update">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Downtown Plaza</td>
                                        <td>Commercial</td>
                                        <td>Thompson Properties</td>
                                        <td>$1,200,000</td>
                                        <td>01 May 2023</td>
                                        <td>30 Dec 2023</td>
                                        <td>
                                            <div class="progress">
                                                <div class="progress-bar bg-primary" style="width: 75%">
                                                </div>
                                            </div>
                                        </td>
                                        <td><span class="status-badge status-active">Active</span></td>
                                        <td>
                                            <button class="action-btn view-project-btn" title="View Details"
                                                data-project-id="102">
                                                <i class="fas fa-eye"></i>
                                            </button>
                                            <button class="action-btn manage-project-btn"
                                                title="Manage Project" data-project-id="102"
                                                data-action-type="update">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Old Town Theater</td>
                                        <td>Renovation</td>
                                        <td>Historic Society</td>
                                        <td>$600,000</td>
                                        <td>01 Aug 2023</td>
                                        <td>01 Feb 2024</td>
                                        <td>
                                            <div class="progress">
                                                <div class="progress-bar bg-warning" style="width: 40%">
                                                </div>
                                            </div>
                                        </td>
                                        <td><span class="status-badge status-pending">Planning</span></td>
                                        <td>
                                            <button class="action-btn view-project-btn" title="View Details"
                                                data-project-id="104">
                                                <i class="fas fa-eye"></i>
                                            </button>
                                            <button class="action-btn manage-project-btn"
                                                title="Manage Project" data-project-id="104"
                                                data-action-type="update">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%-- MODELS --%>
    <!-- Project Management Modal -->
    <div class="modal fade" id="projectManagementModal" tabindex="-1" aria-labelledby="projectManagementModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content glass">
                <div class="modal-header">
                    <h5 class="modal-title" id="projectManagementModalLabel">
                        <span id="managementModalAction">Manage Project</span>
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="managementProjectId">
                    <input type="hidden" id="managementActionType">

                    <!-- Alert Section -->
                    <div class="alert" id="managementModalAlert">
                        <i class="fas fa-info-circle me-2"></i>
                        <span id="managementAlertMessage">Managing project</span>
                    </div>

                    <!-- Client Verification Section (For New Projects) -->
                    <div class="card glass mb-4" id="clientVerificationSection">
                        <div class="card-header bg-warning text-dark">
                            <h6 class="mb-0">
                                <i class="fas fa-shield-alt me-2"></i>Client Verification Required
                            </h6>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="info-group">
                                        <label>Client Name:</label>
                                        <span id="verifyClientName">-</span>
                                    </div>
                                    <div class="info-group">
                                        <label>Email:</label>
                                        <span id="verifyClientEmail">-</span>
                                    </div>
                                    <div class="info-group">
                                        <label>Phone:</label>
                                        <span id="verifyClientPhone">-</span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="info-group">
                                        <label>Client Type:</label>
                                        <span id="verifyClientType">-</span>
                                    </div>
                                    <div class="info-group">
                                        <label>Status:</label>
                                        <span id="verifyClientStatus">-</span>
                                    </div>
                                </div>
                            </div>
                            <div class="verification-checklist mt-3">
                                <div class="form-check">
                                    <input class="form-check-input verification-check" type="checkbox"
                                        id="verifyClientIdentity">
                                    <label class="form-check-label" for="verifyClientIdentity">
                                        Client identity verified and validated
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Project Basic Information -->
                    <div class="card glass mb-4">
                        <div class="card-header">
                            <h6 class="mb-0">Project Basic Information</h6>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="projectName" class="form-label">Project Name *</label>
                                        <input type="text" class="form-control" id="projectName" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="projectType" class="form-label">Project Type *</label>
                                        <select class="form-select" id="projectType" required>
                                            <option value="residential">Residential</option>
                                            <option value="commercial">Commercial</option>
                                            <option value="industrial">Industrial</option>
                                            <option value="renovation">Renovation</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="projectClient" class="form-label">Client *</label>
                                        <select class="form-select" id="projectClient" required>
                                            <option value="">Select Client</option>
                                            <option value="1">Jennifer Martinez</option>
                                            <option value="2">David Thompson</option>
                                            <option value="3">Amanda Roberts</option>
                                            <option value="4">Robert Chen</option>
                                            <option value="new">+ Add New Client</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="projectBudget" class="form-label">Budget *</label>
                                        <div class="input-group">
                                            <span class="input-group-text">$</span>
                                            <input type="number" class="form-control" id="projectBudget" required>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="projectStartDate" class="form-label">Start Date *</label>
                                        <input type="date" class="form-control" id="projectStartDate" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="projectDeadline" class="form-label">Deadline *</label>
                                        <input type="date" class="form-control" id="projectDeadline" required>
                                    </div>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="projectDescription" class="form-label">Project Description *</label>
                                <textarea class="form-control" id="projectDescription" rows="3" required></textarea>
                            </div>
                        </div>
                    </div>

                    <!-- Project Progress & Status -->
                    <div class="card glass mb-4">
                        <div class="card-header">
                            <h6 class="mb-0">Project Progress & Status</h6>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="projectStatus" class="form-label">Project Status</label>
                                        <select class="form-select" id="projectStatus">
                                            <option value="planning">Planning</option>
                                            <option value="active">Active</option>
                                            <option value="on_hold">On Hold</option>
                                            <option value="completed">Completed</option>
                                            <option value="cancelled">Cancelled</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="projectProgress" class="form-label">Progress Percentage</label>
                                        <input type="range" class="form-range" id="projectProgress" min="0" max="100"
                                            value="0">
                                        <div class="d-flex justify-content-between">
                                            <small>0%</small>
                                            <small id="progressPercentageText">0%</small>
                                            <small>100%</small>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="progressNotes" class="form-label">Progress Notes</label>
                                <textarea class="form-control" id="progressNotes" rows="2"
                                    placeholder="Add progress updates..."></textarea>
                            </div>
                        </div>
                    </div>

                    <!-- Project Team & Resources -->
                    <div class="card glass mb-4">
                        <div class="card-header">
                            <h6 class="mb-0">Project Team & Resources</h6>
                        </div>
                        <div class="card-body">
                            <div class="mb-3">
                                <label for="projectManager" class="form-label">Project Manager</label>
                                <select class="form-select" id="projectManager">
                                    <option value="">Select Project Manager</option>
                                    <option value="1">Sarah Williams</option>
                                    <option value="2">Michael Johnson</option>
                                    <option value="3">Robert Chen</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="assignedTeam" class="form-label">Assigned Team Members</label>
                                <select class="form-select" id="assignedTeam" multiple>
                                    <option value="1">Michael Johnson - General Contractor</option>
                                    <option value="2">Sarah Williams - Project Manager</option>
                                    <option value="3">Robert Chen - Structural Engineer</option>
                                    <option value="4">David Kim - Architect</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <!-- Project Milestones -->
                    <div class="card glass mb-4">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h6 class="mb-0">Project Milestones</h6>
                            <button type="button" class="btn btn-sm btn-primary" id="addMilestoneBtn">
                                <i class="fas fa-plus me-1"></i>Add Milestone
                            </button>
                        </div>
                        <div class="card-body">
                            <div id="milestonesContainer">
                                <!-- Milestones will be added here dynamically -->
                            </div>
                        </div>
                    </div>

                    <!-- Project Assessment (For Review) -->
                    <div class="card glass mb-4" id="projectAssessmentSection">
                        <div class="card-header">
                            <h6 class="mb-0">Project Assessment</h6>
                        </div>
                        <div class="card-body">
                            <div class="assessment-checklist">
                                <div class="form-check mb-2">
                                    <input class="form-check-input assessment-check" type="checkbox" id="assessScope">
                                    <label class="form-check-label" for="assessScope">
                                        Project scope is clearly defined
                                    </label>
                                </div>
                                <div class="form-check mb-2">
                                    <input class="form-check-input assessment-check" type="checkbox" id="assessBudget">
                                    <label class="form-check-label" for="assessBudget">
                                        Budget is realistic and approved
                                    </label>
                                </div>
                                <div class="form-check mb-2">
                                    <input class="form-check-input assessment-check" type="checkbox"
                                        id="assessTimeline">
                                    <label class="form-check-label" for="assessTimeline">
                                        Timeline is achievable
                                    </label>
                                </div>
                                <div class="form-check mb-2">
                                    <input class="form-check-input assessment-check" type="checkbox"
                                        id="assessResources">
                                    <label class="form-check-label" for="assessResources">
                                        Required resources are available
                                    </label>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="assessmentNotes" class="form-label">Assessment Notes</label>
                                <textarea class="form-control" id="assessmentNotes" rows="3"
                                    placeholder="Add assessment notes..."></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>

                    <!-- Reject Button (For Review) -->
                    <button type="button" class="btn btn-danger" id="rejectProjectBtn">
                        <i class="fas fa-times me-1"></i>Reject
                    </button>

                    <!-- Save/Update Button -->
                    <button type="button" class="btn btn-primary" id="saveProjectBtn">
                        <i class="fas fa-save me-1"></i><span id="saveButtonText">Save Project</span>
                    </button>

                    <!-- Approve Button (For Review) -->
                    <button type="button" class="btn btn-success" id="approveProjectBtn">
                        <i class="fas fa-check me-1"></i>Approve Project
                    </button>
                </div>
            </div>
        </div>
    </div>


    <!-- Project Details View Modal -->
    <div class="modal fade" id="projectDetailsModal" tabindex="-1" aria-labelledby="projectDetailsModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content glass">
                <div class="modal-header">
                    <h5 class="modal-title" id="projectDetailsModalLabel">Project Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row mb-4">
                        <div class="col-md-8">
                            <h4 id="detailProjectName">Hilltop Residence</h4>
                            <p class="text-muted" id="detailProjectDescription">
                                A contemporary 4-bedroom home with
sustainable features and panoramic views.
                            </p>
                        </div>
                        <div class="col-md-4 text-end">
                            <span class="status-badge status-completed" id="detailProjectStatus">Completed</span>
                            <div class="mt-2">
                                <small class="text-muted">Progress: <span id="detailProjectProgress">100%</span></small>
                            </div>
                        </div>
                    </div>

                    <div class="row mb-4">
                        <div class="col-md-3">
                            <div class="detail-item">
                                <h6>Client</h6>
                                <p id="detailClient">Jennifer Martinez</p>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="detail-item">
                                <h6>Type</h6>
                                <p id="detailType">Residential</p>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="detail-item">
                                <h6>Budget</h6>
                                <p id="detailBudget">$350,000</p>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="detail-item">
                                <h6>Project Manager</h6>
                                <p id="detailManager">Sarah Williams</p>
                            </div>
                        </div>
                    </div>

                    <div class="row mb-4">
                        <div class="col-md-6">
                            <div class="detail-item">
                                <h6>Timeline</h6>
                                <p id="detailTimeline">15 Mar 2023 - 15 Sep 2023</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="detail-item">
                                <h6>Duration</h6>
                                <p id="detailDuration">6 months</p>
                            </div>
                        </div>
                    </div>

                    <div class="mb-4">
                        <h6>Project Progress</h6>
                        <div class="progress mb-2" style="height: 12px;">
                            <div class="progress-bar bg-success" id="detailProgressBar" style="width: 100%"></div>
                        </div>
                        <div class="d-flex justify-content-between">
                            <small>Start: <span id="detailStartDate">15 Mar 2023</span></small>
                            <small>Deadline: <span id="detailDeadline">15 Sep 2023</span></small>
                        </div>
                    </div>

                    <div class="row mb-4">
                        <div class="col-md-6">
                            <h6>Assigned Team</h6>
                            <div id="detailTeamMembers">
                                <div class="team-member-small mb-2">
                                    <i class="fas fa-user me-2 text-primary"></i>
                                    <span>Sarah Williams</span>
                                    <small class="text-muted ms-2">(Project Manager)</small>
                                </div>
                                <div class="team-member-small mb-2">
                                    <i class="fas fa-user me-2 text-primary"></i>
                                    <span>Michael Johnson</span>
                                    <small class="text-muted ms-2">(General Contractor)</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <h6>Key Milestones</h6>
                            <div id="detailMilestones">
                                <div class="milestone-small completed mb-2">
                                    <i class="fas fa-check-circle me-2 text-success"></i>
                                    <span>Planning Complete</span>
                                    <small class="text-muted ms-2">(Apr 15, 2023)</small>
                                </div>
                                <div class="milestone-small completed mb-2">
                                    <i class="fas fa-check-circle me-2 text-success"></i>
                                    <span>Foundation Work</span>
                                    <small class="text-muted ms-2">(May 30, 2023)</small>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mb-4">
                        <h6>Recent Updates</h6>
                        <div class="updates-timeline">
                            <div class="update-item">
                                <div class="update-date">Sep 10, 2023</div>
                                <div class="update-content">
                                    Final inspection completed. Project is ready for handover.
                                </div>
                                <div class="update-author">- Sarah Williams</div>
                            </div>
                            <div class="update-item">
                                <div class="update-date">Sep 5, 2023</div>
                                <div class="update-content">Landscaping and exterior finishing work completed.</div>
                                <div class="update-author">- Michael Johnson</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="editProjectFromDetails">
                        <i class="fas fa-edit me-1"></i>Edit Project
                    </button>
                </div>
            </div>
        </div>

        <script>
            // Project Management System
            $(document).ready(function () {
                let currentProjectData = null;

                // Add Project Button
                $('#addProjectBtn').click(function () {
                    openProjectManagement('add', null);
                });

                // Manage Project Button (Review/Update)
                $(document).on('click', '.manage-project-btn', function () {
                    $('#newProjectsSection').slideToggle();

                    //const projectId = $(this).data('project-id');
                    //const actionType = $(this).data('action-type');
                    //openProjectManagement(actionType, projectId);
                });

                // View Project Button
                $(document).on('click', '.view-project-btn', function () {
                    const projectId = $(this).data('project-id');
                    openProjectDetails(projectId);
                });

                // Edit Project from Details Modal
                $(document).on('click', '#editProjectFromDetails', function () {
                    const projectId = $('#projectDetailsModal').data('project-id');
                    $('#projectDetailsModal').modal('hide');
                    openProjectManagement('update', projectId);
                });

                // Progress Slider
                $('#projectProgress').on('input', function () {
                    $('#progressPercentageText').text($(this).val() + '%');
                });

                // Add Milestone Button
                $('#addMilestoneBtn').click(function () {
                    addMilestoneField();
                });

                // Remove Milestone
                $(document).on('click', '.remove-milestone', function () {
                    $(this).closest('.milestone-field').remove();
                });

                // Action Buttons
                $('#approveProjectBtn').click(function () {
                    if (validateProjectApproval()) {
                        approveProject();
                    } else {
                        alert('Please complete all verification and assessment checks before approving.');
                    }
                });

                $('#rejectProjectBtn').click(function () {
                    if (confirm('Are you sure you want to reject this project?')) {
                        rejectProject();
                    }
                });

                $('#saveProjectBtn').click(function () {
                    if (validateProjectForm()) {
                        saveProject();
                    }
                });

                // Open Project Management Modal
                function openProjectManagement(actionType, projectId) {
                    currentProjectData = { actionType, projectId };

                    $('#managementProjectId').val(projectId || '');
                    $('#managementActionType').val(actionType);

                    setupManagementModal(actionType);
                    loadProjectData(projectId, actionType);
                    $('#projectManagementModal').modal('show');
                }

                // Open Project Details Modal
                function openProjectDetails(projectId) {
                    loadProjectDetails(projectId);
                    $('#projectDetailsModal').data('project-id', projectId);
                    $('#projectDetailsModal').modal('show');
                }

                // Setup Management Modal based on action type
                function setupManagementModal(actionType) {
                    const configs = {
                        'review': {
                            title: 'Review Project Request',
                            alert: 'Reviewing new project request. Verify client and assess project feasibility.',
                            alertType: 'warning',
                            showVerification: true,
                            showAssessment: true,
                            showReject: true,
                            showApprove: true,
                            showSave: false,
                            saveText: 'Save'
                        },
                        'add': {
                            title: 'Add New Project',
                            alert: 'Create a new project. All fields are required.',
                            alertType: 'info',
                            showVerification: false,
                            showAssessment: false,
                            showReject: false,
                            showApprove: false,
                            showSave: true,
                            saveText: 'Create Project'
                        },
                        'update': {
                            title: 'Update Project',
                            alert: 'Update project details, progress, and milestones.',
                            alertType: 'primary',
                            showVerification: false,
                            showAssessment: false,
                            showReject: false,
                            showApprove: false,
                            showSave: true,
                            saveText: 'Update Project'
                        }
                    };

                    const config = configs[actionType];

                    $('#managementModalAction').text(config.title);
                    $('#managementAlertMessage').text(config.alert);
                    $('#managementModalAlert').removeClass('alert-warning alert-info alert-primary').addClass(`alert-${config.alertType}`);

                    // Show/hide sections
                    $('#clientVerificationSection').toggle(config.showVerification);
                    $('#projectAssessmentSection').toggle(config.showAssessment);

                    // Show/hide buttons
                    $('#rejectProjectBtn').toggle(config.showReject);
                    $('#approveProjectBtn').toggle(config.showApprove);
                    $('#saveProjectBtn').toggle(config.showSave);
                    $('#saveButtonText').text(config.saveText);
                }

                // Load Project Data
                function loadProjectData(projectId, actionType) {
                    if (actionType === 'add') {
                        clearProjectForm();
                        return;
                    }

                    // Mock data
                    const projectData = {
                        // Review projects
                        1: {
                            name: 'Garage Addition',
                            type: 'renovation',
                            client: '1',
                            budget: '45000',
                            startDate: '2024-02-01',
                            deadline: '2024-04-30',
                            description: 'Want to add a 2-car garage with storage space and workshop area.',
                            status: 'planning',
                            progress: 0,
                            manager: '2',
                            team: ['1', '2'],
                            clientInfo: {
                                name: 'Jennifer Martinez',
                                email: 'jennifer@email.com',
                                phone: '(555) 111-2222',
                                type: 'Residential',
                                status: 'Existing Client'
                            }
                        },
                        2: {
                            name: 'Modern Office Setup',
                            type: 'commercial',
                            client: 'new',
                            budget: '75000',
                            startDate: '2024-02-15',
                            deadline: '2024-05-30',
                            description: 'Complete office renovation with modern open layout.',
                            status: 'planning',
                            progress: 0,
                            manager: '1',
                            team: ['1'],
                            clientInfo: {
                                name: 'John Smith',
                                email: 'john.smith@email.com',
                                phone: '(555) 123-4567',
                                type: 'Commercial',
                                status: 'New Client - Needs Verification'
                            }
                        },
                        // Update projects
                        101: {
                            name: 'Hilltop Residence',
                            type: 'residential',
                            client: '1',
                            budget: '350000',
                            startDate: '2023-03-15',
                            deadline: '2023-09-15',
                            description: 'A contemporary 4-bedroom home with sustainable features and panoramic views.',
                            status: 'completed',
                            progress: 100,
                            manager: '1',
                            team: ['1', '2'],
                            milestones: [
                                { name: 'Planning Complete', due: '2023-04-15' },
                                { name: 'Foundation Work', due: '2023-05-30' }
                            ]
                        },
                        102: {
                            name: 'Downtown Plaza',
                            type: 'commercial',
                            client: '2',
                            budget: '1200000',
                            startDate: '2023-05-01',
                            deadline: '2023-12-30',
                            description: 'Mixed-use commercial development with retail and office spaces.',
                            status: 'active',
                            progress: 75,
                            manager: '1',
                            team: ['1', '3'],
                            milestones: [
                                { name: 'Design Approval', due: '2023-04-15' },
                                { name: 'Construction Start', due: '2023-05-01' },
                                { name: 'Exterior Complete', due: '2023-10-15' }
                            ]
                        }
                    };

                    const data = projectData[projectId];
                    if (data) {
                        // Fill form fields
                        $('#projectName').val(data.name);
                        $('#projectType').val(data.type);
                        $('#projectClient').val(data.client);
                        $('#projectBudget').val(data.budget);
                        $('#projectStartDate').val(data.startDate);
                        $('#projectDeadline').val(data.deadline);
                        $('#projectDescription').val(data.description);
                        $('#projectStatus').val(data.status);
                        $('#projectProgress').val(data.progress);
                        $('#progressPercentageText').text(data.progress + '%');
                        $('#projectManager').val(data.manager);
                        $('#assignedTeam').val(data.team);

                        // Load client verification info for review
                        if (actionType === 'review' && data.clientInfo) {
                            $('#verifyClientName').text(data.clientInfo.name);
                            $('#verifyClientEmail').text(data.clientInfo.email);
                            $('#verifyClientPhone').text(data.clientInfo.phone);
                            $('#verifyClientType').text(data.clientInfo.type);
                            $('#verifyClientStatus').text(data.clientInfo.status);
                        }

                        // Load milestones
                        if (data.milestones) {
                            loadMilestones(data.milestones);
                        }
                    }
                }

                // Load Project Details
                function loadProjectDetails(projectId) {
                    const detailsData = {
                        101: {
                            name: 'Hilltop Residence',
                            description: 'A contemporary 4-bedroom home with sustainable features and panoramic views.',
                            status: 'Completed',
                            progress: '100%',
                            client: 'Jennifer Martinez',
                            type: 'Residential',
                            budget: '$350,000',
                            manager: 'Sarah Williams',
                            timeline: '15 Mar 2023 - 15 Sep 2023',
                            duration: '6 months',
                            startDate: '15 Mar 2023',
                            deadline: '15 Sep 2023'
                        },
                        102: {
                            name: 'Downtown Plaza',
                            description: 'Mixed-use commercial development with retail and office spaces.',
                            status: 'Active',
                            progress: '75%',
                            client: 'Thompson Properties',
                            type: 'Commercial',
                            budget: '$1,200,000',
                            manager: 'Sarah Williams',
                            timeline: '01 May 2023 - 30 Dec 2023',
                            duration: '8 months',
                            startDate: '01 May 2023',
                            deadline: '30 Dec 2023'
                        }
                    };

                    const data = detailsData[projectId];
                    if (data) {
                        $('#detailProjectName').text(data.name);
                        $('#detailProjectDescription').text(data.description);
                        $('#detailProjectStatus').text(data.status).removeClass().addClass(`status-badge status-${data.status.toLowerCase()}`);
                        $('#detailProjectProgress').text(data.progress);
                        $('#detailClient').text(data.client);
                        $('#detailType').text(data.type);
                        $('#detailBudget').text(data.budget);
                        $('#detailManager').text(data.manager);
                        $('#detailTimeline').text(data.timeline);
                        $('#detailDuration').text(data.duration);
                        $('#detailStartDate').text(data.startDate);
                        $('#detailDeadline').text(data.deadline);
                        $('#detailProgressBar').css('width', data.progress);
                    }
                }

                // Helper functions
                function clearProjectForm() {
                    $('#projectName').val('');
                    $('#projectType').val('residential');
                    $('#projectClient').val('');
                    $('#projectBudget').val('');
                    $('#projectStartDate').val('');
                    $('#projectDeadline').val('');
                    $('#projectDescription').val('');
                    $('#projectStatus').val('planning');
                    $('#projectProgress').val('0');
                    $('#progressPercentageText').text('0%');
                    $('#projectManager').val('');
                    $('#assignedTeam').val('');
                    $('#progressNotes').val('');
                    $('#assessmentNotes').val('');
                    $('#milestonesContainer').empty();
                    $('.verification-check, .assessment-check').prop('checked', false);
                }

                function addMilestoneField(milestone = { name: '', due: '' }) {
                    const milestoneId = Date.now();
                    const milestoneHtml = `
<div class="milestone-field row mb-2" data-id="${milestoneId}">
<div class="col-md-6">
<input type="text" class="form-control" placeholder="Milestone description" value="${milestone.name || ''}">
</div>
<div class="col-md-4">
<input type="date" class="form-control" value="${milestone.due || ''}">
</div>
<div class="col-md-2">
<button type="button" class="btn btn-sm btn-outline-danger remove-milestone">
<i class="fas fa-times"></i>
</button>
</div>
</div>
`;
                    $('#milestonesContainer').append(milestoneHtml);
                }

                function loadMilestones(milestones) {
                    $('#milestonesContainer').empty();
                    milestones.forEach(milestone => {
                        addMilestoneField(milestone);
                    });
                }

                // Validation functions
                function validateProjectApproval() {
                    const verificationChecked = $('#verifyClientIdentity').is(':checked');
                    const assessmentChecked = $('.assessment-check:checked').length === $('.assessment-check').length;
                    return verificationChecked && assessmentChecked && validateProjectForm();
                }

                function validateProjectForm() {
                    const required = ['#projectName', '#projectClient', '#projectBudget', '#projectStartDate', '#projectDeadline', '#projectDescription'];
                    let valid = true;

                    required.forEach(field => {
                        if (!$(field).val().trim()) {
                            valid = false;
                            $(field).addClass('is-invalid');
                        } else {
                            $(field).removeClass('is-invalid');
                        }
                    });

                    return valid;
                }

                // Action functions
                function approveProject() {
                    const projectId = $('#managementProjectId').val();
                    console.log('Approving project:', projectId);
                    showAlert('Project approved successfully!', 'success');
                    $('#projectManagementModal').modal('hide');
                    loadNewProjects();
                }

                function rejectProject() {
                    const projectId = $('#managementProjectId').val();
                    console.log('Rejecting project:', projectId);
                    showAlert('Project rejected.', 'info');
                    $('#projectManagementModal').modal('hide');
                    loadNewProjects();
                }

                function saveProject() {
                    const actionType = $('#managementActionType').val();
                    const projectData = gatherProjectData();

                    console.log(`${actionType} project:`, projectData);
                    showAlert(`Project ${actionType === 'add' ? 'created' : 'updated'} successfully!`, 'success');
                    $('#projectManagementModal').modal('hide');
                }

                function gatherProjectData() {
                    return {
                        id: $('#managementProjectId').val(),
                        actionType: $('#managementActionType').val(),
                        name: $('#projectName').val(),
                        type: $('#projectType').val(),
                        client: $('#projectClient').val(),
                        budget: $('#projectBudget').val(),
                        startDate: $('#projectStartDate').val(),
                        deadline: $('#projectDeadline').val(),
                        description: $('#projectDescription').val(),
                        status: $('#projectStatus').val(),
                        progress: $('#projectProgress').val(),
                        manager: $('#projectManager').val(),
                        team: $('#assignedTeam').val(),
                        progressNotes: $('#progressNotes').val(),
                        assessmentNotes: $('#assessmentNotes').val()
                    };
                }

                function loadNewProjects() {
                    console.log('Loading new projects...');
                }

                function showAlert(message, type) {
                    const alertClass = {
                        'success': 'alert-success',
                        'error': 'alert-danger',
                        'warning': 'alert-warning',
                        'info': 'alert-info'
                    }[type] || 'alert-info';

                    const alertHtml = `
<div class="alert ${alertClass} alert-dismissible fade show position-fixed top-0 end-0 m-3" style="z-index: 1060;">
${message}
<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
</div>
`;

                    $('body').append(alertHtml);

                    setTimeout(() => {
                        $('.alert').alert('close');
                    }, 5000);
                }


            });
        </script>

        <style>
            /* Project Management Styles */
            #newProjectsSection {
                transition: all 0.3s ease;
            }

            .assessment-checklist .form-check,
            .verification-checklist .form-check {
                padding: 0.5rem;
                background: rgba(255, 255, 255, 0.03);
                border-radius: 6px;
                margin-bottom: 0.5rem;
            }

            .assessment-checklist .form-check-input:checked,
            .verification-checklist .form-check-input:checked {
                background-color: var(--success-color);
                border-color: var(--success-color);
            }

            .milestone-field {
                padding: 0.5rem;
                background: rgba(255, 255, 255, 0.05);
                border-radius: 8px;
                margin-bottom: 0.5rem;
            }

            .status-badge {
                padding: 0.5rem 1rem;
                border-radius: 20px;
                font-weight: 600;
                font-size: 0.8rem;
            }

            .status-completed {
                background: rgba(46, 204, 113, 0.2);
                color: var(--success-color);
            }

            .status-active {
                background: rgba(52, 152, 219, 0.2);
                color: var(--info-color);
            }

            .status-pending {
                background: rgba(243, 156, 18, 0.2);
                color: var(--warning-color);
            }

            .detail-item {
                margin-bottom: 1rem;
            }

                .detail-item h6 {
                    color: var(--primary-color);
                    margin-bottom: 0.25rem;
                    font-size: 0.9rem;
                }

                .detail-item p {
                    margin-bottom: 0;
                    font-weight: 500;
                }

            .team-member-small,
            .milestone-small {
                padding: 0.25rem 0;
            }

                .milestone-small.completed {
                    color: var(--success-color);
                }

            .updates-timeline .update-item {
                border-left: 3px solid var(--primary-color);
                padding-left: 15px;
                margin-bottom: 1rem;
            }

            .update-date {
                font-weight: 600;
                color: var(--primary-color);
                font-size: 0.9rem;
            }

            .update-author {
                font-size: 0.8rem;
                color: var(--dark-color);
                opacity: 0.7;
            }
        </style>
    </div>


    <script>
        $(document).ready(function () {
            $('#viewNewProjectsBtn').click(function () {
                $('#newProjectsSection').slideToggle();
                // loadNewProjects();
                loadProjects("CM_PROJECT_LIST_1", "Admin", "123", "Manager", "4567", "projectListTable");


            });

            loadProjects("CM_PROJECT_LIST_1", "Admin", "123", "Manager", "4567", "projectListTable");
            loadProjects("CM_PROJECT_LIST_2", "Admin", "123", "Manager", "4567", "prj_apv_projects");




        });


        function loadProjects(forType, by, x, role, logId, table) {
            $.ajax({
                type: "POST",
                url: "/Pages/Projects.aspx/GetTempProjectList",
                data: JSON.stringify({
                    forType: forType,
                    by: by,
                    x: x,
                    role: role,
                    logId: logId
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    const tableBody = $("#" + table);
                    tableBody.empty();

                    const data = response.d || response;

                    if (data.success && data.data && data.data.length > 0) {
                        const options = {
                            countElement: "#newProjectsBadge",                  // Optional: element ID to show row count
                            defaultColumnWidth: "150px",                    // Default width for columns
                            adjustableColumns: true,                        // Allow resizing of columns
                            tableClass: "table table-striped table-hover",   // Add custom Bootstrap table classes
                            displayNoneToTheseColumns: "1,3"  // Hide these columns (comma-separated)
                        };

                        psmJs_DynamicTableGenerateTable(data, tableBody, options);

                        //psmJs_DynamicTableMakeResizable("projectListTable");
                        psmJs_DynamicTableMakeResizable(table);

                    } else {
                        tableBody.append(
                            '<tr><td colspan="100%" class="text-center">No projects found for this client.</td></tr>'
                        );
                        showAlert(data.message, 'error');

                    }
                },
                error: function (err) {
                    console.error(err);
                    alert("Error fetching projects.");
                }
            });
        }



    </script>


</asp:Content>
