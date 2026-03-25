<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Customers.aspx.cs" Inherits="MediCare.Views.Customers" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <section>
       <div class="row">
    <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4>Customer Management</h4>

            <div class="d-flex d-none">
             

                <a href="/Views/CustomerDetails.aspx" class="btn btn-outline-secondary">
                    <i class="fas fa-edit me-2"></i>Add Customer</a>
            </div>

            <div class="btn-group ">
                <button type="button" class="btn btn-medical btn-medical-primary"
                    onclick="window.location.href='/Views/CustomerDetails.aspx'">
                    <i class="fas fa-plus me-2"></i>Add New Customer
                </button>
                <button class="btn btn-outline-secondary">
                    <i class="fas fa-download me-2"></i>Export Customers
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Customer Stats -->
<div class="row mb-4">
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card-medical">
            <div class="card-medical-body text-center">
                <h3 class="text-primary mb-1">1,247</h3>
                <small class="text-muted">Total Customers</small>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card-medical">
            <div class="card-medical-body text-center">
                <h3 class="text-success mb-1">156</h3>
                <small class="text-muted">Active This Month</small>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card-medical">
            <div class="card-medical-body text-center">
                <h3 class="text-warning mb-1">24</h3>
                <small class="text-muted">New This Week</small>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card-medical">
            <div class="card-medical-body text-center">
                <h3 class="text-info mb-1">₹2.4L</h3>
                <small class="text-muted">Total Revenue</small>
            </div>
        </div>
    </div>
</div>

<!-- Customer Filters -->
<div class="row mb-4">
    <div class="col-12">
        <div class="card-medical">
            <div class="card-medical-body">
                <div class="row g-2">
                    <div class="col-md-3">
                        <label class="form-label">Search</label>
                        <input type="text" class="form-control" placeholder="Name, email, or phone...">
                    </div>
                    <div class="col-md-2">
                        <label class="form-label">Status</label>
                        <select class="form-select">
                            <option value="">All Status</option>
                            <option value="active">Active</option>
                            <option value="inactive">Inactive</option>
                            <option value="new">New</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <label class="form-label">Customer Type</label>
                        <select class="form-select">
                            <option value="">All Types</option>
                            <option value="regular">Regular</option>
                            <option value="prescription">Prescription User</option>
                            <option value="otc">OTC Only</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <label class="form-label">Location</label>
                        <select class="form-select">
                            <option value="">All Locations</option>
                            <option value="local">Local</option>
                            <option value="outstation">Outstation</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">&nbsp;</label>
                        <div class="d-grid gap-2 d-md-flex">
                            <button class="btn btn-primary">Search</button>
                            <button class="btn btn-outline-secondary">Reset</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Customers Table -->
