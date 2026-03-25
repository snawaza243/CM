<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="SupplierDetails.aspx.cs" Inherits="MediCare.Scripts.SupplierDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <section>
       <div class="row">
    <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4>Add New Supplier</h4>
            <div class="btn-group">
                <a href="suppliers.html" class="btn btn-outline-secondary">
                    <i class="fas fa-arrow-left me-2"></i>Back to Suppliers
                </a>
            </div>
        </div>
    </div>
</div>

<!-- Supplier Stats -->
<div class="row mb-4">
    <div class="col-xl-3 col-md-6 mb-3">
        <div class="card-medical text-center">
            <div class="card-medical-body">
                <h6 class="text-muted mb-2">Total Suppliers</h6>
                <h3 class="text-primary mb-1">24</h3>
                <small>Active in system</small>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6 mb-3">
        <div class="card-medical text-center">
            <div class="card-medical-body">
                <h6 class="text-muted mb-2">Premium Suppliers</h6>
                <h3 class="text-warning mb-1">8</h3>
                <small>Certified partners</small>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6 mb-3">
        <div class="card-medical text-center">
            <div class="card-medical-body">
                <h6 class="text-muted mb-2">Monthly Orders</h6>
                <h3 class="text-success mb-1">156</h3>
                <small>Average purchase orders</small>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6 mb-3">
        <div class="card-medical text-center">
            <div class="card-medical-body">
                <h6 class="text-muted mb-2">Pending Deliveries</h6>
                <h3 class="text-info mb-1">12</h3>
                <small>Awaiting shipment</small>
            </div>
        </div>
    </div>
</div>

