<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InventoryDetails.aspx.cs" Inherits="MediCare.Views.InventoryDetails" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <section>
       <div class="row">
    <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4>Add Stock to Inventory</h4>
            <div class="btn-group">
                <a href="/Views/Inventory.aspx" class="btn btn-outline-secondary">
                    <i class="fas fa-arrow-left me-2"></i>Back to Inventory
                </a>
            </div>
        </div>
    </div>
</div>

<!-- Quick Stats -->
<div class="row mb-4">
    <div class="col-xl-3 col-md-6 mb-3">
        <div class="card-medical text-center">
            <div class="card-medical-body">
                <h6 class="text-muted mb-2">Low Stock Items</h6>
                <h3 class="text-warning mb-1">12</h3>
                <small>Need immediate restocking</small>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6 mb-3">
        <div class="card-medical text-center">
            <div class="card-medical-body">
                <h6 class="text-muted mb-2">Out of Stock</h6>
                <h3 class="text-danger mb-1">8</h3>
                <small>Currently unavailable</small>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6 mb-3">
        <div class="card-medical text-center">
            <div class="card-medical-body">
                <h6 class="text-muted mb-2">Expiring Soon</h6>
                <h3 class="text-info mb-1">15</h3>
                <small>Within 30 days</small>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6 mb-3">
        <div class="card-medical text-center">
            <div class="card-medical-body">
                <h6 class="text-muted mb-2">Active Suppliers</h6>
                <h3 class="text-success mb-1">18</h3>
                <small>Available for ordering</small>
            </div>
        </div>
    </div>
</div>