<div class="row">
    <div class="col-12">
        <div class="card-medical">
            <div class="card-medical-header d-flex justify-content-between align-items-center">
                <h6 class="mb-0">All Customers</h6>
                <div class="text-muted">
                    <span class="badge bg-primary">1,247 Customers</span>
                </div>
            </div>
            <div class="card-medical-body">
                <div class="table-responsive">
                    <table class="table table-medical table-hover">
                        <thead>
                            <tr>
                                <th>Customer</th>
                                <th>Contact</th>
                                <th>Type</th>
                                <th>Total Orders</th>
                                <th>Total Spent</th>
                                <th>Last Order</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="customer-avatar me-3">
                                            <div class="avatar-circle bg-primary text-white">
                                                AK
                                            </div>
                                        </div>
                                        <div>
                                            <strong>Amit Kumar</strong>
                                            <div class="text-muted small">Customer #CUST-001</div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div>amit.kumar@email.com</div>
                                    <div class="text-muted small">+91 98765 43210</div>
                                </td>
                                <td>
                                    <span class="badge bg-secondary">Prescription User</span>
                                </td>
                                <td>
                                    <strong>24</strong> orders
                                </td>
                                <td>
                                    <strong>₹12,847</strong>
                                </td>
                                <td>
                                    10 Jan 2024
                                    <div class="text-muted small">#MED-1247</div>
                                </td>
                                <td>
                                    <span class="status-indicator status-active"></span>
                                    <span class="text-success">Active</span>
                                </td>
                                <td>
                                    <div class="btn-group btn-group-sm">
                                        <button class="btn btn-outline-primary" title="View Profile">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button class="btn btn-outline-info" title="Order History">
                                            <i class="fas fa-history"></i>
                                        </button>
                                        <button class="btn btn-outline-warning" title="Edit">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="customer-avatar me-3">
                                            <div class="avatar-circle bg-success text-white">
                                                PS
                                            </div>
                                        </div>
                                        <div>
                                            <strong>Priya Singh</strong>
                                            <div class="text-muted small">Customer #CUST-002</div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div>priya.singh@email.com</div>
                                    <div class="text-muted small">+91 87654 32109</div>
                                </td>
                                <td>
                                    <span class="badge bg-info">OTC Only</span>
                                </td>
                                <td>
                                    <strong>8</strong> orders
                                </td>
                                <td>
                                    <strong>₹3,245</strong>
                                </td>
                                <td>
                                    09 Jan 2024
                                    <div class="text-muted small">#MED-1244</div>
                                </td>
                                <td>
                                    <span class="status-indicator status-active"></span>
                                    <span class="text-success">Active</span>
                                </td>
                                <td>
                                    <div class="btn-group btn-group-sm">
                                        <button class="btn btn-outline-primary">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button class="btn btn-outline-info">
                                            <i class="fas fa-history"></i>
                                        </button>
                                        <button class="btn btn-outline-warning">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="customer-avatar me-3">
                                            <div class="avatar-circle bg-warning text-white">
                                                RD
                                            </div>
                                        </div>
                                        <div>
                                            <strong>Rahul Desai</strong>
                                            <div class="text-muted small">Customer #CUST-003</div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div>rahul.desai@email.com</div>
                                    <div class="text-muted small">+91 76543 21098</div>
                                </td>
                                <td>
                                    <span class="badge bg-secondary">Prescription User</span>
                                </td>
                                <td>
                                    <strong>15</strong> orders
                                </td>
                                <td>
                                    <strong>₹18,642</strong>
                                </td>
                                <td>
                                    08 Jan 2024
                                    <div class="text-muted small">#MED-1242</div>
                                </td>
                                <td>
                                    <span class="status-indicator status-active"></span>
                                    <span class="text-success">Active</span>
                                </td>
                                <td>
                                    <div class="btn-group btn-group-sm">
                                        <button class="btn btn-outline-primary">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button class="btn btn-outline-info">
                                            <i class="fas fa-history"></i>
                                        </button>
                                        <button class="btn btn-outline-warning">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Pagination -->
                <nav aria-label="Customer pagination" class="mt-3">
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

<!-- Top Customers -->
<div class="row mt-4">
    <div class="col-12">
        <div class="card-medical">
            <div class="card-medical-header">
                <h6 class="mb-0">Top Customers</h6>
            </div>
            <div class="card-medical-body">
                <div class="row">
                    <div class="col-md-6 col-lg-3 mb-3">
                        <div class="card-medical text-center">
                            <div class="card-medical-body">
                                <div class="customer-avatar mx-auto mb-3">
                                    <div class="avatar-circle-lg bg-primary text-white">
                                        AK
                                    </div>
                                </div>
                                <h6 class="mb-1">Amit Kumar</h6>
                                <p class="text-muted small mb-2">24 Orders</p>
                                <h5 class="text-success">₹12,847</h5>
                                <small class="text-muted">Total Spent</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 mb-3">
                        <div class="card-medical text-center">
                            <div class="card-medical-body">
                                <div class="customer-avatar mx-auto mb-3">
                                    <div class="avatar-circle-lg bg-success text-white">
                                        RD
                                    </div>
                                </div>
                                <h6 class="mb-1">Rahul Desai</h6>
                                <p class="text-muted small mb-2">15 Orders</p>
                                <h5 class="text-success">₹18,642</h5>
                                <small class="text-muted">Total Spent</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 mb-3">
                        <div class="card-medical text-center">
                            <div class="card-medical-body">
                                <div class="customer-avatar mx-auto mb-3">
                                    <div class="avatar-circle-lg bg-warning text-white">
                                        NG
                                    </div>
                                </div>
                                <h6 class="mb-1">Neha Gupta</h6>
                                <p class="text-muted small mb-2">12 Orders</p>
                                <h5 class="text-success">₹8,745</h5>
                                <small class="text-muted">Total Spent</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 mb-3">
                        <div class="card-medical text-center">
                            <div class="card-medical-body">
                                <div class="customer-avatar mx-auto mb-3">
                                    <div class="avatar-circle-lg bg-info text-white">
                                        SP
                                    </div>
                                </div>
                                <h6 class="mb-1">Sunita Patel</h6>
                                <p class="text-muted small mb-2">8 Orders</p>
                                <h5 class="text-success">₹6,321</h5>
                                <small class="text-muted">Total Spent</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
   </section>

    
 <!-- Add Customer Modal -->
