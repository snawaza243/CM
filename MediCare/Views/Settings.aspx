<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Settings.aspx.cs" Inherits="MediCare.Views.Settings" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <section>
       <div class="row">
    <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4>System Settings</h4>
            <div class="btn-group">
                <button class="btn btn-medical btn-medical-primary">
                    <i class="fas fa-save me-2"></i>Save Changes
                </button>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-3">
        <!-- Settings Navigation -->
        <div class="card-medical">
            <div class="card-medical-body">
                <div class="settings-nav">
                    <div class="nav flex-column nav-pills">
                        <a class="nav-link active" href="#general" data-bs-toggle="pill">
                            <i class="fas fa-cog me-2"></i>General Settings
                        </a>
                        <a class="nav-link" href="#pharmacy" data-bs-toggle="pill">
                            <i class="fas fa-clinic-medical me-2"></i>Pharmacy Info
                        </a>
                        <a class="nav-link" href="#prescription" data-bs-toggle="pill">
                            <i class="fas fa-file-prescription me-2"></i>Prescription Settings
                        </a>
                        <a class="nav-link" href="#inventory" data-bs-toggle="pill">
                            <i class="fas fa-boxes me-2"></i>Inventory Settings
                        </a>
                        <a class="nav-link" href="#notifications" data-bs-toggle="pill">
                            <i class="fas fa-bell me-2"></i>Notifications
                        </a>
                        <a class="nav-link" href="#users" data-bs-toggle="pill">
                            <i class="fas fa-users me-2"></i>User Management
                        </a>
                        <a class="nav-link" href="#security" data-bs-toggle="pill">
                            <i class="fas fa-shield-alt me-2"></i>Security
                        </a>
                        <a class="nav-link" href="#backup" data-bs-toggle="pill">
                            <i class="fas fa-database me-2"></i>Backup & Restore
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="col-lg-9">
        <div class="tab-content">
            <!-- General Settings -->
            <div class="tab-pane fade show active" id="general">
                <div class="card-medical">
                    <div class="card-medical-header">
                        <h6 class="mb-0">General Settings</h6>
                    </div>
                    <div class="card-medical-body">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Application Name</label>
                                <input type="text" class="form-control" value="MediCare Pharmacy Admin">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Timezone</label>
                                <select class="form-select">
                                    <option value="IST" selected>India Standard Time (IST)</option>
                                    <option value="UTC">UTC</option>
                                    <option value="EST">Eastern Standard Time</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Date Format</label>
                                <select class="form-select">
                                    <option value="dd/mm/yyyy" selected>DD/MM/YYYY</option>
                                    <option value="mm/dd/yyyy">MM/DD/YYYY</option>
                                    <option value="yyyy-mm-dd">YYYY-MM-DD</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Currency</label>
                                <select class="form-select">
                                    <option value="INR" selected>Indian Rupee (₹)</option>
                                    <option value="USD">US Dollar ($)</option>
                                    <option value="EUR">Euro (€)</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Language</label>
                                <select class="form-select">
                                    <option value="en" selected>English</option>
                                    <option value="hi">Hindi</option>
                                    <option value="ta">Tamil</option>
                                    <option value="te">Telugu</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Items Per Page</label>
                                <select class="form-select">
                                    <option value="10">10 items</option>
                                    <option value="25" selected>25 items</option>
                                    <option value="50">50 items</option>
                                    <option value="100">100 items</option>
                                </select>
                            </div>
                            <div class="col-12">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="maintenanceMode" checked>
                                    <label class="form-check-label" for="maintenanceMode">
                                        Maintenance Mode
                                    </label>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="autoBackup" checked>
                                    <label class="form-check-label" for="autoBackup">
                                        Automatic Backup
                                    </label>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="emailNotifications" checked>
                                    <label class="form-check-label" for="emailNotifications">
                                        Email Notifications
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Pharmacy Information -->
            <div class="tab-pane fade" id="pharmacy">
                <div class="card-medical">
                    <div class="card-medical-header">
                        <h6 class="mb-0">Pharmacy Information</h6>
                    </div>
                    <div class="card-medical-body">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Pharmacy Name</label>
                                <input type="text" class="form-control" value="MediCare Pharmacy">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">License Number</label>
                                <input type="text" class="form-control" value="PHARM-2024-LIC-001">
                            </div>
                            <div class="col-12">
                                <label class="form-label">Address</label>
                                <textarea class="form-control" rows="3">123 Medical Street, Healthcare Colony, Mumbai, Maharashtra - 400001</textarea>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Phone Number</label>
                                <input type="text" class="form-control" value="+91 22 1234 5678">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Email Address</label>
                                <input type="email" class="form-control" value="info@medicarepharmacy.com">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">GST Number</label>
                                <input type="text" class="form-control" value="27AABCU9603R1ZM">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Pharmacist In Charge</label>
                                <input type="text" class="form-control" value="Dr. Sarah Johnson">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Business Hours</label>
                                <input type="text" class="form-control" value="8:00 AM - 10:00 PM">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Emergency Contact</label>
                                <input type="text" class="form-control" value="+91 98765 43210">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Prescription Settings -->
            <div class="tab-pane fade" id="prescription">
                <div class="card-medical">
                    <div class="card-medical-header">
                        <h6 class="mb-0">Prescription Settings</h6>
                    </div>
                    <div class="card-medical-body">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Prescription Validity Period (Days)</label>
                                <input type="number" class="form-control" value="30" min="1" max="365">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Max Prescription Upload Size (MB)</label>
                                <input type="number" class="form-control" value="10" min="1" max="50">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Auto-Expire Pending Verifications (Hours)</label>
                                <input type="number" class="form-control" value="24" min="1" max="168">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Max Items Per Prescription</label>
                                <input type="number" class="form-control" value="5" min="1" max="20">
                            </div>
                            <div class="col-12">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="prescriptionRequired" checked>
                                    <label class="form-check-label" for="prescriptionRequired">
                                        Require Prescription for Prescription Drugs
                                    </label>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="doctorVerification" checked>
                                    <label class="form-check-label" for="doctorVerification">
                                        Require Doctor Verification
                                    </label>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="autoRefill" checked>
                                    <label class="form-check-label" for="autoRefill">
                                        Allow Automatic Refill Requests
                                    </label>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="emergencyPrescription">
                                    <label class="form-check-label" for="emergencyPrescription">
                                        Allow Emergency Prescription Processing
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Inventory Settings -->
            <div class="tab-pane fade" id="inventory">
                <div class="card-medical">
                    <div class="card-medical-header">
                        <h6 class="mb-0">Inventory Settings</h6>
                    </div>
                    <div class="card-medical-body">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Low Stock Threshold</label>
                                <input type="number" class="form-control" value="20" min="1" max="100">
                                <small class="text-muted">Alert when stock falls below this level</small>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Expiry Alert Days</label>
                                <input type="number" class="form-control" value="30" min="1" max="365">
                                <small class="text-muted">Alert before expiry (days)</small>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Auto Reorder Level</label>
                                <input type="number" class="form-control" value="15" min="1" max="50">
                                <small class="text-muted">Auto-generate purchase order at this level</small>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Default Reorder Quantity</label>
                                <input type="number" class="form-control" value="100" min="1" max="1000">
                                <small class="text-muted">Default quantity for auto reorders</small>
                            </div>
                            <div class="col-12">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="autoReorder" checked>
                                    <label class="form-check-label" for="autoReorder">
                                        Enable Auto Reorder
                                    </label>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="fefoSystem" checked>
                                    <label class="form-check-label" for="fefoSystem">
                                        Enable FEFO (First Expiry First Out)
                                    </label>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="batchTracking" checked>
                                    <label class="form-check-label" for="batchTracking">
                                        Enable Batch Tracking
                                    </label>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="serialNumberTracking">
                                    <label class="form-check-label" for="serialNumberTracking">
                                        Enable Serial Number Tracking
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- User Management -->
            <div class="tab-pane fade" id="users">
                <div class="card-medical">
                    <div class="card-medical-header d-flex justify-content-between align-items-center">
                        <h6 class="mb-0">User Management</h6>
                        <button class="btn btn-sm btn-primary">
                            <i class="fas fa-plus me-1"></i>Add User
                        </button>
                    </div>
                    <div class="card-medical-body">
                        <div class="table-responsive">
                            <table class="table table-medical">
                                <thead>
                                    <tr>
                                        <th>User</th>
                                        <th>Role</th>
                                        <th>Last Login</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <div class="avatar-circle bg-primary text-white me-3">
                                                    SJ
                                                </div>
                                                <div>
                                                    <strong>Dr. Sarah Johnson</strong>
                                                    <div class="text-muted small">sarah@medicare.com</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <span class="badge bg-primary">Administrator</span>
                                        </td>
                                        <td>10 Jan 2024, 10:30 AM</td>
                                        <td>
                                            <span class="status-indicator status-active"></span>
                                            <span class="text-success">Active</span>
                                        </td>
                                        <td>
                                            <div class="btn-group btn-group-sm">
                                                <button class="btn btn-outline-primary">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button class="btn btn-outline-danger">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <div class="avatar-circle bg-success text-white me-3">
                                                    RK
                                                </div>
                                                <div>
                                                    <strong>Rajesh Kumar</strong>
                                                    <div class="text-muted small">rajesh@medicare.com</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <span class="badge bg-success">Pharmacist</span>
                                        </td>
                                        <td>09 Jan 2024, 03:45 PM</td>
                                        <td>
                                            <span class="status-indicator status-active"></span>
                                            <span class="text-success">Active</span>
                                        </td>
                                        <td>
                                            <div class="btn-group btn-group-sm">
                                                <button class="btn btn-outline-primary">
                                                    <i class="fas fa-edit"></i>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
   </section>
</asp:Content>