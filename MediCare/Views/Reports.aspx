<%@ Page Title="Reports & Analytics" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="MediCare.Views.Reports" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <section>
       <div class="row">
    <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4>Reports & Analytics</h4>
            <div class="btn-group">
                <button class="btn btn-medical btn-medical-primary">
                    <i class="fas fa-download me-2"></i>Export Report
                </button>
                <button class="btn btn-outline-secondary">
                    <i class="fas fa-print me-2"></i>Print
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Report Period Selector -->
<div class="row mb-4">
    <div class="col-12">
        <div class="card-medical">
            <div class="card-medical-body">
                <div class="row align-items-center">
                    <div class="col-md-8">
                        <div class="btn-group" role="group">
                            <input type="radio" class="btn-check" name="reportPeriod" id="periodToday" checked>
                            <label class="btn btn-outline-primary" for="periodToday">Today</label>
                            
                            <input type="radio" class="btn-check" name="reportPeriod" id="periodWeek">
                            <label class="btn btn-outline-primary" for="periodWeek">This Week</label>
                            
                            <input type="radio" class="btn-check" name="reportPeriod" id="periodMonth">
                            <label class="btn btn-outline-primary" for="periodMonth">This Month</label>
                            
                            <input type="radio" class="btn-check" name="reportPeriod" id="periodQuarter">
                            <label class="btn btn-outline-primary" for="periodQuarter">This Quarter</label>
                            
                            <input type="radio" class="btn-check" name="reportPeriod" id="periodYear">
                            <label class="btn btn-outline-primary" for="periodYear">This Year</label>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="input-group">
                            <input type="date" class="form-control" value="2024-01-01">
                            <span class="input-group-text">to</span>
                            <input type="date" class="form-control" value="2024-01-10">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Key Metrics -->
<div class="row mb-4">
    <div class="col-xl-2 col-md-4 col-6 mb-3">
        <div class="card-medical text-center">
            <div class="card-medical-body">
                <h3 class="text-primary mb-1">₹1.2L</h3>
                <small class="text-muted">Total Revenue</small>
                <div class="text-success small">
                    <i class="fas fa-arrow-up me-1"></i>12.5%
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-2 col-md-4 col-6 mb-3">
        <div class="card-medical text-center">
            <div class="card-medical-body">
                <h3 class="text-success mb-1">156</h3>
                <small class="text-muted">Total Orders</small>
                <div class="text-success small">
                    <i class="fas fa-arrow-up me-1"></i>8.3%
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-2 col-md-4 col-6 mb-3">
        <div class="card-medical text-center">
            <div class="card-medical-body">
                <h3 class="text-info mb-1">124</h3>
                <small class="text-muted">Prescription Orders</small>
                <div class="text-success small">
                    <i class="fas fa-arrow-up me-1"></i>15.2%
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-2 col-md-4 col-6 mb-3">
        <div class="card-medical text-center">
            <div class="card-medical-body">
                <h3 class="text-warning mb-1">32</h3>
                <small class="text-muted">OTC Orders</small>
                <div class="text-danger small">
                    <i class="fas fa-arrow-down me-1"></i>5.7%
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-2 col-md-4 col-6 mb-3">
        <div class="card-medical text-center">
            <div class="card-medical-body">
                <h3 class="text-danger mb-1">4</h3>
                <small class="text-muted">Cancelled Orders</small>
                <div class="text-success small">
                    <i class="fas fa-arrow-down me-1"></i>2.1%
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-2 col-md-4 col-6 mb-3">
        <div class="card-medical text-center">
            <div class="card-medical-body">
                <h3 class="text-secondary mb-1">₹845</h3>
                <small class="text-muted">Average Order</small>
                <div class="text-success small">
                    <i class="fas fa-arrow-up me-1"></i>3.8%
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Charts Section -->
<div class="row">
    <div class="col-lg-8 mb-4">
        <div class="card-medical">
            <div class="card-medical-header">
                <h6 class="mb-0">Revenue Overview</h6>
            </div>
            <div class="card-medical-body">
                <div class="chart-container" style="height: 300px;">
                    <div class="d-flex align-items-center justify-content-center h-100 text-muted">
                        <div class="text-center">
                            <i class="fas fa-chart-line fa-3x mb-3"></i>
                            <p>Revenue chart visualization</p>
                            <small>Showing daily revenue for January 2024</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4 mb-4">
        <div class="card-medical">
            <div class="card-medical-header">
                <h6 class="mb-0">Order Types</h6>
            </div>
            <div class="card-medical-body">
                <div class="chart-container" style="height: 300px;">
                    <div class="d-flex align-items-center justify-content-center h-100 text-muted">
                        <div class="text-center">
                            <i class="fas fa-chart-pie fa-3x mb-3"></i>
                            <p>Order type distribution</p>
                        </div>
                    </div>
                </div>
                <div class="mt-3">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                        <span>Prescription Orders</span>
                        <span class="fw-bold">79.5%</span>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <span>OTC Orders</span>
                        <span class="fw-bold">20.5%</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Detailed Reports -->
