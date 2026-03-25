<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Orders.aspx.cs" Inherits="MediCare.Views.Orders" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section>
        <div class="row">
            <div class="col-12">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h4>Order Management</h4>
                    <div class="btn-group">
                        <button type="button" class="btn btn-medical btn-medical-primary"
                    onclick="window.location.href='/Views/OrderDetails.aspx'">
                    <i class="fas fa-plus me-2"></i>View Order
                </button>
                        <button class="btn btn-outline-secondary">
                            <i class="fas fa-download me-2"></i>Export Orders
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Order Stats -->
        <div class="row mb-4">
            <div class="col-xl-2 col-md-4 col-6 mb-3">
                <div class="card-medical">
                    <div class="card-medical-body text-center">
                        <h3 class="text-primary mb-1">24</h3>
                        <small class="text-muted">Today's Orders</small>
                    </div>
                </div>
            </div>
            <div class="col-xl-2 col-md-4 col-6 mb-3">
                <div class="card-medical">
                    <div class="card-medical-body text-center">
                        <h3 class="text-warning mb-1">8</h3>
                        <small class="text-muted">Pending Verification</small>
                    </div>
                </div>
            </div>
            <div class="col-xl-2 col-md-4 col-6 mb-3">
                <div class="card-medical">
                    <div class="card-medical-body text-center">
                        <h3 class="text-info mb-1">12</h3>
                        <small class="text-muted">Processing</small>
                    </div>
                </div>
            </div>
            <div class="col-xl-2 col-md-4 col-6 mb-3">
                <div class="card-medical">
                    <div class="card-medical-body text-center">
                        <h3 class="text-success mb-1">18</h3>
                        <small class="text-muted">Shipped</small>
                    </div>
                </div>
            </div>
            <div class="col-xl-2 col-md-4 col-6 mb-3">
                <div class="card-medical">
                    <div class="card-medical-body text-center">
                        <h3 class="text-secondary mb-1">4</h3>
                        <small class="text-muted">Delivered Today</small>
                    </div>
                </div>
            </div>
            <div class="col-xl-2 col-md-4 col-6 mb-3">
                <div class="card-medical">
                    <div class="card-medical-body text-center">
                        <h3 class="text-danger mb-1">2</h3>
                        <small class="text-muted">Cancelled</small>
                    </div>
                </div>
            </div>
        </div>

        <!-- Order Filters -->
        <div class="row mb-4">
            <div class="col-12">
                <div class="card-medical">
                    <div class="card-medical-body">
                        <div class="row g-2">
                            <div class="col-md-2">
                                <label class="form-label">Order Status</label>
                                <select class="form-select">
                                    <option value="">All Status</option>
                                    <option value="pending">Pending Verification</option>
                                    <option value="verified">Verified</option>
                                    <option value="processing">Processing</option>
                                    <option value="shipped">Shipped</option>
                                    <option value="delivered">Delivered</option>
                                    <option value="cancelled">Cancelled</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <label class="form-label">Order Type</label>
                                <select class="form-select">
                                    <option value="">All Types</option>
                                    <option value="prescription">Prescription</option>
                                    <option value="otc">Over-the-counter</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <label class="form-label">Date Range</label>
                                <select class="form-select">
                                    <option value="">All Time</option>
                                    <option value="today">Today</option>
                                    <option value="week">This Week</option>
                                    <option value="month">This Month</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <label class="form-label">Search</label>
                                <input type="text" class="form-control" placeholder="Order ID or Customer...">
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

        <!-- Orders Table -->
        <div class="row">
            <div class="col-12">
                <div class="card-medical">
                    <div class="card-medical-header d-flex justify-content-between align-items-center">
                        <h6 class="mb-0">All Orders</h6>
                        <div class="text-muted">
                            <span class="badge bg-primary">156 Total Orders</span>
                        </div>
                    </div>
                    <div class="card-medical-body">
                        <div class="table-responsive">
                            <table class="table table-medical table-hover">
                                <thead>
                                    <tr>
                                        <th>Order ID</th>
                                        <th>Customer</th>
                                        <th>Type</th>
                                        <th>Medicines</th>
                                        <th>Amount</th>
                                        <th>Order Date</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <strong>#MED-1247</strong>
                                        </td>
                                        <td>
                                            <div>Amit Kumar</div>
                                            <small class="text-muted">+91 98765 43210</small>
                                        </td>
                                        <td>
                                            <span class="badge-medical badge-prescription">Prescription</span>
                                        </td>
                                        <td>
                                            <small>3 items</small>
                                        </td>
                                        <td>₹845.00</td>
                                        <td>10 Jan 2024<br>
                                            <small>10:30 AM</small></td>
                                        <td>
                                            <span class="badge bg-warning">Pending Verification</span>
                                        </td>
                                        <td>
                                            <div class="btn-group btn-group-sm">
                                                <button class="btn btn-outline-primary" title="View Details">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                                <button class="btn btn-outline-success" title="Verify">
                                                    <i class="fas fa-check"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>#MED-1246</strong>
                                        </td>
                                        <td>
                                            <div>Neha Gupta</div>
                                            <small class="text-muted">+91 87654 32109</small>
                                        </td>
                                        <td>
                                            <span class="badge-medical badge-otc">OTC</span>
                                        </td>
                                        <td>
                                            <small>2 items</small>
                                        </td>
                                        <td>₹325.00</td>
                                        <td>10 Jan 2024<br>
                                            <small>09:15 AM</small></td>
                                        <td>
                                            <span class="badge bg-info">Processing</span>
                                        </td>
                                        <td>
                                            <div class="btn-group btn-group-sm">
                                                <button class="btn btn-outline-primary">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                                <button class="btn btn-outline-warning">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>#MED-1245</strong>
                                        </td>
                                        <td>
                                            <div>Rahul Desai</div>
                                            <small class="text-muted">+91 76543 21098</small>
                                        </td>
                                        <td>
                                            <span class="badge-medical badge-prescription">Prescription</span>
                                        </td>
                                        <td>
                                            <small>4 items</small>
                                        </td>
                                        <td>₹1,240.00</td>
                                        <td>09 Jan 2024<br>
                                            <small>03:45 PM</small></td>
                                        <td>
                                            <span class="badge bg-success">Shipped</span>
                                        </td>
                                        <td>
                                            <div class="btn-group btn-group-sm">
                                                <button class="btn btn-outline-primary">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                                <button class="btn btn-outline-info">
                                                    <i class="fas fa-truck"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>#MED-1244</strong>
                                        </td>
                                        <td>
                                            <div>Priya Singh</div>
                                            <small class="text-muted">+91 65432 10987</small>
                                        </td>
                                        <td>
                                            <span class="badge-medical badge-otc">OTC</span>
                                        </td>
                                        <td>
                                            <small>1 item</small>
                                        </td>
                                        <td>₹45.00</td>
                                        <td>09 Jan 2024<br>
                                            <small>11:20 AM</small></td>
                                        <td>
                                            <span class="badge bg-secondary">Delivered</span>
                                        </td>
                                        <td>
                                            <div class="btn-group btn-group-sm">
                                                <button class="btn btn-outline-primary">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                                <button class="btn btn-outline-success">
                                                    <i class="fas fa-redo"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <!-- Pagination -->
                        <nav aria-label="Order pagination" class="mt-3">
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
    </section>
</asp:Content>
