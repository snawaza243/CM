<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="CategoriesDetails.aspx.cs" Inherits="MediCare.Views.CategoriesDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <section>
       <div class="row">
    <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4>Add New Category</h4>
            <div class="btn-group">
                <a href="Categories.aspx" class="btn btn-outline-secondary">
                    <i class="fas fa-arrow-left me-2"></i>Back to Categories
                </a>
            </div>
        </div>
    </div>
</div>

<!-- Category Stats -->
<div class="row mb-4">
    <div class="col-xl-3 col-md-6 mb-3">
        <div class="card-medical text-center">
            <div class="card-medical-body">
                <h6 class="text-muted mb-2">Total Categories</h6>
                <h3 class="text-primary mb-1">24</h3>
                <small>Active in system</small>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6 mb-3">
        <div class="card-medical text-center">
            <div class="card-medical-body">
                <h6 class="text-muted mb-2">Prescription Categories</h6>
                <h3 class="text-warning mb-1">8</h3>
                <small>Require prescription</small>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6 mb-3">
        <div class="card-medical text-center">
            <div class="card-medical-body">
                <h6 class="text-muted mb-2">OTC Categories</h6>
                <h3 class="text-success mb-1">12</h3>
                <small>Over-the-counter</small>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6 mb-3">
        <div class="card-medical text-center">
            <div class="card-medical-body">
                <h6 class="text-muted mb-2">Empty Categories</h6>
                <h3 class="text-info mb-1">4</h3>
                <small>No medicines assigned</small>
            </div>
        </div>
    </div>
</div>

