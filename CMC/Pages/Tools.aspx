<%@ Page Language="C#" Title="Tools" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Tools.aspx.cs" Inherits="CMC.Pages.Tools" %>

<%-- MasterPageFile="~/Site.Master" --%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="content">

          <section id="tools0" class="section d-block">
            <div class="container">
                <h2 class="mb-5 text-center">Our Tools & Equipment</h2>
                <div class="row">
                    <div class="col-md-4">
                        <div class="card glass">
                            <div class="card-body text-center service-card">
                                <div class="card-icon">
                                    <%--<i class="fas fa-excavator"></i>--%>
                                    <i class="fas fa-truck-moving"></i>
                                </div>
                                <h5>Heavy Machinery</h5>
                                <p>State-of-the-art excavators, bulldozers, and cranes for large-scale projects.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card glass">
                            <div class="card-body text-center service-card">
                                <div class="card-icon">
                                    <i class="fas fa-toolbox"></i>
                                </div>
                                <h5>Power Tools</h5>
                                <p>Professional-grade power tools for precision work and efficiency.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card glass">
                            <div class="card-body text-center service-card">
                                <div class="card-icon">
                                    <i class="fas fa-ruler-combined"></i>
                                </div>
                                <h5>Measurement Equipment</h5>
                                <p>Advanced laser levels, theodolites, and measuring tools for accuracy.</p>
                            </div>
                        </div>
                    </div>
                </div>
               
                
                <div class="row mt-4">
                    <div class="col-12">
                        <div class="card glass">
                            <div class="card-body">
                                <h5 class="card-title">Technology Integration</h5>
                                <p>We utilize cutting-edge technology to enhance our construction processes:</p>
                                <div class="row">
                                    <div class="col-md-6">
                                        <ul>
                                            <li>Building Information Modeling (BIM)</li>
                                            <li>3D Printing for components</li>
                                            <li>Drone surveying and inspection</li>
                                        </ul>
                                    </div>
                                    <div class="col-md-6">
                                        <ul>
                                            <li>Project management software</li>
                                            <li>Virtual reality walkthroughs</li>
                                            <li>Automated equipment tracking</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Tools & Resources Section -->
        <section id="tools" class="section d-block" >
            <div class="container">
                <h2 class="mb-5 text-center">Construction Tools & Resources</h2>
                <div class="row g-4">

                    <!-- Tool 1: Material Calculator -->
                    <div class="col-md-6">
                        <div class="card glass">
                            <div class="card-body service-card">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="card-icon me-3">
                                        <i class="fas fa-ruler-combined fa-2x text-primary"></i>
                                    </div>
                                    <h5>Material Calculator</h5>
                                </div>
                                <p>Quickly calculate cement, sand, bricks, and other materials for your construction project.</p>
                                <ul>
                                    <li><a href="/Pages/Tool/Material_Calculator" class="btn btn-outline-primary btn-sm">Open Calculator</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Tool 2: Cost Estimator -->
                    <div class="col-md-6">
                        <div class="card glass">
                            <div class="card-body service-card">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="card-icon me-3">
                                        <i class="fas fa-calculator fa-2x text-success"></i>
                                    </div>
                                    <h5>Cost Estimator</h5>
                                </div>
                                <p>Estimate the budget for residential, commercial, or renovation projects.</p>
                                <ul>
                                    <li><a href="/Pages/Tool/Cost_Estimator" class="btn btn-outline-success btn-sm">Estimate Now</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Tool 3: Floor Planner -->
                    <div class="col-md-6">
                        <div class="card glass">
                            <div class="card-body service-card">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="card-icon me-3">
                                        <i class="fas fa-vector-square fa-2x text-dark"></i>
                                    </div>
                                    <h5>Floor Planner</h5>
                                </div>
                                <p>Design and visualize floor layouts with accurate room dimensions and furniture placement.</p>
                                <ul>
                                    <li><a href="/Pages/Tool/Floor_Planner" class="btn btn-outline-dark btn-sm">Start Planning</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Tool 4: Project Timeline Planner -->
                    <div class="col-md-6">
                        <div class="card glass">
                            <div class="card-body service-card">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="card-icon me-3">
                                        <i class="fas fa-clock fa-2x text-warning"></i>
                                    </div>
                                    <h5>Project Timeline Planner</h5>
                                </div>
                                <p>Plan milestones and deadlines to keep your construction project on track.</p>
                                <ul>
                                    <li><a href="/Pages/Tool/Project_Timeline_Planner" class="btn btn-outline-warning btn-sm">Plan Project</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Tool 5: Safety Checklist -->
                    <div class="col-md-6">
                        <div class="card glass">
                            <div class="card-body service-card">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="card-icon me-3">
                                        <i class="fas fa-hard-hat fa-2x text-danger"></i>
                                    </div>
                                    <h5>Safety Checklist</h5>
                                </div>
                                <p>Ensure compliance with safety standards and keep your site accident-free.</p>
                                <ul>
                                    <li><a href="/Pages/Tool/Safety_Checklist" class="btn btn-outline-danger btn-sm">View Checklist</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Tool 6: Design Inspiration -->
                    <div class="col-md-6">
                        <div class="card glass">
                            <div class="card-body service-card">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="card-icon me-3">
                                        <i class="fas fa-drafting-compass fa-2x text-info"></i>
                                    </div>
                                    <h5>Design Inspiration</h5>
                                </div>
                                <p>Browse home, office, and interior design concepts for your next project.</p>
                                <ul>
                                    <li><a href="/Pages/Tool/Design_Inspiration" class="btn btn-outline-info btn-sm">Explore Designs</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Tool 7: Equipment Rental Guide -->
                    <div class="col-md-6">
                        <div class="card glass">
                            <div class="card-body service-card">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="card-icon me-3">
                                        <i class="fas fa-truck-moving fa-2x text-secondary"></i>
                                    </div>
                                    <h5>Equipment Rental Guide</h5>
                                </div>
                                <p>Find and compare construction equipment rental options near you.</p>
                                <ul>
                                    <li><a href="/Pages/Tool/Equipment_Rental_Guide" class="btn btn-outline-secondary btn-sm">Check Rentals</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- row end -->
            </div>
            <!-- container end -->
        </section>

    </main>

</asp:Content>
