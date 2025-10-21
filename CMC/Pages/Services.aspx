<%@ Page Language="C#" Title="Services" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Services.aspx.cs" Inherits="CMC.Pages.Services" %>

<%-- MasterPageFile="~/Site.Master" --%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="content">

<!-- Services Section -->
<section id="services" class="section d-block">
    <div class="container">
        <h2 class="mb-5 text-center">Our Services</h2>
        <div class="row">

            <!-- ================= DESIGN SERVICES ================= -->
            <div class="col-12">
                <h3 class="text-center">Design & Planning Services</h3>
            </div>

            <!-- Architectural Design -->
            <div class="col-md-6">
                <div class="card glass">
                    <div class="card-body service-card">
                        <div class="d-flex align-items-center mb-3">
                            <div class="card-icon me-3">
                                <i class="fas fa-drafting-compass"></i>
                            </div>
                            <h4>Architectural Design</h4>
                        </div>
                        <p>
                            Our team creates innovative, functional designs that perfectly match your vision and requirements.
                        </p>
                        <ul>
                            <li>Custom home designs & floor plans</li>
                            <li>3D modeling and visualization</li>
                            <li>Space planning and optimization</li>
                            <li>Material selection guidance</li>
                        </ul>
                        <p><strong>Project Timeline:</strong> 2-4 weeks</p>
                        <p><strong>Pricing:</strong> ₹80-₹150 per sq.ft.</p>
                        <p><strong>Warranty:</strong> 2 years on design documents</p>
                    </div>
                </div>
            </div>

            <!-- Project Planning -->
            <div class="col-md-6">
                <div class="card glass">
                    <div class="card-body service-card">
                        <div class="d-flex align-items-center mb-3">
                            <div class="card-icon me-3 ">
                                <i class="fas fa-project-diagram"></i>
                            </div>
                            <h4 class="">Project Planning</h4>
                        </div>
                        <p>Comprehensive planning services to align design, budget, and execution timelines effectively.</p>
                        <ul>
                            <li>Feasibility studies & site analysis</li>
                            <li>Budget planning & cost estimation</li>
                            <li>Timeline management & scheduling</li>
                            <li>Regulatory approvals & documentation</li>
                        </ul>
                        <p><strong>Project Timeline:</strong> 3-6 weeks</p>
                        <p><strong>Pricing:</strong> ₹50,000-₹2,00,000 (project-based)</p>
                        <p><strong>Warranty:</strong> 1 year consultation support</p>
                    </div>
                </div>
            </div>
          
            
            <!-- ================= CONSTRUCTION SERVICES ================= -->
            <div class="col-12 mt-5">
                <h3 class="text-center">Construction & Execution Services</h3>
            </div>

            <!-- New Home Construction -->
            <div class="col-md-6">
                <div class="card glass">
                    <div class="card-body service-card">
                        <div class="d-flex align-items-center mb-3">
                            <div class="card-icon me-3">
                                <i class="fas fa-home"></i>
                            </div>
                            <h4>New Home Construction</h4>
                        </div>
                        <p>
                            Building your dream home from ground up with quality, durability, and aesthetic design focus.
                        </p>
                        <ul>
                            <li>Custom home design consultation</li>
                            <li>Foundation and structural work</li>
                            <li>Masonry, brickwork & concrete work</li>
                            <li>Electrical and plumbing systems</li>
                        </ul>
                        <p><strong>Project Timeline:</strong> 6-12 months</p>
                        <p><strong>Pricing:</strong> ₹1,800-₹2,800 per sq.ft.</p>
                        <p><strong>Warranty:</strong> 5 years on structure</p>
                    </div>
                </div>
            </div>

            <!-- Construction Management -->
            <div class="col-md-6">
                <div class="card glass">
                    <div class="card-body service-card">
                        <div class="d-flex align-items-center mb-3">
                            <div class="card-icon me-3">
                                <i class="fas fa-tools"></i>
                            </div>
                            <h4>Construction Management</h4>
                        </div>
                        <p>
                            We oversee every project aspect from planning to completion, ensuring quality and timely delivery.
                        </p>
                        <ul>
                            <li>Project planning and scheduling</li>
                            <li>Budget management & cost control</li>
                            <li>Quality control and assurance</li>
                            <li>Vendor and contractor coordination</li>
                        </ul>
                        <p><strong>Project Timeline:</strong> Project duration</p>
                        <p><strong>Pricing:</strong> 8-12% of project cost</p>
                        <p><strong>Warranty:</strong> 1 year management support</p>
                    </div>
                </div>
            </div>

            <!-- Site Preparation -->
            <div class="col-md-6 mt-4">
                <div class="card glass">
                    <div class="card-body service-card">
                        <div class="d-flex align-items-center mb-3">
                            <div class="card-icon me-3">
                                <i class="fas fa-truck-pickup"></i>
                            </div>
                            <h4>Site Preparation</h4>
                        </div>
                        <p>
                            We prepare your construction site with precision, ensuring solid foundation for your project.
                        </p>
                        <ul>
                            <li>Land clearing and grading</li>
                            <li>Excavation and foundation work</li>
                            <li>Soil testing & site analysis</li>
                            <li>Utility installation & connections</li>
                        </ul>
                        <p><strong>Project Timeline:</strong> 2-4 weeks</p>
                        <p><strong>Pricing:</strong> ₹80,000-₹3,00,000</p>
                        <p><strong>Warranty:</strong> 2 years on earthwork</p>
                    </div>
                </div>
            </div>

            <!-- ================= RENOVATION & EXTENSION ================= -->
            <div class="col-12 mt-5">
                <h3 class="text-center">Renovation & Extension Services</h3>
            </div>

            <!-- Renovation & Remodeling -->
            <div class="col-md-6">
                <div class="card glass">
                    <div class="card-body service-card">
                        <div class="d-flex align-items-center mb-3">
                            <div class="card-icon me-3">
                                <i class="fas fa-hammer"></i>
                            </div>
                            <h4>Renovation & Remodeling</h4>
                        </div>
                        <p>
                            Transform your existing space with our renovation services tailored to your specific needs.
                        </p>
                        <ul>
                            <li>Kitchen and bathroom remodels</li>
                            <li>Room additions and expansions</li>
                            <li>Interior redesign & modernization</li>
                            <li>Historic restoration & conservation</li>
                        </ul>
                        <p><strong>Project Timeline:</strong> 4-12 weeks</p>
                        <p><strong>Pricing:</strong> ₹1,200-₹2,000 per sq.ft.</p>
                        <p><strong>Warranty:</strong> 3 years on workmanship</p>
                    </div>
                </div>
            </div>

            <!-- Room Extensions -->
            <div class="col-md-6">
                <div class="card glass">
                    <div class="card-body service-card">
                        <div class="d-flex align-items-center mb-3">
                            <div class="card-icon me-3">
                                <i class="fas fa-expand-arrows-alt"></i>
                            </div>
                            <h4>Room Extensions</h4>
                        </div>
                        <p>
                            Expand your living space with expertly designed additions blending seamlessly with existing home.
                        </p>
                        <ul>
                            <li>Single and multi-room additions</li>
                            <li>Second floor extensions</li>
                            <li>Veranda and porch expansions</li>
                            <li>Structural integration with design</li>
                        </ul>
                        <p><strong>Project Timeline:</strong> 6-12 weeks</p>
                        <p><strong>Pricing:</strong> ₹1,400-₹2,200 per sq.ft.</p>
                        <p><strong>Warranty:</strong> 3 years on structure</p>
                    </div>
                </div>
            </div>

            <!-- ================= STRUCTURAL SERVICES ================= -->
            <div class="col-12 mt-5">
                <h3 class="text-center">Structural & Roofing Services</h3>
            </div>

            <!-- Roofing Solutions -->
            <div class="col-md-6">
                <div class="card glass">
                    <div class="card-body service-card">
                        <div class="d-flex align-items-center mb-3">
                            <div class="card-icon me-3">
                                <i class="fas fa-hard-hat"></i>
                            </div>
                            <h4>Roofing Solutions</h4>
                        </div>
                        <p>
                            Comprehensive roofing services ensuring protection, durability, and aesthetic appeal for home.
                        </p>
                        <ul>
                            <li>New roof installation & replacement</li>
                            <li>Roof repairs and maintenance</li>
                            <li>Leak detection and waterproofing</li>
                            <li>Gutter installation and repair</li>
                        </ul>
                        <p><strong>Project Timeline:</strong> 1-4 weeks</p>
                        <p><strong>Pricing:</strong> ₹200-₹500 per sq.ft.</p>
                        <p><strong>Warranty:</strong> 5 years on materials</p>
                    </div>
                </div>
            </div>

            <!-- Structural Repairs -->
            <div class="col-md-6">
                <div class="card glass">
                    <div class="card-body service-card">
                        <div class="d-flex align-items-center mb-3">
                            <div class="card-icon me-3">
                                <i class="fas fa-building"></i>
                            </div>
                            <h4>Structural Repairs</h4>
                        </div>
                        <p>
                            Professional structural repair services to ensure safety and longevity of your building.
                        </p>
                        <ul>
                            <li>Foundation repair & strengthening</li>
                            <li>Wall crack repairs & treatment</li>
                            <li>Structural assessment & audit</li>
                            <li>Retrofitting & reinforcement</li>
                        </ul>
                        <p><strong>Project Timeline:</strong> 2-8 weeks</p>
                        <p><strong>Pricing:</strong> ₹1,00,000-₹5,00,000</p>
                        <p><strong>Warranty:</strong> 5 years on repairs</p>
                    </div>
                </div>
            </div>


             <!-- ================= IMPORTANT NOTE ================= -->
            <div class="col-12 mt-5">
                <div class="note-box">
                    <div class="note-icon">
                        <i title="Disclaimer" class="fas fa-info-circle"></i>
                    </div>
                    <div class="note-content">
                        <h5>Note</h5>
                        <p class="mb-0">
                            All pricing, timelines, and warranty details mentioned above are indicative estimates. 
                            Actual project costs, duration, and warranty terms may vary based on specific requirements, 
                            site conditions, material choices, and project complexity. We provide detailed customized 
                            quotations after one-on-one consultation and site assessment.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


 <style>
     /* Note Section Styles */
.note-box {
    /*background: linear-gradient(135deg, #e3f2fd 0%, #bbdefb 100%);*/
  background: linear-gradient(135deg, var(--secondary-color) 0%, var(--primary-color)  100%);

    border-left: 4px solid var(--primary-color);
    border-radius: 8px;
    padding: 20px;
    display: flex;
    align-items: flex-start;
    gap: 15px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.note-icon {
    color: var(--primary-color);
    font-size: 1.5rem;
    margin-top: 2px;
}

.note-content h5 {
    color: var(--primary-color);
    margin-bottom: 8px;
    font-weight: 600;
}

.note-content p {
    color: white; /*var(--light-color);*/
    line-height: 1.6;
    margin: 0;
}

/* Responsive design */
@media (max-width: 768px) {
    .note-box {
        flex-direction: column;
        text-align: center;
    }
    
    .note-icon {
        align-self: center;
    }
}
 </style>


    </main>
</asp:Content>
