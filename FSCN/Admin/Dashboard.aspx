<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="FSCN.Admin.Dashboard" %>
<%--<%@ Import Namespace="FSCN.Services" %>
<%@ Import Namespace="System.Data" %>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard - Construction Business Hub</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        .header {
            background-color: #2c3e50;
            color: white;
            padding: 10px 20px;
            border-bottom: 3px solid #3498db;
        }
        .sidebar {
            width: 200px;
            background-color: #34495e;
            color: white;
            position: fixed;
            height: 100%;
            overflow-y: auto;
            padding-top: 20px;
        }
        .main-content {
            margin-left: 220px;
            padding: 20px;
        }
        .nav-link {
            display: block;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-bottom: 1px solid #2c3e50;
        }
        .nav-link:hover {
            background-color: #3498db;
        }
        .stat-box {
            background: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            margin: 10px;
            width: 200px;
            float: left;
            text-align: center;
        }
        .stat-number {
            font-size: 24px;
            font-weight: bold;
            color: #2c3e50;
        }
        .stat-label {
            color: #7f8c8d;
            font-size: 14px;
        }
        .content-section {
            background: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            margin: 10px 0;
            clear: both;
        }
        .gridview {
            width: 100%;
            border-collapse: collapse;
        }
        .gridview th {
            background-color: #34495e;
            color: white;
            padding: 8px;
            text-align: left;
        }
        .gridview td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }
        .gridview tr:hover {
            background-color: #f5f5f5;
        }
        .status-active { color: #27ae60; font-weight: bold; }
        .status-pending { color: #f39c12; font-weight: bold; }
        .status-completed { color: #3498db; font-weight: bold; }
        .btn {
            padding: 8px 15px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }
        .btn:hover {
            background-color: #2980b9;
        }
        .quick-actions {
            margin: 20px 0;
            text-align: center;
        }
        .quick-action-btn {
            display: inline-block;
            margin: 5px;
            padding: 10px 15px;
            background: #ecf0f1;
            border: 1px solid #bdc3c7;
            border-radius: 3px;
            text-decoration: none;
            color: #2c3e50;
        }
        .quick-action-btn:hover {
            background: #3498db;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <div class="header">
            <table width="100%">
                <tr>
                    <td><h1 style="margin: 0;">Construction Business Hub</h1></td>
                    <td align="right">
                        Welcome, <asp:Label ID="lblAdminName" runat="server" Text="Admin"></asp:Label> | 
                        <asp:Label ID="lblCurrentDate" runat="server"></asp:Label> | 
                        <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btn" />
                    </td>
                </tr>
            </table>
        </div>

        <!-- Sidebar -->
        <div class="sidebar">
            <div style="padding: 10px 15px; background: #2c3e50; margin-bottom: 10px;">
                <strong>Admin Panel</strong>
            </div>
            <a href="Dashboard.aspx" class="nav-link" style="background: #3498db;">📊 Dashboard</a>
            <a href="Clients.aspx" class="nav-link">👥 Clients</a>
            <a href="Projects.aspx" class="nav-link">🏗️ Projects</a>
            <a href="Employees.aspx" class="nav-link">👨‍💼 Employees</a>
            <a href="Invoices.aspx" class="nav-link">🧾 Invoices</a>
            <a href="Payments.aspx" class="nav-link">💰 Payments</a>
            <a href="Expenses.aspx" class="nav-link">💸 Expenses</a>
            <a href="Reports.aspx" class="nav-link">📈 Reports</a>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <h2>Dashboard Overview</h2>
            
            <!-- Statistics Boxes -->
            <div style="clear: both;">
                <div class="stat-box">
                    <div class="stat-number"><%--<%= GetDashboardStats()["TotalProjects"] %>--%></div>
                    <div class="stat-label">Total Projects</div>
                </div>
                <div class="stat-box">
                    <div class="stat-number"><%--<%= GetDashboardStats()["ActiveProjects"] %>--%></div>
                    <div class="stat-label">Active Projects</div>
                </div>
                <div class="stat-box">
                    <div class="stat-number"><%--<%= GetDashboardStats()["TotalClients"] %>--%></div>
                    <div class="stat-label">Total Clients</div>
                </div>
                <div class="stat-box">
                    <div class="stat-number"><%--$<%= Convert.ToDecimal(GetDashboardStats()["TotalRevenue"]).ToString("N0") %>--%></div>
                    <div class="stat-label">Total Revenue</div>
                </div>
                <div class="stat-box">
                    <div class="stat-number"><%--<%= GetDashboardStats()["PendingInvoices"] %>--%></div>
                    <div class="stat-label">Pending Invoices</div>
                </div>
                <div class="stat-box">
                    <div class="stat-number"><%--<%= GetDashboardStats()["OverdueInvoices"] %>--%></div>
                    <div class="stat-label">Overdue Invoices</div>
                </div>
            </div>

            <!-- Quick Actions -->
            <div class="content-section">
                <h3>Quick Actions</h3>
                <div class="quick-actions">
                    <a href="Projects.aspx?action=new" class="quick-action-btn">➕ New Project</a>
                    <a href="Clients.aspx?action=new" class="quick-action-btn">👥 Add Client</a>
                    <a href="Invoices.aspx?action=new" class="quick-action-btn">🧾 Create Invoice</a>
                    <a href="Employees.aspx?action=new" class="quick-action-btn">👨‍💼 Add Employee</a>
                    <a href="Payments.aspx?action=new" class="quick-action-btn">💰 Record Payment</a>
                    <a href="Reports.aspx" class="quick-action-btn">📈 View Reports</a>
                </div>
            </div>

            <!-- Recent Projects -->
            <div class="content-section">
                <h3>Recent Projects</h3>
                <asp:GridView ID="gvRecentProjects" runat="server" CssClass="gridview" AutoGenerateColumns="false"
                    EmptyDataText="No projects found.">
                    <Columns>
                        <asp:BoundField DataField="ProjectName" HeaderText="Project Name" />
                        <asp:BoundField DataField="CompanyName" HeaderText="Client" />
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <span class='status-<%# Eval("Status").ToString().ToLower() %>'>
                                    <%# Eval("Status") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:MMM dd, yyyy}" />
                        <asp:BoundField DataField="EstimatedEndDate" HeaderText="Due Date" DataFormatString="{0:MMM dd, yyyy}" />
                    </Columns>
                </asp:GridView>
                <div style="text-align: right; margin-top: 10px;">
                    <a href="Projects.aspx" class="btn">View All Projects</a>
                </div>
            </div>

            <!-- Recent Invoices -->
            <div class="content-section">
                <h3>Recent Invoices</h3>
                <asp:GridView ID="gvRecentInvoices" runat="server" CssClass="gridview" AutoGenerateColumns="false"
                    EmptyDataText="No invoices found.">
                    <Columns>
                        <asp:BoundField DataField="InvoiceNumber" HeaderText="Invoice #" />
                        <asp:BoundField DataField="ProjectName" HeaderText="Project" />
                        <asp:BoundField DataField="TotalAmount" HeaderText="Amount" DataFormatString="{0:C2}" />
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <span class='status-<%# Eval("Status").ToString().ToLower() %>'>
                                    <%# Eval("Status") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="DueDate" HeaderText="Due Date" DataFormatString="{0:MMM dd, yyyy}" />
                    </Columns>
                </asp:GridView>
                <div style="text-align: right; margin-top: 10px;">
                    <a href="Invoices.aspx" class="btn">View All Invoices</a>
                </div>
            </div>

            <!-- Project Status Summary -->
            <div class="content-section">
                <h3>Project Status Summary</h3>
                <asp:GridView ID="gvProjectStats" runat="server" CssClass="gridview" AutoGenerateColumns="false"
                    EmptyDataText="No project data available.">
                    <Columns>
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                        <asp:BoundField DataField="Count" HeaderText="Number of Projects" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>