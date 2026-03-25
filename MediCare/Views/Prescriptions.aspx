<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Prescriptions.aspx.cs" Inherits="MediCare.Views.Prescriptions" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section>
        <div class="row">
            <div class="col-12">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h4>Prescription Verification</h4>
                    <div class="text-muted">
                        <span class="badge bg-warning fs-6">8 Pending Verification</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Verification Stats -->
        <div class="row mb-4">
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card-medical">
                    <div class="card-medical-body">
                        <div class="d-flex align-items-center">
                            <div class="flex-grow-1">
                                <h6 class="text-medical-secondary mb-2">Pending Verification</h6>
                                <h3 class="mb-0 text-warning">8</h3>
                            </div>
                            <div class="flex-shrink-0">
                                <i class="fas fa-clock fa-2x text-warning"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card-medical">
                    <div class="card-medical-body">
                        <div class="d-flex align-items-center">
                            <div class="flex-grow-1">
                                <h6 class="text-medical-secondary mb-2">Verified Today</h6>
                                <h3 class="mb-0 text-success">12</h3>
                            </div>
                            <div class="flex-shrink-0">
                                <i class="fas fa-check-circle fa-2x text-success"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card-medical">
                    <div class="card-medical-body">
                        <div class="d-flex align-items-center">
                            <div class="flex-grow-1">
                                <h6 class="text-medical-secondary mb-2">Rejected Today</h6>
                                <h3 class="mb-0 text-danger">2</h3>
                            </div>
                            <div class="flex-shrink-0">
                                <i class="fas fa-times-circle fa-2x text-danger"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card-medical">
                    <div class="card-medical-body">
                        <div class="d-flex align-items-center">
                            <div class="flex-grow-1">
                                <h6 class="text-medical-secondary mb-2">Avg. Response Time</h6>
                                <h3 class="mb-0 text-info">25m</h3>
                            </div>
                            <div class="flex-shrink-0">
                                <i class="fas fa-stopwatch fa-2x text-info"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Prescription Queue -->
        <div class="row">
            <div class="col-12">
                <div class="card-medical">
                    <div class="card-medical-header d-flex justify-content-between align-items-center">
                        <h6 class="mb-0">Pending Verifications</h6>
                        <div class="btn-group btn-group-sm">
                            <button class="btn btn-outline-secondary active">All</button>
                            <button class="btn btn-outline-secondary">Urgent</button>
                            <button class="btn btn-outline-secondary">Regular</button>
                        </div>
                    </div>
                    <div class="card-medical-body">
                        <div class="row">
                            <!-- Prescription Card 1 -->
                            <div class="col-md-6 col-lg-4 mb-4">
                                <div class="card-medical h-100 prescription-card">
                                    <div class="card-medical-body">
                                        <div class="d-flex justify-content-between align-items-start mb-3">
                                            <div>
                                                <h6 class="mb-1">Order #MED-1247</h6>
                                                <small class="text-muted">Dr. Rajesh Sharma</small>
                                            </div>
                                            <span class="badge bg-warning">Pending</span>
                                        </div>

                                        <div class="customer-info mb-3">
                                            <div class="d-flex align-items-center mb-2">
                                                <i class="fas fa-user me-2 text-muted"></i>
                                                <small>Patient: Amit Kumar</small>
                                            </div>
                                            <div class="d-flex align-items-center mb-2">
                                                <i class="fas fa-phone me-2 text-muted"></i>
                                                <small>+91 98765 43210</small>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <i class="fas fa-clock me-2 text-muted"></i>
                                                <small>Submitted: 10:30 AM</small>
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <strong>Medicines Requested:</strong>
                                            <ul class="small mt-1 mb-2">
                                                <li>Amoxicillin 250mg - 1 Strip</li>
                                                <li>Paracetamol 500mg - 2 Strips</li>
                                                <li>Vitamin C 500mg - 1 Bottle</li>
                                            </ul>
                                        </div>

                                        <div class="prescription-image mb-3">
                                            <img src="https://via.placeholder.com/250x150/e2e8f0/64748b?text=Prescription+Image"
                                                alt="Prescription"
                                                class="img-fluid rounded border"
                                                style="cursor: pointer"
                                                data-bs-toggle="modal"
                                                data-bs-target="#prescriptionModal"
                                                data-prescription-id="1247">
                                            <div class="text-center mt-1">
                                                <small class="text-muted">Click to enlarge</small>
                                            </div>
                                        </div>

                                        <div class="d-grid gap-2">
                                            <button class="btn btn-success btn-sm verify-btn" data-action="approve" data-order="1247">
                                                <i class="fas fa-check me-1"></i>Approve & Process
                                            </button>
                                            <button class="btn btn-danger btn-sm verify-btn" data-action="reject" data-order="1247">
                                                <i class="fas fa-times me-1"></i>Reject Prescription
                                            </button>
                                            <button class="btn btn-outline-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#contactModal">
                                                <i class="fas fa-phone me-1"></i>Contact Patient
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Prescription Card 2 -->
                            <div class="col-md-6 col-lg-4 mb-4">
                                <div class="card-medical h-100 prescription-card">
                                    <div class="card-medical-body">
                                        <div class="d-flex justify-content-between align-items-start mb-3">
                                            <div>
                                                <h6 class="mb-1">Order #MED-1248</h6>
                                                <small class="text-muted">Dr. Priya Singh</small>
                                            </div>
                                            <span class="badge bg-danger">Urgent</span>
                                        </div>

                                        <div class="customer-info mb-3">
                                            <div class="d-flex align-items-center mb-2">
                                                <i class="fas fa-user me-2 text-muted"></i>
                                                <small>Patient: Sunita Patel</small>
                                            </div>
                                            <div class="d-flex align-items-center mb-2">
                                                <i class="fas fa-phone me-2 text-muted"></i>
                                                <small>+91 87654 32109</small>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <i class="fas fa-clock me-2 text-muted"></i>
                                                <small>Submitted: 09:15 AM</small>
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <strong>Medicines Requested:</strong>
                                            <ul class="small mt-1 mb-2">
                                                <li>Insulin Glargine - 1 Vial</li>
                                                <li>Metformin 500mg - 3 Strips</li>
                                            </ul>
                                        </div>

                                        <div class="prescription-image mb-3">
                                            <img src="https://via.placeholder.com/250x150/e2e8f0/64748b?text=Urgent+Prescription"
                                                alt="Prescription"
                                                class="img-fluid rounded border"
                                                style="cursor: pointer"
                                                data-bs-toggle="modal"
                                                data-bs-target="#prescriptionModal"
                                                data-prescription-id="1248">
                                            <div class="text-center mt-1">
                                                <small class="text-muted">Click to enlarge</small>
                                            </div>
                                        </div>

                                        <div class="d-grid gap-2">
                                            <button class="btn btn-success btn-sm verify-btn" data-action="approve" data-order="1248">
                                                <i class="fas fa-check me-1"></i>Approve & Process
                                            </button>
                                            <button class="btn btn-danger btn-sm verify-btn" data-action="reject" data-order="1248">
                                                <i class="fas fa-times me-1"></i>Reject Prescription
                                            </button>
                                            <button class="btn btn-outline-secondary btn-sm">
                                                <i class="fas fa-phone me-1"></i>Contact Patient
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Prescription Card 3 -->
                            <div class="col-md-6 col-lg-4 mb-4">
                                <div class="card-medical h-100 prescription-card">
                                    <div class="card-medical-body">
                                        <div class="d-flex justify-content-between align-items-start mb-3">
                                            <div>
                                                <h6 class="mb-1">Order #MED-1249</h6>
                                                <small class="text-muted">Dr. Anil Verma</small>
                                            </div>
                                            <span class="badge bg-warning">Pending</span>
                                        </div>

                                        <div class="customer-info mb-3">
                                            <div class="d-flex align-items-center mb-2">
                                                <i class="fas fa-user me-2 text-muted"></i>
                                                <small>Patient: Rohan Mehta</small>
                                            </div>
                                            <div class="d-flex align-items-center mb-2">
                                                <i class="fas fa-phone me-2 text-muted"></i>
                                                <small>+91 76543 21098</small>
                                            </div>
                                            <div class="d-flex align-items-center">
                                                <i class="fas fa-clock me-2 text-muted"></i>
                                                <small>Submitted: Yesterday</small>
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <strong>Medicines Requested:</strong>
                                            <ul class="small mt-1 mb-2">
                                                <li>Azithromycin 250mg - 1 Strip</li>
                                                <li>Cetirizine 10mg - 1 Strip</li>
                                            </ul>
                                        </div>

                                        <div class="prescription-image mb-3">
                                            <img src="https://via.placeholder.com/250x150/e2e8f0/64748b?text=Prescription+Image"
                                                alt="Prescription"
                                                class="img-fluid rounded border"
                                                style="cursor: pointer"
                                                data-bs-toggle="modal"
                                                data-bs-target="#prescriptionModal"
                                                data-prescription-id="1249">
                                            <div class="text-center mt-1">
                                                <small class="text-muted">Click to enlarge</small>
                                            </div>
                                        </div>

                                        <div class="d-grid gap-2">
                                            <button class="btn btn-success btn-sm verify-btn" data-action="approve" data-order="1249">
                                                <i class="fas fa-check me-1"></i>Approve & Process
                                            </button>
                                            <button class="btn btn-danger btn-sm verify-btn" data-action="reject" data-order="1249">
                                                <i class="fas fa-times me-1"></i>Reject Prescription
                                            </button>
                                            <button class="btn btn-outline-secondary btn-sm">
                                                <i class="fas fa-phone me-1"></i>Contact Patient
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

        <!-- Recent Verifications -->
        <div class="row mt-4">
            <div class="col-12">
                <div class="card-medical">
                    <div class="card-medical-header">
                        <h6 class="mb-0">Recently Verified Prescriptions</h6>
                    </div>
                    <div class="card-medical-body">
                        <div class="table-responsive">
                            <table class="table table-medical table-sm">
                                <thead>
                                    <tr>
                                        <th>Order ID</th>
                                        <th>Patient Name</th>
                                        <th>Doctor</th>
                                        <th>Medicines</th>
                                        <th>Status</th>
                                        <th>Verified By</th>
                                        <th>Time</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>#MED-1246</td>
                                        <td>Neha Gupta</td>
                                        <td>Dr. S. Kapoor</td>
                                        <td>2 Medicines</td>
                                        <td><span class="badge bg-success">Approved</span></td>
                                        <td>Dr. Sarah Johnson</td>
                                        <td>25 minutes ago</td>
                                    </tr>
                                    <tr>
                                        <td>#MED-1245</td>
                                        <td>Rahul Desai</td>
                                        <td>Dr. M. Patil</td>
                                        <td>3 Medicines</td>
                                        <td><span class="badge bg-success">Approved</span></td>
                                        <td>Dr. Sarah Johnson</td>
                                        <td>1 hour ago</td>
                                    </tr>
                                    <tr>
                                        <td>#MED-1244</td>
                                        <td>Anita Joshi</td>
                                        <td>Dr. R. Malhotra</td>
                                        <td>1 Medicine</td>
                                        <td><span class="badge bg-danger">Rejected</span></td>
                                        <td>Dr. Sarah Johnson</td>
                                        <td>2 hours ago</td>
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
