<%@ Page Title="Tools" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tools_And_Utilities.aspx.cs" Inherits="FSCN.Tools_And_Utilities" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <section>

        <!-- Page Hero Section -->
        <section class="page-hero">
            <div class="container">
                <h1 class="display-4 fw-bold ">Construction Tools & Resources</h1>
                <p class="lead">Helpful calculators, guides, and resources for every project</p>
            </div>
        </section>


        <div class="py-5 px-2">
            <div class="row g-4">

                <!-- Tool 1: Material Calculator -->
                <div class="col-md-6 col-lg-4">
                    <div class="card h-100 shadow-sm border-0">
                        <div class="card-body text-center">
                            <i class="fas fa-ruler-combined fa-3x text-primary mb-3"></i>
                            <h5 class="card-title fw-bold">Material Calculator</h5>
                            <p class="card-text text-muted">Quickly calculate cement, sand, bricks, and other materials for your construction project.</p>
                            <a href="/Tools/Material_Calculator" class="btn btn-outline-primary">Open Calculator</a>
                        </div>
                    </div>
                </div>

                <!-- Tool 2: Cost Estimator -->
                <div class="col-md-6 col-lg-4">
                    <div class="card h-100 shadow-sm border-0">
                        <div class="card-body text-center">
                            <i class="fas fa-calculator fa-3x text-success mb-3"></i>
                            <h5 class="card-title fw-bold">Cost Estimator</h5>
                            <p class="card-text text-muted">Estimate the budget for residential, commercial, or renovation projects.</p>
                            <a href="/Tools/Cost_Estimator" class="btn btn-outline-success">Estimate Now</a>
                        </div>
                    </div>
                </div>

                <!-- Tool: Floor Planner -->
                <div class="col-md-6 col-lg-4">
                    <div class="card h-100 shadow-sm border-0">
                        <div class="card-body text-center">
                            <i class="fas fa-vector-square fa-3x text-dark mb-3"></i>
                            <h5 class="card-title fw-bold">Floor Planner</h5>
                            <p class="card-text text-muted">Design and visualize floor layouts with accurate room dimensions and furniture placement.</p>
                            <a href="/Tools/Floor_Planner" class="btn btn-outline-dark">Start Planning</a>
                        </div>
                    </div>
                </div>

                <!-- Tool 3: Project Timeline Planner -->
                <div class="col-md-6 col-lg-4">
                    <div class="card h-100 shadow-sm border-0">
                        <div class="card-body text-center">
                            <i class="fas fa-clock fa-3x text-warning mb-3"></i>
                            <h5 class="card-title fw-bold">Project Timeline Planner</h5>
                            <p class="card-text text-muted">Plan milestones and deadlines to keep your construction project on track.</p>
                            <a href="/Tools/Project_Timeline_Planner" class="btn btn-outline-warning">Plan Project</a>
                        </div>
                    </div>
                </div>

                <!-- Tool 4: Safety Checklist -->
                <div class="col-md-6 col-lg-4">
                    <div class="card h-100 shadow-sm border-0">
                        <div class="card-body text-center">
                            <i class="fas fa-hard-hat fa-3x text-danger mb-3"></i>
                            <h5 class="card-title fw-bold">Safety Checklist</h5>
                            <p class="card-text text-muted">Ensure compliance with safety standards and keep your site accident-free.</p>
                            <a href="/Tools/Safety_Checklist" class="btn btn-outline-danger">View Checklist</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4">
                    <div class="card h-100 shadow-sm border-0">
                        <div class="card-body text-center">
                            <i class="fas fa-drafting-compass fa-3x text-info mb-3"></i>
                            <h5 class="card-title fw-bold">Design Inspiration</h5>
                            <p class="card-text text-muted">Browse home, office, and interior design concepts for your next project.</p>
                            <a href="/Tools/Design_Inspiration" class="btn btn-outline-info">Explore Designs</a>
                        </div>
                    </div>
                </div>

                <!-- Tool 6: Equipment Rental Guide -->
                <div class="col-md-6 col-lg-4">
                    <div class="card h-100 shadow-sm border-0">
                        <div class="card-body text-center">
                            <i class="fas fa-truck-moving fa-3x text-secondary mb-3"></i>
                            <h5 class="card-title fw-bold">Equipment Rental Guide</h5>
                            <p class="card-text text-muted">Find and compare construction equipment rental options near you.</p>
                            <a href="/Tools/Equipment_Rental_Guide" class="btn btn-outline-secondary">Check Rentals</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </section>


</asp:Content>