<!-- Add Stock Form -->
<div class="row">
    <div class="col-12">
        <div class="card-medical">
            <div class="card-medical-header">
                <h6 class="mb-0">Add New Stock Batch</h6>
            </div>
            <div class="card-medical-body">
                <div id="addStockForm">
                    <!-- Medicine Selection -->
                    <div class="form-section">
                        <h6 class="section-title mb-4">
                            <i class="fas fa-pills me-2 text-primary"></i>
                            Select Medicine
                        </h6>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Medicine <span class="text-danger">*</span></label>
                                <select class="form-select" name="medicineId" id="medicineSelect" required>
                                    <option value="">Select Medicine</option>
                                    <option value="1">Paracetamol 500mg (Tablet)</option>
                                    <option value="2">Amoxicillin 250mg (Capsule)</option>
                                    <option value="3">Vitamin C 500mg (Tablet)</option>
                                    <option value="4">Cetirizine 10mg (Tablet)</option>
                                    <option value="5">Omeprazole 20mg (Capsule)</option>
                                </select>
                                <div class="form-text">Search and select existing medicine</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Current Stock</label>
                                <div class="current-stock-info p-3 bg-light rounded">
                                    <div id="currentStockDisplay">
                                        <span class="text-muted">Select a medicine to view current stock</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <hr class="my-4">

                    <!-- Batch Information -->
                    <div class="form-section">
                        <h6 class="section-title mb-4">
                            <i class="fas fa-box me-2 text-primary"></i>
                            Batch Information
                        </h6>
                        <div class="row g-3">
                            <div class="col-md-4">
                                <label class="form-label">Batch Number <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="batchNumber" required 
                                       placeholder="e.g., BATCH-2024-001">
                                <div class="form-text">Unique batch identifier</div>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Manufacture Date</label>
                                <input type="date" class="form-control" name="manufactureDate">
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Expiry Date <span class="text-danger">*</span></label>
                                <input type="date" class="form-control" name="expiryDate" required 
                                       min="2024-01-01">
                                <div class="form-text">MMG: Always check expiry date</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Quantity <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <input type="number" class="form-control" name="quantity" required 
                                           min="1" value="100" step="1">
                                    <span class="input-group-text">units</span>
                                </div>
                                <div class="form-text">Number of packages/units</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Package Type</label>
                                <select class="form-select" name="packageType">
                                    <option value="strips">Strips</option>
                                    <option value="bottles">Bottles</option>
                                    <option value="boxes">Boxes</option>
                                    <option value="vials">Vials</option>
                                    <option value="tubes">Tubes</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <hr class="my-4">

                    <!-- Supplier & Pricing -->
                    <div class="form-section">
                        <h6 class="section-title mb-4">
                            <i class="fas fa-truck me-2 text-primary"></i>
                            Supplier & Pricing
                        </h6>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Supplier <span class="text-danger">*</span></label>
                                <select class="form-select" name="supplierId" required>
                                    <option value="">Select Supplier</option>
                                    <option value="1">MediSupplies Ltd.</option>
                                    <option value="2">PharmaDistributors</option>
                                    <option value="3">HealthSupplies Inc.</option>
                                    <option value="4">Generic Pharma Co.</option>
                                </select>
                                <div class="form-text">Choose your supplier</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Purchase Order Number</label>
                                <input type="text" class="form-control" name="purchaseOrderNumber" 
                                       placeholder="e.g., PO-2024-001">
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Cost Price <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-text">₹</span>
                                    <input type="number" class="form-control" name="costPrice" required 
                                           step="0.01" min="0" placeholder="0.00">
                                </div>
                                <div class="form-text">Price per unit from supplier</div>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Selling Price <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-text">₹</span>
                                    <input type="number" class="form-control" name="sellingPrice" required 
                                           step="0.01" min="0" placeholder="0.00">
                                </div>
                                <div class="form-text">Price per unit to customer</div>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">MRP <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-text">₹</span>
                                    <input type="number" class="form-control" name="mrp" required 
                                           step="0.01" min="0" placeholder="0.00">
                                </div>
                                <div class="form-text">Maximum Retail Price</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Tax Rate</label>
                                <select class="form-select" name="taxRate">
                                    <option value="0">0% - Exempt</option>
                                    <option value="5" selected>5% - GST</option>
                                    <option value="12">12% - GST</option>
                                    <option value="18">18% - GST</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Stock Location</label>
                                <select class="form-select" name="stockLocation">
                                    <option value="main-store">Main Store</option>
                                    <option value="dispensing-area">Dispensing Area</option>
                                    <option value="refrigerated">Refrigerated Storage</option>
                                    <option value="quarantine">Quarantine Area</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <hr class="my-4">

                    <!-- Additional Information -->
                    <div class="form-section">
                        <h6 class="section-title mb-4">
                            <i class="fas fa-file-alt me-2 text-primary"></i>
                            Additional Information
                        </h6>
                        <div class="row g-3">
                            <div class="col-12">
                                <label class="form-label">Batch Notes</label>
                                <textarea class="form-control" name="batchNotes" rows="3" 
                                          placeholder="Any special notes about this batch, quality checks, storage instructions, etc."></textarea>
                            </div>
                            <div class="col-12">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="isActive" id="isActive" checked>
                                    <label class="form-check-label" for="isActive">
                                        Activate this batch immediately
                                    </label>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="qualityChecked" id="qualityChecked" checked>
                                    <label class="form-check-label" for="qualityChecked">
                                        Quality check completed
                                    </label>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="moveToFront" id="moveToFront">
                                    <label class="form-check-label" for="moveToFront">
                                        Move to front for FEFO (First Expiry First Out)
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Form Actions -->
                    <div class="row mt-5">
                        <div class="col-12">
                            <div class="d-flex justify-content-between">
                                <button type="button" class="btn btn-outline-secondary" id="resetStockForm">
                                    <i class="fas fa-redo me-2"></i>Reset Form
                                </button>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-outline-primary" id="saveStockDraft">
                                        <i class="fas fa-save me-2"></i>Save as Draft
                                    </button>
                                    <button type="submit" class="btn btn-medical btn-medical-primary">
                                        <i class="fas fa-box me-2"></i>Add Stock
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Quick Restock Suggestions -->
<div class="row mt-4">
    <div class="col-12">
        <div class="card-medical">
            <div class="card-medical-header">
                <h6 class="mb-0">
                    <i class="fas fa-exclamation-triangle me-2 text-warning"></i>
                    Low Stock Items - Suggested for Restocking
                </h6>
            </div>
            <div class="card-medical-body">
                <div class="table-responsive">
                    <table class="table table-medical table-sm">
                        <thead>
                            <tr>
                                <th>Medicine</th>
                                <th>Current Stock</th>
                                <th>Min Level</th>
                                <th>Shortage</th>
                                <th>Last Ordered</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="table-warning">
                                <td>
                                    <strong>Vitamin C 500mg</strong>
                                    <div class="text-muted small">Tablet</div>
                                </td>
                                <td>
                                    <span class="text-danger">2</span>
                                </td>
                                <td>25</td>
                                <td>
                                    <span class="badge bg-danger">23 units</span>
                                </td>
                                <td>15 Dec 2023</td>
                                <td>
                                    <button class="btn btn-sm btn-outline-primary quick-restock" data-medicine="3">
                                        Quick Add
                                    </button>
                                </td>
                            </tr>
                            <tr class="table-warning">
                                <td>
                                    <strong>Cetirizine 10mg</strong>
                                    <div class="text-muted small">Tablet</div>
                                </td>
                                <td>
                                    <span class="text-warning">8</span>
                                </td>
                                <td>20</td>
                                <td>
                                    <span class="badge bg-warning">12 units</span>
                                </td>
                                <td>20 Dec 2023</td>
                                <td>
                                    <button class="btn btn-sm btn-outline-primary quick-restock" data-medicine="4">
                                        Quick Add
                                    </button>
                                </td>
                            </tr>
                            <tr class="table-warning">
                                <td>
                                    <strong>Omeprazole 20mg</strong>
                                    <div class="text-muted small">Capsule</div>
                                </td>
                                <td>
                                    <span class="text-warning">12</span>
                                </td>
                                <td>30</td>
                                <td>
                                    <span class="badge bg-warning">18 units</span>
                                </td>
                                <td>18 Dec 2023</td>
                                <td>
                                    <button class="btn btn-sm btn-outline-primary quick-restock" data-medicine="5">
                                        Quick Add
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

