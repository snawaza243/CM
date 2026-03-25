<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="MedicinesDetails.aspx.cs" Inherits="MediCare.Views.MedicinesDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section>
        <div class="row">
            <div class="col-12">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h4>Add New Medicine</h4>
                    <div class="btn-group">
                        <a href="/Views/Medicines.aspx" class="btn btn-outline-secondary">
                            <i class="fas fa-arrow-left me-2"></i>Back to Medicines
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <style>
            /* === Step Progress Container === */
            .steps-progress {
                width: 100%;
                position: relative;
                margin-top: 10px;
                margin-bottom: 10px;
            }

            .steps {
                display: flex;
                justify-content: space-between;
                position: relative;
                padding: 0;
                margin: 0;
            }

                /* === Connector Line Behind Steps === */
                .steps::before {
                    content: "";
                    position: absolute;
                    top: 50%;
                    left: 0;
                    width: 100%;
                    height: 4px;
                    background-color: var(--border-color);
                    transform: translateY(-50%);
                    z-index: 1;
                }

            /* === Step Item === */
            .step {
                text-align: center;
                position: relative;
                z-index: 2;
                flex: 1;
            }

            .step-number {
                width: 40px;
                height: 40px;
                background-color: var(--bg-tertiary);
                border: 2px solid var(--border-color);
                color: var(--text-secondary);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 8px;
                font-weight: 600;
                font-size: 16px;
                transition: all 0.3s ease;
            }

            .step-label {
                font-size: 0.9rem;
                color: var(--text-secondary);
                font-weight: 500;
            }

            /* === Active Step === */
            .step.active .step-number {
                background-color: var(--primary-color);
                border-color: var(--primary-color);
                color: #fff;
                transform: scale(1.1);
            }

            .step.active .step-label {
                color: var(--primary-color);
                font-weight: 600;
            }

            /* === Completed Steps (before active) === */
            .step.completed .step-number {
                background-color: var(--medical-green);
                border-color: var(--medical-green);
                color: #fff;
            }

            .step.completed .step-label {
                color: var(--medical-green);
            }

            /* === Line Fill for Completed Steps === */
            .step.completed::after {
                content: "";
                position: absolute;
                top: 50%;
                left: 50%;
                height: 4px;
                width: 100%;
                background-color: var(--medical-green);
                z-index: 1;
                transform: translateY(-50%);
            }

            /* === Responsive Design === */
            @media (max-width: 768px) {
                .steps {
                    flex-direction: column;
                    align-items: center;
                }

                    .steps::before {
                        width: 4px;
                        height: 100%;
                        left: 20px;
                        top: 0;
                        transform: none;
                    }

                .step {
                    flex: none;
                    text-align: left !important;
                    margin-bottom: 1.5rem;
                    position: relative;
                    padding-left: 50px;
                }

                    .step::after {
                        display: none;
                    }

                .step-number {
                    position: absolute;
                    left: 0;
                    top: 0;
                }
            }
        </style>

        <!-- Progress Steps -->
        <div class="row mb-4">
            <div class="col-12">
                <div class="card-medical">
                    <div class="card-medical-body">
                        <div class="steps-progress">
                            <div class="steps">
                                <div class="step active">
                                    <div class="step-number">1</div>
                                    <div class="step-label">Basic Info</div>
                                </div>
                                <div class="step">
                                    <div class="step-number">2</div>
                                    <div class="step-label">Medical Details</div>
                                </div>
                                <div class="step">
                                    <div class="step-number">3</div>
                                    <div class="step-label">Inventory & Pricing</div>
                                </div>
                                <div class="step">
                                    <div class="step-number">4</div>
                                    <div class="step-label">Review & Submit</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Medicine Form -->
        <div class="row">
            <div class="col-12">
                <div class="card-medical">
                    <div class="card-medical-header">
                        <h6 class="mb-0">Medicine Information</h6>
                    </div>
                    <div class="card-medical-body">
                        <asp:Panel ID="pnlAddMedicineForm" runat="server" CssClass="container">

                            <!-- Basic Information Section -->
                            <div class="form-section">
                                <h6 class="section-title mb-4">
                                    <i class="fas fa-info-circle me-2 text-primary"></i>
                                    Basic Information
                                </h6>
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <asp:Label ID="lblMedicineName" runat="server" Text="Medicine Name" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtMedicineName" runat="server" CssClass="form-control" Placeholder="Enter medicine brand name"></asp:TextBox>
                                        <div class="form-text">e.g., Paracetamol, Amoxicillin, etc.</div>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="lblGenericName" runat="server" Text="Generic Name" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtGenericName" runat="server" CssClass="form-control" Placeholder="Enter generic/salt name"></asp:TextBox>
                                        <div class="form-text">International non-proprietary name</div>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="lblBrandName" runat="server" Text="Brand Name" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtBrandName" runat="server" CssClass="form-control" Placeholder="Enter brand name if applicable"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="lblMedicineType" runat="server" Text="Medicine Type" CssClass="form-label"></asp:Label>
                                        <asp:DropDownList ID="ddlMedicineType" runat="server" CssClass="form-select">
                                            <asp:ListItem Text="Select Type" Value=""></asp:ListItem>
                                            <asp:ListItem Text="Tablet" Value="tablet"></asp:ListItem>
                                            <asp:ListItem Text="Capsule" Value="capsule"></asp:ListItem>
                                            <asp:ListItem Text="Syrup" Value="syrup"></asp:ListItem>
                                            <asp:ListItem Text="Injection" Value="injection"></asp:ListItem>
                                            <asp:ListItem Text="Ointment" Value="ointment"></asp:ListItem>
                                            <asp:ListItem Text="Drops" Value="drops"></asp:ListItem>
                                            <asp:ListItem Text="Inhaler" Value="inhaler"></asp:ListItem>
                                            <asp:ListItem Text="Cream" Value="cream"></asp:ListItem>
                                            <asp:ListItem Text="Gel" Value="gel"></asp:ListItem>
                                            <asp:ListItem Text="Spray" Value="spray"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="lblStrength" runat="server" Text="Strength" CssClass="form-label"></asp:Label>
                                        <div class="input-group">
                                            <asp:TextBox ID="txtStrength" runat="server" CssClass="form-control" Placeholder="e.g., 500"></asp:TextBox>
                                            <asp:DropDownList ID="ddlStrengthUnit" runat="server" CssClass="form-select" Style="max-width: 120px;">
                                                <asp:ListItem Text="mg" Value="mg"></asp:ListItem>
                                                <asp:ListItem Text="g" Value="g"></asp:ListItem>
                                                <asp:ListItem Text="ml" Value="ml"></asp:ListItem>
                                                <asp:ListItem Text="mcg" Value="mcg"></asp:ListItem>
                                                <asp:ListItem Text="IU" Value="IU"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="lblPackageSize" runat="server" Text="Package Size" CssClass="form-label"></asp:Label>
                                        <div class="input-group">
                                            <asp:TextBox ID="txtPackageSize" runat="server" CssClass="form-control" Placeholder="e.g., 10"></asp:TextBox>
                                            <asp:DropDownList ID="ddlPackageUnit" runat="server" CssClass="form-select" Style="max-width: 150px;">
                                                <asp:ListItem Text="Tablets" Value="tablets"></asp:ListItem>
                                                <asp:ListItem Text="Capsules" Value="capsules"></asp:ListItem>
                                                <asp:ListItem Text="Strips" Value="strips"></asp:ListItem>
                                                <asp:ListItem Text="Bottles" Value="bottles"></asp:ListItem>
                                                <asp:ListItem Text="Tubes" Value="tubes"></asp:ListItem>
                                                <asp:ListItem Text="Vials" Value="vials"></asp:ListItem>
                                                <asp:ListItem Text="Ampoules" Value="ampoules"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <hr class="my-4">

                            <!-- Medical Details Section -->
                            <div class="form-section">
                                <h6 class="section-title mb-4">
                                    <i class="fas fa-stethoscope me-2 text-primary"></i>
                                    Medical Details
                                </h6>
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <asp:Label ID="lblCategory" runat="server" Text="Category" CssClass="form-label"></asp:Label>
                                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select">
                                            <asp:ListItem Text="Select Category" Value=""></asp:ListItem>
                                            <asp:ListItem Text="Analgesic" Value="analgesic"></asp:ListItem>
                                            <asp:ListItem Text="Antibiotic" Value="antibiotic"></asp:ListItem>
                                            <asp:ListItem Text="Antihistamine" Value="antihistamine"></asp:ListItem>
                                            <asp:ListItem Text="Antiviral" Value="antiviral"></asp:ListItem>
                                            <asp:ListItem Text="Cardiovascular" Value="cardiovascular"></asp:ListItem>
                                            <asp:ListItem Text="Diabetes" Value="diabetes"></asp:ListItem>
                                            <asp:ListItem Text="Gastrointestinal" Value="gastrointestinal"></asp:ListItem>
                                            <asp:ListItem Text="Respiratory" Value="respiratory"></asp:ListItem>
                                            <asp:ListItem Text="Vitamin & Supplement" Value="vitamin"></asp:ListItem>
                                            <asp:ListItem Text="Topical" Value="topical"></asp:ListItem>
                                            <asp:ListItem Text="Other" Value="other"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="lblPrescription" runat="server" Text="Prescription Required" CssClass="form-label"></asp:Label>
                                        <asp:DropDownList ID="ddlPrescriptionRequired" runat="server" CssClass="form-select">
                                            <asp:ListItem Text="Yes - Prescription Medicine" Value="yes"></asp:ListItem>
                                            <asp:ListItem Text="No - Over the Counter (OTC)" Value="no"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-12">
                                        <asp:Label ID="lblUses" runat="server" Text="Uses/Indications" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtUses" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" Placeholder="What conditions does this medicine treat?"></asp:TextBox>
                                    </div>
                                    <div class="col-12">
                                        <asp:Label ID="lblSideEffects" runat="server" Text="Side Effects" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtSideEffects" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" Placeholder="Common side effects"></asp:TextBox>
                                    </div>
                                    <div class="col-12">
                                        <asp:Label ID="lblContraindications" runat="server" Text="Contraindications" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtContraindications" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" Placeholder="When should this medicine not be used?"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="lblStorage" runat="server" Text="Storage Conditions" CssClass="form-label"></asp:Label>
                                        <asp:DropDownList ID="ddlStorage" runat="server" CssClass="form-select">
                                            <asp:ListItem Text="Select Storage" Value=""></asp:ListItem>
                                            <asp:ListItem Text="Room Temperature" Value="room-temp"></asp:ListItem>
                                            <asp:ListItem Text="Refrigerated (2-8°C)" Value="refrigerated"></asp:ListItem>
                                            <asp:ListItem Text="Cool & Dry Place" Value="cool-dry"></asp:ListItem>
                                            <asp:ListItem Text="Protect from Light" Value="protected-light"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="lblManufacturer" runat="server" Text="Manufacturer" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtManufacturer" runat="server" CssClass="form-control" Placeholder="Manufacturer company name"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <!-- Inventory & Pricing Section -->
                            <div class="form-section">
                                <h6 class="section-title mb-4">
                                    <i class="fas fa-boxes me-2 text-primary"></i>
                                    Inventory & Pricing
                                </h6>
                                <div class="row g-3">
                                    <div class="col-md-4">
                                        <asp:Label ID="lblSKU" runat="server" Text="SKU/Product Code" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtSKU" runat="server" CssClass="form-control" Placeholder="e.g., PAN-500-10"></asp:TextBox>
                                        <div class="form-text">Unique product identifier</div>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblBatchNumber" runat="server" Text="Batch Number" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtBatchNumber" runat="server" CssClass="form-control" Placeholder="e.g., BATCH-2024-001"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblExpiryDate" runat="server" Text="Expiry Date" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtExpiryDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblInitialStock" runat="server" Text="Initial Stock" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtInitialStock" runat="server" CssClass="form-control" TextMode="Number" Text="0"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblMinStockLevel" runat="server" Text="Minimum Stock Level" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtMinStockLevel" runat="server" CssClass="form-control" TextMode="Number" Text="10"></asp:TextBox>
                                        <div class="form-text">Alert when stock falls below this level</div>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblMaxStockLevel" runat="server" Text="Maximum Stock Level" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtMaxStockLevel" runat="server" CssClass="form-control" TextMode="Number" Text="1000"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblCostPrice" runat="server" Text="Cost Price" CssClass="form-label"></asp:Label>
                                        <div class="input-group">
                                            <span class="input-group-text">₹</span>
                                            <asp:TextBox ID="txtCostPrice" runat="server" CssClass="form-control" TextMode="Number" Step="0.01"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblSellingPrice" runat="server" Text="Selling Price" CssClass="form-label"></asp:Label>
                                        <div class="input-group">
                                            <span class="input-group-text">₹</span>
                                            <asp:TextBox ID="txtSellingPrice" runat="server" CssClass="form-control" TextMode="Number" Step="0.01"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblMRP" runat="server" Text="MRP (Maximum Retail Price)" CssClass="form-label"></asp:Label>
                                        <div class="input-group">
                                            <span class="input-group-text">₹</span>
                                            <asp:TextBox ID="txtMRP" runat="server" CssClass="form-control" TextMode="Number" Step="0.01"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="lblSupplier" runat="server" Text="Supplier" CssClass="form-label"></asp:Label>
                                        <asp:DropDownList ID="ddlSupplier" runat="server" CssClass="form-select">
                                            <asp:ListItem Text="Select Supplier" Value=""></asp:ListItem>
                                            <asp:ListItem Text="MediSupplies Ltd." Value="1"></asp:ListItem>
                                            <asp:ListItem Text="PharmaDistributors" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="HealthSupplies Inc." Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Generic Pharma Co." Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="lblTaxRate" runat="server" Text="Tax Rate" CssClass="form-label"></asp:Label>
                                        <asp:DropDownList ID="ddlTaxRate" runat="server" CssClass="form-select">
                                            <asp:ListItem Text="0% - Exempt" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="5% - GST" Value="5" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="12% - GST" Value="12"></asp:ListItem>
                                            <asp:ListItem Text="18% - GST" Value="18"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>

                            <hr class="my-4" />

                            <!-- Additional Information Section -->
                            <div class="form-section">
                                <h6 class="section-title mb-4">
                                    <i class="fas fa-file-medical me-2 text-primary"></i>
                                    Additional Information
                                </h6>
                                <div class="row g-3">
                                    <div class="col-12">
                                        <asp:Label ID="lblDescription" runat="server" Text="Description" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                    </div>
                                    <div class="col-12">
                                        <asp:Label ID="lblDosageInstructions" runat="server" Text="Dosage Instructions" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtDosageInstructions" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="lblMedicineImage" runat="server" Text="Medicine Image" CssClass="form-label"></asp:Label>
                                        <asp:FileUpload ID="fuMedicineImage" runat="server" CssClass="form-control" />
                                        <div class="form-text">Upload medicine package image (max 2MB)</div>
                                    </div>

                                    <asp:UpdatePanel ID="updBarcode" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="col-md-6">
    <asp:Label ID="lblBarcode" runat="server" Text="Barcode" CssClass="form-label"></asp:Label>
    <asp:TextBox ID="txtBarcode" runat="server" CssClass="form-control" Placeholder="Scan or enter barcode"></asp:TextBox>

    <asp:LinkButton ID="lbtnScanBarcode" runat="server" CssClass="btn btn-sm btn-outline-secondary mt-2" OnClick="lbtnScanBarcode_Click">
        <i class="fas fa-camera me-1"></i> Scan Barcode
    </asp:LinkButton>