<!-- Add Supplier Form -->
<div class="row">
    <div class="col-12">
        <div class="card-medical">
            <div class="card-medical-header">
                <h6 class="mb-0">Supplier Information</h6>
            </div>
            <div class="card-medical-body">
                <form id="addSupplierForm">
                    <!-- Basic Company Information -->
                    <div class="form-section">
                        <h6 class="section-title mb-4">
                            <i class="fas fa-building me-2 text-primary"></i>
                            Company Information
                        </h6>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Company Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="companyName" required 
                                       placeholder="e.g., MediSupplies Ltd.">
                                <div class="form-text">Legal business name</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Trading Name</label>
                                <input type="text" class="form-control" name="tradingName" 
                                       placeholder="e.g., MediSupplies">
                                <div class="form-text">Name used for daily business</div>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Supplier Type</label>
                                <select class="form-select" name="supplierType">
                                    <option value="pharmaceutical">Pharmaceutical</option>
                                    <option value="medical-equipment">Medical Equipment</option>
                                    <option value="surgical">Surgical Supplies</option>
                                    <option value="generic">Generic Medicines</option>
                                    <option value="ayurvedic">Ayurvedic</option>
                                    <option value="wholesaler">Wholesaler</option>
                                    <option value="distributor">Distributor</option>
                                    <option value="manufacturer">Manufacturer</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Business Category</label>
                                <select class="form-select" name="businessCategory">
                                    <option value="large-enterprise">Large Enterprise</option>
                                    <option value="medium-enterprise">Medium Enterprise</option>
                                    <option value="small-enterprise">Small Enterprise</option>
                                    <option value="startup">Startup</option>
                                    <option value="individual">Individual</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Supplier Tier</label>
                                <select class="form-select" name="supplierTier">
                                    <option value="premium">Premium Partner</option>
                                    <option value="standard" selected>Standard</option>
                                    <option value="basic">Basic</option>
                                    <option value="trial">Trial</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Year Established</label>
                                <input type="number" class="form-control" name="yearEstablished" 
                                       min="1900" max="2024" placeholder="e.g., 2010">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Number of Employees</label>
                                <select class="form-select" name="employeeCount">
                                    <option value="">Select Range</option>
                                    <option value="1-10">1-10 Employees</option>
                                    <option value="11-50">11-50 Employees</option>
                                    <option value="51-200">51-200 Employees</option>
                                    <option value="201-500">201-500 Employees</option>
                                    <option value="501-1000">501-1000 Employees</option>
                                    <option value="1000+">1000+ Employees</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <hr class="my-4">

                    <!-- Contact Information -->
                    <div class="form-section">
                        <h6 class="section-title mb-4">
                            <i class="fas fa-address-card me-2 text-primary"></i>
                            Contact Information
                        </h6>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Primary Contact Person <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="contactPerson" required 
                                       placeholder="e.g., Rajesh Kumar">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Contact Designation</label>
                                <input type="text" class="form-control" name="contactDesignation" 
                                       placeholder="e.g., Sales Manager">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Email Address <span class="text-danger">*</span></label>
                                <input type="email" class="form-control" name="email" required 
                                       placeholder="contact@company.com">
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
                                <label class="form-label">Alternate Phone</label>
                                <div class="input-group">
                                    <span class="input-group-text">+91</span>
                                    <input type="tel" class="form-control" name="alternatePhone" 
                                           placeholder="Alternate contact number" maxlength="10">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Website</label>
                                <input type="url" class="form-control" name="website" 
                                       placeholder="https://www.company.com">
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
                                <label class="form-label">Registered Address <span class="text-danger">*</span></label>
                                <textarea class="form-control" name="registeredAddress" required rows="3" 
                                          placeholder="Complete registered office address"></textarea>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">City <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="city" required 
                                       placeholder="e.g., Mumbai">
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">State <span class="text-danger">*</span></label>
                                <select class="form-select" name="state" required>
                                    <option value="">Select State</option>
                                    <option value="maharashtra">Maharashtra</option>
                                    <option value="delhi">Delhi</option>
                                    <option value="karnataka">Karnataka</option>
                                    <option value="tamil-nadu">Tamil Nadu</option>
                                    <option value="gujarat">Gujarat</option>
                                    <option value="west-bengal">West Bengal</option>
                                    <option value="uttar-pradesh">Uttar Pradesh</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">PIN Code <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="pincode" required 
                                       placeholder="e.g., 400001" maxlength="6">
                            </div>
                            <div class="col-12">
                                <label class="form-label">Warehouse/Shipping Address</label>
                                <textarea class="form-control" name="shippingAddress" rows="2" 
                                          placeholder="If different from registered address"></textarea>
                            </div>
                        </div>
                    </div>

                    <hr class="my-4">

                    <!-- Business & Legal Information -->
                    <div class="form-section">
                        <h6 class="section-title mb-4">
                            <i class="fas fa-file-contract me-2 text-primary"></i>
                            Business & Legal Information
                        </h6>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">GST Number <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="gstNumber" required 
                                       placeholder="e.g., 27AABCU9603R1ZM">
                                <div class="form-text">15-character GST identification number</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Drug License Number</label>
                                <input type="text" class="form-control" name="drugLicenseNumber" 
                                       placeholder="e.g., DL-12345-MH">
                                <div class="form-text">As per FDA regulations</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">PAN Number</label>
                                <input type="text" class="form-control" name="panNumber" 
                                       placeholder="e.g., ABCDE1234F">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">TIN Number</label>
                                <input type="text" class="form-control" name="tinNumber" 
                                       placeholder="Tax Identification Number">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">MSME Registered</label>
                                <select class="form-select" name="msmeRegistered">
                                    <option value="no">No</option>
                                    <option value="yes">Yes</option>
                                    <option value="pending">Registration Pending</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">ISO Certified</label>
                                <select class="form-select" name="isoCertified">
                                    <option value="no">No</option>
                                    <option value="iso9001">ISO 9001</option>
                                    <option value="iso13485">ISO 13485</option>
                                    <option value="iso14001">ISO 14001</option>
                                    <option value="multiple">Multiple Certifications</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <hr class="my-4">

                    <!-- Payment & Terms -->
                    <div class="form-section">
                        <h6 class="section-title mb-4">
                            <i class="fas fa-money-bill-wave me-2 text-primary"></i>
                            Payment & Terms
                        </h6>
                        <div class="row g-3">
                            <div class="col-md-4">
                                <label class="form-label">Payment Terms</label>
                                <select class="form-select" name="paymentTerms">
                                    <option value="net15">Net 15 Days</option>
                                    <option value="net30" selected>Net 30 Days</option>
                                    <option value="net45">Net 45 Days</option>
                                    <option value="net60">Net 60 Days</option>
                                    <option value="cod">Cash on Delivery</option>
                                    <option value="advance">Advance Payment</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Credit Limit (₹)</label>
                                <input type="number" class="form-control" name="creditLimit" 
                                       placeholder="e.g., 500000" step="1000">
                                <div class="form-text">Maximum credit allowed</div>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Currency</label>
                                <select class="form-select" name="currency">
                                    <option value="INR" selected>Indian Rupee (₹)</option>
                                    <option value="USD">US Dollar ($)</option>
                                    <option value="EUR">Euro (€)</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Preferred Payment Methods</label>
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="paymentBankTransfer" id="bankTransfer" checked>
                                            <label class="form-check-label" for="bankTransfer">Bank Transfer</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="paymentCheque" id="cheque">
                                            <label class="form-check-label" for="cheque">Cheque</label>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="paymentUPI" id="upi" checked>
                                            <label class="form-check-label" for="upi">UPI</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="paymentCash" id="cash">
                                            <label class="form-check-label" for="cash">Cash</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Bank Account Details</label>
                                <textarea class="form-control" name="bankDetails" rows="3" 
                                          placeholder="Bank name, account number, IFSC code, etc."></textarea>
                            </div>
                        </div>
                    </div>

                    <hr class="my-4">

                    <!-- Products & Services -->
                    <div class="form-section">
                        <h6 class="section-title mb-4">
                            <i class="fas fa-boxes me-2 text-primary"></i>
                            Products & Services
                        </h6>
                        <div class="row g-3">
                            <div class="col-12">
                                <label class="form-label">Product Categories Supplied</label>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="categoryAntibiotics" id="catAntibiotics">
                                            <label class="form-check-label" for="catAntibiotics">Antibiotics</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="categoryAnalgesics" id="catAnalgesics" checked>
                                            <label class="form-check-label" for="catAnalgesics">Analgesics</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="categoryVitamins" id="catVitamins" checked>
                                            <label class="form-check-label" for="catVitamins">Vitamins</label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="categoryCardiac" id="catCardiac">
                                            <label class="form-check-label" for="catCardiac">Cardiac</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="categoryDiabetes" id="catDiabetes">
                                            <label class="form-check-label" for="catDiabetes">Diabetes</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="categoryDermatology" id="catDermatology">
                                            <label class="form-check-label" for="catDermatology">Dermatology</label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="categoryEquipment" id="catEquipment">
                                            <label class="form-check-label" for="catEquipment">Medical Equipment</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="categorySurgical" id="catSurgical">
                                            <label class="form-check-label" for="catSurgical">Surgical</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="categoryAyurvedic" id="catAyurvedic">
                                            <label class="form-check-label" for="catAyurvedic">Ayurvedic</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Minimum Order Quantity</label>
                                <input type="number" class="form-control" name="minOrderQuantity" 
                                       placeholder="e.g., 1000" step="100">
                                <div class="form-text">Minimum order value in ₹</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Delivery Lead Time (Days)</label>
                                <input type="number" class="form-control" name="deliveryLeadTime" 
                                       value="7" min="1" max="30">
                            </div>
                            <div class="col-12">
                                <label class="form-label">Specializations</label>
                                <textarea class="form-control" name="specializations" rows="2" 
                                          placeholder="Company specializations, unique products, competitive advantages..."></textarea>
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
                            <div class="col-12">
                                <label class="form-label">Company Description</label>
                                <textarea class="form-control" name="companyDescription" rows="3" 
                                          placeholder="Brief description of the company, history, mission, values..."></textarea>
                            </div>
                            <div class="col-12">
                                <label class="form-label">Notes & Remarks</label>
                                <textarea class="form-control" name="notes" rows="2" 
                                          placeholder="Any additional notes, special instructions, or remarks..."></textarea>
                            </div>
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-check form-switch mb-3">
                                            <input class="form-check-input" type="checkbox" name="isActive" id="isActive" checked>
                                            <label class="form-check-label" for="isActive">
                                                Active Supplier
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-check form-switch mb-3">
                                            <input class="form-check-input" type="checkbox" name="preferredSupplier" id="preferredSupplier">
                                            <label class="form-check-label" for="preferredSupplier">
                                                Preferred Supplier
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-check form-switch mb-3">
                                            <input class="form-check-input" type="checkbox" name="qualityCertified" id="qualityCertified">
                                            <label class="form-check-label" for="qualityCertified">
                                                Quality Certified
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-check form-switch mb-3">
                                            <input class="form-check-input" type="checkbox" name="sendNotifications" id="sendNotifications" checked>
                                            <label class="form-check-label" for="sendNotifications">
                                                Send Notifications
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
                                <button type="button" class="btn btn-outline-secondary" id="resetSupplierForm">
                                    <i class="fas fa-redo me-2"></i>Reset Form
                                </button>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-outline-primary" id="saveSupplierDraft">
                                        <i class="fas fa-save me-2"></i>Save as Draft
                                    </button>
                                    <button type="submit" class="btn btn-medical btn-medical-primary">
                                        <i class="fas fa-truck me-2"></i>Add Supplier
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

