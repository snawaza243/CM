<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Settings.aspx.cs" Inherits="CMA.Pages.Settings" %>

 


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

         <!-- Settings Section -->
        <section id="settings" class="section d-block">
            <h2 class="mb-4">System Settings</h2>
            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="card glass">
                        <div class="card-header">
                            <h5 class="card-title mb-0">General Settings</h5>
                        </div>
                        <div class="card-body">
                            <form>
                                <div class="mb-3">
                                    <label for="companyName" class="form-label">Company Name</label>
                                    <input type="text" class="form-control" id="companyName"
                                        value="BuildRight Construction">
                                </div>
                                <div class="mb-3">
                                    <label for="companyEmail" class="form-label">Contact Email</label>
                                    <input type="email" class="form-control" id="companyEmail"
                                        value="info@buildright.com">
                                </div>
                                <div class="mb-3">
                                    <label for="companyPhone" class="form-label">Contact Phone</label>
                                    <input type="text" class="form-control" id="companyPhone"
                                        value="(555) 123-4567">
                                </div>
                                <div class="mb-3">
                                    <label for="companyAddress" class="form-label">Address</label>
                                    <textarea class="form-control" id="companyAddress"
                                        rows="2">123 Construction Ave, Building City, BC 12345</textarea>
                                </div>
                                <button type="submit" class="btn btn-primary">Save Changes</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="card glass">
                        <div class="card-header">
                            <h5 class="card-title mb-0">Notification Settings</h5>
                        </div>
                        <div class="card-body">
                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="emailNotifications" checked>
                                <label class="form-check-label" for="emailNotifications">
                                    Email
                                            Notifications</label>
                            </div>
                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="projectUpdates" checked>
                                <label class="form-check-label" for="projectUpdates">
                                    Project Update
                                            Notifications</label>
                            </div>
                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="budgetAlerts" checked>
                                <label class="form-check-label" for="budgetAlerts">
                                    Budget Alert
                                            Notifications</label>
                            </div>
                            <div class="mb-3 form-check">
                                <input type="checkbox" class="form-check-input" id="deadlineReminders">
                                <label class="form-check-label" for="deadlineReminders">
                                    Deadline
                                            Reminders</label>
                            </div>
                            <button type="submit" class="btn btn-primary">Save Preferences</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
   
       


</asp:Content>