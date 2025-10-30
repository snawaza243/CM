<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="CMA.Pages.Services" %>

 


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <!-- Services Section -->
        <section id="services" class="section d-block">
            <h2 class="mb-4">Service Management</h2>
            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="card glass">
                        <div class="card-body service-card">
                            <div class="d-flex align-items-center mb-3">
                                <div class="service-icon me-3">
                                    <i class="fas fa-drafting-compass fa-2x text-primary"></i>
                                </div>
                                <div>
                                    <h5 class="mb-0">Architectural Design</h5>
                                    <p class="text-muted mb-0">Custom designs and 3D modeling</p>
                                </div>
                            </div>
                            <p>
                                Our team of architects creates innovative and functional designs that meet your
                                        vision and requirements.
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="badge bg-primary">12 Active Projects</span>
                                <button class="btn btn-sm btn-outline-primary">Manage</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="card glass">
                        <div class="card-body service-card">
                            <div class="d-flex align-items-center mb-3">
                                <div class="service-icon me-3">
                                    <i class="fas fa-tools fa-2x text-primary"></i>
                                </div>
                                <div>
                                    <h5 class="mb-0">Construction Management</h5>
                                    <p class="text-muted mb-0">End-to-end project oversight</p>
                                </div>
                            </div>
                            <p>
                                We oversee every aspect of your project from planning to completion, ensuring
                                        quality and timely delivery.
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="badge bg-primary">8 Active Projects</span>
                                <button class="btn btn-sm btn-outline-primary">Manage</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="card glass">
                        <div class="card-body service-card">
                            <div class="d-flex align-items-center mb-3">
                                <div class="service-icon me-3">
                                    <i class="fas fa-hammer fa-2x text-primary"></i>
                                </div>
                                <div>
                                    <h5 class="mb-0">Renovation & Remodeling</h5>
                                    <p class="text-muted mb-0">Transform your existing space</p>
                                </div>
                            </div>
                            <p>
                                Transform your existing space with our renovation and remodeling services
                                        tailored to your needs.
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="badge bg-primary">6 Active Projects</span>
                                <button class="btn btn-sm btn-outline-primary">Manage</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="card glass">
                        <div class="card-body service-card">
                            <div class="d-flex align-items-center mb-3">
                                <div class="service-icon me-3">
                                    <i class="fas fa-truck-pickup fa-2x text-primary"></i>
                                </div>
                                <div>
                                    <h5 class="mb-0">Site Preparation</h5>
                                    <p class="text-muted mb-0">Land clearing and foundation work</p>
                                </div>
                            </div>
                            <p>
                                We prepare your construction site with precision, ensuring a solid foundation for
                                        your project.
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="badge bg-primary">4 Active Projects</span>
                                <button class="btn btn-sm btn-outline-primary">Manage</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    <%-- Model --%>

    <section>

    </section>


</asp:Content>