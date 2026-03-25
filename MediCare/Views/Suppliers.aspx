<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Suppliers.aspx.cs" Inherits="MediCare.Views.Suppliers" %>

 <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <section>
       <div class="row">
    <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4>Suppliers Management</h4>
       

            
            <div class="btn-group ">
                <button type="button" class="btn btn-medical btn-medical-primary"
                    onclick="window.location.href='/Views/SupplierDetails.aspx'">
                    <i class="fas fa-plus me-2"></i>Add Supplier
                </button>
                <button class="btn btn-outline-secondary">
                    <i class="fas fa-download me-2"></i>Export
                </button>
            </div>


        </div>
    </div>
</div>

<!-- Supplier Stats -->
<div class="row mb-4">
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card-medical">
            <div class="card-medical-body text-center">
                <h3 class="text-primary mb-1">24</h3>
                <small class="text-muted">Total Suppliers</small>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card-medical">
            <div class="card-medical-body text-center">
                <h3 class="text-success mb-1">18</h3>
                <small class="text-muted">Active Suppliers</small>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card-medical">
            <div class="card-medical-body text-center">
                <h3 class="text-warning mb-1">₹4.2L</h3>
                <small class="text-muted">Monthly Purchase</small>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card-medical">
            <div class="card-medical-body text-center">
                <h3 class="text-info mb-1">156</h3>
                <small class="text-muted">Active Products</small>
            </div>
        </div>
    </div>
</div>

<!-- Suppliers Grid -->
<div class="row">
    <div class="col-12">
        <div class="card-medical">
            <div class="card-medical-header d-flex justify-content-between align-items-center">
                <h6 class="mb-0">All Suppliers</h6>
                <div class="text-muted">
                    <span class="badge bg-primary">24 Suppliers</span>
                </div>
            </div>
            <div class="card-medical-body">
                <div class="row">
                    <!-- Supplier Card -->
                    <div class="col-xl-4 col-lg-6 mb-4">
                        <div class="card-medical supplier-card h-100">
                            <div class="card-medical-body">
                                <div class="d-flex justify-content-between align-items-start mb-3">
                                    <div class="supplier-logo">
                                        <div class="logo-placeholder bg-primary text-white rounded">
                                            MS
                                        </div>
                                    </div>
                                    <div class="dropdown">
                                        <button class="btn btn-sm btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown">
                                            <i class="fas fa-ellipsis-v"></i>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#"><i class="fas fa-edit me-2"></i>Edit</a></li>
                                            <li><a class="dropdown-item" href="#"><i class="fas fa-eye me-2"></i>View Products</a></li>
                                            <li><a class="dropdown-item" href="#"><i class="fas fa-file-invoice me-2"></i>Purchase Orders</a></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item text-danger" href="#"><i class="fas fa-trash me-2"></i>Delete</a></li>
                                        </ul>
                                    </div>
                                </div>
                                
                                <h5 class="supplier-name mb-2">MediSupplies Ltd.</h5>
                                <p class="text-muted small mb-3">Leading pharmaceutical distributor with 15+ years experience</p>
                                
                                <div class="supplier-contact mb-3">
                                    <div class="d-flex align-items-center mb-2">
                                        <i class="fas fa-user me-2 text-muted"></i>
                                        <small>Contact: Rajesh Kumar</small>
                                    </div>
                                    <div class="d-flex align-items-center mb-2">
                                        <i class="fas fa-phone me-2 text-muted"></i>
                                        <small>+91 98765 43210</small>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <i class="fas fa-envelope me-2 text-muted"></i>
                                        <small>contact@medisupplies.com</small>
                                    </div>
                                </div>
                                
                                <div class="supplier-stats">
                                    <div class="row text-center">
                                        <div class="col-4">
                                            <div class="stat-value text-primary">45</div>
                                            <div class="stat-label small">Products</div>
                                        </div>
                                        <div class="col-4">
                                            <div class="stat-value text-success">12</div>
                                            <div class="stat-label small">Orders/Month</div>
                                        </div>
                                        <div class="col-4">
                                            <div class="stat-value text-info">4.2</div>
                                            <div class="stat-label small">Rating</div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="mt-3">
                                    <span class="badge bg-success">Active</span>
                                    <span class="badge bg-primary ms-1">Premium</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-4 col-lg-6 mb-4">
                        <div class="card-medical supplier-card h-100">
                            <div class="card-medical-body">
                                <div class="d-flex justify-content-between align-items-start mb-3">
                                    <div class="supplier-logo">
                                        <div class="logo-placeholder bg-success text-white rounded">
                                            PD
                                        </div>
                                    </div>
                                    <div class="dropdown">
                                        <button class="btn btn-sm btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown">
                                            <i class="fas fa-ellipsis-v"></i>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#"><i class="fas fa-edit me-2"></i>Edit</a></li>
                                            <li><a class="dropdown-item" href="#"><i class="fas fa-eye me-2"></i>View Products</a></li>
                                            <li><a class="dropdown-item" href="#"><i class="fas fa-file-invoice me-2"></i>Purchase Orders</a></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item text-danger" href="#"><i class="fas fa-trash me-2"></i>Delete</a></li>
                                        </ul>
                                    </div>
                                </div>
                                
                                <h5 class="supplier-name mb-2">PharmaDistributors</h5>
                                <p class="text-muted small mb-3">Specialized in generic medicines and OTC products</p>
                                
                                <div class="supplier-contact mb-3">
                                    <div class="d-flex align-items-center mb-2">
                                        <i class="fas fa-user me-2 text-muted"></i>
                                        <small>Contact: Priya Sharma</small>
                                    </div>
                                    <div class="d-flex align-items-center mb-2">
                                        <i class="fas fa-phone me-2 text-muted"></i>
                                        <small>+91 87654 32109</small>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <i class="fas fa-envelope me-2 text-muted"></i>
                                        <small>info@pharmadist.com</small>
                                    </div>
                                </div>
                                
                                <div class="supplier-stats">
                                    <div class="row text-center">
                                        <div class="col-4">
                                            <div class="stat-value text-primary">32</div>
                                            <div class="stat-label small">Products</div>
                                        </div>
                                        <div class="col-4">
                                            <div class="stat-value text-success">8</div>
                                            <div class="stat-label small">Orders/Month</div>
                                        </div>
                                        <div class="col-4">
                                            <div class="stat-value text-info">4.5</div>
                                            <div class="stat-label small">Rating</div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="mt-3">
                                    <span class="badge bg-success">Active</span>
                                    <span class="badge bg-info ms-1">Standard</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-4 col-lg-6 mb-4">
                        <div class="card-medical supplier-card h-100">
                            <div class="card-medical-body">
                                <div class="d-flex justify-content-between align-items-start mb-3">
                                    <div class="supplier-logo">
                                        <div class="logo-placeholder bg-warning text-white rounded">
                                            HS
                                        </div>
                                    </div>
                                    <div class="dropdown">
                                        <button class="btn btn-sm btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown">
                                            <i class="fas fa-ellipsis-v"></i>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#"><i class="fas fa-edit me-2"></i>Edit</a></li>
                                            <li><a class="dropdown-item" href="#"><i class="fas fa-eye me-2"></i>View Products</a></li>
                                            <li><a class="dropdown-item" href="#"><i class="fas fa-file-invoice me-2"></i>Purchase Orders</a></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item text-danger" href="#"><i class="fas fa-trash me-2"></i>Delete</a></li>
                                        </ul>
                                    </div>
                                </div>
                                
                                <h5 class="supplier-name mb-2">HealthSupplies Inc.</h5>
                                <p class="text-muted small mb-3">Medical equipment and surgical supplies specialist</p>
                                
                                <div class="supplier-contact mb-3">
                                    <div class="d-flex align-items-center mb-2">
                                        <i class="fas fa-user me-2 text-muted"></i>
                                        <small>Contact: Anil Verma</small>
                                    </div>
                                    <div class="d-flex align-items-center mb-2">
                                        <i class="fas fa-phone me-2 text-muted"></i>
                                        <small>+91 76543 21098</small>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <i class="fas fa-envelope me-2 text-muted"></i>
                                        <small>sales@healthsupplies.com</small>
                                    </div>
                                </div>
                                
                                <div class="supplier-stats">
                                    <div class="row text-center">
                                        <div class="col-4">
                                            <div class="stat-value text-primary">28</div>
                                            <div class="stat-label small">Products</div>
                                        </div>
                                        <div class="col-4">
                                            <div class="stat-value text-success">5</div>
                                            <div class="stat-label small">Orders/Month</div>
                                        </div>
                                        <div class="col-4">
                                            <div class="stat-value text-info">4.0</div>
                                            <div class="stat-label small">Rating</div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="mt-3">
                                    <span class="badge bg-success">Active</span>
                                    <span class="badge bg-secondary ms-1">Equipment</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Recent Purchase Orders -->
