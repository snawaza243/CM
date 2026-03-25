<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Payments.aspx.cs" Inherits="CMA.Pages.Payments" %>

 


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <!-- Payments Section -->
        <section id="payments" class="section d-block">
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


    <%-- MODELS --%>
            <!-- Payment Management Modal -->
        <div class="modal fade" id="paymentManagementModal" tabindex="-1" aria-labelledby="paymentManagementModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content glass">
                    <div class="modal-header">
                        <h5 class="modal-title" id="paymentManagementModalLabel">
                            <span id="paymentModalAction">Manage Payment</span>
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" id="paymentId">
                        <input type="hidden" id="paymentActionType">
                        <!-- add, view, edit -->

                        <!-- Alert Section -->
                        <div class="alert" id="paymentModalAlert">
                            <i class="fas fa-info-circle me-2"></i>
                            <span id="paymentAlertMessage">Managing payment</span>
                        </div>

                        <!-- Payment Type Selection -->
                        <div class="card glass mb-4">
                            <div class="card-header">
                                <h6 class="mb-0">Payment Type</h6>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="paymentType" class="form-label">Payment Direction *</label>
                                            <select class="form-select" id="paymentType" required>
                                                <option value="">Select Payment Type</option>
                                                <option value="client_to_contractor">Client → Contractor</option>
                                                <option value="contractor_to_employee">Contractor → Employee</option>
                                                <option value="company_to_contractor">Company → Contractor</option>
                                                <option value="company_to_employee">Company → Employee</option>
                                                <option value="refund">Refund to Client</option>
                                                <option value="client_to_company">Client → Company</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="paymentCategory" class="form-label">Payment Category</label>
                                            <select class="form-select" id="paymentCategory">
                                                <option value="project_payment">Project Payment</option>
                                                <option value="salary">Salary</option>
                                                <option value="bonus">Bonus</option>
                                                <option value="expense_reimbursement">Expense Reimbursement</option>
                                                <option value="advance">Advance Payment</option>
                                                <option value="retainer">Retainer</option>
                                                <option value="other">Other</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Parties Information -->
                        <div class="card glass mb-4">
                            <div class="card-header">
                                <h6 class="mb-0">Parties Information</h6>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="paymentFrom" class="form-label">Payer (From) *</label>
                                            <select class="form-select" id="paymentFrom" required>
                                                <option value="">Select Payer</option>
                                                <!-- Options will be populated dynamically based on payment type -->
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="paymentTo" class="form-label">Payee (To) *</label>
                                            <select class="form-select" id="paymentTo" required>
                                                <option value="">Select Payee</option>
                                                <!-- Options will be populated dynamically based on payment type -->
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="paymentProject" class="form-label">Related Project</label>
                                    <select class="form-select" id="paymentProject">
                                        <option value="">Select Project (Optional)</option>
                                        <option value="1">Hilltop Residence</option>
                                        <option value="2">Downtown Plaza</option>
                                        <option value="3">Logistics Hub</option>
                                        <option value="4">Old Town Theater</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <!-- Payment Details -->
                        <div class="card glass mb-4">
                            <div class="card-header">
                                <h6 class="mb-0">Payment Details</h6>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="paymentAmount" class="form-label">Amount *</label>
                                            <div class="input-group">
                                                <span class="input-group-text">$</span>
                                                <input type="number" class="form-control" id="paymentAmount" required step="0.01">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="paymentDate" class="form-label">Payment Date *</label>
                                            <input type="date" class="form-control" id="paymentDate" required>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="paymentMethod" class="form-label">Payment Method *</label>
                                            <select class="form-select" id="paymentMethod" required>
                                                <option value="">Select Method</option>
                                                <option value="bank_transfer">Bank Transfer</option>
                                                <option value="check">Check</option>
                                                <option value="cash">Cash</option>
                                                <option value="credit_card">Credit Card</option>
                                                <option value="debit_card">Debit Card</option>
                                                <option value="online_payment">Online Payment</option>
                                                <option value="direct_deposit">Direct Deposit</option>
                                                <option value="wire_transfer">Wire Transfer</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="paymentStatus" class="form-label">Payment Status</label>
                                            <select class="form-select" id="paymentStatus">
                                                <option value="pending">Pending</option>
                                                <option value="completed">Completed</option>
                                                <option value="failed">Failed</option>
                                                <option value="cancelled">Cancelled</option>
                                                <option value="processing">Processing</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="paymentReference" class="form-label">Reference Number</label>
                                    <input type="text" class="form-control" id="paymentReference" placeholder="Transaction ID, Check #, etc.">
                                </div>
                            </div>
                        </div>

                        <!-- Payment Description -->
                        <div class="card glass mb-4">
                            <div class="card-header">
                                <h6 class="mb-0">Payment Description</h6>
                            </div>
                            <div class="card-body">
                                <div class="mb-3">
                                    <label for="paymentDescription" class="form-label">Description *</label>
                                    <textarea class="form-control" id="paymentDescription" rows="3" required
                                        placeholder="Describe what this payment is for..."></textarea>
                                </div>

                                <div class="mb-3">
                                    <label for="paymentItems" class="form-label">Payment Items (Optional)</label>
                                    <div id="paymentItemsContainer">
                                        <!-- Payment items will be added here dynamically -->
                                    </div>
                                    <button type="button" class="btn btn-sm btn-outline-primary mt-2" id="addPaymentItemBtn">
                                        <i class="fas fa-plus me-1"></i>Add Item
                                    </button>
                                </div>
                            </div>
                        </div>

                        <!-- Tax & Fees -->
                        <div class="card glass mb-4">
                            <div class="card-header">
                                <h6 class="mb-0">Tax & Fees</h6>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="mb-3">
                                            <label for="taxAmount" class="form-label">Tax Amount</label>
                                            <div class="input-group">
                                                <span class="input-group-text">$</span>
                                                <input type="number" class="form-control" id="taxAmount" step="0.01" value="0">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="mb-3">
                                            <label for="feeAmount" class="form-label">Processing Fee</label>
                                            <div class="input-group">
                                                <span class="input-group-text">$</span>
                                                <input type="number" class="form-control" id="feeAmount" step="0.01" value="0">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="mb-3">
                                            <label class="form-label">Total Amount</label>
                                            <div class="input-group">
                                                <span class="input-group-text">$</span>
                                                <input type="text" class="form-control" id="totalAmount" readonly value="0.00">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Documents & Attachments -->
                        <div class="card glass mb-4">
                            <div class="card-header">
                                <h6 class="mb-0">Documents & Attachments</h6>
                            </div>
                            <div class="card-body">
                                <div class="mb-3">
                                    <label class="form-label">Attached Documents</label>
                                    <div id="paymentDocumentsList">
                                        <div class="document-item d-flex justify-content-between align-items-center p-2 mb-2 bg-light rounded">
                                            <div>
                                                <i class="fas fa-file-invoice text-primary me-2"></i>
                                                <span>Invoice_001.pdf</span>
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
                                    <label for="uploadPaymentDocument" class="form-label">Upload Document</label>
                                    <input type="file" class="form-control" id="uploadPaymentDocument">
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
                                    <label for="paymentNotes" class="form-label">Payment Notes</label>
                                    <textarea class="form-control" id="paymentNotes" rows="3"
                                        placeholder="Add any additional notes about this payment..."></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-danger" id="cancelPaymentBtn" style="display: none;">
                            <i class="fas fa-times me-1"></i>Cancel Payment
                        </button>
                        <button type="button" class="btn btn-warning" id="editPaymentBtn" style="display: none;">
                            <i class="fas fa-edit me-1"></i>Edit
                        </button>
                        <button type="button" class="btn btn-primary" id="savePaymentBtn">
                            <i class="fas fa-save me-1"></i><span id="savePaymentText">Save Payment</span>
                        </button>
                    </div>
                </div>
            </div>
            <script>
                // Payment Management System
                $(document).ready(function () {
                    let currentPaymentData = null;

                    // Add Payment Button
                    $('#addPaymentBtn').click(function () {
                        openPaymentManagement('add', null);
                    });

                    // View Payment Button
                    $(document).on('click', '.view-payment-btn', function () {
                        const paymentId = $(this).data('payment-id');
                        openPaymentManagement('view', paymentId);
                    });

                    // Edit Payment Button
                    $(document).on('click', '.edit-payment-btn', function () {
                        const paymentId = $(this).data('payment-id');
                        openPaymentManagement('edit', paymentId);
                    });

                    // Filter Buttons
                    $('#applyFiltersBtn').click(function () {
                        applyPaymentFilters();
                    });

                    $('#resetFiltersBtn').click(function () {
                        resetPaymentFilters();
                    });

                    // Payment Type Change Handler
                    $('#paymentType').change(function () {
                        updatePartyOptions();
                    });

                    // Amount Calculation
                    $('#paymentAmount, #taxAmount, #feeAmount').on('input', function () {
                        calculateTotalAmount();
                    });

                    // Add Payment Item
                    $('#addPaymentItemBtn').click(function () {
                        addPaymentItem();
                    });

                    // Open Payment Management Modal
                    function openPaymentManagement(actionType, paymentId) {
                        currentPaymentData = { actionType, paymentId };

                        $('#paymentId').val(paymentId || '');
                        $('#paymentActionType').val(actionType);

                        setupPaymentModal(actionType);
                        loadPaymentData(paymentId, actionType);
                        $('#paymentManagementModal').modal('show');
                    }

                    // Setup Payment Modal based on action type
                    function setupPaymentModal(actionType) {
                        const configs = {
                            'add': {
                                title: 'Add New Payment',
                                alert: 'Create a new payment record. Fill in all required information.',
                                alertType: 'info',
                                showCancel: false,
                                showEdit: false,
                                showSave: true,
                                saveText: 'Create Payment',
                                readonly: false
                            },
                            'view': {
                                title: 'View Payment Details',
                                alert: 'Viewing payment information. Click Edit to make changes.',
                                alertType: 'primary',
                                showCancel: true,
                                showEdit: true,
                                showSave: false,
                                saveText: 'Save',
                                readonly: true
                            },
                            'edit': {
                                title: 'Edit Payment',
                                alert: 'Editing payment information. Update the details as needed.',
                                alertType: 'warning',
                                showCancel: false,
                                showEdit: false,
                                showSave: true,
                                saveText: 'Update Payment',
                                readonly: false
                            }
                        };

                        const config = configs[actionType];

                        $('#paymentModalAction').text(config.title);
                        $('#paymentAlertMessage').text(config.alert);
                        $('#paymentModalAlert').removeClass('alert-info alert-primary alert-warning').addClass(`alert-${config.alertType}`);

                        // Show/hide buttons
                        $('#cancelPaymentBtn').toggle(config.showCancel);
                        $('#editPaymentBtn').toggle(config.showEdit);
                        $('#savePaymentBtn').toggle(config.showSave);
                        $('#savePaymentText').text(config.saveText);

                        // Set readonly state
                        setPaymentFormReadonly(config.readonly);

                        // Update party options if adding new payment
                        if (actionType === 'add') {
                            updatePartyOptions();
                        }
                    }

                    // Set form fields readonly state
                    function setPaymentFormReadonly(readonly) {
                        const fields = [
                            '#paymentType', '#paymentCategory', '#paymentFrom', '#paymentTo',
                            '#paymentProject', '#paymentAmount', '#paymentDate', '#paymentMethod',
                            '#paymentStatus', '#paymentReference', '#paymentDescription',
                            '#taxAmount', '#feeAmount', '#paymentNotes', '#uploadPaymentDocument'
                        ];

                        fields.forEach(field => {
                            $(field).prop('readonly', readonly);
                            $(field).prop('disabled', readonly);
                        });

                        // Special handling for buttons
                        $('#addPaymentItemBtn').prop('disabled', readonly);
                    }

                    // Update party options based on payment type
                    function updatePartyOptions() {
                        const paymentType = $('#paymentType').val();
                        const fromSelect = $('#paymentFrom');
                        const toSelect = $('#paymentTo');

                        // Clear existing options
                        fromSelect.empty().append('<option value="">Select Payer</option>');
                        toSelect.empty().append('<option value="">Select Payee</option>');

                        if (!paymentType) return;

                        // Define options based on payment type
                        const options = {
                            'client_to_contractor': {
                                from: [
                                    { value: '1', text: 'Jennifer Martinez' },
                                    { value: '2', text: 'David Thompson' },
                                    { value: '3', text: 'Amanda Roberts' },
                                    { value: '4', text: 'Robert Chen' }
                                ],
                                to: [
                                    { value: '1', text: 'Michael Johnson' },
                                    { value: '2', text: 'Sarah Williams' },
                                    { value: '3', text: 'Robert Chen' },
                                    { value: '4', text: 'Lisa Rodriguez' }
                                ]
                            },
                            'contractor_to_employee': {
                                from: [
                                    { value: '1', text: 'Michael Johnson' },
                                    { value: '2', text: 'Sarah Williams' },
                                    { value: '3', text: 'Robert Chen' }
                                ],
                                to: [
                                    { value: '1', text: 'Michael Johnson' },
                                    { value: '2', text: 'Sarah Williams' },
                                    { value: '3', text: 'Robert Chen' },
                                    { value: '4', text: 'Lisa Rodriguez' }
                                ]
                            },
                            'company_to_contractor': {
                                from: [
                                    { value: 'company', text: 'BuildRight Construction' }
                                ],
                                to: [
                                    { value: '1', text: 'Michael Johnson' },
                                    { value: '2', text: 'Sarah Williams' },
                                    { value: '3', text: 'Robert Chen' }
                                ]
                            },
                            'company_to_employee': {
                                from: [
                                    { value: 'company', text: 'BuildRight Construction' }
                                ],
                                to: [
                                    { value: '1', text: 'Michael Johnson' },
                                    { value: '2', text: 'Sarah Williams' },
                                    { value: '3', text: 'Robert Chen' },
                                    { value: '4', text: 'Lisa Rodriguez' }
                                ]
                            },
                            'refund': {
                                from: [
                                    { value: 'company', text: 'BuildRight Construction' }
                                ],
                                to: [
                                    { value: '1', text: 'Jennifer Martinez' },
                                    { value: '2', text: 'David Thompson' },
                                    { value: '3', text: 'Amanda Roberts' },
                                    { value: '4', text: 'Robert Chen' }
                                ]
                            },
                            'client_to_company': {
                                from: [
                                    { value: '1', text: 'Jennifer Martinez' },
                                    { value: '2', text: 'David Thompson' },
                                    { value: '3', text: 'Amanda Roberts' },
                                    { value: '4', text: 'Robert Chen' }
                                ],
                                to: [
                                    { value: 'company', text: 'BuildRight Construction' }
                                ]
                            }
                        };

                        const typeOptions = options[paymentType];
                        if (typeOptions) {
                            typeOptions.from.forEach(option => {
                                fromSelect.append(`<option value="${option.value}">${option.text}</option>`);
                            });

                            typeOptions.to.forEach(option => {
                                toSelect.append(`<option value="${option.value}">${option.text}</option>`);
                            });
                        }
                    }

                    // Load Payment Data
                    function loadPaymentData(paymentId, actionType) {
                        if (actionType === 'add') {
                            clearPaymentForm();
                            generatePaymentId();
                            return;
                        }

                        // Mock data - replace with API calls
                        const paymentData = {
                            1: {
                                type: 'client_to_contractor',
                                category: 'project_payment',
                                from: '1',
                                to: '1',
                                project: '1',
                                amount: 25000,
                                date: '2024-01-15',
                                method: 'bank_transfer',
                                status: 'completed',
                                reference: 'TRX-001234',
                                description: 'Progress payment for foundation work completion',
                                taxAmount: 1500,
                                feeAmount: 25,
                                notes: 'Payment received on time. Client satisfied with progress.'
                            },
                            2: {
                                type: 'contractor_to_employee',
                                category: 'salary',
                                from: '1',
                                to: '2',
                                project: '1',
                                amount: 5000,
                                date: '2024-01-16',
                                method: 'check',
                                status: 'completed',
                                reference: 'CHK-567890',
                                description: 'Monthly salary payment for project management services',
                                taxAmount: 750,
                                feeAmount: 0,
                                notes: 'Regular salary payment.'
                            },
                            3: {
                                type: 'company_to_contractor',
                                category: 'project_payment',
                                from: 'company',
                                to: '3',
                                project: '2',
                                amount: 15000,
                                date: '2024-01-17',
                                method: 'bank_transfer',
                                status: 'pending',
                                reference: 'TRX-345678',
                                description: 'Advance payment for structural engineering services',
                                taxAmount: 900,
                                feeAmount: 15,
                                notes: 'Awaiting bank confirmation.'
                            },
                            4: {
                                type: 'refund',
                                category: 'other',
                                from: 'company',
                                to: '2',
                                project: '3',
                                amount: 2500,
                                date: '2024-01-18',
                                method: 'credit_card',
                                status: 'completed',
                                reference: 'REF-901234',
                                description: 'Refund for cancelled service',
                                taxAmount: 0,
                                feeAmount: 0,
                                notes: 'Client requested refund due to schedule conflict.'
                            },
                            5: {
                                type: 'company_to_employee',
                                category: 'salary',
                                from: 'company',
                                to: '4',
                                project: '4',
                                amount: 3200,
                                date: '2024-01-19',
                                method: 'direct_deposit',
                                status: 'completed',
                                reference: 'DD-567812',
                                description: 'Bi-weekly salary payment',
                                taxAmount: 480,
                                feeAmount: 0,
                                notes: 'Regular payroll processing.'
                            }
                        };

                        const data = paymentData[paymentId];
                        if (data) {
                            // Fill form fields
                            $('#paymentType').val(data.type);
                            $('#paymentCategory').val(data.category);
                            $('#paymentFrom').val(data.from);
                            $('#paymentTo').val(data.to);
                            $('#paymentProject').val(data.project);
                            $('#paymentAmount').val(data.amount);
                            $('#paymentDate').val(data.date);
                            $('#paymentMethod').val(data.method);
                            $('#paymentStatus').val(data.status);
                            $('#paymentReference').val(data.reference);
                            $('#paymentDescription').val(data.description);
                            $('#taxAmount').val(data.taxAmount);
                            $('#feeAmount').val(data.feeAmount);
                            $('#paymentNotes').val(data.notes);

                            // Calculate total
                            calculateTotalAmount();

                            // Set payment ID
                            $('#paymentId').val(paymentId);
                        }
                    }

                    // Helper functions
                    function clearPaymentForm() {
                        $('#paymentType').val('');
                        $('#paymentCategory').val('project_payment');
                        $('#paymentFrom').val('');
                        $('#paymentTo').val('');
                        $('#paymentProject').val('');
                        $('#paymentAmount').val('');
                        $('#paymentDate').val('');
                        $('#paymentMethod').val('');
                        $('#paymentStatus').val('pending');
                        $('#paymentReference').val('');
                        $('#paymentDescription').val('');
                        $('#taxAmount').val('0');
                        $('#feeAmount').val('0');
                        $('#paymentNotes').val('');
                        $('#paymentItemsContainer').empty();
                        calculateTotalAmount();
                    }

                    function generatePaymentId() {
                        // In real application, this would come from the server
                        const randomId = Math.floor(Math.random() * 1000).toString().padStart(3, '0');
                        return `PAY-${randomId}`;
                    }

                    function calculateTotalAmount() {
                        const amount = parseFloat($('#paymentAmount').val()) || 0;
                        const tax = parseFloat($('#taxAmount').val()) || 0;
                        const fee = parseFloat($('#feeAmount').val()) || 0;
                        const total = amount + tax + fee;
                        $('#totalAmount').val(total.toFixed(2));
                    }

                    function addPaymentItem() {
                        const itemId = Date.now();
                        const itemHtml = `
            <div class="payment-item row mb-2" data-id="${itemId}">
                <div class="col-md-5">
                    <input type="text" class="form-control" placeholder="Item description">
                </div>
                <div class="col-md-3">
                    <input type="number" class="form-control" placeholder="Quantity" value="1">
                </div>
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-text">$</span>
                        <input type="number" class="form-control" placeholder="Price" step="0.01">
                    </div>
                </div>
                <div class="col-md-1">
                    <button type="button" class="btn btn-sm btn-outline-danger remove-payment-item">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
            </div>
        `;
                        $('#paymentItemsContainer').append(itemHtml);
                    }

                    // Remove Payment Item
                    $(document).on('click', '.remove-payment-item', function () {
                        $(this).closest('.payment-item').remove();
                    });

                    // Edit Button Click

                    // Edit Button Click Handler
                    $('#editPaymentBtn').click(function () {
                        openPaymentManagement('edit', currentPaymentData.paymentId);
                    });

                    // Save Payment Button
                    $('#savePaymentBtn').click(function () {
                        savePayment();
                    });

                    // Cancel Payment Button
                    $('#cancelPaymentBtn').click(function () {
                        cancelPayment();
                    });

                    // Save Payment Function
                    function savePayment() {
                        if (!validatePaymentForm()) {
                            return;
                        }

                        const paymentData = gatherPaymentData();
                        const actionType = $('#paymentActionType').val();

                        // Simulate API call - replace with actual API
                        simulateAPICall(actionType, paymentData)
                            .then(response => {
                                showAlert('Payment saved successfully!', 'success');
                                $('#paymentManagementModal').modal('hide');
                                refreshPaymentsTable();
                            })
                            .catch(error => {
                                showAlert('Error saving payment: ' + error.message, 'error');
                            });
                    }

                    // Cancel Payment Function
                    function cancelPayment() {
                        const paymentId = $('#paymentId').val();

                        if (confirm('Are you sure you want to cancel this payment? This action cannot be undone.')) {
                            // Simulate API call - replace with actual API
                            simulateCancelPayment(paymentId)
                                .then(response => {
                                    showAlert('Payment cancelled successfully!', 'success');
                                    $('#paymentManagementModal').modal('hide');
                                    refreshPaymentsTable();
                                })
                                .catch(error => {
                                    showAlert('Error cancelling payment: ' + error.message, 'error');
                                });
                        }
                    }

                    // Validate Payment Form
                    function validatePaymentForm() {
                        const requiredFields = [
                            '#paymentType', '#paymentFrom', '#paymentTo',
                            '#paymentAmount', '#paymentDate', '#paymentMethod',
                            '#paymentDescription'
                        ];

                        let isValid = true;
                        let firstInvalidField = null;

                        requiredFields.forEach(field => {
                            const value = $(field).val();
                            if (!value) {
                                isValid = false;
                                if (!firstInvalidField) {
                                    firstInvalidField = field;
                                }
                                $(field).addClass('is-invalid');
                            } else {
                                $(field).removeClass('is-invalid');
                            }
                        });

                        // Validate amount is positive
                        const amount = parseFloat($('#paymentAmount').val());
                        if (amount <= 0) {
                            isValid = false;
                            $('#paymentAmount').addClass('is-invalid');
                            if (!firstInvalidField) firstInvalidField = '#paymentAmount';
                        }

                        if (!isValid && firstInvalidField) {
                            $(firstInvalidField).focus();
                            showAlert('Please fill in all required fields correctly.', 'warning');
                        }

                        return isValid;
                    }

                    // Gather Payment Data from Form
                    function gatherPaymentData() {
                        return {
                            id: $('#paymentId').val(),
                            type: $('#paymentType').val(),
                            category: $('#paymentCategory').val(),
                            from: $('#paymentFrom').val(),
                            to: $('#paymentTo').val(),
                            project: $('#paymentProject').val(),
                            amount: parseFloat($('#paymentAmount').val()),
                            date: $('#paymentDate').val(),
                            method: $('#paymentMethod').val(),
                            status: $('#paymentStatus').val(),
                            reference: $('#paymentReference').val(),
                            description: $('#paymentDescription').val(),
                            taxAmount: parseFloat($('#taxAmount').val()) || 0,
                            feeAmount: parseFloat($('#feeAmount').val()) || 0,
                            totalAmount: parseFloat($('#totalAmount').val()) || 0,
                            notes: $('#paymentNotes').val(),
                            items: gatherPaymentItems()
                        };
                    }

                    // Gather Payment Items
                    function gatherPaymentItems() {
                        const items = [];
                        $('.payment-item').each(function () {
                            const item = {
                                description: $(this).find('input[type="text"]').val(),
                                quantity: parseInt($(this).find('input[type="number"]').eq(0).val()) || 1,
                                price: parseFloat($(this).find('input[type="number"]').eq(1).val()) || 0
                            };
                            if (item.description) {
                                items.push(item);
                            }
                        });
                        return items;
                    }

                    // Apply Payment Filters
                    function applyPaymentFilters() {
                        const typeFilter = $('#paymentTypeFilter').val();
                        const statusFilter = $('#paymentStatusFilter').val();
                        const dateFrom = $('#dateFromFilter').val();
                        const dateTo = $('#dateToFilter').val();

                        $('table.data-table tbody tr').each(function () {
                            let showRow = true;
                            const row = $(this);

                            // Type filter
                            if (typeFilter) {
                                const typeText = row.find('td:nth-child(2) .badge').text().toLowerCase();
                                const typeMapping = {
                                    'client → contractor': 'client_to_contractor',
                                    'contractor → employee': 'contractor_to_employee',
                                    'company → contractor': 'company_to_contractor',
                                    'company → employee': 'company_to_employee',
                                    'refund to client': 'refund'
                                };

                                const rowType = typeMapping[typeText.toLowerCase()];
                                if (rowType !== typeFilter) {
                                    showRow = false;
                                }
                            }

                            // Status filter
                            if (statusFilter && showRow) {
                                const statusText = row.find('.status-badge').text().toLowerCase();
                                if (statusText !== statusFilter.toLowerCase()) {
                                    showRow = false;
                                }
                            }

                            // Date filter
                            if (dateFrom && showRow) {
                                const rowDate = row.find('td:nth-child(7)').text();
                                if (new Date(rowDate) < new Date(dateFrom)) {
                                    showRow = false;
                                }
                            }

                            if (dateTo && showRow) {
                                const rowDate = row.find('td:nth-child(7)').text();
                                if (new Date(rowDate) > new Date(dateTo)) {
                                    showRow = false;
                                }
                            }

                            row.toggle(showRow);
                        });

                        showAlert('Filters applied successfully!', 'success');
                    }

                    // Reset Payment Filters
                    function resetPaymentFilters() {
                        $('#paymentTypeFilter').val('');
                        $('#paymentStatusFilter').val('');
                        $('#dateFromFilter').val('');
                        $('#dateToFilter').val('');

                        $('table.data-table tbody tr').show();
                        showAlert('Filters reset successfully!', 'info');
                    }

                    // Refresh Payments Table
                    function refreshPaymentsTable() {
                        // In a real application, this would reload data from the server
                        // For now, we'll just show a notification
                        console.log('Refreshing payments table...');
                        // You would typically make an API call here to get updated data
                    }

                    // Simulate API Calls
                    function simulateAPICall(actionType, data) {
                        return new Promise((resolve, reject) => {
                            setTimeout(() => {
                                // Simulate random success/failure
                                if (Math.random() > 0.1) { // 90% success rate
                                    console.log(`${actionType} payment:`, data);
                                    resolve({ success: true, data: data });
                                } else {
                                    reject(new Error('Network error or server unavailable'));
                                }
                            }, 1000);
                        });
                    }

                    function simulateCancelPayment(paymentId) {
                        return new Promise((resolve, reject) => {
                            setTimeout(() => {
                                if (Math.random() > 0.1) { // 90% success rate
                                    console.log('Cancelled payment:', paymentId);
                                    resolve({ success: true, paymentId: paymentId });
                                } else {
                                    reject(new Error('Unable to cancel payment'));
                                }
                            }, 1000);
                        });
                    }

                    // Show Notification
                
                    // Initialize date fields with current date
                    function initializeDateFields() {
                        const today = new Date().toISOString().split('T')[0];
                        $('#paymentDate').val(today);
                    }

                    // Initialize the payment management system
                    function initializePaymentSystem() {
                        initializeDateFields();
                        console.log('Payment Management System initialized');
                    }

                    // Call initialization when document is ready
                    initializePaymentSystem();
                });
            </script>
        </div>

       


</asp:Content>