<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master"  CodeBehind="OrderDetails.aspx.cs" Inherits="MediCare.Views.OrderDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <section>
       <div class="row">
    <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4>Order Details - #MED-1247</h4>
            <div class="btn-group">
                <a href="Orders.aspx" class="btn btn-outline-secondary">
                    <i class="fas fa-arrow-left me-2"></i>Back to Orders
                </a>
                <button class="btn btn-outline-primary" onclick="window.print()">
                    <i class="fas fa-print me-2"></i>Print
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Order Status & Actions -->
<div class="row mb-4">
    <div class="col-12">
        <div class="card-medical">
            <div class="card-medical-body">
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <div class="d-flex align-items-center">
                            <div class="order-status-badge me-3">
                                <span class="badge bg-warning fs-6">Pending Verification</span>
                            </div>
                            <div class="order-meta">
                                <small class="text-muted">Placed on: <strong>10 Jan 2024, 10:30 AM</strong></small>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="d-flex justify-content-end gap-2">
                            <button class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#verifyPrescriptionModal">
                                <i class="fas fa-check me-1"></i>Verify Prescription
                            </button>
                            <button class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#rejectOrderModal">
                                <i class="fas fa-times me-1"></i>Reject Order
                            </button>
                            <div class="dropdown">
                                <button class="btn btn-outline-secondary btn-sm dropdown-toggle" data-bs-toggle="dropdown">
                                    <i class="fas fa-cog me-1"></i>Actions
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#"><i class="fas fa-edit me-2"></i>Edit Order</a></li>
                                    <li><a class="dropdown-item" href="#"><i class="fas fa-phone me-2"></i>Contact Customer</a></li>
                                    <li><a class="dropdown-item" href="#"><i class="fas fa-file-invoice me-2"></i>Generate Invoice</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item text-danger" href="#"><i class="fas fa-trash me-2"></i>Cancel Order</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <!-- Left Column - Order Information -->
    <div class="col-lg-8">
        <!-- Order Items -->
        <div class="card-medical mb-4">
            <div class="card-medical-header">
                <h6 class="mb-0">
                    <i class="fas fa-shopping-cart me-2"></i>
                    Order Items
                </h6>
            </div>
            <div class="card-medical-body">
                <div class="table-responsive">
                    <table class="table table-medical">
                        <thead>
                            <tr>
                                <th>Medicine</th>
                                <th>Type</th>
                                <th>Batch</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Total</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="medicine-icon me-3">
                                            <i class="fas fa-prescription-bottle text-warning"></i>
                                        </div>
                                        <div>
                                            <strong>Amoxicillin 250mg</strong>
                                            <div class="text-muted small">Capsule · Prescription Required</div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <span class="badge-medical badge-prescription">Rx</span>
                                </td>
                                <td>
                                    <small>BATCH-2024-015</small>
                                    <div class="text-success small">Exp: Mar 2025</div>
                                </td>
                                <td>
                                    <div class="quantity-controls">
                                        <div class="input-group input-group-sm" style="width: 120px;">
                                            <button class="btn btn-outline-secondary" type="button">-</button>
                                            <input type="number" class="form-control text-center" value="1" min="1" max="10">
                                            <button class="btn btn-outline-secondary" type="button">+</button>
                                        </div>
                                    </div>
                                </td>
                                <td>₹180.00</td>
                                <td>₹180.00</td>
                                <td>
                                    <span class="badge bg-warning">Pending</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="medicine-icon me-3">
                                            <i class="fas fa-pills text-primary"></i>
                                        </div>
                                        <div>
                                            <strong>Paracetamol 500mg</strong>
                                            <div class="text-muted small">Tablet · OTC</div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <span class="badge-medical badge-otc">OTC</span>
                                </td>
                                <td>
                                    <small>BATCH-2024-001</small>
                                    <div class="text-success small">Exp: Dec 2024</div>
                                </td>
                                <td>
                                    <div class="quantity-controls">
                                        <div class="input-group input-group-sm" style="width: 120px;">
                                            <button class="btn btn-outline-secondary" type="button">-</button>
                                            <input type="number" class="form-control text-center" value="2" min="1" max="20">
                                            <button class="btn btn-outline-secondary" type="button">+</button>
                                        </div>
                                    </div>
                                </td>
                                <td>₹25.00</td>
                                <td>₹50.00</td>
                                <td>
                                    <span class="badge bg-success">In Stock</span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="medicine-icon me-3">
                                            <i class="fas fa-capsules text-info"></i>
                                        </div>
                                        <div>
                                            <strong>Vitamin C 500mg</strong>
                                            <div class="text-muted small">Tablet · OTC</div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <span class="badge-medical badge-otc">OTC</span>
                                </td>
                                <td>
                                    <small>BATCH-2024-005</small>
                                    <div class="text-success small">Exp: Jun 2025</div>
                                </td>
                                <td>
                                    <div class="quantity-controls">
                                        <div class="input-group input-group-sm" style="width: 120px;">
                                            <button class="btn btn-outline-secondary" type="button">-</button>
                                            <input type="number" class="form-control text-center" value="1" min="1" max="15">
                                            <button class="btn btn-outline-secondary" type="button">+</button>
                                        </div>
                                    </div>
                                </td>
                                <td>₹45.00</td>
                                <td>₹45.00</td>
                                <td>
                                    <span class="badge bg-danger">Out of Stock</span>
                                </td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="5" class="text-end"><strong>Subtotal:</strong></td>
                                <td><strong>₹275.00</strong></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="5" class="text-end">Shipping:</td>
                                <td>₹50.00</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="5" class="text-end">Tax (5%):</td>
                                <td>₹13.75</td>
                                <td></td>
                            </tr>
                            <tr class="table-active">
                                <td colspan="5" class="text-end"><strong>Total Amount:</strong></td>
                                <td><strong class="text-primary">₹338.75</strong></td>
                                <td></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>

        <!-- Prescription Verification -->
        <div class="card-medical mb-4">
            <div class="card-medical-header">
                <h6 class="mb-0">
                    <i class="fas fa-file-prescription me-2"></i>
                    Prescription Verification
                </h6>
            </div>
            <div class="card-medical-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="prescription-images">
                            <h6 class="mb-3">Uploaded Prescriptions</h6>
                            <div class="row g-2">
                                <div class="col-6">
                                    <div class="prescription-thumbnail">
                                        <img src="https://via.placeholder.com/200x300/e2e8f0/64748b?text=Prescription+1" 
                                             class="img-fluid rounded border" 
                                             style="cursor: pointer"
                                             data-bs-toggle="modal" 
                                             data-bs-target="#prescriptionModal">
                                        <div class="text-center mt-1">
                                            <small class="text-muted">Front View</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="prescription-thumbnail">
                                        <img src="https://via.placeholder.com/200x300/e2e8f0/64748b?text=Prescription+2" 
                                             class="img-fluid rounded border"
                                             style="cursor: pointer"
                                             data-bs-toggle="modal" 
                                             data-bs-target="#prescriptionModal">
                                        <div class="text-center mt-1">
                                            <small class="text-muted">Back View</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="verification-info">
                            <h6 class="mb-3">Verification Details</h6>
                            <div class="verification-status mb-3">
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <span class="text-muted">Status:</span>
                                    <span class="badge bg-warning">Pending Verification</span>
                                </div>
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <span class="text-muted">Doctor:</span>
                                    <span>Dr. Rajesh Sharma</span>
                                </div>
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    <span class="text-muted">Clinic/Hospital:</span>
                                    <span>City Hospital</span>
                                </div>
                                <div class="d-flex justify-content-between align-items-center">
                                    <span class="text-muted">Date:</span>
                                    <span>08 Jan 2024</span>
                                </div>
                            </div>
                            
                            <div class="verification-actions">
                                <div class="d-grid gap-2">
                                    <button class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#verifyPrescriptionModal">
                                        <i class="fas fa-check me-1"></i>Approve Prescription
                                    </button>
                                    <button class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#rejectPrescriptionModal">
                                        <i class="fas fa-times me-1"></i>Reject Prescription
                                    </button>
                                    <button class="btn btn-outline-secondary btn-sm">
                                        <i class="fas fa-comment me-1"></i>Request Clarification
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Order Timeline -->
        <div class="card-medical">
            <div class="card-medical-header">
                <h6 class="mb-0">
                    <i class="fas fa-history me-2"></i>
                    Order Timeline
                </h6>
            </div>
            <div class="card-medical-body">
                <div class="timeline">
                    <div class="timeline-item">
                        <div class="timeline-marker bg-success">
                            <i class="fas fa-shopping-cart"></i>
                        </div>
                        <div class="timeline-content">
                            <h6 class="mb-1">Order Placed</h6>
                            <p class="text-muted mb-1">Customer placed the order online</p>
                            <small class="text-muted">10 Jan 2024, 10:30 AM</small>
                        </div>
                    </div>
                    <div class="timeline-item">
                        <div class="timeline-marker bg-warning">
                            <i class="fas fa-file-prescription"></i>
                        </div>
                        <div class="timeline-content">
                            <h6 class="mb-1">Prescription Uploaded</h6>
                            <p class="text-muted mb-1">Customer uploaded prescription images</p>
                            <small class="text-muted">10 Jan 2024, 10:32 AM</small>
                        </div>
                    </div>
                    <div class="timeline-item">
                        <div class="timeline-marker bg-info">
                            <i class="fas fa-clock"></i>
                        </div>
                        <div class="timeline-content">
                            <h6 class="mb-1">Awaiting Verification</h6>
                            <p class="text-muted mb-1">Pending pharmacist verification</p>
                            <small class="text-muted">10 Jan 2024, 10:35 AM - Present</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Right Column - Order Summary & Actions -->
    <div class="col-lg-4">
        <!-- Customer Information -->
        <div class="card-medical mb-4">
            <div class="card-medical-header">
                <h6 class="mb-0">
                    <i class="fas fa-user me-2"></i>
                    Customer Information
                </h6>
            </div>
            <div class="card-medical-body">
                <div class="customer-info">
                    <div class="d-flex align-items-center mb-3">
                        <div class="customer-avatar me-3">
                            <div class="avatar-circle bg-primary text-white">
                                AK
                            </div>
                        </div>
                        <div>
                            <h6 class="mb-0">Amit Kumar</h6>
                            <small class="text-muted">Customer #CUST-001</small>
                        </div>
                    </div>
                    
                    <div class="customer-details">
                        <div class="detail-item mb-2">
                            <i class="fas fa-envelope me-2 text-muted"></i>
                            <span>amit.kumar@email.com</span>
                        </div>
                        <div class="detail-item mb-2">
                            <i class="fas fa-phone me-2 text-muted"></i>
                            <span>+91 98765 43210</span>
                        </div>
                        <div class="detail-item mb-3">
                            <i class="fas fa-map-marker-alt me-2 text-muted"></i>
                            <span>123 Main Street, Mumbai</span>
                        </div>
                    </div>
                    
                    <div class="customer-stats">
                        <div class="row text-center">
                            <div class="col-4">
                                <div class="stat-value text-primary">24</div>
                                <div class="stat-label small">Orders</div>
                            </div>
                            <div class="col-4">
                                <div class="stat-value text-success">₹12.8K</div>
                                <div class="stat-label small">Total Spent</div>
                            </div>
                            <div class="col-4">
                                <div class="stat-value text-info">4.5</div>
                                <div class="stat-label small">Rating</div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="customer-actions mt-3">
                        <div class="d-grid gap-2">
                            <button class="btn btn-outline-primary btn-sm">
                                <i class="fas fa-eye me-1"></i>View Profile
                            </button>
                            <button class="btn btn-outline-secondary btn-sm">
                                <i class="fas fa-phone me-1"></i>Contact Customer
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <!-- 🧾 Order Summary -->
<div class="card-medical mb-4 shadow-sm rounded-3">
    <!-- Card Header -->
    <div class="card-medical-header bg-light border-bottom py-2 px-3">
        <h6 class="mb-0 text-dark">
            <i class="fas fa-receipt me-2 text-primary"></i>
            Order Summary
        </h6>
    </div>

    <!-- Card Body -->
    <div class="card-medical-body p-3">
        <div class="order-summary">

            <!-- Order Details -->
            <div class="summary-item d-flex justify-content-between mb-2">
                <span class="">Order ID:</span>
                <span class="fw-bold">#MED-1247</span>
            </div>

            <div class="summary-item d-flex justify-content-between mb-2">
                <span class="">Order Type:</span>
                <span class="badge bg-secondary">Prescription</span>
            </div>

            <div class="summary-item d-flex justify-content-between mb-2">
                <span class="">Payment Method:</span>
                <span>Cash on Delivery</span>
            </div>

            <div class="summary-item d-flex justify-content-between mb-2">
                <span class="">Payment Status:</span>
                <span class="badge bg-warning text-dark">Pending</span>
            </div>

            <div class="summary-item d-flex justify-content-between mb-3">
                <span class="">Shipping Method:</span>
                <span>Standard Delivery</span>
            </div>

            <hr class="my-2">

            <!-- Cost Breakdown -->
            <div class="summary-item d-flex justify-content-between mb-1">
                <span>Subtotal:</span>
                <span>₹275.00</span>
            </div>

            <div class="summary-item d-flex justify-content-between mb-1">
                <span>Shipping:</span>
                <span>₹50.00</span>
            </div>

            <div class="summary-item d-flex justify-content-between mb-1">
                <span>Tax:</span>
                <span>₹13.75</span>
            </div>

            <div class="summary-item d-flex justify-content-between mb-3">
                <span>Discount:</span>
                <span class="text-success">-₹0.00</span>
            </div>

            <!-- Total -->
            <div class="summary-total d-flex justify-content-between align-items-center fw-bold fs-5 pt-2 border-top">
                <span>Total:</span>
                <span class="text-primary">₹338.75</span>
            </div>

        </div>
    </div>