</div>

                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="lbtnScanBarcode" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>

                                    <div class="col-12">
                                        <asp:CheckBox ID="chkIsActive" runat="server" CssClass="form-check-input" Checked="True" Text="Activate this medicine immediately" />
                                        <asp:CheckBox ID="chkTrackExpiry" runat="server" CssClass="form-check-input" Checked="True" Text="Track expiry date and send alerts" />
                                        <asp:CheckBox ID="chkRequireBatch" runat="server" CssClass="form-check-input" Text="Require batch number for sales" />
                                    </div>
                                </div>
                            </div>

                            <!-- Form Actions -->
                            <div class="row mt-5">
                                <div class="col-12">
                                        <asp:UpdatePanel ID="updMedicineButtons" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div class="d-flex justify-content-between">
                                                    <asp:LinkButton ID="lbtnReset" runat="server" CssClass="btn btn-outline-secondary" OnClick="lbtnReset_Click">
        <i class="fas fa-redo me-2"></i>Reset Form
                                                    </asp:LinkButton>

                                                    <div class="btn-group">
                                                        <asp:LinkButton ID="lbtnSaveDraft" runat="server" CssClass="btn btn-medical-secondary" OnClick="lbtnSaveDraft_Click">
            <i class="fas fa-save me-2"></i>Save as Draft
                                                        </asp:LinkButton>

                                                        <asp:LinkButton ID="lbtnAddMedicine" runat="server" CssClass="btn btn-medical btn-medical-primary" OnClick="lbtnAddMedicine_Click">
            <i class="fas fa-plus me-2"></i>Add Medicine
                                                        </asp:LinkButton>
                                                    </div>
                                                </div>


                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="lbtnReset" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="lbtnSaveDraft" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="lbtnAddMedicine" EventName="Click" />
                                            </Triggers>

                                        </asp:UpdatePanel>
                                </div>
                            </div>
                        </asp:Panel>
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
                            <div class="col-md-3 col-6 mb-3">
                                <button type="button" class="btn btn-outline-primary w-100 template-btn" data-template="analgesic">
                                    <i class="fas fa-pain-relief me-2"></i>Analgesic
                                </button>
                            </div>
                            <div class="col-md-3 col-6 mb-3">
                                <button type="button" class="btn btn-outline-success w-100 template-btn" data-template="antibiotic">
                                    <i class="fas fa-prescription-bottle me-2"></i>Antibiotic
                                </button>
                            </div>
                            <div class="col-md-3 col-6 mb-3">
                                <button type="button" class="btn btn-outline-info w-100 template-btn" data-template="vitamin">
                                    <i class="fas fa-capsules me-2"></i>Vitamin
                                </button>
                            </div>
                            <div class="col-md-3 col-6 mb-3">
                                <button type="button" class="btn btn-outline-warning w-100 template-btn" data-template="topical">
                                    <i class="fas fa-spray-can me-2"></i>Topical
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
                        <h6 class="mb-0">Recently Added Medicines</h6>
                    </div>
                    <div class="card-medical-body">
                        <div class="table-responsive">
                            <table class="table table-medical table-sm">
                                <thead>
                                    <tr>
                                        <th>Medicine Name</th>
                                        <th>Type</th>
                                        <th>Category</th>
                                        <th>Stock</th>
                                        <th>Price</th>
                                        <th>Added On</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Cetirizine 10mg</td>
                                        <td>Tablet</td>
                                        <td>Antihistamine</td>
                                        <td>45</td>
                                        <td>₹35.00</td>
                                        <td>10 Jan 2024</td>
                                    </tr>
                                    <tr>
                                        <td>Vitamin B Complex</td>
                                        <td>Capsule</td>
                                        <td>Vitamin</td>
                                        <td>120</td>
                                        <td>₹85.00</td>
                                        <td>09 Jan 2024</td>
                                    </tr>
                                    <tr>
                                        <td>Omeprazole 20mg</td>
                                        <td>Capsule</td>
                                        <td>Gastrointestinal</td>
                                        <td>78</td>
                                        <td>₹65.00</td>
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
        // Add Medicine Form Functionality
        document.addEventListener('DOMContentLoaded', function () {
            const form = document.getElementById('addMedicineForm');
            const resetBtn = document.getElementById('resetForm');
            const saveDraftBtn = document.getElementById('saveDraft');
            const templateBtns = document.querySelectorAll('.template-btn');

            // Form Reset
            resetBtn.addEventListener('click', function () {
                if (confirm('Are you sure you want to reset the form? All entered data will be lost.')) {
                    form.reset();
                }
            });

            // Save Draft
            saveDraftBtn.addEventListener('click', function () {
                const formData = new FormData(form);
                // Here you would typically save to localStorage or send to server
                alert('Draft saved successfully!');
            });

            // Template Buttons
            templateBtns.forEach(btn => {
                btn.addEventListener('click', function () {
                    const template = this.dataset.template;
                    loadTemplate(template);
                });
            });

            // Form Submission
            form.addEventListener('submit', function (e) {
                e.preventDefault();

                if (validateForm()) {
                    // Show loading state
                    const submitBtn = form.querySelector('button[type="submit"]');
                    const originalText = submitBtn.innerHTML;
                    submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Adding...';
                    submitBtn.disabled = true;

                    // Simulate API call
                    setTimeout(() => {
                        alert('Medicine added successfully!');
                        form.reset();
                        submitBtn.innerHTML = originalText;
                        submitBtn.disabled = false;

                        // Redirect to medicines list
                        window.location.href = 'medicines.html';
                    }, 2000);
                }
            });

            // Auto-generate SKU based on inputs
            const nameInput = form.querySelector('input[name="medicineName"]');
            const strengthInput = form.querySelector('input[name="strength"]');
            const skuInput = form.querySelector('input[name="sku"]');

            nameInput.addEventListener('blur', generateSKU);
            strengthInput.addEventListener('blur', generateSKU);

            function generateSKU() {
                const name = nameInput.value.trim();
                const strength = strengthInput.value.trim();

                if (name && strength && !skuInput.value) {
                    const prefix = name.substring(0, 3).toUpperCase();
                    skuInput.value = `${prefix}-${strength}-001`;
                }
            }

            // Calculate selling price based on cost and margin
            const costPriceInput = form.querySelector('input[name="costPrice"]');
            const sellingPriceInput = form.querySelector('input[name="sellingPrice"]');
            const mrpInput = form.querySelector('input[name="mrp"]');

            costPriceInput.addEventListener('blur', calculatePrices);

            function calculatePrices() {
                const costPrice = parseFloat(costPriceInput.value) || 0;
                if (costPrice > 0) {
                    const sellingPrice = costPrice * 1.3; // 30% margin
                    const mrp = costPrice * 1.5; // 50% margin for MRP

                    sellingPriceInput.value = sellingPrice.toFixed(2);
                    mrpInput.value = mrp.toFixed(2);
                }
            }
        });

        // Template Data
        const templates = {
            analgesic: {
                medicineName: 'Paracetamol',
                genericName: 'Paracetamol',
                medicineType: 'tablet',
                strength: '500',
                category: 'analgesic',
                prescriptionRequired: 'no',
                uses: 'Pain relief and fever reduction',
                sideEffects: 'Rare side effects include skin rash',
                storageConditions: 'room-temp',
                minStockLevel: '20',
                costPrice: '15.00'
            },
            antibiotic: {
                medicineName: 'Amoxicillin',
                genericName: 'Amoxicillin Trihydrate',
                medicineType: 'capsule',
                strength: '250',
                category: 'antibiotic',
                prescriptionRequired: 'yes',
                uses: 'Treatment of bacterial infections',
                sideEffects: 'Nausea, diarrhea, skin rash',
                storageConditions: 'room-temp',
                minStockLevel: '15',
                costPrice: '120.00'
            },
            vitamin: {
                medicineName: 'Vitamin C',
                genericName: 'Ascorbic Acid',
                medicineType: 'tablet',
                strength: '500',
                category: 'vitamin',
                prescriptionRequired: 'no',
                uses: 'Vitamin C supplement for immunity',
                sideEffects: 'Generally well tolerated',
                storageConditions: 'room-temp',
                minStockLevel: '25',
                costPrice: '25.00'
            },
            topical: {
                medicineName: 'Antiseptic Cream',
                genericName: 'Povidone-Iodine',
                medicineType: 'cream',
                strength: '5',
                category: 'topical',
                prescriptionRequired: 'no',
                uses: 'Antiseptic for minor cuts and wounds',
                sideEffects: 'Local skin irritation',
                storageConditions: 'room-temp',
                minStockLevel: '10',
                costPrice: '45.00'
            }
        };

        function loadTemplate(templateName) {
            if (confirm(`Load ${templateName} template? This will overwrite current form data.`)) {
                const template = templates[templateName];
                const form = document.getElementById('addMedicineForm');

                for (const [key, value] of Object.entries(template)) {
                    const element = form.querySelector(`[name="${key}"]`);
                    if (element) {
                        element.value = value;
                    }
                }

                // Trigger price calculation
                const costPriceInput = form.querySelector('input[name="costPrice"]');
                if (costPriceInput) {
                    costPriceInput.dispatchEvent(new Event('blur'));
                }

                alert(`${templateName.charAt(0).toUpperCase() + templateName.slice(1)} template loaded!`);
            }
        }

        function validateForm() {
            const form = document.getElementById('addMedicineForm');
            const requiredFields = form.querySelectorAll('[required]');
            let isValid = true;

            requiredFields.forEach(field => {
                if (!field.value.trim()) {
                    isValid = false;
                    field.classList.add('is-invalid');

                    // Add error message
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

            // Validate prices
            const costPrice = parseFloat(form.querySelector('[name="costPrice"]').value);
            const sellingPrice = parseFloat(form.querySelector('[name="sellingPrice"]').value);
            const mrp = parseFloat(form.querySelector('[name="mrp"]').value);

            if (sellingPrice <= costPrice) {
                alert('Selling price must be greater than cost price');
                isValid = false;
            }

            if (mrp < sellingPrice) {
                alert('MRP must be greater than or equal to selling price');
                isValid = false;
            }

            return isValid;
        }
    </script>
</asp:Content>