<!-- Recent Stock Additions -->
<div class="row mt-4">
    <div class="col-12">
        <div class="card-medical">
            <div class="card-medical-header">
                <h6 class="mb-0">Recently Added Stock Batches</h6>
            </div>
            <div class="card-medical-body">
                <div class="table-responsive">
                    <table class="table table-medical table-sm">
                        <thead>
                            <tr>
                                <th>Batch Number</th>
                                <th>Medicine</th>
                                <th>Supplier</th>
                                <th>Quantity</th>
                                <th>Expiry Date</th>
                                <th>Added On</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>BATCH-2024-015</td>
                                <td>Amoxicillin 250mg</td>
                                <td>MediSupplies Ltd.</td>
                                <td>200</td>
                                <td>Mar 2025</td>
                                <td>10 Jan 2024</td>
                            </tr>
                            <tr>
                                <td>BATCH-2024-014</td>
                                <td>Paracetamol 500mg</td>
                                <td>PharmaDistributors</td>
                                <td>500</td>
                                <td>Dec 2024</td>
                                <td>09 Jan 2024</td>
                            </tr>
                            <tr>
                                <td>BATCH-2024-013</td>
                                <td>Vitamin B Complex</td>
                                <td>HealthSupplies Inc.</td>
                                <td>100</td>
                                <td>Jun 2025</td>
                                <td>08 Jan 2024</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
   </section>

    <script>
        // Add Stock Page Functionality
        document.addEventListener('DOMContentLoaded', function () {
            const form = document.getElementById('addStockForm');
            const resetBtn = document.getElementById('resetStockForm');
            const saveDraftBtn = document.getElementById('saveStockDraft');
            const medicineSelect = document.getElementById('medicineSelect');
            const quickRestockBtns = document.querySelectorAll('.quick-restock');

            // Medicine stock data (in real app, this would come from API)
            const medicineStockData = {
                1: { currentStock: 145, minLevel: 20, unit: 'tablets' },
                2: { currentStock: 12, minLevel: 15, unit: 'capsules' },
                3: { currentStock: 2, minLevel: 25, unit: 'tablets' },
                4: { currentStock: 8, minLevel: 20, unit: 'tablets' },
                5: { currentStock: 12, minLevel: 30, unit: 'capsules' }
            };

            // Form Reset
            resetBtn.addEventListener('click', function () {
                if (confirm('Are you sure you want to reset the form? All entered data will be lost.')) {
                    resetStockForm();
                }
            });

            // Save Draft
            saveDraftBtn.addEventListener('click', function () {
                const formData = new FormData(form);
                // Here you would typically save to localStorage or send to server
                showNotification('Stock draft saved successfully!', 'success');
            });

            // Medicine selection change
            medicineSelect.addEventListener('change', function () {
                updateCurrentStockDisplay(this.value);
                autoFillBatchNumber();
            });

            // Quick restock buttons
            quickRestockBtns.forEach(btn => {
                btn.addEventListener('click', function () {
                    const medicineId = this.dataset.medicine;
                    quickRestockMedicine(medicineId);
                });
            });

            // Auto-calculate prices
            const costPriceInput = form.querySelector('input[name="costPrice"]');
            costPriceInput.addEventListener('blur', calculatePrices);

            // Auto-generate batch number on medicine select
            function autoFillBatchNumber() {
                const medicineId = medicineSelect.value;
                if (medicineId) {
                    const batchInput = form.querySelector('input[name="batchNumber"]');
                    if (!batchInput.value) {
                        const timestamp = new Date().getTime().toString().slice(-4);
                        const medicineCode = medicineSelect.options[medicineSelect.selectedIndex].text.substring(0, 3).toUpperCase();
                        batchInput.value = `BATCH-${medicineCode}-${timestamp}`;
                    }
                }
            }

            // Update current stock display
            function updateCurrentStockDisplay(medicineId) {
                const stockDisplay = document.getElementById('currentStockDisplay');

                if (medicineId && medicineStockData[medicineId]) {
                    const stock = medicineStockData[medicineId];
                    const status = stock.currentStock <= stock.minLevel ? 'danger' :
                        stock.currentStock <= stock.minLevel * 2 ? 'warning' : 'success';

                    stockDisplay.innerHTML = `
                <div class="d-flex justify-content-between align-items-center">
                    <span class="fw-bold">Current Stock:</span>
                    <span class="text-${status} fw-bold">${stock.currentStock} ${stock.unit}</span>
                </div>
                <div class="d-flex justify-content-between align-items-center mt-1">
                    <span class="text-muted">Minimum Level:</span>
                    <span>${stock.minLevel} ${stock.unit}</span>
                </div>
                ${stock.currentStock <= stock.minLevel ?
                            '<div class="alert alert-warning mt-2 p-2 small">⚠️ Low stock - needs immediate restocking</div>' : ''}
            `;
                } else {
                    stockDisplay.innerHTML = '<span class="text-muted">Select a medicine to view current stock</span>';
                }
            }

            // Calculate selling price and MRP based on cost
            function calculatePrices() {
                const costPrice = parseFloat(costPriceInput.value) || 0;
                if (costPrice > 0) {
                    const sellingPriceInput = form.querySelector('input[name="sellingPrice"]');
                    const mrpInput = form.querySelector('input[name="mrp"]');

                    const sellingPrice = costPrice * 1.3; // 30% margin
                    const mrp = costPrice * 1.5; // 50% margin for MRP

                    sellingPriceInput.value = sellingPrice.toFixed(2);
                    mrpInput.value = mrp.toFixed(2);
                }
            }

            // Quick restock function
            function quickRestockMedicine(medicineId) {
                if (medicineStockData[medicineId]) {
                    medicineSelect.value = medicineId;
                    updateCurrentStockDisplay(medicineId);
                    autoFillBatchNumber();

                    // Auto-fill suggested quantity
                    const stock = medicineStockData[medicineId];
                    const suggestedQty = Math.max(stock.minLevel * 3, 100); // 3x min level or 100, whichever is higher
                    form.querySelector('input[name="quantity"]').value = suggestedQty;

                    showNotification(`Quick restock prepared for ${medicineSelect.options[medicineSelect.selectedIndex].text}`, 'info');
                }
            }

            // Form Submission
            form.addEventListener('submit', function (e) {
                e.preventDefault();

                if (validateStockForm()) {
                    // Show loading state
                    const submitBtn = form.querySelector('button[type="submit"]');
                    const originalText = submitBtn.innerHTML;
                    submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Adding Stock...';
                    submitBtn.disabled = true;

                    // Simulate API call
                    setTimeout(() => {
                        showNotification('Stock added successfully!', 'success');
                        form.reset();
                        submitBtn.innerHTML = originalText;
                        submitBtn.disabled = false;

                        // Update current stock display
                        updateCurrentStockDisplay('');

                        // Redirect to inventory after success
                        setTimeout(() => {
                            window.location.href = 'inventory.html';
                        }, 1500);
                    }, 2000);
                }
            });
        });

        function resetStockForm() {
            const form = document.getElementById('addStockForm');
            if (form) {
                form.reset();

                // Clear validation states
                const invalidFields = form.querySelectorAll('.is-invalid');
                invalidFields.forEach(field => {
                    field.classList.remove('is-invalid');
                });

                const errorMessages = form.querySelectorAll('.invalid-feedback');
                errorMessages.forEach(error => error.remove());

                // Reset stock display
                document.getElementById('currentStockDisplay').innerHTML =
                    '<span class="text-muted">Select a medicine to view current stock</span>';
            }
        }

        function validateStockForm() {
            const form = document.getElementById('addStockForm');
            const requiredFields = form.querySelectorAll('[required]');
            let isValid = true;

            // Basic required field validation
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

            // Validate expiry date
            const expiryDateInput = form.querySelector('input[name="expiryDate"]');
            if (expiryDateInput.value) {
                const expiryDate = new Date(expiryDateInput.value);
                const today = new Date();
                if (expiryDate <= today) {
                    isValid = false;
                    expiryDateInput.classList.add('is-invalid');
                    if (!expiryDateInput.nextElementSibling?.classList.contains('invalid-feedback')) {
                        const errorDiv = document.createElement('div');
                        errorDiv.className = 'invalid-feedback';
                        errorDiv.textContent = 'Expiry date must be in the future';
                        expiryDateInput.parentNode.appendChild(errorDiv);
                    }
                }
            }

            // Validate prices
            const costPrice = parseFloat(form.querySelector('[name="costPrice"]').value);
            const sellingPrice = parseFloat(form.querySelector('[name="sellingPrice"]').value);
            const mrp = parseFloat(form.querySelector('[name="mrp"]').value);

            if (sellingPrice <= costPrice) {
                showNotification('Selling price must be greater than cost price', 'error');
                isValid = false;
            }

            if (mrp < sellingPrice) {
                showNotification('MRP must be greater than or equal to selling price', 'error');
                isValid = false;
            }

            // Validate quantity
            const quantity = parseInt(form.querySelector('[name="quantity"]').value);
            if (quantity <= 0) {
                showNotification('Quantity must be greater than 0', 'error');
                isValid = false;
            }

            return isValid;
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
    </script>
</asp:Content>