<!-- Add Category Form -->
<div class="row">
    <div class="col-12">
        <div class="card-medical">
            <div class="card-medical-header">
                <h6 class="mb-0">Category Information</h6>
            </div>
            <div class="card-medical-body">
                <form id="addCategoryForm">
                    <!-- Basic Information -->
                    <div class="form-section">
                        <h6 class="section-title mb-4">
                            <i class="fas fa-info-circle me-2 text-primary"></i>
                            Basic Information
                        </h6>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Category Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="categoryName" required 
                                       placeholder="e.g., Antibiotics, Analgesics, Vitamins">
                                <div class="form-text">Unique category name</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Parent Category</label>
                                <select class="form-select" name="parentCategory">
                                    <option value="">No Parent (Main Category)</option>
                                    <option value="1">Prescription Medicines</option>
                                    <option value="2">Over-the-Counter (OTC)</option>
                                    <option value="3">Medical Equipment</option>
                                    <option value="4">Wellness Products</option>
                                </select>
                                <div class="form-text">Optional: Create sub-category under existing category</div>
                            </div>
                            <div class="col-12">
                                <label class="form-label">Description</label>
                                <textarea class="form-control" name="description" rows="3" 
                                          placeholder="Describe this category, its purpose, and typical medicines included..."></textarea>
                            </div>
                        </div>
                    </div>

                    <hr class="my-4">

                    <!-- Category Settings -->
                    <div class="form-section">
                        <h6 class="section-title mb-4">
                            <i class="fas fa-cog me-2 text-primary"></i>
                            Category Settings
                        </h6>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Category Type</label>
                                <select class="form-select" name="categoryType">
                                    <option value="medicine">Medicine</option>
                                    <option value="equipment">Medical Equipment</option>
                                    <option value="supplement">Supplement</option>
                                    <option value="personal-care">Personal Care</option>
                                    <option value="surgical">Surgical</option>
                                    <option value="diagnostic">Diagnostic</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Prescription Requirement</label>
                                <select class="form-select" name="prescriptionRequired">
                                    <option value="not-required">Not Required - OTC</option>
                                    <option value="required">Required - Prescription Only</option>
                                    <option value="conditional">Conditional - Some items require</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Sort Order</label>
                                <input type="number" class="form-control" name="sortOrder" 
                                       min="0" value="0" placeholder="0">
                                <div class="form-text">Lower numbers appear first</div>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Minimum Age Restriction</label>
                                <select class="form-select" name="ageRestriction">
                                    <option value="none">No Restriction</option>
                                    <option value="18">18+ Years</option>
                                    <option value="21">21+ Years</option>
                                    <option value="children">Children Only</option>
                                    <option value="adults">Adults Only</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Storage Requirements</label>
                                <select class="form-select" name="storageRequirements">
                                    <option value="room-temp">Room Temperature</option>
                                    <option value="refrigerated">Refrigerated (2-8°C)</option>
                                    <option value="controlled">Controlled Room Temp</option>
                                    <option value="frozen">Frozen</option>
                                    <option value="protected-light">Protect from Light</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <hr class="my-4">

                    <!-- Visual & Display -->
                    <div class="form-section">
                        <h6 class="section-title mb-4">
                            <i class="fas fa-palette me-2 text-primary"></i>
                            Visual & Display
                        </h6>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Category Icon</label>
                                <select class="form-select" name="categoryIcon">
                                    <option value="fa-pills">💊 Pills</option>
                                    <option value="fa-prescription-bottle">🧪 Prescription Bottle</option>
                                    <option value="fa-syringe">💉 Syringe</option>
                                    <option value="fa-heartbeat">❤️ Heartbeat</option>
                                    <option value="fa-lungs">🫁 Lungs</option>
                                    <option value="fa-brain">🧠 Brain</option>
                                    <option value="fa-capsules">💊 Capsules</option>
                                    <option value="fa-eye">👁️ Eye</option>
                                    <option value="fa-ear">👂 Ear</option>
                                    <option value="fa-allergies">🤧 Allergies</option>
                                    <option value="fa-temperature-high">🌡️ Temperature</option>
                                    <option value="fa-band-aid">🩹 Band Aid</option>
                                </select>
                                <div class="form-text">Icon to represent this category</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Category Color</label>
                                <div class="input-group color-picker-group">
                                    <input type="color" class="form-control form-control-color" name="categoryColor" value="#3b82f6">
                                    <span class="input-group-text">#3b82f6</span>
                                </div>
                                <div class="form-text">Color theme for this category</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Category Image</label>
                                <input type="file" class="form-control" name="categoryImage" 
                                       accept="image/*">
                                <div class="form-text">Optional: Upload category banner image</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Display Style</label>
                                <select class="form-select" name="displayStyle">
                                    <option value="grid">Grid View</option>
                                    <option value="list">List View</option>
                                    <option value="card">Card View</option>
                                    <option value="compact">Compact View</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <hr class="my-4">

                    <!-- SEO & Metadata -->
                    <div class="form-section">
                        <h6 class="section-title mb-4">
                            <i class="fas fa-search me-2 text-primary"></i>
                            SEO & Metadata
                        </h6>
                        <div class="row g-3">
                            <div class="col-12">
                                <label class="form-label">Meta Title</label>
                                <input type="text" class="form-control" name="metaTitle" 
                                       placeholder="Optimized title for search engines">
                            </div>
                            <div class="col-12">
                                <label class="form-label">Meta Description</label>
                                <textarea class="form-control" name="metaDescription" rows="2" 
                                          placeholder="Brief description for search engine results..."></textarea>
                            </div>
                            <div class="col-12">
                                <label class="form-label">Keywords</label>
                                <input type="text" class="form-control" name="keywords" 
                                       placeholder="Comma-separated keywords for search">
                                <div class="form-text">e.g., antibiotics, infection treatment, bacterial medicines</div>
                            </div>
                        </div>
                    </div>

                    <hr class="my-4">

                    <!-- Additional Settings -->
                    <div class="form-section">
                        <h6 class="section-title mb-4">
                            <i class="fas fa-sliders-h me-2 text-primary"></i>
                            Additional Settings
                        </h6>
                        <div class="row g-3">
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-check form-switch mb-3">
                                            <input class="form-check-input" type="checkbox" name="isActive" id="isActive" checked>
                                            <label class="form-check-label" for="isActive">
                                                Activate category immediately
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-check form-switch mb-3">
                                            <input class="form-check-input" type="checkbox" name="showInMenu" id="showInMenu" checked>
                                            <label class="form-check-label" for="showInMenu">
                                                Show in navigation menu
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-check form-switch mb-3">
                                            <input class="form-check-input" type="checkbox" name="featuredCategory" id="featuredCategory">
                                            <label class="form-check-label" for="featuredCategory">
                                                Mark as featured category
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-check form-switch mb-3">
                                            <input class="form-check-input" type="checkbox" name="requireLicense" id="requireLicense">
                                            <label class="form-check-label" for="requireLicense">
                                                Require special license
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-check form-switch mb-3">
                                            <input class="form-check-input" type="checkbox" name="trackInventory" id="trackInventory" checked>
                                            <label class="form-check-label" for="trackInventory">
                                                Track inventory for this category
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-check form-switch mb-3">
                                            <input class="form-check-input" type="checkbox" name="allowOnlineSale" id="allowOnlineSale" checked>
                                            <label class="form-check-label" for="allowOnlineSale">
                                                Allow online sales
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <label class="form-label">Custom CSS Class</label>
                                <input type="text" class="form-control" name="customCssClass" 
                                       placeholder="custom-category-style">
                                <div class="form-text">Optional: Custom CSS class for styling</div>
                            </div>
                        </div>
                    </div>

                    <!-- Form Actions -->
                    <div class="row mt-5">
                        <div class="col-12">
                            <div class="d-flex justify-content-between">
                                <button type="button" class="btn btn-outline-secondary" id="resetCategoryForm">
                                    <i class="fas fa-redo me-2"></i>Reset Form
                                </button>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-outline-primary" id="saveCategoryDraft">
                                        <i class="fas fa-save me-2"></i>Save as Draft
                                    </button>
                                    <button type="submit" class="btn btn-medical btn-medical-primary">
                                        <i class="fas fa-folder-plus me-2"></i>Create Category
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Quick Category Templates -->
<div class="row mt-4">
    <div class="col-12">
        <div class="card-medical">
            <div class="card-medical-header">
                <h6 class="mb-0">Quick Category Templates</h6>
            </div>
            <div class="card-medical-body">
                <div class="row">
                    <div class="col-md-3 col-6 mb-3">
                        <button type="button" class="btn btn-outline-primary w-100 template-btn" data-template="antibiotic">
                            <i class="fas fa-prescription-bottle me-2"></i>Antibiotic
                        </button>
                    </div>
                    <div class="col-md-3 col-6 mb-3">
                        <button type="button" class="btn btn-outline-success w-100 template-btn" data-template="analgesic">
                            <i class="fas fa-pain-relief me-2"></i>Analgesic
                        </button>
                    </div>
                    <div class="col-md-3 col-6 mb-3">
                        <button type="button" class="btn btn-outline-info w-100 template-btn" data-template="vitamin">
                            <i class="fas fa-capsules me-2"></i>Vitamin
                        </button>
                    </div>
                    <div class="col-md-3 col-6 mb-3">
                        <button type="button" class="btn btn-outline-warning w-100 template-btn" data-template="cardiac">
                            <i class="fas fa-heartbeat me-2"></i>Cardiac
                        </button>
                    </div>
                    <div class="col-md-3 col-6 mb-3">
                        <button type="button" class="btn btn-outline-danger w-100 template-btn" data-template="diabetes">
                            <i class="fas fa-syringe me-2"></i>Diabetes
                        </button>
                    </div>
                    <div class="col-md-3 col-6 mb-3">
                        <button type="button" class="btn btn-outline-secondary w-100 template-btn" data-template="respiratory">
                            <i class="fas fa-lungs me-2"></i>Respiratory
                        </button>
                    </div>
                    <div class="col-md-3 col-6 mb-3">
                        <button type="button" class="btn btn-outline-dark w-100 template-btn" data-template="dermatology">
                            <i class="fas fa-spray-can me-2"></i>Dermatology
                        </button>
                    </div>
                    <div class="col-md-3 col-6 mb-3">
                        <button type="button" class="btn btn-outline-primary w-100 template-btn" data-template="pediatric">
                            <i class="fas fa-baby me-2"></i>Pediatric
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Category Hierarchy Preview -->
<div class="row mt-4">
    <div class="col-12">
        <div class="card-medical">
            <div class="card-medical-header">
                <h6 class="mb-0">Current Category Hierarchy</h6>
            </div>
            <div class="card-medical-body">
                <div class="category-tree-preview">
                    <ul class="list-unstyled">
                        <li class="mb-2">
                            <div class="d-flex align-items-center p-2 bg-light rounded">
                                <i class="fas fa-folder text-warning me-2"></i>
                                <strong>All Categories</strong>
                                <span class="badge bg-primary ms-2">24 categories</span>
                            </div>
                            <ul class="list-unstyled ms-4 mt-2">
                                <li class="mb-2">
                                    <div class="d-flex align-items-center p-2">
                                        <i class="fas fa-folder text-info me-2"></i>
                                        <span>Prescription Medicines</span>
                                        <span class="badge bg-secondary ms-2">8 categories</span>
                                    </div>
                                    <ul class="list-unstyled ms-4">
                                        <li class="mb-1">
                                            <div class="d-flex align-items-center p-1">
                                                <i class="fas fa-tag text-muted me-2"></i>
                                                <span>Antibiotics</span>
                                                <span class="badge bg-primary ms-2">45 medicines</span>
                                            </div>
                                        </li>
                                        <li class="mb-1">
                                            <div class="d-flex align-items-center p-1">
                                                <i class="fas fa-tag text-muted me-2"></i>
                                                <span>Cardiovascular</span>
                                                <span class="badge bg-primary ms-2">28 medicines</span>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li class="mb-2">
                                    <div class="d-flex align-items-center p-2">
                                        <i class="fas fa-folder text-success me-2"></i>
                                        <span>Over-the-Counter</span>
                                        <span class="badge bg-success ms-2">12 categories</span>
                                    </div>
                                    <ul class="list-unstyled ms-4">
                                        <li class="mb-1">
                                            <div class="d-flex align-items-center p-1">
                                                <i class="fas fa-tag text-muted me-2"></i>
                                                <span>Analgesics</span>
                                                <span class="badge bg-primary ms-2">67 medicines</span>
                                            </div>
                                        </li>
                                        <li class="mb-1">
                                            <div class="d-flex align-items-center p-1">
                                                <i class="fas fa-tag text-muted me-2"></i>
                                                <span>Vitamins</span>
                                                <span class="badge bg-primary ms-2">89 medicines</span>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li class="mb-2">
                                    <div class="d-flex align-items-center p-2">
                                        <i class="fas fa-folder text-warning me-2"></i>
                                        <span>Medical Equipment</span>
                                        <span class="badge bg-warning ms-2">4 categories</span>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
   </section>
    <script>
        // Add Category Page Functionality
        document.addEventListener('DOMContentLoaded', function () {
            const form = document.getElementById('addCategoryForm');
            const resetBtn = document.getElementById('resetCategoryForm');
            const saveDraftBtn = document.getElementById('saveCategoryDraft');
            const templateBtns = document.querySelectorAll('.template-btn');
            const colorInput = form.querySelector('input[name="categoryColor"]');
            const colorDisplay = form.querySelector('.color-picker-group .input-group-text');

            // Form Reset
            resetBtn.addEventListener('click', function () {
                if (confirm('Are you sure you want to reset the form? All entered data will be lost.')) {
                    resetCategoryForm();
                }
            });

            // Save Draft
            saveDraftBtn.addEventListener('click', function () {
                const formData = new FormData(form);
                // Here you would typically save to localStorage or send to server
                showNotification('Category draft saved successfully!', 'success');
            });

            // Template Buttons
            templateBtns.forEach(btn => {
                btn.addEventListener('click', function () {
                    const template = this.dataset.template;
                    loadCategoryTemplate(template);
                });
            });

            // Color picker update
            colorInput.addEventListener('input', function () {
                colorDisplay.textContent = this.value;
            });

            // Auto-generate meta data
            const nameInput = form.querySelector('input[name="categoryName"]');
            const metaTitleInput = form.querySelector('input[name="metaTitle"]');
            const metaDescInput = form.querySelector('textarea[name="metaDescription"]');
            const keywordsInput = form.querySelector('input[name="keywords"]');

            nameInput.addEventListener('blur', function () {
                if (this.value && !metaTitleInput.value) {
                    metaTitleInput.value = `${this.value} - Buy Online at MediCare Pharmacy`;
                }
                if (this.value && !metaDescInput.value) {
                    metaDescInput.value = `Explore our range of ${this.value.toLowerCase()} medicines. Genuine products, competitive prices, fast delivery. Consult our pharmacists today.`;
                }
                if (this.value && !keywordsInput.value) {
                    keywordsInput.value = `${this.value.toLowerCase()}, medicines, healthcare, pharmacy, online medicine`;
                }
            });

            // Form Submission
            form.addEventListener('submit', function (e) {
                e.preventDefault();

                if (validateCategoryForm()) {
                    // Show loading state
                    const submitBtn = form.querySelector('button[type="submit"]');
                    const originalText = submitBtn.innerHTML;
                    submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Creating Category...';
                    submitBtn.disabled = true;

                    // Simulate API call
                    setTimeout(() => {
                        showNotification('Category created successfully!', 'success');
                        form.reset();
                        submitBtn.innerHTML = originalText;
                        submitBtn.disabled = false;

                        // Reset color display
                        colorDisplay.textContent = '#3b82f6';

                        // Redirect to categories list after success
                        setTimeout(() => {
                            window.location.href = 'categories.html';
                        }, 1500);
                    }, 2000);
                }
            });
        });

        function resetCategoryForm() {
            const form = document.getElementById('addCategoryForm');
            if (form) {
                form.reset();

                // Clear validation states
                const invalidFields = form.querySelectorAll('.is-invalid');
                invalidFields.forEach(field => {
                    field.classList.remove('is-invalid');
                });

                const errorMessages = form.querySelectorAll('.invalid-feedback');
                errorMessages.forEach(error => error.remove());

                // Reset color display
                const colorDisplay = form.querySelector('.color-picker-group .input-group-text');
                colorDisplay.textContent = '#3b82f6';
            }
        }

        function validateCategoryForm() {
            const form = document.getElementById('addCategoryForm');
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

            // Check for duplicate category name (in real app, this would be API call)
            const categoryName = form.querySelector('input[name="categoryName"]').value;
            const existingCategories = ['Antibiotics', 'Analgesics', 'Vitamins', 'Cardiovascular'];
            if (existingCategories.includes(categoryName)) {
                isValid = false;
                showNotification(`Category "${categoryName}" already exists!`, 'error');
            }

            return isValid;
        }

        function loadCategoryTemplate(templateName) {
            const template = categoryTemplates[templateName];
            const form = document.getElementById('addCategoryForm');

            for (const [key, value] of Object.entries(template)) {
                const element = form.querySelector(`[name="${key}"]`);
                if (element) {
                    if (element.type === 'checkbox') {
                        element.checked = value;
                    } else {
                        element.value = value;
                    }
                }
            }

            // Update color display
            const colorDisplay = form.querySelector('.color-picker-group .input-group-text');
            const colorInput = form.querySelector('input[name="categoryColor"]');
            colorDisplay.textContent = colorInput.value;

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

        // Category Template Data
        const categoryTemplates = {
            antibiotic: {
                categoryName: 'Antibiotics',
                description: 'Medicines that inhibit or kill bacteria to treat bacterial infections',
                categoryType: 'medicine',
                prescriptionRequired: 'required',
                categoryIcon: 'fa-prescription-bottle',
                categoryColor: '#8b5cf6',
                storageRequirements: 'room-temp',
                metaTitle: 'Antibiotics - Buy Online at MediCare Pharmacy',
                keywords: 'antibiotics, bacterial infection, amoxicillin, azithromycin, infection treatment',
                isActive: true,
                showInMenu: true,
                trackInventory: true
            },
            analgesic: {
                categoryName: 'Analgesics',
                description: 'Pain relief medications for various types of pain and fever',
                categoryType: 'medicine',
                prescriptionRequired: 'not-required',
                categoryIcon: 'fa-pain-relief',
                categoryColor: '#3b82f6',
                storageRequirements: 'room-temp',
                metaTitle: 'Pain Relief Medicines - Analgesics Online',
                keywords: 'analgesics, pain relief, paracetamol, ibuprofen, fever medicine',
                isActive: true,
                showInMenu: true,
                trackInventory: true
            },
            vitamin: {
                categoryName: 'Vitamins & Supplements',
                description: 'Nutritional supplements, vitamins, and mineral supplements for overall health',
                categoryType: 'supplement',
                prescriptionRequired: 'not-required',
                categoryIcon: 'fa-capsules',
                categoryColor: '#10b981',
                storageRequirements: 'room-temp',
                metaTitle: 'Vitamins & Supplements - Health Products',
                keywords: 'vitamins, supplements, nutrition, health supplements, multivitamins',
                isActive: true,
                showInMenu: true,
                trackInventory: true
            },
            cardiac: {
                categoryName: 'Cardiac Medicines',
                description: 'Medications for heart conditions, blood pressure, and cardiovascular health',
                categoryType: 'medicine',
                prescriptionRequired: 'required',
                categoryIcon: 'fa-heartbeat',
                categoryColor: '#ef4444',
                storageRequirements: 'room-temp',
                metaTitle: 'Cardiac Medicines - Heart Health Products',
                keywords: 'cardiac, heart medicine, blood pressure, hypertension, cardiovascular',
                isActive: true,
                showInMenu: true,
                trackInventory: true
            },
            diabetes: {
                categoryName: 'Diabetes Care',
                description: 'Medicines and supplies for diabetes management and blood sugar control',
                categoryType: 'medicine',
                prescriptionRequired: 'required',
                categoryIcon: 'fa-syringe',
                categoryColor: '#f59e0b',
                storageRequirements: 'refrigerated',
                metaTitle: 'Diabetes Medicines & Supplies Online',
                keywords: 'diabetes, insulin, blood sugar, glucose, diabetes care',
                isActive: true,
                showInMenu: true,
                trackInventory: true
            },
            respiratory: {
                categoryName: 'Respiratory Care',
                description: 'Medicines for asthma, allergies, cold, cough and respiratory conditions',
                categoryType: 'medicine',
                prescriptionRequired: 'conditional',
                categoryIcon: 'fa-lungs',
                categoryColor: '#06b6d4',
                storageRequirements: 'room-temp',
                metaTitle: 'Respiratory Medicines - Breathing Treatments',
                keywords: 'respiratory, asthma, inhaler, allergy, cold medicine, cough syrup',
                isActive: true,
                showInMenu: true,
                trackInventory: true
            },
            dermatology: {
                categoryName: 'Dermatology',
                description: 'Skin care medicines, creams, ointments for various skin conditions',
                categoryType: 'medicine',
                prescriptionRequired: 'conditional',
                categoryIcon: 'fa-spray-can',
                categoryColor: '#d946ef',
                storageRequirements: 'room-temp',
                metaTitle: 'Skin Care & Dermatology Products',
                keywords: 'dermatology, skin care, cream, ointment, skin treatment',
                isActive: true,
                showInMenu: true,
                trackInventory: true
            },
            pediatric: {
                categoryName: 'Pediatric Medicines',
                description: 'Medicines specifically formulated for children and infants',
                categoryType: 'medicine',
                prescriptionRequired: 'conditional',
                categoryIcon: 'fa-baby',
                categoryColor: '#ec4899',
                storageRequirements: 'room-temp',
                ageRestriction: 'children',
                metaTitle: 'Children Medicines - Pediatric Care',
                keywords: 'pediatric, children medicine, baby care, kids health, infant medicine',
                isActive: true,
                showInMenu: true,
                trackInventory: true
            }
        };
    </script>
</asp:Content>