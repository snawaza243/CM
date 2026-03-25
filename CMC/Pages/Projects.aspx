<%@ Page Language="C#" Title="Projects" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="CMC.Pages.Projects" %>

<%-- MasterPageFile="~/Site.Master" --%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <main class="content">
  <!-- Projects Section -->
        <section id="projects" class="section  d-block">
            <div class="container">
                <h2 class="mb-5 text-center">Our Recent Projects</h2>
                <div class="row">
                    <div class="col-md-6">
                        <div class="card glass project-card">
                            <div class="card-body">
                                <h5>Modern Residence - Hilltop Estate</h5>
                                <p class="text-muted">Completed: June 2023</p>
                                <p>A contemporary 4-bedroom home with sustainable features and panoramic views.</p>
                                <div class="progress">
                                    <div class="progress-bar" style="width: 100%"></div>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <span>Status: Completed</span>
                                    <span>100%</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card glass project-card">
                            <div class="card-body">
                                <h5>Commercial Complex - Downtown Plaza</h5>
                                <p class="text-muted">Expected: December 2023</p>
                                <p>A mixed-use development with retail spaces, offices, and residential units.</p>
                                <div class="progress">
                                    <div class="progress-bar" style="width: 75%"></div>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <span>Status: In Progress</span>
                                    <span>75%</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card glass project-card">
                            <div class="card-body">
                                <h5>Industrial Warehouse - Logistics Hub</h5>
                                <p class="text-muted">Completed: March 2023</p>
                                <p>
                                    A 50,000 sq ft warehouse with advanced automation systems for logistics operations.
                                </p>
                                <div class="progress">
                                    <div class="progress-bar" style="width: 100%"></div>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <span>Status: Completed</span>
                                    <span>100%</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card glass project-card">
                            <div class="card-body">
                                <h5>Historic Renovation - Old Town Theater</h5>
                                <p class="text-muted">Expected: February 2024</p>
                                <p>
                                    Restoration of a historic theater while preserving its original architectural
                                    details.
                                </p>
                                <div class="progress">
                                    <div class="progress-bar" style="width: 40%"></div>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <span>Status: Planning</span>
                                    <span>40%</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

</main>

</asp:Content>