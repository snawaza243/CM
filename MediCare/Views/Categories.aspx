<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Categories.aspx.cs" Inherits="MediCare.Views.Categories" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <section>
       <div class="row">
    <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4>Categories Management</h4>
            <div class="btn-group ">
                <button type="button" class="btn btn-medical btn-medical-primary"
                    onclick="window.location.href='/Views/CategoriesDetails.aspx'">
                    <i class="fas fa-plus me-2"></i>Add Category
                </button>
                <button class="btn btn-outline-secondary">
                    <i class="fas fa-download me-2"></i>Export
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Categories Summary -->
<div class="row mb-4">
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card-medical">
            <div class="card-medical-body text-center">
                <h3 class="text-primary mb-1">24</h3>
                <small class="text-muted">Total Categories</small>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card-medical">
            <div class="card-medical-body text-center">
                <h3 class="text-success mb-1">18</h3>
                <small class="text-muted">Active Categories</small>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card-medical">
            <div class="card-medical-body text-center">
                <h3 class="text-warning mb-1">4</h3>
                <small class="text-muted">Categories with Low Stock</small>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6 mb-4">
        <div class="card-medical">
            <div class="card-medical-body text-center">
                <h3 class="text-info mb-1">156</h3>
                <small class="text-muted">Total Medicines</small>
            </div>
        </div>
    </div>
</div>

<!-- Categories Grid -->
<div class="row">
    <div class="col-12">
        <div class="card-medical">
            <div class="card-medical-header d-flex justify-content-between align-items-center">
                <h6 class="mb-0">Medicine Categories</h6>
                <div class="text-muted">
                    <span class="badge bg-primary">24 Categories</span>
                </div>
            </div>
            <div class="card-medical-body">
                <div class="row">
                    <!-- Category Card -->
                    <div class="col-xl-3 col-lg-4 col-md-6 mb-4">
                        <div class="card-medical category-card h-100">
                            <div class="card-medical-body">
                                <div class="d-flex justify-content-between align-items-start mb-3">
                                    <div class="category-icon">
                                        <i class="fas fa-prescription-bottle fa-2x text-primary"></i>
                                    </div>
                                    <div class="dropdown">
                                        <button class="btn btn-sm btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown">
                                            <i class="fas fa-ellipsis-v"></i>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#"><i class="fas fa-edit me-2"></i>Edit</a></li>
                                            <li><a class="dropdown-item" href="#"><i class="fas fa-eye me-2"></i>View Medicines</a></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item text-danger" href="#"><i class="fas fa-trash me-2"></i>Delete</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <h5 class="category-title">Antibiotics</h5>
                                <p class="text-muted small mb-3">Medicines that inhibit or kill bacteria</p>
                                <div class="category-stats">
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <span class="text-muted">Medicines:</span>
                                        <span class="fw-bold text-primary">24</span>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <span class="text-muted">In Stock:</span>
                                        <span class="fw-bold text-success">18</span>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="text-muted">Low Stock:</span>
                                        <span class="fw-bold text-warning">2</span>
                                    </div>
                                </div>
                                <div class="mt-3">
                                    <span class="badge bg-success">Active</span>
                                    <span class="badge bg-secondary ms-1">Prescription</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-lg-4 col-md-6 mb-4">
                        <div class="card-medical category-card h-100">
                            <div class="card-medical-body">
                                <div class="d-flex justify-content-between align-items-start mb-3">
                                    <div class="category-icon">
                                        <i class="fas fa-pain-relief fa-2x text-warning"></i>
                                    </div>
                                    <div class="dropdown">
                                        <button class="btn btn-sm btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown">
                                            <i class="fas fa-ellipsis-v"></i>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#"><i class="fas fa-edit me-2"></i>Edit</a></li>
                                            <li><a class="dropdown-item" href="#"><i class="fas fa-eye me-2"></i>View Medicines</a></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item text-danger" href="#"><i class="fas fa-trash me-2"></i>Delete</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <h5 class="category-title">Analgesics</h5>
                                <p class="text-muted small mb-3">Pain relief medications</p>
                                <div class="category-stats">
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <span class="text-muted">Medicines:</span>
                                        <span class="fw-bold text-primary">18</span>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <span class="text-muted">In Stock:</span>
                                        <span class="fw-bold text-success">15</span>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="text-muted">Low Stock:</span>
                                        <span class="fw-bold text-warning">3</span>
                                    </div>
                                </div>
                                <div class="mt-3">
                                    <span class="badge bg-success">Active</span>
                                    <span class="badge bg-info ms-1">OTC</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-lg-4 col-md-6 mb-4">
                        <div class="card-medical category-card h-100">
                            <div class="card-medical-body">
                                <div class="d-flex justify-content-between align-items-start mb-3">
                                    <div class="category-icon">
                                        <i class="fas fa-allergies fa-2x text-danger"></i>
                                    </div>
                                    <div class="dropdown">
                                        <button class="btn btn-sm btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown">
                                            <i class="fas fa-ellipsis-v"></i>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#"><i class="fas fa-edit me-2"></i>Edit</a></li>
                                            <li><a class="dropdown-item" href="#"><i class="fas fa-eye me-2"></i>View Medicines</a></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item text-danger" href="#"><i class="fas fa-trash me-2"></i>Delete</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <h5 class="category-title">Antihistamines</h5>
                                <p class="text-muted small mb-3">Allergy and cold medications</p>
                                <div class="category-stats">
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <span class="text-muted">Medicines:</span>
                                        <span class="fw-bold text-primary">12</span>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <span class="text-muted">In Stock:</span>
                                        <span class="fw-bold text-success">8</span>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="text-muted">Low Stock:</span>
                                        <span class="fw-bold text-warning">4</span>
                                    </div>
                                </div>
                                <div class="mt-3">
                                    <span class="badge bg-success">Active</span>
                                    <span class="badge bg-info ms-1">OTC</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-3 col-lg-4 col-md-6 mb-4">
                        <div class="card-medical category-card h-100">
                            <div class="card-medical-body">
                                <div class="d-flex justify-content-between align-items-start mb-3">
                                    <div class="category-icon">
                                        <i class="fas fa-heartbeat fa-2x text-success"></i>
                                    </div>
                                    <div class="dropdown">
                                        <button class="btn btn-sm btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown">
                                            <i class="fas fa-ellipsis-v"></i>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#"><i class="fas fa-edit me-2"></i>Edit</a></li>
                                            <li><a class="dropdown-item" href="#"><i class="fas fa-eye me-2"></i>View Medicines</a></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item text-danger" href="#"><i class="fas fa-trash me-2"></i>Delete</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <h5 class="category-title">Cardiovascular</h5>
                                <p class="text-muted small mb-3">Heart and blood pressure medications</p>
                                <div class="category-stats">
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <span class="text-muted">Medicines:</span>
                                        <span class="fw-bold text-primary">15</span>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <span class="text-muted">In Stock:</span>
                                        <span class="fw-bold text-success">12</span>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="text-muted">Low Stock:</span>
                                        <span class="fw-bold text-warning">1</span>
                                    </div>
                                </div>
                                <div class="mt-3">
                                    <span class="badge bg-success">Active</span>
                                    <span class="badge bg-secondary ms-1">Prescription</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Category Hierarchy -->
