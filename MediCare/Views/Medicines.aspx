<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Medicines.aspx.cs" Inherits="MediCare.Views.Medicines" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section>
        <div class="row">
            <div class="col-12">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h4>Medicine Management</h4>
                    <div class="btn-group ">
                        <button type="button" class="btn btn-medical btn-medical-primary"
                            onclick="window.location.href='/Views/MedicinesDetails.aspx'">
                            <i class="fas fa-plus me-2"></i>Add Medicine
                        </button>
                        <button class="btn btn-outline-secondary">
                            <i class="fas fa-download me-2"></i>Export 
                        </button>
                    </div>

                </div>
            </div>
        </div>

        <!-- Filters and Search -->
        <div class="row mb-4">
            <div class="col-12">
                <div class="card-medical">
                    <div class="card-medical-body">
                        <div class="row g-3">
                            <div class="col-md-3">
                                <label class="form-label">Search</label>
                                <input type="text" class="form-control" placeholder="Medicine name or salt...">
                            </div>
                            <div class="col-md-2">
                                <label class="form-label">Category</label>
                                <select class="form-select">
                                    <option value="">All Categories</option>
                                    <option value="analgesic">Analgesic</option>
                                    <option value="antibiotic">Antibiotic</option>
                                    <option value="antihistamine">Antihistamine</option>
                                    <option value="vitamin">Vitamin</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <label class="form-label">Medicine Type</label>
                                <select class="form-select">
                                    <option value="">All Types</option>
                                    <option value="prescription">Prescription</option>
                                    <option value="otc">Over-the-counter</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <label class="form-label">Stock Status</label>
                                <select class="form-select">
                                    <option value="">All Status</option>
                                    <option value="in-stock">In Stock</option>
                                    <option value="low-stock">Low Stock</option>
                                    <option value="out-of-stock">Out of Stock</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <label class="form-label">&nbsp;</label>
                                <div class="d-grid">
                                    <button class="btn btn-primary">Apply Filters</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Medicine List Table -->
        <div class="row">
            <div class="col-12">
                <div class="card-medical">
                    <div class="card-medical-header d-flex justify-content-between align-items-center">
                        <h6 class="mb-0">All Medicines</h6>
                        <div class="text-muted">
                            <span class="badge bg-primary">1,247 Total</span>
                        </div>
                    </div>
                    <div class="card-medical-body">
                        <div class="table-responsive">
                            <table class="table table-medical table-hover">
                                <thead>
                                    <tr>
                                        <th>
                                            <input type="checkbox" class="form-check-input">
                                        </th>
                                        <th>Medicine Name</th>
                                        <th>Salt Composition</th>
                                        <th>Category</th>
                                        <th>Type</th>
                                        <th>Stock</th>
                                        <th>Price</th>
                                        <th>Expiry Date</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <input type="checkbox" class="form-check-input">
                                        </td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <div class="medicine-icon me-3">
                                                    <i class="fas fa-pills text-primary"></i>
                                                </div>
                                                <div>
                                                    <strong>Paracetamol 500mg</strong>
                                                    <div class="text-muted small">PAN-001</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>Paracetamol</td>
                                        <td>Analgesic</td>
                                        <td><span class="badge-medical badge-otc">OTC</span></td>
                                        <td>
                                            <div class="stock-info">
                                                <span class="text-success">145</span>
                                                <div class="progress" style="height: 4px; width: 60px;">
                                                    <div class="progress-bar bg-success" style="width: 80%"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>₹25.00</td>
                                        <td>
                                            <span class="text-success">Dec 2024</span>
                                        </td>
                                        <td>
                                            <span class="status-indicator status-active"></span>
                                            <span class="text-success">Active</span>
                                        </td>
                                        <td>
                                            <div class="btn-group btn-group-sm">
                                                <button class="btn btn-outline-primary" data-bs-toggle="tooltip" title="Edit">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button class="btn btn-outline-info" data-bs-toggle="tooltip" title="View Details">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                                <button class="btn btn-outline-warning" data-bs-toggle="tooltip" title="Manage Stock">
                                                    <i class="fas fa-box"></i>
                                                </button>
                                                <button class="btn btn-outline-danger" data-bs-toggle="tooltip" title="Delete">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" class="form-check-input">
                                        </td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <div class="medicine-icon me-3">
                                                    <i class="fas fa-prescription-bottle text-warning"></i>
                                                </div>
                                                <div>
                                                    <strong>Amoxicillin 250mg</strong>
                                                    <div class="text-muted small">AMX-002</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>Amoxicillin Trihydrate</td>
                                        <td>Antibiotic</td>
                                        <td><span class="badge-medical badge-prescription">Prescription</span></td>
                                        <td>
                                            <div class="stock-info">
                                                <span class="text-warning">12</span>
                                                <div class="progress" style="height: 4px; width: 60px;">
                                                    <div class="progress-bar bg-warning" style="width: 30%"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>₹180.00</td>
                                        <td>
                                            <span class="text-success">Mar 2025</span>
                                        </td>
                                        <td>
                                            <span class="status-indicator status-active"></span>
                                            <span class="text-success">Active</span>
                                        </td>
                                        <td>
                                            <div class="btn-group btn-group-sm">
                                                <button class="btn btn-outline-primary">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button class="btn btn-outline-info">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                                <button class="btn btn-outline-warning">
                                                    <i class="fas fa-box"></i>
                                                </button>
                                                <button class="btn btn-outline-danger">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="table-warning">
                                        <td>
                                            <input type="checkbox" class="form-check-input">
                                        </td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <div class="medicine-icon me-3">
                                                    <i class="fas fa-pills text-danger"></i>
                                                </div>
                                                <div>
                                                    <strong>Vitamin C 500mg</strong>
                                                    <div class="text-muted small">VIT-005</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>Ascorbic Acid</td>
                                        <td>Vitamin</td>
                                        <td><span class="badge-medical badge-otc">OTC</span></td>
                                        <td>
                                            <div class="stock-info">
                                                <span class="text-danger">2</span>
                                                <div class="progress" style="height: 4px; width: 60px;">
                                                    <div class="progress-bar bg-danger" style="width: 5%"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>₹45.00</td>
                                        <td>
                                            <span class="text-warning">Jan 2024</span>
                                        </td>
                                        <td>
                                            <span class="status-indicator status-active"></span>
                                            <span class="text-warning">Low Stock</span>
                                        </td>
                                        <td>
                                            <div class="btn-group btn-group-sm">
                                                <button class="btn btn-outline-primary">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button class="btn btn-outline-info">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                                <button class="btn btn-outline-warning">
                                                    <i class="fas fa-box"></i>
                                                </button>
                                                <button class="btn btn-outline-danger">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="table-danger">
                                        <td>
                                            <input type="checkbox" class="form-check-input">
                                        </td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <div class="medicine-icon me-3">
                                                    <i class="fas fa-skull-crossbones text-muted"></i>
                                                </div>
                                                <div>
                                                    <strong>Cetirizine 10mg</strong>
                                                    <div class="text-muted small">CET-008</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>Cetirizine Hydrochloride</td>
                                        <td>Antihistamine</td>
                                        <td><span class="badge-medical badge-otc">OTC</span></td>
                                        <td>
                                            <div class="stock-info">
                                                <span class="text-danger">0</span>
                                                <div class="progress" style="height: 4px; width: 60px;">
                                                    <div class="progress-bar bg-danger" style="width: 0%"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>₹35.00</td>
                                        <td>
                                            <span class="text-danger">Expired</span>
                                        </td>
                                        <td>
                                            <span class="status-indicator status-inactive"></span>
                                            <span class="text-danger">Expired</span>
                                        </td>
                                        <td>
                                            <div class="btn-group btn-group-sm">
                                                <button class="btn btn-outline-primary">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button class="btn btn-outline-info">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                                <button class="btn btn-outline-warning">
                                                    <i class="fas fa-box"></i>
                                                </button>
                                                <button class="btn btn-outline-danger">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <!-- Pagination -->
                        <nav aria-label="Medicine pagination">
                            <ul class="pagination justify-content-center mb-0">
                                <li class="page-item disabled">
                                    <a class="page-link" href="#">Previous</a>
                                </li>
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#">Next</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bulk Actions -->
        <div class="row mt-3">
            <div class="col-12">
                <div class="card-medical">
                    <div class="card-medical-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="selectAll">
                                <label class="form-check-label" for="selectAll">
                                    Select all medicines
                                </label>
                            </div>
                            <div class="btn-group">
                                <button class="btn btn-outline-primary btn-sm">
                                    <i class="fas fa-edit me-1"></i>Bulk Edit
                                </button>
                                <button class="btn btn-outline-success btn-sm">
                                    <i class="fas fa-toggle-on me-1"></i>Activate
                                </button>
                                <button class="btn btn-outline-warning btn-sm">
                                    <i class="fas fa-toggle-off me-1"></i>Deactivate
                                </button>
                                <button class="btn btn-outline-danger btn-sm">
                                    <i class="fas fa-trash me-1"></i>Delete Selected
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Add Medicine Modal -->
    <div class="modal fade" id="addMedicineModal" tabindex="-1" aria-labelledby="addMedicineModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addMedicineModalLabel">
                        <i class="fas fa-pills me-2"></i>Add New Medicine
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Progress Steps -->
                    <div class="card-medical mb-4">
                        <div class="card-medical-body py-3">
                            <div class="steps-progress">
                                <div class="steps">
                                    <div class="step active">
                                        <div class="step-number">1</div>
                                        <div class="step-label">Basic Info</div>
                                    </div>
                                    <div class="step">
                                        <div class="step-number">2</div>
                                        <div class="step-label">Medical Details</div>
                                    </div>
                                    <div class="step">
                                        <div class="step-number">3</div>
                                        <div class="step-label">Inventory & Pricing</div>
                                    </div>
                                    <div class="step">
                                        <div class="step-number">4</div>
                                        <div class="step-label">Review</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Medicine Form -->
                    <div id="addMedicineForm">
                        <!-- Basic Information Section -->
                        <div class="form-section">
                            <h6 class="section-title mb-3">
                                <i class="fas fa-info-circle me-2 text-primary"></i>
                                Basic Information
                            </h6>
                            <div class="row g-2">
                                <div class="col-md-6">
                                    <label class="form-label">Medicine Name <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" name="medicineName" required
                                        placeholder="Enter medicine brand name">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Generic Name <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" name="genericName" required
                                        placeholder="Enter generic/salt name">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Medicine Type <span class="text-danger">*</span></label>
                                    <select class="form-select" name="medicineType" required>
                                        <option value="">Select Type</option>
                                        <option value="tablet">Tablet</option>
                                        <option value="capsule">Capsule</option>
                                        <option value="syrup">Syrup</option>
                                        <option value="injection">Injection</option>
                                        <option value="ointment">Ointment</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Strength</label>
                                    <div class="input-group">
                                        <input type="number" class="form-control" name="strength"
                                            placeholder="e.g., 500">
                                        <select class="form-select" name="strengthUnit" style="max-width: 120px;">
                                            <option value="mg">mg</option>
                                            <option value="g">g</option>
                                            <option value="ml">ml</option>
                                            <option value="mcg">mcg</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <hr class="my-3">

                        <!-- Medical Details Section -->
                        <div class="form-section">
                            <h6 class="section-title mb-3">
                                <i class="fas fa-stethoscope me-2 text-primary"></i>
                                Medical Details
                            </h6>
                            <div class="row g-2">
                                <div class="col-md-6">
                                    <label class="form-label">Category <span class="text-danger">*</span></label>
                                    <select class="form-select" name="category" required>
                                        <option value="">Select Category</option>
                                        <option value="analgesic">Analgesic</option>
                                        <option value="antibiotic">Antibiotic</option>
                                        <option value="antihistamine">Antihistamine</option>
                                        <option value="vitamin">Vitamin</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Prescription Required <span class="text-danger">*</span></label>
                                    <select class="form-select" name="prescriptionRequired" required>
                                        <option value="yes">Yes - Prescription Medicine</option>
                                        <option value="no">No - Over the Counter (OTC)</option>
                                    </select>
                                </div>
                                <div class="col-12">
                                    <label class="form-label">Uses/Indications</label>
                                    <textarea class="form-control" name="uses" rows="2"
                                        placeholder="What conditions does this medicine treat?"></textarea>
                                </div>
                            </div>
                        </div>

                        <hr class="my-3">

                        <!-- Inventory & Pricing Section -->
                        <div class="form-section">
                            <h6 class="section-title mb-3">
                                <i class="fas fa-boxes me-2 text-primary"></i>
                                Inventory & Pricing
                            </h6>
                            <div class="row g-2">
                                <div class="col-md-4">
                                    <label class="form-label">SKU/Product Code <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" name="sku" required
                                        placeholder="e.g., PAN-500-10">
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Batch Number <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" name="batchNumber" required
                                        placeholder="e.g., BATCH-2024-001">
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Expiry Date <span class="text-danger">*</span></label>
                                    <input type="date" class="form-control" name="expiryDate" required
                                        min="2024-01-01">
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Initial Stock <span class="text-danger">*</span></label>
                                    <input type="number" class="form-control" name="initialStock" required
                                        min="0" value="0">
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Cost Price <span class="text-danger">*</span></label>
                                    <div class="input-group">
                                        <span class="input-group-text">₹</span>
                                        <input type="number" class="form-control" name="costPrice" required
                                            step="0.01" min="0" placeholder="0.00">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label">Selling Price <span class="text-danger">*</span></label>
                                    <div class="input-group">
                                        <span class="input-group-text">₹</span>
                                        <input type="number" class="form-control" name="sellingPrice" required
                                            step="0.01" min="0" placeholder="0.00">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Quick Templates -->
                        <div class="card-medical mt-3">
                            <div class="card-medical-body py-2">
                                <small class="text-muted mb-2 d-block">Quick Templates:</small>
                                <div class="row g-1">
                                    <div class="col-md-3 col-6">
                                        <button type="button" class="btn btn-sm btn-outline-primary w-100 template-btn" data-template="analgesic">
                                            Analgesic
                                        </button>
                                    </div>
                                    <div class="col-md-3 col-6">
                                        <button type="button" class="btn btn-sm btn-outline-success w-100 template-btn" data-template="antibiotic">
                                            Antibiotic
                                        </button>
                                    </div>
                                    <div class="col-md-3 col-6">
                                        <button type="button" class="btn btn-sm btn-outline-info w-100 template-btn" data-template="vitamin">
                                            Vitamin
                                        </button>
                                    </div>
                                    <div class="col-md-3 col-6">
                                        <button type="button" class="btn btn-sm btn-outline-warning w-100 template-btn" data-template="topical">
                                            Topical
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                        <i class="fas fa-times me-2"></i>Cancel
                    </button>
                    <button type="button" class="btn btn-outline-primary" id="resetFormModal">
                        <i class="fas fa-redo me-2"></i>Reset
                    </button>
                    <button type="submit" form="addMedicineForm" class="btn btn-medical btn-medical-primary">
                        <i class="fas fa-plus me-2"></i>Add Medicine
                    </button>
                </div>
            </div>
        </div>
    </div>
   
    <script>
        // Add Medicine Modal Functionality
        document.addEventListener('DOMContentLoaded', function () {
            const addMedicineModal = document.getElementById('addMedicineModal');

            if (addMedicineModal) {
                // Initialize modal events
                addMedicineModal.addEventListener('show.bs.modal', function () {
                    resetForm();
                });

                addMedicineModal.addEventListener('hidden.bs.modal', function () {
                    resetForm();
                });

                const form = document.getElementById('addMedicineForm');
                const resetBtn = document.getElementById('resetFormModal');
                const templateBtns = addMedicineModal.querySelectorAll('.template-btn');

                // Form Reset
                resetBtn.addEventListener('click', function () {
                    resetForm();
                });

                // Template Buttons
                templateBtns.forEach(btn => {
                    btn.addEventListener('click', function () {
                        const template = this.dataset.template;
                        loadTemplate(template);
                    });
                });

                // Form Submission
                form.addEventListener('submit', function (e) {
                    e.preventDefault();

                    if (validateForm()) {
                        // Show loading state
                        const submitBtn = form.querySelector('button[type="submit"]');
                        const originalText = submitBtn.innerHTML;
                        submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Adding...';
                        submitBtn.disabled = true;

                        // Simulate API call
                        setTimeout(() => {
                            // Success message
                            showNotification('Medicine added successfully!', 'success');

                            // Close modal
                            const modal = bootstrap.Modal.getInstance(addMedicineModal);
                            modal.hide();

                            // Reset form
                            resetForm();

                            // Reset button state
                            submitBtn.innerHTML = originalText;
                            submitBtn.disabled = false;

                            // Refresh medicines list or show success message
                            refreshMedicinesList();

                        }, 1500);
                    }
                });

                // Auto-generate SKU
                const nameInput = form.querySelector('input[name="medicineName"]');
                const strengthInput = form.querySelector('input[name="strength"]');
                const skuInput = form.querySelector('input[name="sku"]');

                nameInput.addEventListener('blur', generateSKU);
                strengthInput.addEventListener('blur', generateSKU);

                // Calculate prices
                const costPriceInput = form.querySelector('input[name="costPrice"]');
                costPriceInput.addEventListener('blur', calculatePrices);
            }
        });

        function resetForm() {
            const form = document.getElementById('addMedicineForm');
            if (form) {
                form.reset();

                // Clear validation states
                const invalidFields = form.querySelectorAll('.is-invalid');
                invalidFields.forEach(field => {
                    field.classList.remove('is-invalid');
                });

                const errorMessages = form.querySelectorAll('.invalid-feedback');
                errorMessages.forEach(error => error.remove());
            }
        }

        function generateSKU() {
            const form = document.getElementById('addMedicineForm');
            const nameInput = form.querySelector('input[name="medicineName"]');
            const strengthInput = form.querySelector('input[name="strength"]');
            const skuInput = form.querySelector('input[name="sku"]');

            const name = nameInput.value.trim();
            const strength = strengthInput.value.trim();

            if (name && strength && !skuInput.value) {
                const prefix = name.substring(0, 3).toUpperCase();
                skuInput.value = `${prefix}-${strength}-001`;
            }
        }

        function calculatePrices() {
            const form = document.getElementById('addMedicineForm');
            const costPriceInput = form.querySelector('input[name="costPrice"]');
            const sellingPriceInput = form.querySelector('input[name="sellingPrice"]');

            const costPrice = parseFloat(costPriceInput.value) || 0;
            if (costPrice > 0) {
                const sellingPrice = costPrice * 1.3; // 30% margin
                sellingPriceInput.value = sellingPrice.toFixed(2);
            }
        }

        function validateForm() {
            const form = document.getElementById('addMedicineForm');
            const requiredFields = form.querySelectorAll('[required]');
            let isValid = true;

            requiredFields.forEach(field => {
                if (!field.value.trim()) {
                    isValid = false;
                    field.classList.add('is-invalid');

                    if (!field.nextElementSibling?.classList.contains('invalid-feedback')) {
                        const errorDiv = document.createElement('div');
                        errorDiv.className = 'invalid-feedback';
                        errorDiv.textContent = 'This field is required';
                        field.parentNode.appendChild(errorDiv);
                    }
                } else {
                    field.classList.remove('is-invalid');
                    const errorDiv = field.parentNode.querySelector('.invalid-feedback');
                    if (errorDiv) {
                        errorDiv.remove();
                    }
                }
            });

            // Validate prices
            const costPrice = parseFloat(form.querySelector('[name="costPrice"]').value);
            const sellingPrice = parseFloat(form.querySelector('[name="sellingPrice"]').value);

            if (sellingPrice <= costPrice) {
                showNotification('Selling price must be greater than cost price', 'error');
                isValid = false;
            }

            // Validate expiry date
            const expiryDate = new Date(form.querySelector('[name="expiryDate"]').value);
            const today = new Date();
            if (expiryDate <= today) {
                showNotification('Expiry date must be in the future', 'error');
                isValid = false;
            }

            return isValid;
        }

        function loadTemplate(templateName) {
            const template = templates[templateName];
            const form = document.getElementById('addMedicineForm');

            for (const [key, value] of Object.entries(template)) {
                const element = form.querySelector(`[name="${key}"]`);
                if (element) {
                    element.value = value;
                }
            }

            // Trigger calculations
            const costPriceInput = form.querySelector('input[name="costPrice"]');
            if (costPriceInput) {
                costPriceInput.dispatchEvent(new Event('blur'));
            }

            showNotification(`${templateName} template loaded!`, 'info');
        }

        function showNotification(message, type = 'info') {
            // Create notification element
            const notification = document.createElement('div');
            notification.className = `alert alert-${type === 'error' ? 'danger' : type} alert-dismissible fade show`;
            notification.innerHTML = `
        ${message}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    `;

            // Add to page
            const container = document.querySelector('.content-wrapper') || document.body;
            container.insertBefore(notification, container.firstChild);

            // Auto remove after 5 seconds
            setTimeout(() => {
                if (notification.parentNode) {
                    notification.remove();
                }
            }, 5000);
        }

        function refreshMedicinesList() {
            // This function would refresh the medicines list on the main page
            // For now, we'll just show a notification
            showNotification('Medicine added successfully! You can view it in the medicines list.', 'success');
        }

        // Template Data (same as before)
        const templates = {
            analgesic: {
                medicineName: 'Paracetamol',
                genericName: 'Paracetamol',
                medicineType: 'tablet',
                strength: '500',
                category: 'analgesic',
                prescriptionRequired: 'no',
                uses: 'Pain relief and fever reduction',
                costPrice: '15.00'
            },
            antibiotic: {
                medicineName: 'Amoxicillin',
                genericName: 'Amoxicillin Trihydrate',
                medicineType: 'capsule',
                strength: '250',
                category: 'antibiotic',
                prescriptionRequired: 'yes',
                uses: 'Treatment of bacterial infections',
                costPrice: '120.00'
            },
            vitamin: {
                medicineName: 'Vitamin C',
                genericName: 'Ascorbic Acid',
                medicineType: 'tablet',
                strength: '500',
                category: 'vitamin',
                prescriptionRequired: 'no',
                uses: 'Vitamin C supplement for immunity',
                costPrice: '25.00'
            },
            topical: {
                medicineName: 'Antiseptic Cream',
                genericName: 'Povidone-Iodine',
                medicineType: 'cream',
                strength: '5',
                category: 'topical',
                prescriptionRequired: 'no',
                uses: 'Antiseptic for minor cuts and wounds',
                costPrice: '45.00'
            }
        };
    </script>
</asp:Content>
