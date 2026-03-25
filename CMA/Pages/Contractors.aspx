<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contractors.aspx.cs" Inherits="CMA.Pages.Contractors" %>

 


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
           <!-- Contractors Section -->
        <section id="contractors" class="section d-block">
            <h2 class="mb-4">Contractor Management</h2>
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="card glass contractor-card">
                        <div class="card-body">
                            <div class="d-flex align-items-center mb-3">
                                <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Contractor"
                                    class="rounded-circle me-3" width="60" height="60">
                                <div>
                                    <h5 class="mb-0">Michael Johnson</h5>
                                    <p class="text-muted mb-0">General Contractor</p>
                                </div>
                            </div>
                            <p class="mb-3">
                                With over 15 years of experience, Michael specializes in residential
                                        construction and renovation projects.
                            </p>
                            <div class="mb-3">
                                <span class="badge bg-primary me-1">Residential</span>
                                <span class="badge bg-success">Renovation</span>
                            </div>
                            <div class="d-flex justify-content-between">
                                <small class="text-muted">Active Projects: 3</small>
                                <small class="text-muted">Rating: 4.8/5</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card glass contractor-card">
                        <div class="card-body">
                            <div class="d-flex align-items-center mb-3">
                                <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="Contractor"
                                    class="rounded-circle me-3" width="60" height="60">
                                <div>
                                    <h5 class="mb-0">Sarah Williams</h5>
                                    <p class="text-muted mb-0">Project Manager</p>
                                </div>
                            </div>
                            <p class="mb-3">
                                Sarah excels in commercial construction management with a focus on
                                        sustainable building practices.
                            </p>
                            <div class="mb-3">
                                <span class="badge bg-primary me-1">Commercial</span>
                                <span class="badge bg-info">Sustainable</span>
                            </div>
                            <div class="d-flex justify-content-between">
                                <small class="text-muted">Active Projects: 2</small>
                                <small class="text-muted">Rating: 4.9/5</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card glass contractor-card">
                        <div class="card-body">
                            <div class="d-flex align-items-center mb-3">
                                <img src="https://randomuser.me/api/portraits/men/76.jpg" alt="Contractor"
                                    class="rounded-circle me-3" width="60" height="60">
                                <div>
                                    <h5 class="mb-0">Robert Chen</h5>
                                    <p class="text-muted mb-0">Structural Engineer</p>
                                </div>
                            </div>
                            <p class="mb-3">
                                Robert brings technical expertise to complex structural challenges
                                        in industrial construction.
                            </p>
                            <div class="mb-3">
                                <span class="badge bg-warning me-1">Industrial</span>
                                <span class="badge bg-danger">Structural</span>
                            </div>
                            <div class="d-flex justify-content-between">
                                <small class="text-muted">Active Projects: 1</small>
                                <small class="text-muted">Rating: 4.7/5</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    <%-- MODEL --%>

    <section>

    </section>



</asp:Content>