<div class="row mt-4">
    <div class="col-12">
        <div class="card-medical">
            <div class="card-medical-header">
                <h6 class="mb-0">Category Hierarchy</h6>
            </div>
            <div class="card-medical-body">
                <div class="category-tree">
                    <ul class="list-unstyled">
                        <li class="mb-2">
                            <div class="d-flex align-items-center p-2 bg-light rounded">
                                <i class="fas fa-folder text-warning me-2"></i>
                                <strong>All Medicines</strong>
                                <span class="badge bg-primary ms-2">156 items</span>
                            </div>
                            <ul class="list-unstyled ms-4 mt-2">
                                <li class="mb-2">
                                    <div class="d-flex align-items-center p-2">
                                        <i class="fas fa-folder text-info me-2"></i>
                                        <span>Prescription Medicines</span>
                                        <span class="badge bg-secondary ms-2">89 items</span>
                                    </div>
                                    <ul class="list-unstyled ms-4">
                                        <li class="mb-1">
                                            <div class="d-flex align-items-center p-1">
                                                <i class="fas fa-tag text-muted me-2"></i>
                                                <span>Antibiotics</span>
                                                <span class="badge bg-primary ms-2">24 items</span>
                                            </div>
                                        </li>
                                        <li class="mb-1">
                                            <div class="d-flex align-items-center p-1">
                                                <i class="fas fa-tag text-muted me-2"></i>
                                                <span>Cardiovascular</span>
                                                <span class="badge bg-primary ms-2">15 items</span>
                                            </div>
                                        </li>
                                    </ul>
                                </li>
                                <li class="mb-2">
                                    <div class="d-flex align-items-center p-2">
                                        <i class="fas fa-folder text-success me-2"></i>
                                        <span>Over-the-Counter</span>
                                        <span class="badge bg-success ms-2">67 items</span>
                                    </div>
                                    <ul class="list-unstyled ms-4">
                                        <li class="mb-1">
                                            <div class="d-flex align-items-center p-1">
                                                <i class="fas fa-tag text-muted me-2"></i>
                                                <span>Analgesics</span>
                                                <span class="badge bg-primary ms-2">18 items</span>
                                            </div>
                                        </li>
                                        <li class="mb-1">
                                            <div class="d-flex align-items-center p-1">
                                                <i class="fas fa-tag text-muted me-2"></i>
                                                <span>Antihistamines</span>
                                                <span class="badge bg-primary ms-2">12 items</span>
                                            </div>
                                        </li>
                                    </ul>
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
</asp:Content>