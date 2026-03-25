<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MediCare._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
	 
	 <%--   <section class="row" aria-labelledby="aspnetTitle">
			<h1 id="aspnetTitle">ASP.NET</h1>
			<p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
			<p><a href="http://www.asp.net" class="btn btn-primary btn-md">Learn more &raquo;</a></p>
		</section>--%>


	  <%--  <section>


			<div class="row">
				<div class="col-12">
					<div class="d-flex justify-content-between align-items-center mb-4">
						<h4>Pharmacy Dashboard</h4>
						<div class="d-flex gap-2">
							<button class="btn btn-medical btn-medical-primary">
								<i class="fas fa-plus me-2"></i>Add Medicine
							</button>
							<button class="btn btn-outline-secondary">
								<i class="fas fa-download me-2"></i>Export Report
							</button>
						</div>
					</div>
				</div>
			</div>

			<!-- Critical Alerts -->
			<div class="row mb-4">
				<div class="col-12">
					<div class="alert-medical alert-critical">
						<div class="d-flex align-items-center">
							<i class="fas fa-exclamation-triangle me-3"></i>
							<div>
								<strong>Critical Alert:</strong> 15 medicines are expiring in the next 30 days. 
					<a href="inventory.html?filter=expiring" class="alert-link">Review Now</a>
							</div>
						</div>
					</div>
					<div class="alert-medical alert-warning">
						<div class="d-flex align-items-center">
							<i class="fas fa-file-prescription me-3"></i>
							<div>
								<strong>Action Required:</strong> 8 prescriptions are pending verification.
					<a href="prescriptions.html" class="alert-link">Verify Now</a>
							</div>
						</div>
					</div>
					<div class="alert-medical alert-warning">
						<div class="d-flex align-items-center">
							<i class="fas fa-box me-3"></i>
							<div>
								<strong>Low Stock:</strong> 12 medicines are below minimum stock level.
					<a href="inventory.html?filter=lowstock" class="alert-link">View Details</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Stats Cards -->
			<div class="row mb-4">
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card-medical">
						<div class="card-medical-body">
							<div class="d-flex align-items-center">
								<div class="flex-grow-1">
									<h6 class="text-medical-secondary mb-2">Total Medicines</h6>
									<h3 class="mb-0">1,247</h3>
									<small class="text-success"><i class="fas fa-arrow-up me-1"></i>5.2% from last month</small>
								</div>
								<div class="flex-shrink-0">
									<i class="fas fa-pills fa-2x text-primary"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card-medical">
						<div class="card-medical-body">
							<div class="d-flex align-items-center">
								<div class="flex-grow-1">
									<h6 class="text-medical-secondary mb-2">Pending Prescriptions</h6>
									<h3 class="mb-0">8</h3>
									<small class="text-danger"><i class="fas fa-clock me-1"></i>Requires immediate action</small>
								</div>
								<div class="flex-shrink-0">
									<i class="fas fa-file-prescription fa-2x text-warning"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card-medical">
						<div class="card-medical-body">
							<div class="d-flex align-items-center">
								<div class="flex-grow-1">
									<h6 class="text-medical-secondary mb-2">Expiring Soon</h6>
									<h3 class="mb-0">15</h3>
									<small class="text-warning"><i class="fas fa-calendar me-1"></i>Within 30 days</small>
								</div>
								<div class="flex-shrink-0">
									<i class="fas fa-exclamation-triangle fa-2x text-danger"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card-medical">
						<div class="card-medical-body">
							<div class="d-flex align-items-center">
								<div class="flex-grow-1">
									<h6 class="text-medical-secondary mb-2">Today's Orders</h6>
									<h3 class="mb-0">24</h3>
									<small class="text-success"><i class="fas fa-dollar-sign me-1"></i>₹12,847 revenue</small>
								</div>
								<div class="flex-shrink-0">
									<i class="fas fa-shopping-cart fa-2x text-success"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Charts and Recent Activity -->
			<div class="row">
				<div class="col-lg-8 mb-4">
					<div class="card-medical">
						<div class="card-medical-header">
							<h6 class="mb-0">Sales Overview</h6>
						</div>
						<div class="card-medical-body">
							<div class="chart-container" style="height: 300px;">
								<!-- Chart would go here -->
								<div class="d-flex align-items-center justify-content-center h-100 text-muted">
									<div class="text-center">
										<i class="fas fa-chart-line fa-3x mb-3"></i>
										<p>Sales chart visualization</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-4 mb-4">
					<div class="card-medical">
						<div class="card-medical-header">
							<h6 class="mb-0">Recent Activity</h6>
						</div>
						<div class="card-medical-body">
							<div class="activity-timeline">
								<div class="activity-item d-flex mb-3">
									<div class="activity-icon me-3">
										<i class="fas fa-prescription-bottle text-primary"></i>
									</div>
									<div class="activity-content">
										<small class="text-muted">10 min ago</small>
										<p class="mb-1">New prescription order #MED-1247 received</p>
									</div>
								</div>
								<div class="activity-item d-flex mb-3">
									<div class="activity-icon me-3">
										<i class="fas fa-check-circle text-success"></i>
									</div>
									<div class="activity-content">
										<small class="text-muted">25 min ago</small>
										<p class="mb-1">Prescription #MED-1246 verified and approved</p>
									</div>
								</div>
								<div class="activity-item d-flex mb-3">
									<div class="activity-icon me-3">
										<i class="fas fa-truck text-info"></i>
									</div>
									<div class="activity-content">
										<small class="text-muted">1 hour ago</small>
										<p class="mb-1">Order #MED-1245 shipped to customer</p>
									</div>
								</div>
								<div class="activity-item d-flex mb-3">
									<div class="activity-icon me-3">
										<i class="fas fa-exclamation-triangle text-warning"></i>
									</div>
									<div class="activity-content">
										<small class="text-muted">2 hours ago</small>
										<p class="mb-1">Low stock alert: Paracetamol 500mg</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Quick Actions -->
			<div class="row">
				<div class="col-12">
					<div class="card-medical">
						<div class="card-medical-header">
							<h6 class="mb-0">Quick Actions</h6>
						</div>
						<div class="card-medical-body">
							<div class="row">
								<div class="col-md-3 col-6 mb-3">
									<a href="medicines.html?action=add" class="btn btn-outline-primary w-100">
										<i class="fas fa-pills me-2"></i>Add Medicine
									</a>
								</div>
								<div class="col-md-3 col-6 mb-3">
									<a href="prescriptions.html" class="btn btn-outline-warning w-100">
										<i class="fas fa-file-prescription me-2"></i>Verify Prescriptions
									</a>
								</div>
								<div class="col-md-3 col-6 mb-3">
									<a href="inventory.html" class="btn btn-outline-info w-100">
										<i class="fas fa-boxes me-2"></i>Manage Inventory
									</a>
								</div>
								<div class="col-md-3 col-6 mb-3">
									<a href="reports.html" class="btn btn-outline-success w-100">
										<i class="fas fa-chart-bar me-2"></i>View Reports
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>--%>

		 
			<div class="row">
				<div class="col-12">
					<div class="d-flex justify-content-between align-items-center mb-4">
						<h4>Pharmacy Dashboard</h4>
						<div class="d-flex gap-2">
							<button class="btn btn-medical btn-medical-primary">
								<i class="fas fa-plus me-2"></i>Add Medicine
							</button>
						</div>
					</div>
				</div>
			</div>

			<!-- Critical Alerts -->
			<div class="row mb-4">
				<div class="col-12">
					<div class="alert-medical alert-critical">
						<div class="d-flex align-items-center">
							<i class="fas fa-exclamation-triangle me-3"></i>
							<div>
								<strong>Critical Alert:</strong> 15 medicines are expiring in the next 30 days. 
								<a href="#" class="alert-link">Review Now</a>
							</div>
						</div>
					</div>
					<div class="alert-medical alert-warning">
						<div class="d-flex align-items-center">
							<i class="fas fa-clock me-3"></i>
							<div>
								<strong>Action Required:</strong> 8 prescriptions are pending verification.
								<a href="prescriptions.html" class="alert-link">Verify Now</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Stats Cards -->
			<div class="row mb-4">
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card-medical">
						<div class="card-medical-body">
							<div class="d-flex align-items-center">
								<div class="flex-grow-1">
									<h6 class="text-medical-secondary mb-2">Total Medicines</h6>
									<h3 class="mb-0">1,247</h3>
								</div>
								<div class="flex-shrink-0">
									<i class="fas fa-pills fa-2x text-primary"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card-medical">
						<div class="card-medical-body">
							<div class="d-flex align-items-center">
								<div class="flex-grow-1">
									<h6 class="text-medical-secondary mb-2">Pending Prescriptions</h6>
									<h3 class="mb-0">8</h3>
								</div>
								<div class="flex-shrink-0">
									<i class="fas fa-file-prescription fa-2x text-warning"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card-medical">
						<div class="card-medical-body">
							<div class="d-flex align-items-center">
								<div class="flex-grow-1">
									<h6 class="text-medical-secondary mb-2">Expiring Soon</h6>
									<h3 class="mb-0">15</h3>
								</div>
								<div class="flex-shrink-0">
									<i class="fas fa-exclamation-triangle fa-2x text-danger"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card-medical">
						<div class="card-medical-body">
							<div class="d-flex align-items-center">
								<div class="flex-grow-1">
									<h6 class="text-medical-secondary mb-2">Today's Orders</h6>
									<h3 class="mb-0">24</h3>
								</div>
								<div class="flex-shrink-0">
									<i class="fas fa-shopping-cart fa-2x text-success"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	   

</asp:Content>
