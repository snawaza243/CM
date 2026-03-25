<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CMA._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <section>
        <!-- Dashboard Section -->
        <section id="dashboard" class="section active">
            <div class="row mb-4">
                <div class="col-md-3 col-sm-6 mb-3">
                    <div class="card glass stats-card">
                        <div class="card-body">
                            <div class="stats-icon">
                                <i class="fas fa-building"></i>
                            </div>
                            <div class="stats-value">12</div>
                            <div class="stats-label">Active Projects</div>
                            <div class="stats-change change-up">
                                <i class="fas fa-arrow-up"></i>2 from last month
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-3">
                    <div class="card glass stats-card">
                        <div class="card-body">
                            <div class="stats-icon">
                                <i class="fas fa-dollar-sign"></i>
                            </div>
                            <div class="stats-value">$245,680</div>
                            <div class="stats-label">Total Budget</div>
                            <div class="stats-change change-up">
                                <i class="fas fa-arrow-up"></i>$12,450 from last month
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-3">
                    <div class="card glass stats-card">
                        <div class="card-body">
                            <div class="stats-icon">
                                <i class="fas fa-users"></i>
                            </div>
                            <div class="stats-value">24</div>
                            <div class="stats-label">Active Clients</div>
                            <div class="stats-change change-up">
                                <i class="fas fa-arrow-up"></i>3 from last month
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-3">
                    <div class="card glass stats-card">
                        <div class="card-body">
                            <div class="stats-icon">
                                <i class="fas fa-tasks"></i>
                            </div>
                            <div class="stats-value">42</div>
                            <div class="stats-label">Pending Tasks</div>
                            <div class="stats-change change-down">
                                <i class="fas fa-arrow-down"></i>5 from last week
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <div class="row mb-4">
                <div class="col-md-8 mb-4">
                    <div class="card glass">
                        <div class="card-header">
                            <h5 class="card-title mb-0">Project Progress</h5>
                        </div>
                        <div class="card-body">
                            <div class="chart-container">
                                <canvas id="progressChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card glass">
                        <div class="card-header">
                            <h5 class="card-title mb-0">Budget Allocation</h5>
                        </div>
                        <div class="card-body">
                            <div class="chart-container">
                                <canvas id="budgetChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="card glass">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h5 class="card-title mb-0">Recent Projects</h5>
                            <button class="btn btn-primary btn-sm" data-bs-toggle="modal"
                                data-bs-target="#addProjectModal">
                                <i class="fas fa-plus me-1"></i>Add Project
                            </button>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="data-table">
                                    <thead>
                                        <tr>
                                            <th>Project Name</th>
                                            <th>Client</th>
                                            <th>Start Date</th>
                                            <th>Deadline</th>
                                            <th>Progress</th>
                                            <th>Status</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Hilltop Residence</td>
                                            <td>Jennifer Martinez</td>
                                            <td>15 Mar 2023</td>
                                            <td>15 Sep 2023</td>
                                            <td>
                                                <div class="progress">
                                                    <div class="progress-bar bg-success" style="width: 100%">
                                                    </div>
                                                </div>
                                                <small>100% Complete</small>
                                            </td>
                                            <td><span class="status-badge status-completed">Completed</span>
                                            </td>
                                            <td>
                                                <button class="action-btn view-project" title="View Details">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                                <button class="action-btn" title="Edit">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Downtown Plaza</td>
                                            <td>Thompson Properties</td>
                                            <td>01 May 2023</td>
                                            <td>30 Dec 2023</td>
                                            <td>
                                                <div class="progress">
                                                    <div class="progress-bar bg-primary" style="width: 75%">
                                                    </div>
                                                </div>
                                                <small>75% Complete</small>
                                            </td>
                                            <td><span class="status-badge status-active">Active</span></td>
                                            <td>
                                                <button class="action-btn view-project" title="View Details">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                                <button class="action-btn" title="Edit">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Logistics Hub</td>
                                            <td>Global Shipping Co.</td>
                                            <td>10 Jan 2023</td>
                                            <td>10 Jul 2023</td>
                                            <td>
                                                <div class="progress">
                                                    <div class="progress-bar bg-success" style="width: 100%">
                                                    </div>
                                                </div>
                                                <small>100% Complete</small>
                                            </td>
                                            <td><span class="status-badge status-completed">Completed</span>
                                            </td>
                                            <td>
                                                <button class="action-btn view-project" title="View Details">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                                <button class="action-btn" title="Edit">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Old Town Theater</td>
                                            <td>Historic Society</td>
                                            <td>01 Aug 2023</td>
                                            <td>01 Feb 2024</td>
                                            <td>
                                                <div class="progress">
                                                    <div class="progress-bar bg-warning" style="width: 40%">
                                                    </div>
                                                </div>
                                                <small>40% Complete</small>
                                            </td>
                                            <td><span class="status-badge status-pending">Planning</span></td>
                                            <td>
                                                <button class="action-btn view-project" title="View Details">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                                <button class="action-btn" title="Edit">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

  
  
 
    
    
        
   
    
    </section>

</asp:Content>
