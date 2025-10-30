<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Client.aspx.cs" Inherits="CMA.Pages.Client" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <!-- Clients Section -->
    <section id="clients" class="section d-block">
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

    <%-- Models --%>
    <section>

        <!-- Universal Client Update Modal -->
        <div class="modal fade" id="clientUpdateModal" tabindex="-1" aria-labelledby="clientUpdateModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content glass">
                    <div class="modal-header">
                        <h5 class="modal-title" id="clientUpdateModalLabel">
                            <span id="modalActionType">View Client</span> -
                        <span id="modalClientName">Client Name</span>
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" id="updateClientId">
                        <input type="hidden" id="updateClientType">
                        <!-- new, saved, add -->

                        <!-- Alert Section -->
                        <div class="alert" id="clientModalAlert" style="display: none;">
                            <i class="fas fa-info-circle me-2"></i>
                            <span id="alertMessage"></span>
                        </div>

                        <!-- Client Information -->
                        <div class="card glass mb-4">
                            <div class="card-header">
                                <h6 class="mb-0">Client Information</h6>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="clientFirstName" class="form-label">First Name *</label>
                                            <input type="text" class="form-control" id="clientFirstName" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="clientLastName" class="form-label">Last Name *</label>
                                            <input type="text" class="form-control" id="clientLastName" required>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="clientEmail" class="form-label">Email Address *</label>
                                            <input type="email" class="form-control" id="clientEmail" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="clientPhone" class="form-label">Phone Number *</label>
                                            <input type="tel" class="form-control" id="clientPhone" required>
                                        </div>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="clientCompany" class="form-label">Company / Organization</label>
                                    <input type="text" class="form-control" id="clientCompany">
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="clientType" class="form-label">Client Type *</label>
                                            <select class="form-select" id="clientType" required>
                                                <option value="residential">Residential</option>
                                                <option value="commercial">Commercial</option>
                                                <option value="industrial">Industrial</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="clientStatus" class="form-label">Status</label>
                                            <select class="form-select" id="clientStatus">
                                                <option value="lead">Lead</option>
                                                <option value="active">Active</option>
                                                <option value="inactive">Inactive</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Address Information -->
                        <div class="card glass mb-4">
                            <div class="card-header">
                                <h6 class="mb-0">Address Information</h6>
                            </div>
                            <div class="card-body">
                                <div class="mb-3">
                                    <label for="clientAddress" class="form-label">Street Address</label>
                                    <input type="text" class="form-control" id="clientAddress">
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="mb-3">
                                            <label for="clientCity" class="form-label">City</label>
                                            <input type="text" class="form-control" id="clientCity">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="mb-3">
                                            <label for="clientState" class="form-label">State</label>
                                            <input type="text" class="form-control" id="clientState">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="mb-3">
                                            <label for="clientZip" class="form-label">ZIP Code</label>
                                            <input type="text" class="form-control" id="clientZip">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Project Information (For New Clients) -->
                        <div class="card glass mb-4" id="projectInfoSection">
                            <div class="card-header">
                                <h6 class="mb-0">Project Information</h6>
                            </div>
                            <div class="card-body">
                                <div class="mb-3">
                                    <label for="projectDescription" class="form-label">Project Description</label>
                                    <textarea class="form-control" id="projectDescription" rows="3"
                                        placeholder="Describe the project requested by the client..."></textarea>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="projectBudget" class="form-label">Budget Range</label>
                                            <select class="form-select" id="projectBudget">
                                                <option value="under_50k">Under $50k</option>
                                                <option value="50k_100k">$50k - $100k</option>
                                                <option value="100k_250k">$100k - $250k</option>
                                                <option value="250k_500k">$250k - $500k</option>
                                                <option value="500k_plus">$500k+</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="projectTimeline" class="form-label">Desired Timeline</label>
                                            <select class="form-select" id="projectTimeline">
                                                <option value="asap">ASAP</option>
                                                <option value="1-3_months">1-3 months</option>
                                                <option value="3-6_months">3-6 months</option>
                                                <option value="6plus_months">6+ months</option>
                                            </select>
                                        </div>
                                    </div>
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
                                    <label for="clientNotes" class="form-label">Client Notes</label>
                                    <textarea class="form-control" id="clientNotes" rows="3"
                                        placeholder="Add any additional notes about the client..."></textarea>
                                </div>
                            </div>
                        </div>

                        <!-- Verification Section (For New Clients) -->
                        <div class="card glass mb-4" id="verificationSection">
                            <div class="card-header">
                                <h6 class="mb-0">Verification Checklist</h6>
                            </div>
                            <div class="card-body">
                                <div class="verification-checklist">
                                    <div class="form-check mb-2">
                                        <input class="form-check-input verification-check" type="checkbox"
                                            id="verifyClientIdentity">
                                        <label class="form-check-label" for="verifyClientIdentity">
                                            Identity Verified
                                        </label>
                                    </div>
                                    <div class="form-check mb-2">
                                        <input class="form-check-input verification-check" type="checkbox"
                                            id="verifyClientContact">
                                        <label class="form-check-label" for="verifyClientContact">
                                            Contact Information Valid
                                        </label>
                                    </div>
                                    <div class="form-check mb-2">
                                        <input class="form-check-input verification-check" type="checkbox"
                                            id="verifyClientBudget">
                                        <label class="form-check-label" for="verifyClientBudget">
                                            Budget Realistic
                                        </label>
                                    </div>
                                    <div class="form-check mb-2">
                                        <input class="form-check-input verification-check" type="checkbox"
                                            id="verifyClientRequirements">
                                        <label class="form-check-label" for="verifyClientRequirements">
                                            Requirements Clear
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>

                        <!-- Reject Button (For New Clients) -->
                        <button type="button" class="btn btn-danger" id="rejectClientBtn" style="display: none;">
                            <i class="fas fa-times me-1"></i>Reject Client
                        </button>

                        <!-- Save/Update Button -->
                        <button type="button" class="btn btn-primary" id="saveClientBtn">
                            <i class="fas fa-save me-1"></i><span id="saveButtonText">Save Client</span>
                        </button>

                        <!-- Accept & Create Button (For New Clients) -->
                        <button type="button" class="btn btn-success" id="acceptClientBtn" style="display: none;">
                            <i class="fas fa-check me-1"></i>Accept & Create Client
                        </button>
                    </div>
                </div>
            </div>
            <script>// Client Management System
                $(document).ready(function () {
                    let currentClientData = null;

                    // View New Clients Button
                    $('#viewNewClientsBtn').click(function () {
                        $('#newClientsSection').slideToggle();
                        loadNewClients();
                    });

                    // Add New Client Button
                    $('#addNewClientBtn').click(function () {
                        openClientModal('add', null);
                    });

                    // Verify Client Button (New Clients)
                    $(document).on('click', '.verify-client-btn', function () {
                        const clientId = $(this).data('client-id');
                        const clientType = $(this).data('client-type');
                        const clientName = $(this).data('client-name');

                        openClientModal('verify', {
                            id: clientId,
                            type: clientType,
                            name: clientName
                        });
                    });

                    // View Client Button (Saved Clients)
                    $(document).on('click', '.view-client-btn', function () {
                        const clientId = $(this).data('client-id');
                        const clientType = $(this).data('client-type');

                        openClientModal('view', {
                            id: clientId,
                            type: clientType
                        });
                    });

                    // Message Client Button
                    $(document).on('click', '.message-client-btn', function () {
                        const clientCard = $(this).closest('.client-card');
                        const clientName = clientCard.find('h5').text();
                        alert(`Opening message interface for: ${clientName}`);
                        // Implement messaging functionality here
                    });

                    // Open Client Modal
                    function openClientModal(action, clientData) {
                        currentClientData = clientData;

                        // Set modal title and configuration based on action
                        switch (action) {
                            case 'verify':
                                setupModalForVerification(clientData);
                                break;
                            case 'view':
                                setupModalForView(clientData);
                                break;
                            case 'add':
                                setupModalForAdd();
                                break;
                        }

                        $('#clientUpdateModal').modal('show');
                    }

                    // Setup modal for verification (new clients)
                    function setupModalForVerification(clientData) {
                        $('#modalActionType').text('Verify Client');
                        $('#modalClientName').text(clientData.name);
                        $('#updateClientId').val(clientData.id);
                        $('#updateClientType').val('new');

                        // Show verification sections
                        $('#projectInfoSection').show();
                        $('#verificationSection').show();
                        $('#rejectClientBtn').show();
                        $('#acceptClientBtn').show();
                        $('#saveClientBtn').hide();

                        // Set alert
                        showModalAlert('This client is pending verification. Complete the checklist to accept them.', 'warning');

                        // Load client data (mock - replace with API call)
                        loadClientData(clientData.id, 'new');
                    }

                    // Setup modal for view (saved clients)
                    function setupModalForView(clientData) {
                        $('#modalActionType').text('View/Edit Client');
                        $('#modalClientName').text('Loading...');
                        $('#updateClientId').val(clientData.id);
                        $('#updateClientType').val('saved');

                        // Hide verification sections
                        $('#projectInfoSection').hide();
                        $('#verificationSection').hide();
                        $('#rejectClientBtn').hide();
                        $('#acceptClientBtn').hide();
                        $('#saveClientBtn').show();
                        $('#saveButtonText').text('Update Client');

                        // Hide alert
                        $('#clientModalAlert').hide();

                        // Load client data
                        loadClientData(clientData.id, 'saved');
                    }

                    // Setup modal for add (new client manually)
                    function setupModalForAdd() {
                        $('#modalActionType').text('Add New Client');
                        $('#modalClientName').text('New Client');
                        $('#updateClientId').val('');
                        $('#updateClientType').val('add');

                        // Show project info, hide verification
                        $('#projectInfoSection').show();
                        $('#verificationSection').hide();
                        $('#rejectClientBtn').hide();
                        $('#acceptClientBtn').hide();
                        $('#saveClientBtn').show();
                        $('#saveButtonText').text('Save Client');

                        // Set alert
                        showModalAlert('Add a new client to the system. They will be available immediately.', 'info');

                        // Clear form
                        clearClientForm();
                    }

                    // Load client data
                    function loadClientData(clientId, type) {
                        // Mock data - replace with API calls
                        const clientData = {
                            'new': {
                                1: {
                                    first_name: 'John',
                                    last_name: 'Smith',
                                    email: 'john.smith@email.com',
                                    phone: '(555) 123-4567',
                                    company: '',
                                    type: 'residential',
                                    address: '123 Main St',
                                    city: 'Anytown',
                                    state: 'CA',
                                    zip: '12345',
                                    project_description: 'Looking to build a modern 3-bedroom house with sustainable features.',
                                    budget: '100k_250k',
                                    timeline: '3-6_months',
                                    notes: 'Very interested in green building practices.'
                                },
                                2: {
                                    first_name: 'Sarah',
                                    last_name: 'Johnson',
                                    email: 'sarahj@company.com',
                                    phone: '(555) 987-6543',
                                    company: 'Tech Solutions Inc',
                                    type: 'commercial',
                                    address: '456 Business Ave',
                                    city: 'Metro City',
                                    state: 'NY',
                                    zip: '67890',
                                    project_description: 'Office space renovation with modern amenities and open layout.',
                                    budget: '500k_plus',
                                    timeline: '6plus_months',
                                    notes: 'Budget approved by board.'
                                }
                            },
                            'saved': {
                                1: {
                                    first_name: 'Jennifer',
                                    last_name: 'Martinez',
                                    email: 'jennifer@email.com',
                                    phone: '(555) 111-2222',
                                    company: '',
                                    type: 'residential',
                                    status: 'active',
                                    address: '789 Home Lane',
                                    city: 'Suburbia',
                                    state: 'TX',
                                    zip: '54321',
                                    notes: 'Great client, always pays on time.'
                                },
                                2: {
                                    first_name: 'David',
                                    last_name: 'Thompson',
                                    email: 'david@thompsoncorp.com',
                                    phone: '(555) 333-4444',
                                    company: 'Thompson Properties',
                                    type: 'commercial',
                                    status: 'active',
                                    address: '321 Corporate Blvd',
                                    city: 'Downtown',
                                    state: 'IL',
                                    zip: '98765',
                                    notes: 'Multiple project history.'
                                }
                            }
                        };

                        const data = clientData[type][clientId];
                        if (data) {
                            // Populate form fields
                            $('#clientFirstName').val(data.first_name);
                            $('#clientLastName').val(data.last_name);
                            $('#clientEmail').val(data.email);
                            $('#clientPhone').val(data.phone);
                            $('#clientCompany').val(data.company || '');
                            $('#clientType').val(data.type);
                            $('#clientStatus').val(data.status || 'lead');
                            $('#clientAddress').val(data.address || '');
                            $('#clientCity').val(data.city || '');
                            $('#clientState').val(data.state || '');
                            $('#clientZip').val(data.zip || '');
                            $('#clientNotes').val(data.notes || '');

                            if (type === 'new') {
                                $('#projectDescription').val(data.project_description || '');
                                $('#projectBudget').val(data.budget || 'under_50k');
                                $('#projectTimeline').val(data.timeline || 'asap');
                            }

                            // Update modal title with actual name
                            $('#modalClientName').text(`${data.first_name} ${data.last_name}`);
                        }
                    }

                    // Clear client form
                    function clearClientForm() {
                        $('#clientFirstName').val('');
                        $('#clientLastName').val('');
                        $('#clientEmail').val('');
                        $('#clientPhone').val('');
                        $('#clientCompany').val('');
                        $('#clientType').val('residential');
                        $('#clientStatus').val('lead');
                        $('#clientAddress').val('');
                        $('#clientCity').val('');
                        $('#clientState').val('');
                        $('#clientZip').val('');
                        $('#clientNotes').val('');
                        $('#projectDescription').val('');
                        $('#projectBudget').val('under_50k');
                        $('#projectTimeline').val('asap');

                        // Clear verification checks
                        $('.verification-check').prop('checked', false);
                    }

                    // Show modal alert
                    function showModalAlert(message, type) {
                        const alert = $('#clientModalAlert');
                        alert.removeClass('alert-warning alert-info alert-success alert-danger')
                            .addClass(`alert-${type}`);
                        $('#alertMessage').text(message);
                        alert.show();
                    }

                    // Accept Client Button
                    $('#acceptClientBtn').click(function () {
                        if (validateVerification()) {
                            acceptNewClient();
                        } else {
                            alert('Please complete all verification checks before accepting the client.');
                        }
                    });

                    // Reject Client Button
                    $('#rejectClientBtn').click(function () {
                        if (confirm('Are you sure you want to reject this client? This action cannot be undone.')) {
                            rejectNewClient();
                        }
                    });

                    // Save Client Button
                    $('#saveClientBtn').click(function () {
                        if (validateClientForm()) {
                            saveClient();
                        }
                    });

                    // Validation functions
                    function validateVerification() {
                        const checks = $('.verification-check:checked').length;
                        const totalChecks = $('.verification-check').length;
                        return checks === totalChecks && validateClientForm();
                    }

                    function validateClientForm() {
                        const required = ['#clientFirstName', '#clientLastName', '#clientEmail', '#clientPhone'];
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
                    function acceptNewClient() {
                        const clientData = gatherClientData();

                        // Mock API call to move from temp to permanent
                        console.log('Accepting new client:', clientData);

                        // In real implementation:
                        // 1. Insert into clients table
                        // 2. Remove from temp_clients table
                        // 3. Create initial project if needed

                        showAlert('Client accepted and added to system!', 'success');
                        $('#clientUpdateModal').modal('hide');
                        loadNewClients(); // Refresh the list
                    }

                    function rejectNewClient() {
                        const clientId = $('#updateClientId').val();

                        // Mock API call to reject client
                        console.log('Rejecting client:', clientId);

                        // In real implementation:
                        // Update temp_clients status to 'rejected'

                        showAlert('Client request rejected.', 'info');
                        $('#clientUpdateModal').modal('hide');
                        loadNewClients(); // Refresh the list
                    }

                    function saveClient() {
                        const clientData = gatherClientData();
                        const clientType = $('#updateClientType').val();

                        if (clientType === 'add') {
                            // Add new client
                            console.log('Adding new client:', clientData);
                            showAlert('New client added successfully!', 'success');
                        } else {
                            // Update existing client
                            console.log('Updating client:', clientData);
                            showAlert('Client updated successfully!', 'success');
                        }

                        $('#clientUpdateModal').modal('hide');
                    }

                    function gatherClientData() {
                        return {
                            id: $('#updateClientId').val(),
                            type: $('#updateClientType').val(),
                            first_name: $('#clientFirstName').val(),
                            last_name: $('#clientLastName').val(),
                            email: $('#clientEmail').val(),
                            phone: $('#clientPhone').val(),
                            company: $('#clientCompany').val(),
                            client_type: $('#clientType').val(),
                            status: $('#clientStatus').val(),
                            address: $('#clientAddress').val(),
                            city: $('#clientCity').val(),
                            state: $('#clientState').val(),
                            zip: $('#clientZip').val(),
                            notes: $('#clientNotes').val(),
                            project_description: $('#projectDescription').val(),
                            budget: $('#projectBudget').val(),
                            timeline: $('#projectTimeline').val()
                        };
                    }

                    // Load new clients (refresh data)
                    function loadNewClients() {
                        // This would be an API call in real implementation
                        console.log('Loading new clients...');
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
                });</script>
            <style>
                /* Client Management Styles */
                .client-card {
                    transition: transform 0.3s ease, box-shadow 0.3s ease;
                }

                    .client-card:hover {
                        transform: translateY(-5px);
                        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
                    }

                #newClientsSection {
                    transition: all 0.3s ease;
                }

                .verification-checklist .form-check {
                    padding: 0.5rem;
                    background: rgba(255, 255, 255, 0.03);
                    border-radius: 6px;
                    margin-bottom: 0.5rem;
                }

                .verification-checklist .form-check-input:checked {
                    background-color: var(--success-color);
                    border-color: var(--success-color);
                }

                .client-avatar {
                    width: 40px;
                    height: 40px;
                    border-radius: 50%;
                    object-fit: cover;
                }

                .client-info-cell {
                    min-width: 200px;
                }

                /* Status badges */
                .badge.bg-warning {
                    background: rgba(243, 156, 18, 0.2) !important;
                    color: var(--warning-color) !important;
                }

                .badge.bg-info {
                    background: rgba(52, 152, 219, 0.2) !important;
                    color: var(--info-color) !important;
                }

                /* Table enhancements */
                .table-hover tbody tr:hover {
                    background: rgba(255, 255, 255, 0.05);
                }

                /* Modal header colors based on action */
                .modal-header[data-action="verify"] {
                    border-bottom: 3px solid var(--warning-color);
                }

                .modal-header[data-action="view"] {
                    border-bottom: 3px solid var(--primary-color);
                }

                .modal-header[data-action="add"] {
                    border-bottom: 3px solid var(--success-color);
                }
            </style>
        </div>


        <!-- New Client Requests Modal -->
        <div class="modal fade" id="newClientRequestsModal" tabindex="-1" aria-labelledby="newClientRequestsModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content glass">
                    <div class="modal-header">
                        <h5 class="modal-title" id="newClientRequestsModalLabel">New Client Requests</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="table-responsive">
                            <table class="data-table">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Project Type</th>
                                        <th>Budget Range</th>
                                        <th>Request Date</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>John Smith</td>
                                        <td>john.smith@email.com</td>
                                        <td>(555) 123-4567</td>
                                        <td>Residential</td>
                                        <td>$100k - $250k</td>
                                        <td>2024-01-15</td>
                                        <td><span class="badge bg-warning">Pending Review</span></td>
                                        <td>
                                            <button class="btn btn-sm btn-primary view-client-request" data-id="1">
                                                <i class="fas fa-eye"></i>Review
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Sarah Johnson</td>
                                        <td>sarahj@company.com</td>
                                        <td>(555) 987-6543</td>
                                        <td>Commercial</td>
                                        <td>$500k+</td>
                                        <td>2024-01-14</td>
                                        <td><span class="badge bg-info">Contacted</span></td>
                                        <td>
                                            <button class="btn btn-sm btn-primary view-client-request" data-id="2">
                                                <i class="fas fa-eye"></i>Review
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

        <!-- Client Request Details Modal -->
        <div class="modal fade" id="clientRequestDetailsModal" tabindex="-1"
            aria-labelledby="clientRequestDetailsModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content glass">
                    <div class="modal-header">
                        <h5 class="modal-title" id="clientRequestDetailsModalLabel">Client Request Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row mb-4">
                            <div class="col-md-6">
                                <h6>Personal Information</h6>
                                <div class="info-group">
                                    <label>Full Name:</label>
                                    <span id="clientRequestName">John Smith</span>
                                </div>
                                <div class="info-group">
                                    <label>Email:</label>
                                    <span id="clientRequestEmail">john.smith@email.com</span>
                                </div>
                                <div class="info-group">
                                    <label>Phone:</label>
                                    <span id="clientRequestPhone">(555) 123-4567</span>
                                </div>
                                <div class="info-group">
                                    <label>Company:</label>
                                    <span id="clientRequestCompany">-</span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <h6>Project Details</h6>
                                <div class="info-group">
                                    <label>Project Type:</label>
                                    <span id="clientRequestType">Residential</span>
                                </div>
                                <div class="info-group">
                                    <label>Budget Range:</label>
                                    <span id="clientRequestBudget">$100k - $250k</span>
                                </div>
                                <div class="info-group">
                                    <label>Timeline:</label>
                                    <span id="clientRequestTimeline">3-6 months</span>
                                </div>
                                <div class="info-group">
                                    <label>Request Date:</label>
                                    <span id="clientRequestDate">2024-01-15</span>
                                </div>
                            </div>
                        </div>

                        <div class="mb-4">
                            <h6>Project Description</h6>
                            <div class="project-description-box">
                                <p id="clientRequestDescription">
                                    Looking to build a modern 3-bedroom house with sustainable
                                features and smart home technology. The property is located in a suburban area with
                                existing land ownership.
                                </p>
                            </div>
                        </div>

                        <div class="mb-4">
                            <h6>Verification Notes</h6>
                            <textarea class="form-control" id="verificationNotes" rows="3"
                                placeholder="Add verification notes..."></textarea>
                        </div>

                        <div class="mb-4">
                            <h6>Client Verification</h6>
                            <div class="verification-checklist">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="verifyIdentity">
                                    <label class="form-check-label" for="verifyIdentity">
                                        Identity Verified
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="verifyBudget">
                                    <label class="form-check-label" for="verifyBudget">
                                        Budget Confirmed
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="verifyRequirements">
                                    <label class="form-check-label" for="verifyRequirements">
                                        Requirements Clear
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="verifyTimeline">
                                    <label class="form-check-label" for="verifyTimeline">
                                        Timeline Realistic
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-warning" id="requestMoreInfo">
                            <i class="fas fa-info-circle me-1"></i>Request More Info
                        </button>
                        <button type="button" class="btn btn-danger" id="rejectClient">
                            <i class="fas fa-times me-1"></i>Reject
                        </button>
                        <button type="button" class="btn btn-success" id="acceptClient">
                            <i class="fas fa-check me-1"></i>Accept Client
                        </button>
                    </div>
                </div>
            </div>
        </div>


    </section>

</asp:Content>
