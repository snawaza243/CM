<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Reports.aspx.cs" Inherits="CMA.Pages.Reports" %>
 


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

         <!-- Reports Section -->
        <section id="reports" class="section d-block">
            <h2 class="mb-4">Reports & Analytics</h2>
            <div class="row">
                <div class="col-md-8 mb-4">
                    <div class="card glass">
                        <div class="card-header">
                            <h5 class="card-title mb-0">Financial Performance</h5>
                        </div>
                        <div class="card-body">
                            <div class="chart-container">
                                <canvas id="financeChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card glass">
                        <div class="card-header">
                            <h5 class="card-title mb-0">Project Status</h5>
                        </div>
                        <div class="card-body">
                            <div class="chart-container">
                                <canvas id="projectStatusChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card glass">
                        <div class="card-header">
                            <h5 class="card-title mb-0">Project Timeline</h5>
                        </div>
                        <div class="card-body">
                            <div class="chart-container">
                                <canvas id="timelineChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>



</asp:Content>