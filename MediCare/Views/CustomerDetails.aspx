<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.Master" CodeBehind="CustomerDetails.aspx.cs" Inherits="MediCare.Views.CustomerDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <section>
       <div class="row">
    <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4>Add New Customer</h4>
            <div class="btn-group">
                <a href="/Views/Customers.aspx" class="btn btn-outline-secondary">
                    <i class="fas fa-arrow-left me-2"></i>Back to Customers
                </a>
            </div>
        </div>
    </div>
</div>

<!-- Progress Steps -->
<div class="row mb-4">
    <div class="col-12">
        <div class="card-medical">
            <div class="card-medical-body">
                <div class="steps-progress">
                    <div class="steps">
                        <div class="step active">
                            <div class="step-number">1</div>
                            <div class="step-label">Personal Info</div>
                        </div>
                        <div class="step">
                            <div class="step-number">2</div>
                            <div class="step-label">Address Details</div>
                        </div>
                        <div class="step">
                            <div class="step-number">3</div>
                            <div class="step-label">Medical Info</div>
                        </div>
                        <div class="step">
                            <div class="step-number">4</div>
                            <div class="step-label">Review & Save</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Customer Form -->
<div class="row">
    <div class="col-12">
        <div class="card-medical">
            <div class="card-medical-header">
                <h6 class="mb-0">Customer Information</h6>
            </div>
            <div class="card-medical-body">
                <div id="addCustomerForm">
                    <!-- Personal Information -->
                    <div class="form-section">
                        <h6 class="section-title mb-4">
                            <i class="fas fa-user me-2 text-primary"></i>
                            Personal Information
                        </h6>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">First Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="firstName" required 
                                       placeholder="Enter first name">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Last Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="lastName" required 
                                       placeholder="Enter last name">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Email Address <span class="text-danger">*</span></label>
                                <input type="email" class="form-control" name="email" required 
                                       placeholder="customer@example.com">
                                <div class="form-text">We'll never share your email with anyone else.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Phone Number <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-text">+91</span>
                                    <input type="tel" class="form-control" name="phone" required 
                                           placeholder="98765 43210" maxlength="10">
                                </div>
                                <div class="form-text">10-digit mobile number without country code</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Date of Birth</label>
                                <input type="date" class="form-control" name="dateOfBirth">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Gender</label>
                                <select class="form-select" name="gender">
                                    <option value="">Select Gender</option>
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                    <option value="other">Other</option>
                                    <option value="prefer-not-to-say">Prefer not to say</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <hr class="my-4">

                    <!-- Address Information -->
                    <div class="form-section">
                        <h6 class="section-title mb-4">
                            <i class="fas fa-map-marker-alt me-2 text-primary"></i>
                            Address Information
                        </h6>
                        <div class="row g-3">
                            <div class="col-12">
                                <label class="form-label">Address Line 1 <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="addressLine1" required 
                                       placeholder="House no., Street, Area">
                            </div>
                            <div class="col-12">
                                <label class="form-label">Address Line 2</label>
                                <input type="text" class="form-control" name="addressLine2" 
                                       placeholder="Landmark, Building name">
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">City <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="city" required 
                                       placeholder="Enter city">
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">State <span class="text-danger">*</span></label>
                                <select class="form-select" name="state" required>
                                    <option value="">Select State</option>
                                    <option value="maharashtra">Maharashtra</option>
                                    <option value="delhi">Delhi</option>
                                    <option value="karnataka">Karnataka</option>
                                    <option value="tamil-nadu">Tamil Nadu</option>
                                    <option value="kerala">Kerala</option>
                                    <option value="gujarat">Gujarat</option>
                                    <option value="rajasthan">Rajasthan</option>
                                    <option value="west-bengal">West Bengal</option>
                                    <option value="uttar-pradesh">Uttar Pradesh</option>
                                    <option value="andhra-pradesh">Andhra Pradesh</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">PIN Code <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="pincode" required 
                                       placeholder="e.g., 400001" maxlength="6">
                                <div class="form-text">6-digit PIN code</div>
                            </div>
                        </div>
                    </div>

                    <hr class="my-4">

                    <!-- Medical Information -->
                    <div class="form-section">
                        <h6 class="section-title mb-4">
                            <i class="fas fa-file-medical me-2 text-primary"></i>
                            Medical Information
                        </h6>
                        <div class="row g-3">
                            <div class="col-12">
                                <label class="form-label">Known Allergies</label>
                                <textarea class="form-control" name="allergies" rows="3" 
                                          placeholder="List any known allergies (e.g., Penicillin, NSAIDs, Sulfa drugs, etc.)"></textarea>
                                <div class="form-text">Separate multiple allergies with commas</div>
                            </div>
                            <div class="col-12">
                                <label class="form-label">Medical Conditions</label>
                                <textarea class="form-control" name="medicalConditions" rows="3" 
                                          placeholder="Any chronic conditions (e.g., Diabetes, Hypertension, Asthma, etc.)"></textarea>
                                <div class="form-text">Separate multiple conditions with commas</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Blood Group</label>
                                <select class="form-select" name="bloodGroup">
                                    <option value="">Select Blood Group</option>
                                    <option value="a+">A+</option>
                                    <option value="a-">A-</option>
                                    <option value="b+">B+</option>
                                    <option value="b-">B-</option>
                                    <option value="o+">O+</option>
                                    <option value="o-">O-</option>
                                    <option value="ab+">AB+</option>
                                    <option value="ab-">AB-</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Customer Type</label>
                                <select class="form-select" name="customerType">
                                    <option value="regular">Regular Customer</option>
                                    <option value="prescription">Prescription User</option>
                                    <option value="otc">OTC Only</option>
                                    <option value="senior">Senior Citizen</option>
                                    <option value="chronic">Chronic Condition</option>
                                    <option value="wholesale">Wholesale Buyer</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <hr class="my-4">

                    <!-- Additional Information -->
                    <div class="form-section">
                        <h6 class="section-title mb-4">
                            <i class="fas fa-info-circle me-2 text-primary"></i>
                            Additional Information
                        </h6>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Emergency Contact Name</label>
                                <input type="text" class="form-control" name="emergencyContactName" 
                                       placeholder="Emergency contact person">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Emergency Contact Number</label>
                                <div class="input-group">
                                    <span class="input-group-text">+91</span>
                                    <input type="tel" class="form-control" name="emergencyContactPhone" 
                                           placeholder="Emergency contact number" maxlength="10">
                                </div>
                            </div>
                            <div class="col-12">
                                <label class="form-label">Delivery Instructions</label>
                                <textarea class="form-control" name="deliveryInstructions" rows="3" 
                                          placeholder="Any special delivery instructions, gate codes, security information, etc."></textarea>
                            </div>
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-check form-switch mb-3">
                                            <input class="form-check-input" type="checkbox" name="sendPromotions" id="sendPromotions" checked>
                                            <label class="form-check-label" for="sendPromotions">
                                                Send promotional emails and updates
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-check form-switch mb-3">
                                            <input class="form-check-input" type="checkbox" name="smsNotifications" id="smsNotifications" checked>
                                            <label class="form-check-label" for="smsNotifications">
                                                Enable SMS notifications for orders
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-check form-switch mb-3">
                                            <input class="form-check-input" type="checkbox" name="autoRefillReminders" id="autoRefillReminders">
                                            <label class="form-check-label" for="autoRefillReminders">
                                                Send automatic refill reminders
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Form Actions -->
                    <div class="row mt-5">
                        <div class="col-12">
                            <div class="d-flex justify-content-between">
                                <button type="button" class="btn btn-outline-secondary" id="resetCustomerForm">
                                    <i class="fas fa-redo me-2"></i>Reset Form
                                </button>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-outline-primary" id="saveCustomerDraft">
                                        <i class="fas fa-save me-2"></i>Save as Draft
                                    </button>
                                    <button type="submit" class="btn btn-medical btn-medical-primary">
                                        <i class="fas fa-user-plus me-2"></i>Add Customer
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

