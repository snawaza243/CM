<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CMA._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <section>
        <!-- Dashboard Section -->
        <section id="dashboard" class="section active">
            <div class="row mb-4">
                <div class="col-md-3 col-sm-6 mb-3">
                    <div class="card glass stats-card">
                        <div class="card-body">
                            <div class="stats-icon">
                                <i class="fas fa-building"></i>
                            </div>
                            <div class="stats-value">12</div>
                            <div class="stats-label">Active Projects</div>
                            <div class="stats-change change-up">
                                <i class="fas fa-arrow-up"></i>2 from last month
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-3">
                    <div class="card glass stats-card">
                        <div class="card-body">
                            <div class="stats-icon">
                                <i class="fas fa-dollar-sign"></i>
                            </div>
                            <div class="stats-value">$245,680</div>
                            <div class="stats-label">Total Budget</div>
                            <div class="stats-change change-up">
                                <i class="fas fa-arrow-up"></i>$12,450 from last month
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-3">
                    <div class="card glass stats-card">
                        <div class="card-body">
                            <div class="stats-icon">
                                <i class="fas fa-users"></i>
                            </div>
                            <div class="stats-value">24</div>
                            <div class="stats-label">Active Clients</div>
                            <div class="stats-change change-up">
                                <i class="fas fa-arrow-up"></i>3 from last month
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-3">
                    <div class="card glass stats-card">
                        <div class="card-body">
                            <div class="stats-icon">
                                <i class="fas fa-tasks"></i>
                            </div>
                            <div class="stats-value">42</div>
                            <div class="stats-label">Pending Tasks</div>
                            <div class="stats-change change-down">
                                <i class="fas fa-arrow-down"></i>5 from last week
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mb-4">
                <div class="col-md-8 mb-4">
                    <div class="card glass">
                        <div class="card-header">
                            <h5 class="card-title mb-0">Project Progress</h5>
                        </div>
                        <div class="card-body">
                            <div class="chart-container">
                                <canvas id="progressChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card glass">
                        <div class="card-header">
                            <h5 class="card-title mb-0">Budget Allocation</h5>
                        </div>
                        <div class="card-body">
                            <div class="chart-container">
                                <canvas id="budgetChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="card glass">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h5 class="card-title mb-0">Recent Projects</h5>
                            <button class="btn btn-primary btn-sm" data-bs-toggle="modal"
                                data-bs-target="#addProjectModal">
                                <i class="fas fa-plus me-1"></i>Add Project
                            </button>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="data-table">
                                    <thead>
                                        <tr>
                                            <th>Project Name</th>
                                            <th>Client</th>
                                            <th>Start Date</th>
                                            <th>Deadline</th>
                                            <th>Progress</th>
                                            <th>Status</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Hilltop Residence</td>
                                            <td>Jennifer Martinez</td>
                                            <td>15 Mar 2023</td>
                                            <td>15 Sep 2023</td>
                                            <td>
                                                <div class="progress">
                                                    <div class="progress-bar bg-success" style="width: 100%">
                                                    </div>
                                                </div>
                                                <small>100% Complete</small>
                                            </td>
                                            <td><span class="status-badge status-completed">Completed</span>
                                            </td>
                                            <td>
                                                <button class="action-btn view-project" title="View Details">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                                <button class="action-btn" title="Edit">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Downtown Plaza</td>
                                            <td>Thompson Properties</td>
                                            <td>01 May 2023</td>
                                            <td>30 Dec 2023</td>
                                            <td>
                                                <div class="progress">
                                                    <div class="progress-bar bg-primary" style="width: 75%">
                                                    </div>
                                                </div>
                                                <small>75% Complete</small>
                                            </td>
                                            <td><span class="status-badge status-active">Active</span></td>
                                            <td>
                                                <button class="action-btn view-project" title="View Details">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                                <button class="action-btn" title="Edit">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Logistics Hub</td>
                                            <td>Global Shipping Co.</td>
                                            <td>10 Jan 2023</td>
                                            <td>10 Jul 2023</td>
                                            <td>
                                                <div class="progress">
                                                    <div class="progress-bar bg-success" style="width: 100%">
                                                    </div>
                                                </div>
                                                <small>100% Complete</small>
                                            </td>
                                            <td><span class="status-badge status-completed">Completed</span>
                                            </td>
                                            <td>
                                                <button class="action-btn view-project" title="View Details">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                                <button class="action-btn" title="Edit">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Old Town Theater</td>
                                            <td>Historic Society</td>
                                            <td>01 Aug 2023</td>
                                            <td>01 Feb 2024</td>
                                            <td>
                                                <div class="progress">
                                                    <div class="progress-bar bg-warning" style="width: 40%">
                                                    </div>
                                                </div>
                                                <small>40% Complete</small>
                                            </td>
                                            <td><span class="status-badge status-pending">Planning</span></td>
                                            <td>
                                                <button class="action-btn view-project" title="View Details">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                                <button class="action-btn" title="Edit">
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

        <!-- Projects Section -->
        <section id="projects" class="section">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2>Project Management</h2>
                <div>
                    <button class="btn btn-warning me-2" id="viewNewProjectsBtn">
                        <i class="fas fa-clock me-1"></i>New Project Requests
                                <span class="badge bg-danger ms-1" id="newProjectsBadge">3</span>
                    </button>
                    <button class="btn btn-primary" id="addProjectBtn">
                        <i class="fas fa-plus me-2"></i>Add New Project
                    </button>
                </div>
            </div>

            <!-- New Project Requests Section -->
            <div class="card glass mb-4" id="newProjectsSection" style="display: none;">
                <div class="card-header bg-warning text-dark">
                    <h5 class="mb-0">
                        <i class="fas fa-hourglass-half me-2"></i>New Project Requests - Pending Review
                    </h5>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover" id="newProjectsTable">
                            <thead>
                                <tr>
                                    <th>Project Name</th>
                                    <th>Client</th>
                                    <th>Type</th>
                                    <th>Budget</th>
                                    <th>Request Date</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <strong>Garage Addition</strong>
                                        <div class="small text-muted">Residential expansion</div>
                                    </td>
                                    <td>Jennifer Martinez</td>
                                    <td>Renovation</td>
                                    <td>$45,000</td>
                                    <td>2024-01-16</td>
                                    <td><span class="badge bg-warning">Pending</span></td>
                                    <td>
                                        <button class="btn btn-sm btn-primary manage-project-btn"
                                            data-project-id="1" data-action-type="review">
                                            <i class="fas fa-search me-1"></i>Review
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>Modern Office Setup</strong>
                                        <div class="small text-muted">Commercial interior</div>
                                    </td>
                                    <td>John Smith (New)</td>
                                    <td>Commercial</td>
                                    <td>$75,000</td>
                                    <td>2024-01-15</td>
                                    <td><span class="badge bg-info">Client Verified</span></td>
                                    <td>
                                        <button class="btn btn-sm btn-primary manage-project-btn"
                                            data-project-id="2" data-action-type="review">
                                            <i class="fas fa-search me-1"></i>Review
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>Warehouse Renovation</strong>
                                        <div class="small text-muted">Industrial upgrade</div>
                                    </td>
                                    <td>David Thompson</td>
                                    <td>Industrial</td>
                                    <td>$120,000</td>
                                    <td>2024-01-14</td>
                                    <td><span class="badge bg-success">Ready</span></td>
                                    <td>
                                        <button class="btn btn-sm btn-primary manage-project-btn"
                                            data-project-id="3" data-action-type="review">
                                            <i class="fas fa-search me-1"></i>Review
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Active Projects Section -->
            <div class="row">
                <div class="col-12">
                    <div class="card glass">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="data-table">
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
                                            <th>Actions</th>
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

        <!-- Clients Section -->
        <section id="clients" class="section">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2>Client Management</h2>
                <div>
                    <button class="btn btn-warning me-2" id="viewNewClientsBtn">
                        <i class="fas fa-user-clock me-1"></i>New Client Requests
                                <span class="badge bg-danger ms-1" id="newClientsBadge">2</span>
                    </button>
                    <button class="btn btn-primary" id="addNewClientBtn">
                        <i class="fas fa-user-plus me-1"></i>Add New Client
                    </button>
                </div>
            </div>

            <!-- New Client Requests Section -->
            <div class="card glass mb-4" id="newClientsSection">
                <div class="card-header bg-warning text-dark">
                    <h5 class="mb-0">
                        <i class="fas fa-clock me-2"></i>New Client Requests - Pending Verification
                    </h5>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover" id="newClientsTable">
                            <thead>
                                <tr>
                                    <th>Client Name</th>
                                    <th>Contact Info</th>
                                    <th>Project Type</th>
                                    <th>Budget Range</th>
                                    <th>Request Date</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img src="https://randomuser.me/api/portraits/men/32.jpg"
                                                alt="Client" class="rounded-circle me-2" width="40" height="40">
                                            <div>
                                                <strong>John Smith</strong>
                                                <div class="small text-muted">Residential</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div>john.smith@email.com</div>
                                        <small class="text-muted">(555) 123-4567</small>
                                    </td>
                                    <td>New Home Construction</td>
                                    <td>$100k - $250k</td>
                                    <td>2024-01-15</td>
                                    <td><span class="badge bg-warning">Pending</span></td>
                                    <td>
                                        <button class="btn btn-sm btn-primary verify-client-btn"
                                            data-client-type="new" data-client-id="1"
                                            data-client-name="John Smith">
                                            <i class="fas fa-shield-alt me-1"></i>Verify
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img src="https://randomuser.me/api/portraits/women/44.jpg"
                                                alt="Client" class="rounded-circle me-2" width="40" height="40">
                                            <div>
                                                <strong>Sarah Johnson</strong>
                                                <div class="small text-muted">Commercial</div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div>sarahj@company.com</div>
                                        <small class="text-muted">(555) 987-6543</small>
                                    </td>
                                    <td>Office Renovation</td>
                                    <td>$500k+</td>
                                    <td>2024-01-14</td>
                                    <td><span class="badge bg-info">Contacted</span></td>
                                    <td>
                                        <button class="btn btn-sm btn-primary verify-client-btn"
                                            data-client-type="new" data-client-id="2"
                                            data-client-name="Sarah Johnson">
                                            <i class="fas fa-shield-alt me-1"></i>Verify
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Saved Clients Section -->
            <div class="row">
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="card glass text-center client-card">
                        <div class="card-body">
                            <img src="https://randomuser.me/api/portraits/women/68.jpg" alt="Client"
                                class="rounded-circle mb-3" width="80" height="80">
                            <h5>Jennifer Martinez</h5>
                            <p class="text-muted">Homeowner</p>
                            <p class="small">2 Projects</p>
                            <div class="d-flex justify-content-center">
                                <button class="btn btn-sm btn-primary me-2 view-client-btn" data-client-id="1"
                                    data-client-type="saved">
                                    <i class="fas fa-eye"></i>View
                                </button>
                                <button class="btn btn-sm btn-outline-primary message-client-btn">
                                    <i class="fas fa-envelope"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="card glass text-center client-card">
                        <div class="card-body">
                            <img src="https://randomuser.me/api/portraits/men/81.jpg" alt="Client"
                                class="rounded-circle mb-3" width="80" height="80">
                            <h5>David Thompson</h5>
                            <p class="text-muted">Business Owner</p>
                            <p class="small">3 Projects</p>
                            <div class="d-flex justify-content-center">
                                <button class="btn btn-sm btn-primary me-2 view-client-btn" data-client-id="2"
                                    data-client-type="saved">
                                    <i class="fas fa-eye"></i>View
                                </button>
                                <button class="btn btn-sm btn-outline-primary message-client-btn">
                                    <i class="fas fa-envelope"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="card glass text-center client-card">
                        <div class="card-body">
                            <img src="https://randomuser.me/api/portraits/women/26.jpg" alt="Client"
                                class="rounded-circle mb-3" width="80" height="80">
                            <h5>Amanda Roberts</h5>
                            <p class="text-muted">Property Developer</p>
                            <p class="small">5 Projects</p>
                            <div class="d-flex justify-content-center">
                                <button class="btn btn-sm btn-primary me-2 view-client-btn" data-client-id="3"
                                    data-client-type="saved">
                                    <i class="fas fa-eye"></i>View
                                </button>
                                <button class="btn btn-sm btn-outline-primary message-client-btn">
                                    <i class="fas fa-envelope"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="card glass text-center client-card">
                        <div class="card-body">
                            <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Client"
                                class="rounded-circle mb-3" width="80" height="80">
                            <h5>Robert Chen</h5>
                            <p class="text-muted">Investor</p>
                            <p class="small">1 Project</p>
                            <div class="d-flex justify-content-center">
                                <button class="btn btn-sm btn-primary me-2 view-client-btn" data-client-id="4"
                                    data-client-type="saved">
                                    <i class="fas fa-eye"></i>View
                                </button>
                                <button class="btn btn-sm btn-outline-primary message-client-btn">
                                    <i class="fas fa-envelope"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Contractors Section -->
        <section id="contractors" class="section">
            <h2 class="mb-4">Contractor Management</h2>
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="card glass contractor-card">
                        <div class="card-body">
                            <div class="d-flex align-items-center mb-3">
                                <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Contractor"
                                    class="rounded-circle me-3" width="60" height="60">
                                <div>
                                    <h5 class="mb-0">Michael Johnson</h5>
                                    <p class="text-muted mb-0">General Contractor</p>
                                </div>
                            </div>
                            <p class="mb-3">
                                With over 15 years of experience, Michael specializes in residential
                                        construction and renovation projects.
                            </p>
                            <div class="mb-3">
                                <span class="badge bg-primary me-1">Residential</span>
                                <span class="badge bg-success">Renovation</span>
                            </div>
                            <div class="d-flex justify-content-between">
                                <small class="text-muted">Active Projects: 3</small>
                                <small class="text-muted">Rating: 4.8/5</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card glass contractor-card">
                        <div class="card-body">
                            <div class="d-flex align-items-center mb-3">
                                <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="Contractor"
                                    class="rounded-circle me-3" width="60" height="60">
                                <div>
                                    <h5 class="mb-0">Sarah Williams</h5>
                                    <p class="text-muted mb-0">Project Manager</p>
                                </div>
                            </div>
                            <p class="mb-3">
                                Sarah excels in commercial construction management with a focus on
                                        sustainable building practices.
                            </p>
                            <div class="mb-3">
                                <span class="badge bg-primary me-1">Commercial</span>
                                <span class="badge bg-info">Sustainable</span>
                            </div>
                            <div class="d-flex justify-content-between">
                                <small class="text-muted">Active Projects: 2</small>
                                <small class="text-muted">Rating: 4.9/5</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card glass contractor-card">
                        <div class="card-body">
                            <div class="d-flex align-items-center mb-3">
                                <img src="https://randomuser.me/api/portraits/men/76.jpg" alt="Contractor"
                                    class="rounded-circle me-3" width="60" height="60">
                                <div>
                                    <h5 class="mb-0">Robert Chen</h5>
                                    <p class="text-muted mb-0">Structural Engineer</p>
                                </div>
                            </div>
                            <p class="mb-3">
                                Robert brings technical expertise to complex structural challenges
                                        in industrial construction.
                            </p>
                            <div class="mb-3">
                                <span class="badge bg-warning me-1">Industrial</span>
                                <span class="badge bg-danger">Structural</span>
                            </div>
                            <div class="d-flex justify-content-between">
                                <small class="text-muted">Active Projects: 1</small>
                                <small class="text-muted">Rating: 4.7/5</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Employees Section -->
        <section id="employees" class="section">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2>Employee Management</h2>
                <button class="btn btn-primary" id="addEmployeeBtn">
                    <i class="fas fa-user-plus me-2"></i>Add Employee
                </button>
            </div>

            <div class="row">
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="card glass text-center employee-card">
                        <div class="card-body">
                            <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Employee"
                                class="rounded-circle mb-3" width="80" height="80">
                            <h5>Michael Johnson</h5>
                            <p class="text-muted">General Contractor</p>
                            <p class="small">5 years experience</p>
                            <div class="d-flex justify-content-center">
                                <button class="btn btn-sm btn-primary me-2 view-employee-btn"
                                    data-employee-id="1">
                                    <i class="fas fa-eye"></i>View
                                </button>
                                <button class="btn btn-sm btn-outline-primary message-employee-btn">
                                    <i class="fas fa-envelope"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="card glass text-center employee-card">
                        <div class="card-body">
                            <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="Employee"
                                class="rounded-circle mb-3" width="80" height="80">
                            <h5>Sarah Williams</h5>
                            <p class="text-muted">Project Manager</p>
                            <p class="small">8 years experience</p>
                            <div class="d-flex justify-content-center">
                                <button class="btn btn-sm btn-primary me-2 view-employee-btn"
                                    data-employee-id="2">
                                    <i class="fas fa-eye"></i>View
                                </button>
                                <button class="btn btn-sm btn-outline-primary message-employee-btn">
                                    <i class="fas fa-envelope"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="card glass text-center employee-card">
                        <div class="card-body">
                            <img src="https://randomuser.me/api/portraits/men/76.jpg" alt="Employee"
                                class="rounded-circle mb-3" width="80" height="80">
                            <h5>Robert Chen</h5>
                            <p class="text-muted">Structural Engineer</p>
                            <p class="small">6 years experience</p>
                            <div class="d-flex justify-content-center">
                                <button class="btn btn-sm btn-primary me-2 view-employee-btn"
                                    data-employee-id="3">
                                    <i class="fas fa-eye"></i>View
                                </button>
                                <button class="btn btn-sm btn-outline-primary message-employee-btn">
                                    <i class="fas fa-envelope"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="card glass text-center employee-card">
                        <div class="card-body">
                            <img src="https://randomuser.me/api/portraits/women/68.jpg" alt="Employee"
                                class="rounded-circle mb-3" width="80" height="80">
                            <h5>Lisa Rodriguez</h5>
                            <p class="text-muted">Architect</p>
                            <p class="small">7 years experience</p>
                            <div class="d-flex justify-content-center">
                                <button class="btn btn-sm btn-primary me-2 view-employee-btn"
                                    data-employee-id="4">
                                    <i class="fas fa-eye"></i>View
                                </button>
                                <button class="btn btn-sm btn-outline-primary message-employee-btn">
                                    <i class="fas fa-envelope"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Employee List Table -->
            <div class="card glass mt-4">
                <div class="card-header">
                    <h5 class="mb-0">
                        <i class="fas fa-list me-2"></i>All Employees
                    </h5>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="data-table">
                            <thead>
                                <tr>
                                    <th>Employee ID</th>
                                    <th>Name</th>
                                    <th>Position</th>
                                    <th>Department</th>
                                    <th>Contact</th>
                                    <th>Status</th>
                                    <th>Join Date</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>EMP-001</td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img src="https://randomuser.me/api/portraits/men/32.jpg"
                                                alt="Employee" class="rounded-circle me-2" width="40"
                                                height="40">
                                            <span>Michael Johnson</span>
                                        </div>
                                    </td>
                                    <td>General Contractor</td>
                                    <td>Construction</td>
                                    <td>
                                        <div>michael@buildright.com</div>
                                        <small class="text-muted">(555) 111-2222</small>
                                    </td>
                                    <td><span class="badge bg-success">Active</span></td>
                                    <td>2022-03-15</td>
                                    <td>
                                        <button class="action-btn view-employee-btn" title="View Details"
                                            data-employee-id="1">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button class="action-btn edit-employee-btn" title="Edit Employee"
                                            data-employee-id="1">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>EMP-002</td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img src="https://randomuser.me/api/portraits/women/44.jpg"
                                                alt="Employee" class="rounded-circle me-2" width="40"
                                                height="40">
                                            <span>Sarah Williams</span>
                                        </div>
                                    </td>
                                    <td>Project Manager</td>
                                    <td>Management</td>
                                    <td>
                                        <div>sarah@buildright.com</div>
                                        <small class="text-muted">(555) 333-4444</small>
                                    </td>
                                    <td><span class="badge bg-success">Active</span></td>
                                    <td>2021-06-10</td>
                                    <td>
                                        <button class="action-btn view-employee-btn" title="View Details"
                                            data-employee-id="2">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button class="action-btn edit-employee-btn" title="Edit Employee"
                                            data-employee-id="2">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>EMP-003</td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img src="https://randomuser.me/api/portraits/men/76.jpg"
                                                alt="Employee" class="rounded-circle me-2" width="40"
                                                height="40">
                                            <span>Robert Chen</span>
                                        </div>
                                    </td>
                                    <td>Structural Engineer</td>
                                    <td>Engineering</td>
                                    <td>
                                        <div>robert@buildright.com</div>
                                        <small class="text-muted">(555) 555-6666</small>
                                    </td>
                                    <td><span class="badge bg-success">Active</span></td>
                                    <td>2022-08-22</td>
                                    <td>
                                        <button class="action-btn view-employee-btn" title="View Details"
                                            data-employee-id="3">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button class="action-btn edit-employee-btn" title="Edit Employee"
                                            data-employee-id="3">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>EMP-004</td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img src="https://randomuser.me/api/portraits/women/68.jpg"
                                                alt="Employee" class="rounded-circle me-2" width="40"
                                                height="40">
                                            <span>Lisa Rodriguez</span>
                                        </div>
                                    </td>
                                    <td>Architect</td>
                                    <td>Design</td>
                                    <td>
                                        <div>lisa@buildright.com</div>
                                        <small class="text-muted">(555) 777-8888</small>
                                    </td>
                                    <td><span class="badge bg-warning">On Leave</span></td>
                                    <td>2023-01-15</td>
                                    <td>
                                        <button class="action-btn view-employee-btn" title="View Details"
                                            data-employee-id="4">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button class="action-btn edit-employee-btn" title="Edit Employee"
                                            data-employee-id="4">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>

        <!-- Services Section -->
        <section id="services" class="section">
            <h2 class="mb-4">Service Management</h2>
            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="card glass">
                        <div class="card-body service-card">
                            <div class="d-flex align-items-center mb-3">
                                <div class="service-icon me-3">
                                    <i class="fas fa-drafting-compass fa-2x text-primary"></i>
                                </div>
                                <div>
                                    <h5 class="mb-0">Architectural Design</h5>
                                    <p class="text-muted mb-0">Custom designs and 3D modeling</p>
                                </div>
                            </div>
                            <p>
                                Our team of architects creates innovative and functional designs that meet your
                                        vision and requirements.
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="badge bg-primary">12 Active Projects</span>
                                <button class="btn btn-sm btn-outline-primary">Manage</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="card glass">
                        <div class="card-body service-card">
                            <div class="d-flex align-items-center mb-3">
                                <div class="service-icon me-3">
                                    <i class="fas fa-tools fa-2x text-primary"></i>
                                </div>
                                <div>
                                    <h5 class="mb-0">Construction Management</h5>
                                    <p class="text-muted mb-0">End-to-end project oversight</p>
                                </div>
                            </div>
                            <p>
                                We oversee every aspect of your project from planning to completion, ensuring
                                        quality and timely delivery.
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="badge bg-primary">8 Active Projects</span>
                                <button class="btn btn-sm btn-outline-primary">Manage</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="card glass">
                        <div class="card-body service-card">
                            <div class="d-flex align-items-center mb-3">
                                <div class="service-icon me-3">
                                    <i class="fas fa-hammer fa-2x text-primary"></i>
                                </div>
                                <div>
                                    <h5 class="mb-0">Renovation & Remodeling</h5>
                                    <p class="text-muted mb-0">Transform your existing space</p>
                                </div>
                            </div>
                            <p>
                                Transform your existing space with our renovation and remodeling services
                                        tailored to your needs.
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="badge bg-primary">6 Active Projects</span>
                                <button class="btn btn-sm btn-outline-primary">Manage</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="card glass">
                        <div class="card-body service-card">
                            <div class="d-flex align-items-center mb-3">
                                <div class="service-icon me-3">
                                    <i class="fas fa-truck-pickup fa-2x text-primary"></i>
                                </div>
                                <div>
                                    <h5 class="mb-0">Site Preparation</h5>
                                    <p class="text-muted mb-0">Land clearing and foundation work</p>
                                </div>
                            </div>
                            <p>
                                We prepare your construction site with precision, ensuring a solid foundation for
                                        your project.
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="badge bg-primary">4 Active Projects</span>
                                <button class="btn btn-sm btn-outline-primary">Manage</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Payments Section -->
        <section id="payments" class="section">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2>Payment Management</h2>
                <button class="btn btn-primary" id="addPaymentBtn">
                    <i class="fas fa-money-bill-wave me-2"></i>Add Payment
                </button>
            </div>

            <!-- Payment Summary Cards -->
            <div class="row mb-4">
                <div class="col-md-3 col-sm-6 mb-3">
                    <div class="card glass text-center">
                        <div class="card-body">
                            <div class="stats-icon text-success">
                                <i class="fas fa-dollar-sign"></i>
                            </div>
                            <div class="stats-value">$245,680</div>
                            <div class="stats-label">Total Received</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-3">
                    <div class="card glass text-center">
                        <div class="card-body">
                            <div class="stats-icon text-warning">
                                <i class="fas fa-clock"></i>
                            </div>
                            <div class="stats-value">$45,200</div>
                            <div class="stats-label">Pending Payments</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-3">
                    <div class="card glass text-center">
                        <div class="card-body">
                            <div class="stats-icon text-info">
                                <i class="fas fa-users"></i>
                            </div>
                            <div class="stats-value">$89,500</div>
                            <div class="stats-label">Paid to Employees</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-3">
                    <div class="card glass text-center">
                        <div class="card-body">
                            <div class="stats-icon text-primary">
                                <i class="fas fa-hard-hat"></i>
                            </div>
                            <div class="stats-value">$156,180</div>
                            <div class="stats-label">Paid to Contractors</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Payment Filters -->
            <div class="card glass mb-4">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="mb-3">
                                <label for="paymentTypeFilter" class="form-label">Payment Type</label>
                                <select class="form-select" id="paymentTypeFilter">
                                    <option value="">All Types</option>
                                    <option value="client_to_contractor">Client → Contractor</option>
                                    <option value="contractor_to_employee">Contractor → Employee</option>
                                    <option value="company_to_contractor">Company → Contractor</option>
                                    <option value="company_to_employee">Company → Employee</option>
                                    <option value="refund">Refund to Client</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="mb-3">
                                <label for="paymentStatusFilter" class="form-label">Status</label>
                                <select class="form-select" id="paymentStatusFilter">
                                    <option value="">All Status</option>
                                    <option value="completed">Completed</option>
                                    <option value="pending">Pending</option>
                                    <option value="failed">Failed</option>
                                    <option value="cancelled">Cancelled</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="mb-3">
                                <label for="dateFromFilter" class="form-label">From Date</label>
                                <input type="date" class="form-control" id="dateFromFilter">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="mb-3">
                                <label for="dateToFilter" class="form-label">To Date</label>
                                <input type="date" class="form-control" id="dateToFilter">
                            </div>
                        </div>
                    </div>
                    <div class="d-flex justify-content-between">
                        <button class="btn btn-outline-primary" id="applyFiltersBtn">
                            <i class="fas fa-filter me-1"></i>Apply Filters
                        </button>
                        <button class="btn btn-outline-secondary" id="resetFiltersBtn">
                            <i class="fas fa-redo me-1"></i>Reset Filters
                        </button>
                    </div>
                </div>
            </div>

            <!-- Payments Table -->
            <div class="card glass">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="data-table">
                            <thead>
                                <tr>
                                    <th>Payment ID</th>
                                    <th>Type</th>
                                    <th>From</th>
                                    <th>To</th>
                                    <th>Project</th>
                                    <th>Amount</th>
                                    <th>Date</th>
                                    <th>Status</th>
                                    <th>Method</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>PAY-001</td>
                                    <td>
                                        <span class="badge bg-primary">Client → Contractor</span>
                                    </td>
                                    <td>Jennifer Martinez</td>
                                    <td>Michael Johnson</td>
                                    <td>Hilltop Residence</td>
                                    <td>$25,000</td>
                                    <td>2024-01-15</td>
                                    <td><span class="status-badge status-completed">Completed</span></td>
                                    <td>Bank Transfer</td>
                                    <td>
                                        <button class="action-btn view-payment-btn" title="View Details" data-payment-id="1">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button class="action-btn edit-payment-btn" title="Edit Payment" data-payment-id="1">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>PAY-002</td>
                                    <td>
                                        <span class="badge bg-info">Contractor → Employee</span>
                                    </td>
                                    <td>Michael Johnson</td>
                                    <td>Sarah Williams</td>
                                    <td>Hilltop Residence</td>
                                    <td>$5,000</td>
                                    <td>2024-01-16</td>
                                    <td><span class="status-badge status-completed">Completed</span></td>
                                    <td>Check</td>
                                    <td>
                                        <button class="action-btn view-payment-btn" title="View Details" data-payment-id="2">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button class="action-btn edit-payment-btn" title="Edit Payment" data-payment-id="2">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>PAY-003</td>
                                    <td>
                                        <span class="badge bg-warning">Company → Contractor</span>
                                    </td>
                                    <td>BuildRight Construction</td>
                                    <td>Robert Chen</td>
                                    <td>Downtown Plaza</td>
                                    <td>$15,000</td>
                                    <td>2024-01-17</td>
                                    <td><span class="status-badge status-pending">Pending</span></td>
                                    <td>Bank Transfer</td>
                                    <td>
                                        <button class="action-btn view-payment-btn" title="View Details" data-payment-id="3">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button class="action-btn edit-payment-btn" title="Edit Payment" data-payment-id="3">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>PAY-004</td>
                                    <td>
                                        <span class="badge bg-success">Refund to Client</span>
                                    </td>
                                    <td>BuildRight Construction</td>
                                    <td>David Thompson</td>
                                    <td>Office Renovation</td>
                                    <td>$2,500</td>
                                    <td>2024-01-18</td>
                                    <td><span class="status-badge status-completed">Completed</span></td>
                                    <td>Credit Card</td>
                                    <td>
                                        <button class="action-btn view-payment-btn" title="View Details" data-payment-id="4">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button class="action-btn edit-payment-btn" title="Edit Payment" data-payment-id="4">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>PAY-005</td>
                                    <td>
                                        <span class="badge bg-secondary">Company → Employee</span>
                                    </td>
                                    <td>BuildRight Construction</td>
                                    <td>Lisa Rodriguez</td>
                                    <td>Old Town Theater</td>
                                    <td>$3,200</td>
                                    <td>2024-01-19</td>
                                    <td><span class="status-badge status-completed">Completed</span></td>
                                    <td>Direct Deposit</td>
                                    <td>
                                        <button class="action-btn view-payment-btn" title="View Details" data-payment-id="5">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button class="action-btn edit-payment-btn" title="Edit Payment" data-payment-id="5">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>

        <!-- Reports Section -->
        <section id="reports" class="section">
            <h2 class="mb-4">Reports & Analytics</h2>
            <div class="row">
                <div class="col-md-8 mb-4">
                    <div class="card glass">
                        <div class="card-header">
                            <h5 class="card-title mb-0">Financial Performance</h5>
                        </div>
                        <div class="card-body">
                            <div class="chart-container">
                                <canvas id="financeChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card glass">
                        <div class="card-header">
                            <h5 class="card-title mb-0">Project Status</h5>
                        </div>
                        <div class="card-body">
                            <div class="chart-container">
                                <canvas id="projectStatusChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card glass">
                        <div class="card-header">
                            <h5 class="card-title mb-0">Project Timeline</h5>
                        </div>
                        <div class="card-body">
                            <div class="chart-container">
                                <canvas id="timelineChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Settings Section -->
        <section id="settings" class="section">
            <h2 class="mb-4">System Settings</h2>
            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="card glass">
                        <div class="card-header">
                            <h5 class="card-title mb-0">General Settings</h5>
                        </div>
                        <div class="card-body">
                            <form>
                                <div class="mb-3">
                                    <label for="companyName" class="form-label">Company Name</label>
                                    <input type="text" class="form-control" id="companyName"
                                        value="BuildRight Construction">
                                </div>
                                <div class="mb-3">
                                    <label for="companyEmail" class="form-label">Contact Email</label>
                                    <input type="email" class="form-control" id="companyEmail"
                                        value="info@buildright.com">
                                </div>
                                <div class="mb-3">
                                    <label for="companyPhone" class="form-label">Contact Phone</label>
                                    <input type="text" class="form-control" id="companyPhone"
                                        value="(555) 123-4567">
                                </div>
                                <div class="mb-3">
                                    <label for="companyAddress" class="form-label">Address</label>
                                    <textarea class="form-control" id="companyAddress"
                                        rows="2">123 Construction Ave, Building City, BC 12345</textarea>
                                </div>
                                <button type="submit" class="btn btn-primary">Save Changes</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="card glass">
                        <div class="card-header">
                            <h5 class="card-title mb-0">Notification Settings</h5>
                        </div>
                        <div class="card-body">
                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="emailNotifications" checked>
                                <label class="form-check-label" for="emailNotifications">
                                    Email
                                            Notifications</label>
                            </div>
                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="projectUpdates" checked>
                                <label class="form-check-label" for="projectUpdates">
                                    Project Update
                                            Notifications</label>
                            </div>
                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="budgetAlerts" checked>
                                <label class="form-check-label" for="budgetAlerts">
                                    Budget Alert
                                            Notifications</label>
                            </div>
                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="deadlineReminders">
                                <label class="form-check-label" for="deadlineReminders">
                                    Deadline
                                            Reminders</label>
                            </div>
                            <button type="submit" class="btn btn-primary">Save Preferences</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </section>

</asp:Content>