</div>

        <!-- Quick Actions -->
        <div class="card-medical">
            <div class="card-medical-header">
                <h6 class="mb-0">
                    <i class="fas fa-bolt me-2"></i>
                    Quick Actions
                </h6>
            </div>
            <div class="card-medical-body">
                <div class="quick-actions">
                    <div class="d-grid gap-2">
                        <button class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#processOrderModal">
                            <i class="fas fa-play me-1"></i>Process Order
                        </button>
                        <button class="btn btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#updateStatusModal">
                            <i class="fas fa-sync me-1"></i>Update Status
                        </button>
                        <button class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#assignDriverModal">
                            <i class="fas fa-truck me-1"></i>Assign for Delivery
                        </button>
                        <button class="btn btn-outline-primary btn-sm">
                            <i class="fas fa-file-invoice me-1"></i>Generate Invoice
                        </button>
                        <button class="btn btn-outline-danger btn-sm">
                            <i class="fas fa-times me-1"></i>Cancel Order
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modals -->
<!-- Verify Prescription Modal -->
<div class="modal fade" id="verifyPrescriptionModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Verify Prescription</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to approve this prescription?</p>
                <div class="mb-3">
                    <label class="form-label">Verification Notes (Optional)</label>
                    <textarea class="form-control" rows="3" placeholder="Add any notes about the verification..."></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-success">Approve Prescription</button>
            </div>
        </div>
    </div>