<div class="modal fade" id="addCustomerModal" tabindex="-1" aria-labelledby="addCustomerModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addCustomerModalLabel">
                    <i class="fas fa-user-plus me-2"></i>Add New Customer
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Customer Form -->
                <div id="addCustomerForm">
                    <!-- Personal Information -->
                    <div class="form-section">
                        <h6 class="section-title mb-3">
                            <i class="fas fa-user me-2 text-primary"></i>
                            Personal Information
                        </h6>
                        <div class="row g-2">
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
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Phone Number <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-text">+91</span>
                                    <input type="tel" class="form-control" name="phone" required 
                                           placeholder="98765 43210" maxlength="10">
                                </div>
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

                    <hr class="my-3">

                    <!-- Address Information -->
                    <div class="form-section">
                        <h6 class="section-title mb-3">
                            <i class="fas fa-map-marker-alt me-2 text-primary"></i>
                            Address Information
                        </h6>
                        <div class="row g-2">
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
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">PIN Code <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="pincode" required 
                                       placeholder="e.g., 400001" maxlength="6">
                            </div>
                        </div>
                    </div>

                    <hr class="my-3">

                    <!-- Medical Information -->
                    <div class="form-section">
                        <h6 class="section-title mb-3">
                            <i class="fas fa-file-medical me-2 text-primary"></i>
                            Medical Information
                        </h6>
                        <div class="row g-2">
                            <div class="col-12">
                                <label class="form-label">Known Allergies</label>
                                <textarea class="form-control" name="allergies" rows="2" 
                                          placeholder="List any known allergies (e.g., Penicillin, NSAIDs, etc.)"></textarea>
                            </div>
                            <div class="col-12">
                                <label class="form-label">Medical Conditions</label>
                                <textarea class="form-control" name="medicalConditions" rows="2" 
                                          placeholder="Any chronic conditions (e.g., Diabetes, Hypertension, etc.)"></textarea>
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
                                </select>
                            </div>
                        </div>
                    </div>

                    <hr class="my-3">

                    <!-- Additional Information -->
                    <div class="form-section">
                        <h6 class="section-title mb-3">
                            <i class="fas fa-info-circle me-2 text-primary"></i>
                            Additional Information
                        </h6>
                        <div class="row g-2">
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
                                <textarea class="form-control" name="deliveryInstructions" rows="2" 
                                          placeholder="Any special delivery instructions"></textarea>
                            </div>
                            <div class="col-12">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="sendPromotions" id="sendPromotions" checked>
                                    <label class="form-check-label" for="sendPromotions">
                                        Send promotional emails and updates
                                    </label>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="smsNotifications" id="smsNotifications" checked>
                                    <label class="form-check-label" for="smsNotifications">
                                        Enable SMS notifications for orders
                                    </label>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="autoRefillReminders" id="autoRefillReminders">
                                    <label class="form-check-label" for="autoRefillReminders">
                                        Send automatic refill reminders
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Quick Templates -->
                    <div class="card-medical mt-3">
                        <div class="card-medical-body py-2">
                            <small class="text-muted mb-2 d-block">Quick Templates:</small>
                            <div class="row g-1">
                                <div class="col-md-4 col-6">
                                    <button type="button" class="btn btn-sm btn-outline-primary w-100 template-btn" data-template="regular">
                                        Regular Customer
                                    </button>
                                </div>
                                <div class="col-md-4 col-6">
                                    <button type="button" class="btn btn-sm btn-outline-success w-100 template-btn" data-template="prescription">
                                        Prescription User
                                    </button>
                                </div>
                                <div class="col-md-4 col-6">
                                    <button type="button" class="btn btn-sm btn-outline-info w-100 template-btn" data-template="senior">
                                        Senior Citizen
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
                <button type="button" class="btn btn-outline-primary" id="resetCustomerForm">
                    <i class="fas fa-redo me-2"></i>Reset
                </button>
                <%--form="addCustomerForm"--%>
                <button type="submit"  class="btn btn-medical btn-medical-primary">
                    <i class="fas fa-user-plus me-2"></i>Add Customer
                </button>
            </div>
        </div>
    </div>
</div>
</asp:Content>