<!-- Quick Add Templates -->
<div class="row mt-4">
    <div class="col-12">
        <div class="card-medical">
            <div class="card-medical-header">
                <h6 class="mb-0">Quick Add Templates</h6>
            </div>
            <div class="card-medical-body">
                <div class="row">
                    <div class="col-md-4 col-6 mb-3">
                        <button type="button" class="btn btn-outline-primary w-100 template-btn" data-template="regular">
                            <i class="fas fa-user me-2"></i>Regular Customer
                        </button>
                    </div>
                    <div class="col-md-4 col-6 mb-3">
                        <button type="button" class="btn btn-outline-success w-100 template-btn" data-template="prescription">
                            <i class="fas fa-file-prescription me-2"></i>Prescription User
                        </button>
                    </div>
                    <div class="col-md-4 col-6 mb-3">
                        <button type="button" class="btn btn-outline-info w-100 template-btn" data-template="senior">
                            <i class="fas fa-user-friends me-2"></i>Senior Citizen
                        </button>
                    </div>
                    <div class="col-md-4 col-6 mb-3">
                        <button type="button" class="btn btn-outline-warning w-100 template-btn" data-template="chronic">
                            <i class="fas fa-heartbeat me-2"></i>Chronic Condition
                        </button>
                    </div>
                    <div class="col-md-4 col-6 mb-3">
                        <button type="button" class="btn btn-outline-secondary w-100 template-btn" data-template="wholesale">
                            <i class="fas fa-industry me-2"></i>Wholesale Buyer
                        </button>
                    </div>
                    <div class="col-md-4 col-6 mb-3">
                        <button type="button" class="btn btn-outline-dark w-100 template-btn" data-template="otc">
                            <i class="fas fa-shopping-cart me-2"></i>OTC Only
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Recent Additions -->
<div class="row mt-4">
    <div class="col-12">
        <div class="card-medical">
            <div class="card-medical-header">
                <h6 class="mb-0">Recently Added Customers</h6>
            </div>
            <div class="card-medical-body">
                <div class="table-responsive">
                    <table class="table table-medical table-sm">
                        <thead>
                            <tr>
                                <th>Customer Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Type</th>
                                <th>City</th>
                                <th>Added On</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="avatar-circle bg-primary text-white me-2">
                                            AK
                                        </div>
                                        Amit Kumar
                                    </div>
                                </td>
                                <td>amit.kumar@email.com</td>
                                <td>+91 98765 43210</td>
                                <td><span class="badge bg-primary">Regular</span></td>
                                <td>Mumbai</td>
                                <td>10 Jan 2024</td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="avatar-circle bg-success text-white me-2">
                                            PS
                                        </div>
                                        Priya Singh
                                    </div>
                                </td>
                                <td>priya.singh@email.com</td>
                                <td>+91 87654 32109</td>
                                <td><span class="badge bg-success">OTC Only</span></td>
                                <td>Delhi</td>
                                <td>09 Jan 2024</td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="avatar-circle bg-warning text-white me-2">
                                            RP
                                        </div>
                                        Ramesh Patel
                                    </div>
                                </td>
                                <td>ramesh.patel@email.com</td>
                                <td>+91 76543 21098</td>
                                <td><span class="badge bg-warning">Senior</span></td>
                                <td>Bangalore</td>
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
        // Add Customer Page Functionality
        document.addEventListener('DOMContentLoaded', function () {
            const form = document.getElementById('addCustomerForm');
            const resetBtn = document.getElementById('resetCustomerForm');
            const saveDraftBtn = document.getElementById('saveCustomerDraft');
            const templateBtns = document.querySelectorAll('.template-btn');

            // Form Reset
            resetBtn.addEventListener('click', function () {
                if (confirm('Are you sure you want to reset the form? All entered data will be lost.')) {
                    resetCustomerForm();
                }
            });

            // Save Draft
            saveDraftBtn.addEventListener('click', function () {
                const formData = new FormData(form);
                // Here you would typically save to localStorage or send to server
                showNotification('Customer draft saved successfully!', 'success');
            });

            // Template Buttons
            templateBtns.forEach(btn => {
                btn.addEventListener('click', function () {
                    const template = this.dataset.template;
                    loadCustomerTemplate(template);
                });
            });

            // Form Submission
            form.addEventListener('submit', function (e) {
                e.preventDefault();

                if (validateCustomerForm()) {
                    // Show loading state
                    const submitBtn = form.querySelector('button[type="submit"]');
                    const originalText = submitBtn.innerHTML;
                    submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Adding Customer...';
                    submitBtn.disabled = true;

                    // Simulate API call
                    setTimeout(() => {
                        showNotification('Customer added successfully!', 'success');
                        form.reset();
                        submitBtn.innerHTML = originalText;
                        submitBtn.disabled = false;

                        // Redirect to customers list after success
                        setTimeout(() => {
                            window.location.href = 'customers.html';
                        }, 1500);
                    }, 2000);
                }
            });

            // Phone number validation
            const phoneInput = form.querySelector('input[name="phone"]');
            phoneInput.addEventListener('input', function (e) {
                this.value = this.value.replace(/\D/g, '').slice(0, 10);
            });

            // PIN code validation
            const pincodeInput = form.querySelector('input[name="pincode"]');
            pincodeInput.addEventListener('input', function (e) {
                this.value = this.value.replace(/\D/g, '').slice(0, 6);
            });

            // Emergency contact phone validation
            const emergencyPhoneInput = form.querySelector('input[name="emergencyContactPhone"]');
            emergencyPhoneInput.addEventListener('input', function (e) {
                this.value = this.value.replace(/\D/g, '').slice(0, 10);
            });

            // Auto-generate customer ID on page load
            generateCustomerId();
        });

        function resetCustomerForm() {
            const form = document.getElementById('addCustomerForm');
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

        function generateCustomerId() {
            // This would typically be generated by the backend
            // For now, we'll simulate it
            const timestamp = new Date().getTime().toString().slice(-6);
            const random = Math.floor(Math.random() * 1000).toString().padStart(3, '0');
            return `CUST-${timestamp}${random}`;
        }

        function validateCustomerForm() {
            const form = document.getElementById('addCustomerForm');
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

            // Email validation
            const emailInput = form.querySelector('input[name="email"]');
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (emailInput.value && !emailRegex.test(emailInput.value)) {
                isValid = false;
                emailInput.classList.add('is-invalid');
                if (!emailInput.nextElementSibling?.classList.contains('invalid-feedback')) {
                    const errorDiv = document.createElement('div');
                    errorDiv.className = 'invalid-feedback';
                    errorDiv.textContent = 'Please enter a valid email address';
                    emailInput.parentNode.appendChild(errorDiv);
                }
            }

            // Phone validation
            const phoneInput = form.querySelector('input[name="phone"]');
            if (phoneInput.value && phoneInput.value.length !== 10) {
                isValid = false;
                phoneInput.classList.add('is-invalid');
                if (!phoneInput.nextElementSibling?.classList.contains('invalid-feedback')) {
                    const errorDiv = document.createElement('div');
                    errorDiv.className = 'invalid-feedback';
                    errorDiv.textContent = 'Phone number must be 10 digits';
                    phoneInput.parentNode.appendChild(errorDiv);
                }
            }

            // PIN code validation
            const pincodeInput = form.querySelector('input[name="pincode"]');
            if (pincodeInput.value && pincodeInput.value.length !== 6) {
                isValid = false;
                pincodeInput.classList.add('is-invalid');
                if (!pincodeInput.nextElementSibling?.classList.contains('invalid-feedback')) {
                    const errorDiv = document.createElement('div');
                    errorDiv.className = 'invalid-feedback';
                    errorDiv.textContent = 'PIN code must be 6 digits';
                    pincodeInput.parentNode.appendChild(errorDiv);
                }
            }

            // Date of birth validation (not in future)
            const dobInput = form.querySelector('input[name="dateOfBirth"]');
            if (dobInput.value) {
                const dob = new Date(dobInput.value);
                const today = new Date();
                if (dob > today) {
                    isValid = false;
                    dobInput.classList.add('is-invalid');
                    if (!dobInput.nextElementSibling?.classList.contains('invalid-feedback')) {
                        const errorDiv = document.createElement('div');
                        errorDiv.className = 'invalid-feedback';
                        errorDiv.textContent = 'Date of birth cannot be in the future';
                        dobInput.parentNode.appendChild(errorDiv);
                    }
                }
            }

            return isValid;
        }

        function loadCustomerTemplate(templateName) {
            const template = customerTemplates[templateName];
            const form = document.getElementById('addCustomerForm');

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

        // Customer Template Data
        const customerTemplates = {
            regular: {
                firstName: 'Amit',
                lastName: 'Kumar',
                email: 'amit.kumar@example.com',
                phone: '9876543210',
                addressLine1: '123 Main Street',
                city: 'Mumbai',
                state: 'maharashtra',
                pincode: '400001',
                customerType: 'regular',
                sendPromotions: true,
                smsNotifications: true
            },
            prescription: {
                firstName: 'Priya',
                lastName: 'Sharma',
                email: 'priya.sharma@example.com',
                phone: '8765432109',
                addressLine1: '456 Healthcare Lane',
                city: 'Delhi',
                state: 'delhi',
                pincode: '110001',
                customerType: 'prescription',
                sendPromotions: false,
                smsNotifications: true,
                autoRefillReminders: true
            },
            senior: {
                firstName: 'Ramesh',
                lastName: 'Patel',
                email: 'ramesh.patel@example.com',
                phone: '7654321098',
                dateOfBirth: '1955-06-15',
                addressLine1: '789 Senior Homes',
                city: 'Bangalore',
                state: 'karnataka',
                pincode: '560001',
                customerType: 'senior',
                bloodGroup: 'o+',
                sendPromotions: true,
                smsNotifications: true,
                autoRefillReminders: true
            },
            chronic: {
                firstName: 'Sunita',
                lastName: 'Joshi',
                email: 'sunita.joshi@example.com',
                phone: '6543210987',
                addressLine1: '321 Medical Avenue',
                city: 'Chennai',
                state: 'tamil-nadu',
                pincode: '600001',
                customerType: 'chronic',
                medicalConditions: 'Diabetes, Hypertension',
                sendPromotions: true,
                smsNotifications: true,
                autoRefillReminders: true
            },
            wholesale: {
                firstName: 'Rajesh',
                lastName: 'Enterprises',
                email: 'orders@rajeshenterprises.com',
                phone: '9876543211',
                addressLine1: 'Industrial Area, Sector 25',
                city: 'Gurgaon',
                state: 'delhi',
                pincode: '122001',
                customerType: 'wholesale',
                sendPromotions: false,
                smsNotifications: true
            },
            otc: {
                firstName: 'Neha',
                lastName: 'Gupta',
                email: 'neha.gupta@example.com',
                phone: '8765432108',
                addressLine1: '654 OTC Corner',
                city: 'Pune',
                state: 'maharashtra',
                pincode: '411001',
                customerType: 'otc',
                sendPromotions: true,
                smsNotifications: true
            }
        };
    </script>
</asp:Content>