<!-- Quick Supplier Templates -->
<div class="row mt-4">
    <div class="col-12">
        <div class="card-medical">
            <div class="card-medical-header">
                <h6 class="mb-0">Quick Supplier Templates</h6>
            </div>
            <div class="card-medical-body">
                <div class="row">
                    <div class="col-md-4 col-6 mb-3">
                        <button type="button" class="btn btn-outline-primary w-100 template-btn" data-template="pharmaceutical">
                            <i class="fas fa-pills me-2"></i>Pharmaceutical
                        </button>
                    </div>
                    <div class="col-md-4 col-6 mb-3">
                        <button type="button" class="btn btn-outline-success w-100 template-btn" data-template="equipment">
                            <i class="fas fa-stethoscope me-2"></i>Equipment
                        </button>
                    </div>
                    <div class="col-md-4 col-6 mb-3">
                        <button type="button" class="btn btn-outline-info w-100 template-btn" data-template="generic">
                            <i class="fas fa-capsules me-2"></i>Generic
                        </button>
                    </div>
                    <div class="col-md-4 col-6 mb-3">
                        <button type="button" class="btn btn-outline-warning w-100 template-btn" data-template="wholesaler">
                            <i class="fas fa-warehouse me-2"></i>Wholesaler
                        </button>
                    </div>
                    <div class="col-md-4 col-6 mb-3">
                        <button type="button" class="btn btn-outline-danger w-100 template-btn" data-template="surgical">
                            <i class="fas fa-syringe me-2"></i>Surgical
                        </button>
                    </div>
                    <div class="col-md-4 col-6 mb-3">
                        <button type="button" class="btn btn-outline-secondary w-100 template-btn" data-template="ayurvedic">
                            <i class="fas fa-leaf me-2"></i>Ayurvedic
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Recent Supplier Additions -->
<div class="row mt-4">
    <div class="col-12">
        <div class="card-medical">
            <div class="card-medical-header">
                <h6 class="mb-0">Recently Added Suppliers</h6>
            </div>
            <div class="card-medical-body">
                <div class="table-responsive">
                    <table class="table table-medical table-sm">
                        <thead>
                            <tr>
                                <th>Supplier Name</th>
                                <th>Type</th>
                                <th>Contact</th>
                                <th>City</th>
                                <th>Status</th>
                                <th>Added On</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <strong>MediSupplies Ltd.</strong>
                                    <div class="text-muted small">Premium Partner</div>
                                </td>
                                <td>Pharmaceutical</td>
                                <td>Rajesh Kumar</td>
                                <td>Mumbai</td>
                                <td><span class="badge bg-success">Active</span></td>
                                <td>10 Jan 2024</td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>HealthEquip Corp</strong>
                                    <div class="text-muted small">Equipment Specialist</div>
                                </td>
                                <td>Medical Equipment</td>
                                <td>Priya Sharma</td>
                                <td>Delhi</td>
                                <td><span class="badge bg-success">Active</span></td>
                                <td>09 Jan 2024</td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Generic Pharma Co.</strong>
                                    <div class="text-muted small">Generic Medicines</div>
                                </td>
                                <td>Generic</td>
                                <td>Anil Verma</td>
                                <td>Bangalore</td>
                                <td><span class="badge bg-warning">Pending</span></td>
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
        // Add Supplier Page Functionality
        document.addEventListener('DOMContentLoaded', function () {
            const form = document.getElementById('addSupplierForm');
            const resetBtn = document.getElementById('resetSupplierForm');
            const saveDraftBtn = document.getElementById('saveSupplierDraft');
            const templateBtns = document.querySelectorAll('.template-btn');

            // Form Reset
            resetBtn.addEventListener('click', function () {
                if (confirm('Are you sure you want to reset the form? All entered data will be lost.')) {
                    resetSupplierForm();
                }
            });

            // Save Draft
            saveDraftBtn.addEventListener('click', function () {
                const formData = new FormData(form);
                // Here you would typically save to localStorage or send to server
                showNotification('Supplier draft saved successfully!', 'success');
            });

            // Template Buttons
            templateBtns.forEach(btn => {
                btn.addEventListener('click', function () {
                    const template = this.dataset.template;
                    loadSupplierTemplate(template);
                });
            });

            // Phone number validation
            const phoneInput = form.querySelector('input[name="phone"]');
            phoneInput.addEventListener('input', function (e) {
                this.value = this.value.replace(/\D/g, '').slice(0, 10);
            });

            const altPhoneInput = form.querySelector('input[name="alternatePhone"]');
            altPhoneInput.addEventListener('input', function (e) {
                this.value = this.value.replace(/\D/g, '').slice(0, 10);
            });

            // PIN code validation
            const pincodeInput = form.querySelector('input[name="pincode"]');
            pincodeInput.addEventListener('input', function (e) {
                this.value = this.value.replace(/\D/g, '').slice(0, 6);
            });

            // GST number formatting
            const gstInput = form.querySelector('input[name="gstNumber"]');
            gstInput.addEventListener('input', function (e) {
                this.value = this.value.toUpperCase();
            });

            // Auto-generate company description
            const companyNameInput = form.querySelector('input[name="companyName"]');
            const companyDescInput = form.querySelector('textarea[name="companyDescription"]');

            companyNameInput.addEventListener('blur', function () {
                if (this.value && !companyDescInput.value) {
                    companyDescInput.value = `${this.value} is a reputable supplier in the pharmaceutical industry, committed to providing high-quality medicines and healthcare products. With a focus on reliability and customer satisfaction, we ensure timely delivery and competitive pricing for all our partners.`;
                }
            });

            // Form Submission
            form.addEventListener('submit', function (e) {
                e.preventDefault();

                if (validateSupplierForm()) {
                    // Show loading state
                    const submitBtn = form.querySelector('button[type="submit"]');
                    const originalText = submitBtn.innerHTML;
                    submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Adding Supplier...';
                    submitBtn.disabled = true;

                    // Simulate API call
                    setTimeout(() => {
                        showNotification('Supplier added successfully!', 'success');
                        form.reset();
                        submitBtn.innerHTML = originalText;
                        submitBtn.disabled = false;

                        // Redirect to suppliers list after success
                        setTimeout(() => {
                            window.location.href = 'suppliers.html';
                        }, 1500);
                    }, 2000);
                }
            });
        });

        function resetSupplierForm() {
            const form = document.getElementById('addSupplierForm');
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

        function validateSupplierForm() {
            const form = document.getElementById('addSupplierForm');
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

            // GST validation (basic format check)
            const gstInput = form.querySelector('input[name="gstNumber"]');
            const gstRegex = /^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$/;
            if (gstInput.value && !gstRegex.test(gstInput.value)) {
                isValid = false;
                gstInput.classList.add('is-invalid');
                if (!gstInput.nextElementSibling?.classList.contains('invalid-feedback')) {
                    const errorDiv = document.createElement('div');
                    errorDiv.className = 'invalid-feedback';
                    errorDiv.textContent = 'Please enter a valid GST number';
                    gstInput.parentNode.appendChild(errorDiv);
                }
            }

            // Website URL validation
            const websiteInput = form.querySelector('input[name="website"]');
            const urlRegex = /^(https?:\/\/)?([\da-z.-]+)\.([a-z.]{2,6})([/\w .-]*)*\/?$/;
            if (websiteInput.value && !urlRegex.test(websiteInput.value)) {
                isValid = false;
                websiteInput.classList.add('is-invalid');
                if (!websiteInput.nextElementSibling?.classList.contains('invalid-feedback')) {
                    const errorDiv = document.createElement('div');
                    errorDiv.className = 'invalid-feedback';
                    errorDiv.textContent = 'Please enter a valid website URL';
                    websiteInput.parentNode.appendChild(errorDiv);
                }
            }

            return isValid;
        }

        function loadSupplierTemplate(templateName) {
            const template = supplierTemplates[templateName];
            const form = document.getElementById('addSupplierForm');

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

            showNotification(`${templateName} supplier template loaded!`, 'info');
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

        // Supplier Template Data
        const supplierTemplates = {
            pharmaceutical: {
                companyName: 'PharmaSupplies India Ltd.',
                tradingName: 'PharmaSupplies',
                supplierType: 'pharmaceutical',
                businessCategory: 'large-enterprise',
                supplierTier: 'premium',
                contactPerson: 'Rajesh Kumar',
                contactDesignation: 'Sales Director',
                email: 'sales@pharmasupplies.com',
                phone: '9876543210',
                website: 'https://www.pharmasupplies.com',
                registeredAddress: '123 Pharma Street, Andheri East',
                city: 'Mumbai',
                state: 'maharashtra',
                pincode: '400069',
                gstNumber: '27AABCP1234R1Z2',
                drugLicenseNumber: 'DL-54321-MH',
                paymentTerms: 'net30',
                creditLimit: '1000000',
                categoryAnalgesics: true,
                categoryAntibiotics: true,
                categoryVitamins: true,
                deliveryLeadTime: '7',
                isActive: true,
                preferredSupplier: true,
                qualityCertified: true
            },
            equipment: {
                companyName: 'MediEquip Solutions Pvt. Ltd.',
                supplierType: 'medical-equipment',
                businessCategory: 'medium-enterprise',
                supplierTier: 'standard',
                contactPerson: 'Priya Sharma',
                contactDesignation: 'Business Development Manager',
                email: 'info@mediequip.com',
                phone: '8765432109',
                website: 'https://www.mediequip.com',
                registeredAddress: '456 Equipment Park, Sector 18',
                city: 'Gurgaon',
                state: 'delhi',
                pincode: '122001',
                gstNumber: '06AABCM5678R1Z3',
                paymentTerms: 'net15',
                creditLimit: '500000',
                categoryEquipment: true,
                categorySurgical: true,
                deliveryLeadTime: '5',
                minOrderQuantity: '5000',
                isActive: true,
                qualityCertified: true
            },
            generic: {
                companyName: 'Generic Pharma Corporation',
                supplierType: 'generic',
                businessCategory: 'medium-enterprise',
                supplierTier: 'standard',
                contactPerson: 'Anil Verma',
                contactDesignation: 'Sales Manager',
                email: 'orders@genericpharma.com',
                phone: '7654321098',
                registeredAddress: '789 Generic Lane, Industrial Area',
                city: 'Hyderabad',
                state: 'telangana',
                pincode: '500032',
                gstNumber: '36AABCG9012R1Z4',
                drugLicenseNumber: 'DL-98765-TS',
                paymentTerms: 'net30',
                creditLimit: '750000',
                categoryAnalgesics: true,
                categoryVitamins: true,
                categoryCardiac: true,
                deliveryLeadTime: '10',
                minOrderQuantity: '2000',
                isActive: true
            },
            wholesaler: {
                companyName: 'MediWholesale Distributors',
                supplierType: 'wholesaler',
                businessCategory: 'large-enterprise',
                supplierTier: 'premium',
                contactPerson: 'Sunil Patel',
                contactDesignation: 'Director',
                email: 'wholesale@mediwholesale.com',
                phone: '6543210987',
                registeredAddress: '321 Wholesale Market, Trade Center',
                city: 'Ahmedabad',
                state: 'gujarat',
                pincode: '380001',
                gstNumber: '24AABCW3456R1Z5',
                paymentTerms: 'net45',
                creditLimit: '2000000',
                categoryAnalgesics: true,
                categoryAntibiotics: true,
                categoryVitamins: true,
                categoryCardiac: true,
                categoryDiabetes: true,
                deliveryLeadTime: '3',
                minOrderQuantity: '5000',
                isActive: true,
                preferredSupplier: true
            },
            surgical: {
                companyName: 'Surgical Supplies India',
                supplierType: 'surgical',
                businessCategory: 'small-enterprise',
                supplierTier: 'standard',
                contactPerson: 'Dr. Amit Joshi',
                contactDesignation: 'Medical Director',
                email: 'surgical@surgicalsupplies.com',
                phone: '5432109876',
                registeredAddress: '654 Surgical Complex, Medical Zone',
                city: 'Chennai',
                state: 'tamil-nadu',
                pincode: '600001',
                gstNumber: '33AABCS7890R1Z6',
                paymentTerms: 'net30',
                creditLimit: '300000',
                categorySurgical: true,
                categoryEquipment: true,
                deliveryLeadTime: '7',
                minOrderQuantity: '1000',
                isActive: true,
                qualityCertified: true
            },
            ayurvedic: {
                companyName: 'AyurMed Herbals Pvt. Ltd.',
                supplierType: 'ayurvedic',
                businessCategory: 'medium-enterprise',
                supplierTier: 'standard',
                contactPerson: 'Neha Gupta',
                contactDesignation: 'Marketing Head',
                email: 'ayurvedic@ayurmed.com',
                phone: '4321098765',
                website: 'https://www.ayurmed.com',
                registeredAddress: '987 Herbal Garden, Natural Park',
                city: 'Bangalore',
                state: 'karnataka',
                pincode: '560001',
                gstNumber: '29AABCA1234R1Z7',
                paymentTerms: 'net30',
                creditLimit: '400000',
                categoryAyurvedic: true,
                deliveryLeadTime: '14',
                minOrderQuantity: '1500',
                isActive: true,
                msmeRegistered: 'yes'
            }
        };
    </script>
</asp:Content>