<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="CMA.Pages.Employee" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Employees Section -->
    <section id="employees" class="section d-block">
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

    <%-- Model --%>
    <section>


        <!-- Employee Management Modal -->
        <div class="modal fade" id="employeeManagementModal" tabindex="-1" aria-labelledby="employeeManagementModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content glass">
                    <div class="modal-header">
                        <h5 class="modal-title" id="employeeManagementModalLabel">
                            <span id="employeeModalAction">Manage Employee</span>
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" id="employeeId">
                        <input type="hidden" id="employeeActionType">
                        <!-- add, view, edit -->

                        <!-- Alert Section -->
                        <div class="alert" id="employeeModalAlert">
                            <i class="fas fa-info-circle me-2"></i>
                            <span id="employeeAlertMessage">Managing employee</span>
                        </div>

                        <!-- Employee Photo & Basic Info -->
                        <div class="card glass mb-4">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-md-3 text-center">
                                        <div class="employee-photo-container mb-3">
                                            <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Employee Photo"
                                                class="rounded-circle" id="employeePhoto" width="120" height="120">
                                            <div class="mt-2">
                                                <button class="btn btn-sm btn-outline-primary" id="changePhotoBtn">
                                                    <i class="fas fa-camera me-1"></i>Change Photo
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label for="employeeFirstName" class="form-label">First Name *</label>
                                                    <input type="text" class="form-control" id="employeeFirstName" required>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label for="employeeLastName" class="form-label">Last Name *</label>
                                                    <input type="text" class="form-control" id="employeeLastName" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label for="employeeEmail" class="form-label">Email Address *</label>
                                                    <input type="email" class="form-control" id="employeeEmail" required>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label for="employeePhone" class="form-label">Phone Number *</label>
                                                    <input type="tel" class="form-control" id="employeePhone" required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Professional Information -->
                        <div class="card glass mb-4">
                            <div class="card-header">
                                <h6 class="mb-0">Professional Information</h6>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="employeePosition" class="form-label">Position *</label>
                                            <select class="form-select" id="employeePosition" required>
                                                <option value="">Select Position</option>
                                                <option value="general_contractor">General Contractor</option>
                                                <option value="project_manager">Project Manager</option>
                                                <option value="structural_engineer">Structural Engineer</option>
                                                <option value="architect">Architect</option>
                                                <option value="site_supervisor">Site Supervisor</option>
                                                <option value="foreman">Foreman</option>
                                                <option value="carpenter">Carpenter</option>
                                                <option value="electrician">Electrician</option>
                                                <option value="plumber">Plumber</option>
                                                <option value="laborer">Laborer</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="employeeDepartment" class="form-label">Department *</label>
                                            <select class="form-select" id="employeeDepartment" required>
                                                <option value="">Select Department</option>
                                                <option value="construction">Construction</option>
                                                <option value="management">Management</option>
                                                <option value="engineering">Engineering</option>
                                                <option value="design">Design</option>
                                                <option value="electrical">Electrical</option>
                                                <option value="plumbing">Plumbing</option>
                                                <option value="finishing">Finishing</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="employeeExperience" class="form-label">Years of Experience</label>
                                            <input type="number" class="form-control" id="employeeExperience" min="0"
                                                max="50">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="employeeSalary" class="form-label">Salary</label>
                                            <div class="input-group">
                                                <span class="input-group-text">$</span>
                                                <input type="number" class="form-control" id="employeeSalary">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="employeeSkills" class="form-label">Skills & Specializations</label>
                                    <select class="form-select" id="employeeSkills" multiple>
                                        <option value="concrete_work">Concrete Work</option>
                                        <option value="framing">Framing</option>
                                        <option value="roofing">Roofing</option>
                                        <option value="electrical_installation">Electrical Installation</option>
                                        <option value="plumbing">Plumbing</option>
                                        <option value="drywall">Drywall</option>
                                        <option value="painting">Painting</option>
                                        <option value="tiling">Tiling</option>
                                        <option value="cabinetry">Cabinetry</option>
                                        <option value="heavy_machinery">Heavy Machinery</option>
                                        <option value="project_management">Project Management</option>
                                        <option value="blueprint_reading">Blueprint Reading</option>
                                    </select>
                                    <div class="form-text">Hold Ctrl to select multiple skills</div>
                                </div>
                            </div>
                        </div>

                        <!-- Employment Details -->
                        <div class="card glass mb-4">
                            <div class="card-header">
                                <h6 class="mb-0">Employment Details</h6>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="employeeIdNumber" class="form-label">Employee ID</label>
                                            <input type="text" class="form-control" id="employeeIdNumber" readonly>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="employeeJoinDate" class="form-label">Join Date *</label>
                                            <input type="date" class="form-control" id="employeeJoinDate" required>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="employeeStatus" class="form-label">Employment Status</label>
                                            <select class="form-select" id="employeeStatus">
                                                <option value="active">Active</option>
                                                <option value="on_leave">On Leave</option>
                                                <option value="suspended">Suspended</option>
                                                <option value="terminated">Terminated</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="employeeType" class="form-label">Employment Type</label>
                                            <select class="form-select" id="employeeType">
                                                <option value="full_time">Full Time</option>
                                                <option value="part_time">Part Time</option>
                                                <option value="contract">Contract</option>
                                                <option value="seasonal">Seasonal</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Personal Information -->
                        <div class="card glass mb-4">
                            <div class="card-header">
                                <h6 class="mb-0">Personal Information</h6>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="employeeAddress" class="form-label">Address</label>
                                            <input type="text" class="form-control" id="employeeAddress">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="employeeCity" class="form-label">City</label>
                                            <input type="text" class="form-control" id="employeeCity">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="employeeState" class="form-label">State</label>
                                            <input type="text" class="form-control" id="employeeState">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="employeeZipCode" class="form-label">ZIP Code</label>
                                            <input type="text" class="form-control" id="employeeZipCode">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="employeeEmergencyContact" class="form-label">
                                                Emergency
                                            Contact</label>
                                            <input type="text" class="form-control" id="employeeEmergencyContact">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="employeeEmergencyPhone" class="form-label">Emergency Phone</label>
                                            <input type="tel" class="form-control" id="employeeEmergencyPhone">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Documents & Certifications -->
                        <div class="card glass mb-4">
                            <div class="card-header">
                                <h6 class="mb-0">Documents & Certifications</h6>
                            </div>
                            <div class="card-body">
                                <div class="mb-3">
                                    <label class="form-label">Available Documents</label>
                                    <div id="employeeDocumentsList">
                                        <div
                                            class="document-item d-flex justify-content-between align-items-center p-2 mb-2 bg-light rounded">
                                            <div>
                                                <i class="fas fa-file-pdf text-danger me-2"></i>
                                                <span>Employment_Contract.pdf</span>
                                            </div>
                                            <div>
                                                <button class="btn btn-sm btn-outline-primary me-1">
                                                    <i class="fas fa-download"></i>
                                                </button>
                                                <button class="btn btn-sm btn-outline-danger">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="employeeCertifications" class="form-label">Certifications</label>
                                    <select class="form-select" id="employeeCertifications" multiple>
                                        <option value="osha_30">OSHA 30-Hour</option>
                                        <option value="first_aid_cpr">First Aid/CPR</option>
                                        <option value="fall_protection">Fall Protection</option>
                                        <option value="scaffolding">Scaffolding</option>
                                        <option value="excavation">Excavation Safety</option>
                                        <option value="welding_cert">Welding Certification</option>
                                        <option value="electrical_cert">Electrical Certification</option>
                                        <option value="plumbing_license">Plumbing License</option>
                                    </select>
                                    <div class="form-text">Hold Ctrl to select multiple certifications</div>
                                </div>

                                <div class="mb-3">
                                    <label for="uploadDocument" class="form-label">Upload Document</label>
                                    <input type="file" class="form-control" id="uploadDocument">
                                </div>
                            </div>
                        </div>

                        <!-- Notes Section -->
                        <div class="card glass mb-4">
                            <div class="card-header">
                                <h6 class="mb-0">Additional Notes</h6>
                            </div>
                            <div class="card-body">
                                <div class="mb-3">
                                    <label for="employeeNotes" class="form-label">Employee Notes</label>
                                    <textarea class="form-control" id="employeeNotes" rows="3"
                                        placeholder="Add any additional notes about the employee..."></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-danger" id="deactivateEmployeeBtn" style="display: none;">
                            <i class="fas fa-user-slash me-1"></i>Deactivate
                        </button>
                        <button type="button" class="btn btn-warning" id="editEmployeeBtn" style="display: none;">
                            <i class="fas fa-edit me-1"></i>Edit
                        </button>
                        <button type="button" class="btn btn-primary" id="saveEmployeeBtn">
                            <i class="fas fa-save me-1"></i><span id="saveEmployeeText">Save Employee</span>
                        </button>
                    </div>
                </div>
            </div>
            <script>
                // Employee Management System
                $(document).ready(function () {
                    let currentEmployeeData = null;

                    // Add Employee Button
                    $('#addEmployeeBtn').click(function () {
                        openEmployeeManagement('add', null);
                    });

                    // View Employee Button
                    $(document).on('click', '.view-employee-btn', function () {
                        const employeeId = $(this).data('employee-id');
                        openEmployeeManagement('view', employeeId);
                    });

                    // Edit Employee Button
                    $(document).on('click', '.edit-employee-btn', function () {
                        const employeeId = $(this).data('employee-id');
                        openEmployeeManagement('edit', employeeId);
                    });

                    // Message Employee Button
                    $(document).on('click', '.message-employee-btn', function () {
                        const employeeCard = $(this).closest('.employee-card');
                        const employeeName = employeeCard.find('h5').text();
                        alert(`Opening message interface for: ${employeeName}`);
                    });

                    // Open Employee Management Modal
                    function openEmployeeManagement(actionType, employeeId) {
                        currentEmployeeData = { actionType, employeeId };

                        $('#employeeId').val(employeeId || '');
                        $('#employeeActionType').val(actionType);

                        setupEmployeeModal(actionType);
                        loadEmployeeData(employeeId, actionType);
                        $('#employeeManagementModal').modal('show');
                    }

                    // Setup Employee Modal based on action type
                    function setupEmployeeModal(actionType) {
                        const configs = {
                            'add': {
                                title: 'Add New Employee',
                                alert: 'Add a new employee to the system. Fill in all required information.',
                                alertType: 'info',
                                showDeactivate: false,
                                showEdit: false,
                                showSave: true,
                                saveText: 'Create Employee',
                                readonly: false
                            },
                            'view': {
                                title: 'View Employee Details',
                                alert: 'Viewing employee information. Click Edit to make changes.',
                                alertType: 'primary',
                                showDeactivate: true,
                                showEdit: true,
                                showSave: false,
                                saveText: 'Save',
                                readonly: true
                            },
                            'edit': {
                                title: 'Edit Employee',
                                alert: 'Editing employee information. Update the details as needed.',
                                alertType: 'warning',
                                showDeactivate: false,
                                showEdit: false,
                                showSave: true,
                                saveText: 'Update Employee',
                                readonly: false
                            }
                        };

                        const config = configs[actionType];

                        $('#employeeModalAction').text(config.title);
                        $('#employeeAlertMessage').text(config.alert);
                        $('#employeeModalAlert').removeClass('alert-info alert-primary alert-warning').addClass(`alert-${config.alertType}`);

                        // Show/hide buttons
                        $('#deactivateEmployeeBtn').toggle(config.showDeactivate);
                        $('#editEmployeeBtn').toggle(config.showEdit);
                        $('#saveEmployeeBtn').toggle(config.showSave);
                        $('#saveEmployeeText').text(config.saveText);

                        // Set readonly state
                        setFormReadonly(config.readonly);
                    }

                    // Set form fields readonly state
                    function setFormReadonly(readonly) {
                        const fields = [
                            '#employeeFirstName', '#employeeLastName', '#employeeEmail', '#employeePhone',
                            '#employeePosition', '#employeeDepartment', '#employeeExperience', '#employeeSalary',
                            '#employeeSkills', '#employeeJoinDate', '#employeeStatus', '#employeeType',
                            '#employeeAddress', '#employeeCity', '#employeeState', '#employeeZipCode',
                            '#employeeEmergencyContact', '#employeeEmergencyPhone', '#employeeCertifications',
                            '#employeeNotes', '#uploadDocument'
                        ];

                        fields.forEach(field => {
                            $(field).prop('readonly', readonly);
                            $(field).prop('disabled', readonly);
                        });

                        // Special handling for select multiple
                        if (readonly) {
                            $('#employeeSkills, #employeeCertifications').prop('disabled', true);
                        }
                    }

                    // Load Employee Data
                    function loadEmployeeData(employeeId, actionType) {
                        if (actionType === 'add') {
                            clearEmployeeForm();
                            generateEmployeeId();
                            return;
                        }

                        // Mock data - replace with API calls
                        const employeeData = {
                            1: {
                                firstName: 'Michael',
                                lastName: 'Johnson',
                                email: 'michael@buildright.com',
                                phone: '(555) 111-2222',
                                position: 'general_contractor',
                                department: 'construction',
                                experience: 5,
                                salary: 75000,
                                skills: ['concrete_work', 'framing', 'heavy_machinery'],
                                joinDate: '2022-03-15',
                                status: 'active',
                                employmentType: 'full_time',
                                address: '123 Construction Ave',
                                city: 'Building City',
                                state: 'CA',
                                zipCode: '12345',
                                emergencyContact: 'Mary Johnson',
                                emergencyPhone: '(555) 999-8888',
                                certifications: ['osha_30', 'first_aid_cpr'],
                                notes: 'Excellent leadership skills. Specializes in residential projects.',
                                photo: 'men/32'
                            },
                            2: {
                                firstName: 'Sarah',
                                lastName: 'Williams',
                                email: 'sarah@buildright.com',
                                phone: '(555) 333-4444',
                                position: 'project_manager',
                                department: 'management',
                                experience: 8,
                                salary: 85000,
                                skills: ['project_management', 'blueprint_reading'],
                                joinDate: '2021-06-10',
                                status: 'active',
                                employmentType: 'full_time',
                                address: '456 Manager St',
                                city: 'Metro City',
                                state: 'NY',
                                zipCode: '67890',
                                emergencyContact: 'John Williams',
                                emergencyPhone: '(555) 777-6666',
                                certifications: ['osha_30', 'first_aid_cpr'],
                                notes: 'Strong project management background. PMP certified.',
                                photo: 'women/44'
                            },
                            3: {
                                firstName: 'Robert',
                                lastName: 'Chen',
                                email: 'robert@buildright.com',
                                phone: '(555) 555-6666',
                                position: 'structural_engineer',
                                department: 'engineering',
                                experience: 6,
                                salary: 80000,
                                skills: ['blueprint_reading'],
                                joinDate: '2022-08-22',
                                status: 'active',
                                employmentType: 'full_time',
                                address: '789 Engineer Lane',
                                city: 'Tech Town',
                                state: 'TX',
                                zipCode: '54321',
                                emergencyContact: 'Lisa Chen',
                                emergencyPhone: '(555) 444-3333',
                                certifications: ['osha_30'],
                                notes: 'Expert in structural analysis and design.',
                                photo: 'men/76'
                            },
                            4: {
                                firstName: 'Lisa',
                                lastName: 'Rodriguez',
                                email: 'lisa@buildright.com',
                                phone: '(555) 777-8888',
                                position: 'architect',
                                department: 'design',
                                experience: 7,
                                salary: 78000,
                                skills: ['blueprint_reading'],
                                joinDate: '2023-01-15',
                                status: 'on_leave',
                                employmentType: 'full_time',
                                address: '321 Design Blvd',
                                city: 'Creative City',
                                state: 'FL',
                                zipCode: '98765',
                                emergencyContact: 'Carlos Rodriguez',
                                emergencyPhone: '(555) 222-1111',
                                certifications: [],
                                notes: 'Creative architect with modern design approach.',
                                photo: 'women/68'
                            }
                        };

                        const data = employeeData[employeeId];
                        if (data) {
                            // Fill form fields
                            $('#employeeFirstName').val(data.firstName);
                            $('#employeeLastName').val(data.lastName);
                            $('#employeeEmail').val(data.email);
                            $('#employeePhone').val(data.phone);
                            $('#employeePosition').val(data.position);
                            $('#employeeDepartment').val(data.department);
                            $('#employeeExperience').val(data.experience);
                            $('#employeeSalary').val(data.salary);
                            $('#employeeSkills').val(data.skills);
                            $('#employeeJoinDate').val(data.joinDate);
                            $('#employeeStatus').val(data.status);
                            $('#employeeType').val(data.employmentType);
                            $('#employeeAddress').val(data.address);
                            $('#employeeCity').val(data.city);
                            $('#employeeState').val(data.state);
                            $('#employeeZipCode').val(data.zipCode);
                            $('#employeeEmergencyContact').val(data.emergencyContact);
                            $('#employeeEmergencyPhone').val(data.emergencyPhone);
                            $('#employeeCertifications').val(data.certifications);
                            $('#employeeNotes').val(data.notes);

                            // Set employee ID
                            $('#employeeIdNumber').val(`EMP-00${employeeId}`);

                            // Set employee photo
                            $('#employeePhoto').attr('src', `https://randomuser.me/api/portraits/${data.photo}.jpg`);
                        }
                    }

                    // Helper functions
                    function clearEmployeeForm() {
                        $('#employeeFirstName').val('');
                        $('#employeeLastName').val('');
                        $('#employeeEmail').val('');
                        $('#employeePhone').val('');
                        $('#employeePosition').val('');
                        $('#employeeDepartment').val('');
                        $('#employeeExperience').val('');
                        $('#employeeSalary').val('');
                        $('#employeeSkills').val('');
                        $('#employeeJoinDate').val('');
                        $('#employeeStatus').val('active');
                        $('#employeeType').val('full_time');
                        $('#employeeAddress').val('');
                        $('#employeeCity').val('');
                        $('#employeeState').val('');
                        $('#employeeZipCode').val('');
                        $('#employeeEmergencyContact').val('');
                        $('#employeeEmergencyPhone').val('');
                        $('#employeeCertifications').val('');
                        $('#employeeNotes').val('');
                        $('#employeePhoto').attr('src', 'https://randomuser.me/api/portraits/men/0.jpg');
                    }

                    function generateEmployeeId() {
                        const randomId = Math.floor(Math.random() * 1000).toString().padStart(3, '0');
                        $('#employeeIdNumber').val(`EMP-${randomId}`);
                    }

                    // Edit Button Click
                    $('#editEmployeeBtn').click(function () {
                        const employeeId = $('#employeeId').val();
                        openEmployeeManagement('edit', employeeId);
                    });

                    // Save Employee Button
                    $('#saveEmployeeBtn').click(function () {
                        if (validateEmployeeForm()) {
                            saveEmployee();
                        }
                    });

                    // Deactivate Employee Button
                    $('#deactivateEmployeeBtn').click(function () {
                        if (confirm('Are you sure you want to deactivate this employee?')) {
                            deactivateEmployee();
                        }
                    });

                    // Change Photo Button
                    $('#changePhotoBtn').click(function () {
                        // In a real application, this would open a file picker
                        alert('Photo upload functionality would be implemented here');
                    });

                    // Validation function
                    function validateEmployeeForm() {
                        const required = [
                            '#employeeFirstName', '#employeeLastName', '#employeeEmail',
                            '#employeePhone', '#employeePosition', '#employeeDepartment',
                            '#employeeJoinDate'
                        ];
                        let valid = true;

                        required.forEach(field => {
                            if (!$(field).val().trim()) {
                                valid = false;
                                $(field).addClass('is-invalid');
                            } else {
                                $(field).removeClass('is-invalid');
                            }
                        });

                        // Email validation
                        const email = $('#employeeEmail').val();
                        if (email && !isValidEmail(email)) {
                            valid = false;
                            $('#employeeEmail').addClass('is-invalid');
                        }

                        return valid;
                    }

                    function isValidEmail(email) {
                        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                        return emailRegex.test(email);
                    }

                    // Action functions
                    function saveEmployee() {
                        const actionType = $('#employeeActionType').val();
                        const employeeData = gatherEmployeeData();

                        console.log(`${actionType} employee:`, employeeData);
                        showAlert(`Employee ${actionType === 'add' ? 'created' : 'updated'} successfully!`, 'success');
                        $('#employeeManagementModal').modal('hide');

                        // In real application, refresh the employee list
                    }

                    function deactivateEmployee() {
                        const employeeId = $('#employeeId').val();
                        console.log('Deactivating employee:', employeeId);
                        showAlert('Employee deactivated successfully.', 'info');
                        $('#employeeManagementModal').modal('hide');
                    }

                    function gatherEmployeeData() {
                        return {
                            id: $('#employeeId').val(),
                            actionType: $('#employeeActionType').val(),
                            firstName: $('#employeeFirstName').val(),
                            lastName: $('#employeeLastName').val(),
                            email: $('#employeeEmail').val(),
                            phone: $('#employeePhone').val(),
                            position: $('#employeePosition').val(),
                            department: $('#employeeDepartment').val(),
                            experience: $('#employeeExperience').val(),
                            salary: $('#employeeSalary').val(),
                            skills: $('#employeeSkills').val(),
                            joinDate: $('#employeeJoinDate').val(),
                            status: $('#employeeStatus').val(),
                            employmentType: $('#employeeType').val(),
                            address: $('#employeeAddress').val(),
                            city: $('#employeeCity').val(),
                            state: $('#employeeState').val(),
                            zipCode: $('#employeeZipCode').val(),
                            emergencyContact: $('#employeeEmergencyContact').val(),
                            emergencyPhone: $('#employeeEmergencyPhone').val(),
                            certifications: $('#employeeCertifications').val(),
                            notes: $('#employeeNotes').val()
                        };
                    }

                    // Global alert function
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
                /* Employee Management Styles */
                .employee-card {
                    transition: transform 0.3s ease, box-shadow 0.3s ease;
                }

                    .employee-card:hover {
                        transform: translateY(-5px);
                        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
                    }

                .employee-photo-container {
                    position: relative;
                }

                    .employee-photo-container img {
                        border: 3px solid var(--primary-color);
                    }

                .document-item {
                    background: rgba(255, 255, 255, 0.05);
                    border-radius: 8px;
                    padding: 0.75rem;
                    margin-bottom: 0.5rem;
                }

                /* Status badges */
                .badge.bg-success {
                    background: rgba(46, 204, 113, 0.2) !important;
                    color: var(--success-color) !important;
                }

                .badge.bg-warning {
                    background: rgba(243, 156, 18, 0.2) !important;
                    color: var(--warning-color) !important;
                }

                .badge.bg-danger {
                    background: rgba(231, 76, 60, 0.2) !important;
                    color: var(--danger-color) !important;
                }

                /* Table enhancements */
                .data-table img {
                    border: 2px solid var(--glass-border);
                }

                .data-table .action-btn {
                    margin: 0 2px;
                }

                /* Form styling */
                .form-label {
                    font-weight: 600;
                    color: var(--dark-color);
                    margin-bottom: 0.5rem;
                }

                .form-control:read-only {
                    background: rgba(255, 255, 255, 0.05);
                    border-color: var(--glass-border);
                    color: var(--dark-color);
                }

                .form-control:disabled {
                    background: rgba(255, 255, 255, 0.02);
                    border-color: var(--glass-border);
                    color: var(--dark-color);
                    opacity: 0.7;
                }
            </style>
        </div>



    </section>


</asp:Content>