</div>

<!-- Reject Prescription Modal -->
<div class="modal fade" id="rejectPrescriptionModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Reject Prescription</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <label class="form-label">Reason for Rejection <span class="text-danger">*</span></label>
                    <select class="form-select">
                        <option value="">Select Reason</option>
                        <option value="expired">Prescription Expired</option>
                        <option value="unclear">Unclear/Illegible</option>
                        <option value="missing-info">Missing Doctor Signature</option>
                        <option value="invalid-doctor">Invalid Doctor Details</option>
                        <option value="quantity-mismatch">Quantity Mismatch</option>
                        <option value="other">Other</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label">Additional Notes</label>
                    <textarea class="form-control" rows="3" placeholder="Provide detailed reason for rejection..."></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-danger">Reject Prescription</button>
            </div>
        </div>
    </div>
</div>

<!-- Prescription View Modal -->
<div class="modal fade" id="prescriptionModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Prescription View</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body text-center">
                <img src="https://via.placeholder.com/600x800/e2e8f0/64748b?text=Prescription+Detail+View" 
                     class="img-fluid rounded" alt="Prescription">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">
                    <i class="fas fa-download me-1"></i>Download
                </button>
            </div>
        </div>
    </div>
</div>
   </section>

<script>
    // Order Details Page Functionality
    document.addEventListener('DOMContentLoaded', function () {
        // Quantity controls
        const quantityControls = document.querySelectorAll('.quantity-controls');

        quantityControls.forEach(control => {
            const minusBtn = control.querySelector('.btn:first-child');
            const plusBtn = control.querySelector('.btn:last-child');
            const input = control.querySelector('input');

            minusBtn.addEventListener('click', function () {
                const currentValue = parseInt(input.value);
                if (currentValue > parseInt(input.min)) {
                    input.value = currentValue - 1;
                    updateOrderTotals();
                }
            });

            plusBtn.addEventListener('click', function () {
                const currentValue = parseInt(input.value);
                if (currentValue < parseInt(input.max)) {
                    input.value = currentValue + 1;
                    updateOrderTotals();
                }
            });

            input.addEventListener('change', function () {
                const value = parseInt(this.value);
                const min = parseInt(this.min);
                const max = parseInt(this.max);

                if (value < min) this.value = min;
                if (value > max) this.value = max;

                updateOrderTotals();
            });
        });

        // Update order totals
        function updateOrderTotals() {
            let subtotal = 0;

            document.querySelectorAll('tbody tr').forEach(row => {
                const quantity = parseInt(row.querySelector('input').value);
                const price = parseFloat(row.querySelector('td:nth-child(5)').textContent.replace('₹', ''));
                const total = quantity * price;

                row.querySelector('td:nth-child(6)').textContent = `₹${total.toFixed(2)}`;
                subtotal += total;
            });

            const shipping = 50.00;
            const tax = subtotal * 0.05;
            const total = subtotal + shipping + tax;

            // Update summary
            document.querySelector('tfoot tr:first-child td:last-child').innerHTML = `<strong>₹${subtotal.toFixed(2)}</strong>`;
            document.querySelector('tfoot tr:nth-child(2) td:last-child').textContent = `₹${shipping.toFixed(2)}`;
            document.querySelector('tfoot tr:nth-child(3) td:last-child').textContent = `₹${tax.toFixed(2)}`;
            document.querySelector('tfoot tr:last-child td:last-child').innerHTML = `<strong class="text-primary">₹${total.toFixed(2)}</strong>`;

            // Update right panel summary
            document.querySelector('.summary-item:nth-child(1) span:last-child').textContent = `₹${subtotal.toFixed(2)}`;
            document.querySelector('.summary-item:nth-child(2) span:last-child').textContent = `₹${shipping.toFixed(2)}`;
            document.querySelector('.summary-item:nth-child(3) span:last-child').textContent = `₹${tax.toFixed(2)}`;
            document.querySelector('.summary-total span:last-child').textContent = `₹${total.toFixed(2)}`;
        }

        // Prescription verification actions
        const verifyBtn = document.querySelector('[data-bs-target="#verifyPrescriptionModal"]');
        const rejectBtn = document.querySelector('[data-bs-target="#rejectPrescriptionModal"]');

        if (verifyBtn) {
            verifyBtn.addEventListener('click', function () {
                // Additional logic for verification
                console.log('Verify prescription clicked');
            });
        }

        if (rejectBtn) {
            rejectBtn.addEventListener('click', function () {
                // Additional logic for rejection
                console.log('Reject prescription clicked');
            });
        }

        // Status update functionality
        const statusButtons = document.querySelectorAll('.quick-actions .btn');

        statusButtons.forEach(btn => {
            btn.addEventListener('click', function () {
                const action = this.textContent.trim();
                console.log(`Action: ${action}`);

                // Simulate status update
                if (action.includes('Process Order')) {
                    updateOrderStatus('processing', 'Order is being processed');
                } else if (action.includes('Update Status')) {
                    // This would open a modal in real implementation
                    console.log('Open status update modal');
                } else if (action.includes('Assign for Delivery')) {
                    updateOrderStatus('shipped', 'Order assigned for delivery');
                }
            });
        });

        // Update order status function
        function updateOrderStatus(newStatus, message) {
            const statusBadge = document.querySelector('.order-status-badge .badge');
            const timeline = document.querySelector('.timeline');

            // Update status badge
            statusBadge.textContent = newStatus.charAt(0).toUpperCase() + newStatus.slice(1);
            statusBadge.className = 'badge bg-success fs-6'; // Change color based on status

            // Add to timeline
            const newTimelineItem = document.createElement('div');
            newTimelineItem.className = 'timeline-item';
            newTimelineItem.innerHTML = `
            <div class="timeline-marker bg-success">
                <i class="fas fa-check"></i>
            </div>
            <div class="timeline-content">
                <h6 class="mb-1">Status Updated</h6>
                <p class="text-muted mb-1">${message}</p>
                <small class="text-muted">${new Date().toLocaleString()}</small>
            </div>
        `;

            timeline.appendChild(newTimelineItem);

            showNotification(`Order status updated to: ${newStatus}`, 'success');
        }

        // Notification function
        function showNotification(message, type = 'info') {
            const notification = document.createElement('div');
            notification.className = `alert alert-${type === 'error' ? 'danger' : type} alert-dismissible fade show`;
            notification.innerHTML = `
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        `;

            const container = document.querySelector('.content-wrapper');
            container.insertBefore(notification, container.firstChild);

            setTimeout(() => {
                if (notification.parentNode) {
                    notification.remove();
                }
            }, 5000);
        }

        // Print functionality
        const printBtn = document.querySelector('button[onclick="window.print()"]');
        if (printBtn) {
            printBtn.addEventListener('click', function () {
                // Additional print logic if needed
                console.log('Print order details');
            });
        }
    });
</script>
</asp:Content>