<div class="row mt-4">
    <div class="col-12">
        <div class="card-medical">
            <div class="card-medical-header">
                <h6 class="mb-0">Recent Purchase Orders</h6>
            </div>
            <div class="card-medical-body">
                <div class="table-responsive">
                    <table class="table table-medical table-sm">
                        <thead>
                            <tr>
                                <th>PO Number</th>
                                <th>Supplier</th>
                                <th>Products</th>
                                <th>Order Date</th>
                                <th>Delivery Date</th>
                                <th>Amount</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>#PO-2024-001</td>
                                <td>MediSupplies Ltd.</td>
                                <td>8 Products</td>
                                <td>05 Jan 2024</td>
                                <td>12 Jan 2024</td>
                                <td>₹84,500</td>
                                <td><span class="badge bg-success">Delivered</span></td>
                                <td>
                                    <button class="btn btn-sm btn-outline-primary">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>#PO-2024-002</td>
                                <td>PharmaDistributors</td>
                                <td>5 Products</td>
                                <td>08 Jan 2024</td>
                                <td>15 Jan 2024</td>
                                <td>₹45,200</td>
                                <td><span class="badge bg-warning">In Transit</span></td>
                                <td>
                                    <button class="btn btn-sm btn-outline-primary">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>#PO-2024-003</td>
                                <td>HealthSupplies Inc.</td>
                                <td>3 Products</td>
                                <td>10 Jan 2024</td>
                                <td>17 Jan 2024</td>
                                <td>₹67,800</td>
                                <td><span class="badge bg-info">Processing</span></td>
                                <td>
                                    <button class="btn btn-sm btn-outline-primary">
                                        <i class="fas fa-eye"></i>
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
   </section>
</asp:Content>