<div class="row">
    <div class="col-md-6 mb-4">
        <div class="card-medical">
            <div class="card-medical-header">
                <h6 class="mb-0">Top Selling Medicines</h6>
            </div>
            <div class="card-medical-body">
                <div class="list-group list-group-flush">
                    <div class="list-group-item d-flex justify-content-between align-items-center">
                        <div>
                            <h6 class="mb-1">Paracetamol 500mg</h6>
                            <small class="text-muted">Analgesic</small>
                        </div>
                        <div class="text-end">
                            <strong>145 units</strong>
                            <div class="text-success">₹3,625</div>
                        </div>
                    </div>
                    <div class="list-group-item d-flex justify-content-between align-items-center">
                        <div>
                            <h6 class="mb-1">Amoxicillin 250mg</h6>
                            <small class="text-muted">Antibiotic</small>
                        </div>
                        <div class="text-end">
                            <strong>89 units</strong>
                            <div class="text-success">₹16,020</div>
                        </div>
                    </div>
                    <div class="list-group-item d-flex justify-content-between align-items-center">
                        <div>
                            <h6 class="mb-1">Vitamin C 500mg</h6>
                            <small class="text-muted">Vitamin</small>
                        </div>
                        <div class="text-end">
                            <strong>67 units</strong>
                            <div class="text-success">₹3,015</div>
                        </div>
                    </div>
                    <div class="list-group-item d-flex justify-content-between align-items-center">
                        <div>
                            <h6 class="mb-1">Cetirizine 10mg</h6>
                            <small class="text-muted">Antihistamine</small>
                        </div>
                        <div class="text-end">
                            <strong>54 units</strong>
                            <div class="text-success">₹1,890</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="col-md-6 mb-4">
        <div class="card-medical">
            <div class="card-medical-header">
                <h6 class="mb-0">Inventory Alerts</h6>
            </div>
            <div class="card-medical-body">
                <div class="list-group list-group-flush">
                    <div class="list-group-item">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <h6 class="mb-1 text-warning">Low Stock</h6>
                                <small>12 medicines below minimum stock level</small>
                            </div>
                            <span class="badge bg-warning">12</span>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <h6 class="mb-1 text-danger">Expiring Soon</h6>
                                <small>15 medicines expiring in 30 days</small>
                            </div>
                            <span class="badge bg-danger">15</span>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <h6 class="mb-1 text-secondary">Out of Stock</h6>
                                <small>8 medicines currently out of stock</small>
                            </div>
                            <span class="badge bg-secondary">8</span>
                        </div>
                    </div>
                    <div class="list-group-item">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <h6 class="mb-1 text-info">Prescription Pending</h6>
                                <small>8 prescriptions awaiting verification</small>
                            </div>
                            <span class="badge bg-info">8</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Report Types -->
<div class="row">
    <div class="col-12">
        <div class="card-medical">
            <div class="card-medical-header">
                <h6 class="mb-0">Quick Reports</h6>
            </div>
            <div class="card-medical-body">
                <div class="row">
                    <div class="col-md-3 col-6 mb-3">
                        <a href="#" class="btn btn-outline-primary w-100 text-start">
                            <i class="fas fa-shopping-cart me-2"></i>
                            Sales Report
                        </a>
                    </div>
                    <div class="col-md-3 col-6 mb-3">
                        <a href="#" class="btn btn-outline-success w-100 text-start">
                            <i class="fas fa-pills me-2"></i>
                            Inventory Report
                        </a>
                    </div>
                    <div class="col-md-3 col-6 mb-3">
                        <a href="#" class="btn btn-outline-info w-100 text-start">
                            <i class="fas fa-users me-2"></i>
                            Customer Report
                        </a>
                    </div>
                    <div class="col-md-3 col-6 mb-3">
                        <a href="#" class="btn btn-outline-warning w-100 text-start">
                            <i class="fas fa-truck me-2"></i>
                            Supplier Report
                        </a>
                    </div>
                    <div class="col-md-3 col-6 mb-3">
                        <a href="#" class="btn btn-outline-danger w-100 text-start">
                            <i class="fas fa-file-prescription me-2"></i>
                            Prescription Report
                        </a>
                    </div>
                    <div class="col-md-3 col-6 mb-3">
                        <a href="#" class="btn btn-outline-secondary w-100 text-start">
                            <i class="fas fa-chart-bar me-2"></i>
                            Performance Report
                        </a>
                    </div>
                    <div class="col-md-3 col-6 mb-3">
                        <a href="#" class="btn btn-outline-dark w-100 text-start">
                            <i class="fas fa-money-bill-wave me-2"></i>
                            Revenue Report
                        </a>
                    </div>
                    <div class="col-md-3 col-6 mb-3">
                        <a href="#" class="btn btn-outline-primary w-100 text-start">
                            <i class="fas fa-calendar me-2"></i>
                            Monthly Summary
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
   </section>
</asp:Content>