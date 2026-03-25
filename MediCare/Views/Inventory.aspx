<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Inventory.aspx.cs" Inherits="MediCare.Views.Inventory" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section>

        <div class="row">
            <div class="col-12">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h4>Inventory Management</h4>
                   
                    <div class="btn-group ">
                        <button type="button" class="btn btn-medical btn-medical-primary"
                            onclick="window.location.href='/Views/InventoryDetails.aspx'">
                            <i class="fas fa-plus me-2"></i>Add Stock
                        </button>
                        <button class="btn btn-outline-secondary">
                            <i class="fas fa-download me-2"></i>Export 
                        </button>
                    </div>

                </div>
            </div>
        </div>

        <!-- Inventory Alerts -->
        <div class="row mb-4">
            <div class="col-12">
                <div class="alert-medical alert-critical">
                    <div class="d-flex align-items-center justify-content-between">
                        <div class="d-flex align-items-center">
                            <i class="fas fa-exclamation-triangle me-3"></i>
                            <div>
                                <strong>Expiry Alert:</strong> 15 medicines are expiring in the next 30 days
                            </div>
                        </div>
                        <a href="#expiring-section" class="btn btn-sm btn-outline-danger">View All</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Inventory Summary -->
        <div class="row mb-4">
            <div class="col-xl-2 col-md-4 col-6 mb-3">
                <div class="card-medical text-center">
                    <div class="card-medical-body">
                        <h3 class="text-success mb-1">856</h3>
                        <small class="text-muted">In Stock</small>
                    </div>
                </div>
            </div>
            <div class="col-xl-2 col-md-4 col-6 mb-3">
                <div class="card-medical text-center">
                    <div class="card-medical-body">
                        <h3 class="text-warning mb-1">42</h3>
                        <small class="text-muted">Low Stock</small>
                    </div>
                </div>
            </div>
            <div class="col-xl-2 col-md-4 col-6 mb-3">
                <div class="card-medical text-center">
                    <div class="card-medical-body">
                        <h3 class="text-danger mb-1">15</h3>
                        <small class="text-muted">Out of Stock</small>
                    </div>
                </div>
            </div>
            <div class="col-xl-2 col-md-4 col-6 mb-3">
                <div class="card-medical text-center">
                    <div class="card-medical-body">
                        <h3 class="text-info mb-1">28</h3>
                        <small class="text-muted">Expiring Soon</small>
                    </div>
                </div>
            </div>
            <div class="col-xl-2 col-md-4 col-6 mb-3">
                <div class="card-medical text-center">
                    <div class="card-medical-body">
                        <h3 class="text-secondary mb-1">12</h3>
                        <small class="text-muted">Expired</small>
                    </div>
                </div>
            </div>
            <div class="col-xl-2 col-md-4 col-6 mb-3">
                <div class="card-medical text-center">
                    <div class="card-medical-body">
                        <h3 class="text-primary mb-1">1,247</h3>
                        <small class="text-muted">Total Items</small>
                    </div>
                </div>
            </div>
        </div>

        <!-- Filters -->
        <div class="row mb-4">
            <div class="col-12">
                <div class="card-medical">
                    <div class="card-medical-body">
                        <div class="row g-2">
                            <div class="col-md-2">
                                <label class="form-label">Stock Status</label>
                                <select class="form-select">
                                    <option value="">All Status</option>
                                    <option value="in-stock">In Stock</option>
                                    <option value="low-stock">Low Stock</option>
                                    <option value="out-of-stock">Out of Stock</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <label class="form-label">Category</label>
                                <select class="form-select">
                                    <option value="">All Categories</option>
                                    <option value="analgesic">Analgesic</option>
                                    <option value="antibiotic">Antibiotic</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <label class="form-label">Expiry Status</label>
                                <select class="form-select">
                                    <option value="">All</option>
                                    <option value="expiring">Expiring Soon</option>
                                    <option value="expired">Expired</option>
                                    <option value="safe">Safe</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <label class="form-label">Search Medicine</label>
                                <input type="text" class="form-control" placeholder="Medicine name...">
                            </div>
                            <div class="col-md-3">
                                <label class="form-label">&nbsp;</label>
                                <div class="d-grid gap-2 d-md-flex">
                                    <button class="btn btn-primary">Apply Filters</button>
                                    <button class="btn btn-outline-secondary">Reset</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Inventory Table -->
        <div class="row">
            <div class="col-12">
                <div class="card-medical">
                    <div class="card-medical-header d-flex justify-content-between align-items-center">
                        <h6 class="mb-0">Medicine Inventory</h6>
                        <div class="text-muted">
                            <span class="badge bg-primary">1,247 Items</span>
                        </div>
                    </div>
                    <div class="card-medical-body">
                        <div class="table-responsive">
                            <table class="table table-medical table-hover">
                                <thead>
                                    <tr>
                                        <th>Medicine</th>
                                        <th>Batch No.</th>
                                        <th>Current Stock</th>
                                        <th>Min Stock</th>
                                        <th>Supplier</th>
                                        <th>Expiry Date</th>
                                        <th>Days Left</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <strong>Paracetamol 500mg</strong>
                                            <div class="text-muted small">PAN-001</div>
                                        </td>
                                        <td>BATCH-2024-001</td>
                                        <td>
                                            <div class="stock-level">
                                                <span class="text-success">145</span>
                                                <div class="progress" style="height: 6px; width: 100px;">
                                                    <div class="progress-bar bg-success" style="width: 80%"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>20</td>
                                        <td>MediSupplies Ltd.</td>
                                        <td>15 Dec 2024</td>
                                        <td>
                                            <span class="text-success">320 days</span>
                                        </td>
                                        <td>
                                            <span class="badge bg-success">In Stock</span>
                                        </td>
                                        <td>
                                            <div class="btn-group btn-group-sm">
                                                <button class="btn btn-outline-primary" title="Restock">
                                                    <i class="fas fa-box"></i>
                                                </button>
                                                <button class="btn btn-outline-warning" title="Adjust Stock">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="table-warning">
                                        <td>
                                            <strong>Amoxicillin 250mg</strong>
                                            <div class="text-muted small">AMX-002</div>
                                        </td>
                                        <td>BATCH-2024-015</td>
                                        <td>
                                            <div class="stock-level">
                                                <span class="text-warning">12</span>
                                                <div class="progress" style="height: 6px; width: 100px;">
                                                    <div class="progress-bar bg-warning" style="width: 30%"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>15</td>
                                        <td>PharmaDistributors</td>
                                        <td>20 Mar 2025</td>
                                        <td>
                                            <span class="text-success">415 days</span>
                                        </td>
                                        <td>
                                            <span class="badge bg-warning">Low Stock</span>
                                        </td>
                                        <td>
                                            <div class="btn-group btn-group-sm">
                                                <button class="btn btn-outline-primary">
                                                    <i class="fas fa-box"></i>
                                                </button>
                                                <button class="btn btn-outline-warning">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="table-danger">
                                        <td>
                                            <strong>Vitamin C 500mg</strong>
                                            <div class="text-muted small">VIT-005</div>
                                        </td>
                                        <td>BATCH-2023-128</td>
                                        <td>
                                            <div class="stock-level">
                                                <span class="text-danger">2</span>
                                                <div class="progress" style="height: 6px; width: 100px;">
                                                    <div class="progress-bar bg-danger" style="width: 5%"></div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>25</td>
                                        <td>HealthSupplies Inc.</td>
                                        <td>10 Jan 2024</td>
                                        <td>
                                            <span class="text-danger">-15 days</span>
                                        </td>
                                        <td>
                                            <span class="badge bg-danger">Expired</span>
                                        </td>
                                        <td>
                                            <div class="btn-group btn-group-sm">
                                                <button class="btn btn-outline-primary">
                                                    <i class="fas fa-box"></i>
                                                </button>
                                                <button class="btn btn-outline-warning">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button class="btn btn-outline-danger" title="Dispose">
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

        <!-- Expiring Soon Section -->
        <div class="row mt-4" id="expiring-section">
            <div class="col-12">
                <div class="card-medical">
                    <div class="card-medical-header d-flex justify-content-between align-items-center">
                        <h6 class="mb-0 text-danger">
                            <i class="fas fa-exclamation-triangle me-2"></i>
                            Medicines Expiring Soon (Next 30 Days)
                        </h6>
                        <span class="badge bg-danger">15 Items</span>
                    </div>
                    <div class="card-medical-body">
                        <div class="table-responsive">
                            <table class="table table-medical table-sm">
                                <thead>
                                    <tr>
                                        <th>Medicine</th>
                                        <th>Batch No.</th>
                                        <th>Current Stock</th>
                                        <th>Expiry Date</th>
                                        <th>Days Left</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="table-warning">
                                        <td>Cetirizine 10mg</td>
                                        <td>BATCH-2023-045</td>
                                        <td>45</td>
                                        <td>15 Jan 2024</td>
                                        <td><span class="text-warning">5 days</span></td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-warning">Move to Front</button>
                                        </td>
                                    </tr>
                                    <tr class="table-warning">
                                        <td>Metformin 500mg</td>
                                        <td>BATCH-2023-067</td>
                                        <td>120</td>
                                        <td>20 Jan 2024</td>
                                        <td><span class="text-warning">10 days</span></td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-warning">Move to Front</button>
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
