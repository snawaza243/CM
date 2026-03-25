<%@ Page Title="Error" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="FSCN.Error" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <!-- Error Page Content -->
    <section class="error-section py-5" style="margin-top: 80px; min-height: 60vh;">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 text-center">
                    <div class="error-icon mb-4">
                        <i class="fas fa-exclamation-triangle fa-5x text-warning"></i>
                    </div>
                    <h1 class="display-1 fw-bold text-primary">404</h1>
                    <h2 class="mb-4">Page Not Found</h2>
                    <p class="lead mb-4">Sorry, the page you are looking for doesn't exist or has been moved.</p>

                    <div class="error-search mb-5">
                        <div class="d-flex justify-content-center" id="errorSearchForm">
                            <div class="input-group" style="max-width: 400px;">
                                <input type="text" class="form-control form-control-lg" placeholder="Search our website..." aria-label="Search">
                                <button class="btn btn-primary" id="btnErrorSearchForm">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="error-actions">
                        <div class="row justify-content-center">
                            <div class="col-md-6 mb-3">
                                <a href="index.html" class="btn btn-primary btn-lg w-100">
                                    <i class="fas fa-home me-2"></i>Go to Homepage
                                </a>
                            </div>
                            <div class="col-md-6 mb-3">
                                <a href="contact.html" class="btn btn-outline-primary btn-lg w-100">
                                    <i class="fas fa-envelope me-2"></i>Contact Support
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="error-sitemap mt-5">
                        <h4 class="mb-3">Popular Pages</h4>
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <ul class="list-unstyled">
                                    <li><a href="services.html#new-homes">New Home Construction</a></li>
                                    <li><a href="services.html#renovations">Home Renovations</a></li>
                                </ul>
                            </div>
                            <div class="col-md-4 mb-3">
                                <ul class="list-unstyled">
                                    <li><a href="portfolio.html">Our Projects</a></li>
                                    <li><a href="tools/material-calculator.html">Material Calculator</a></li>
                                </ul>
                            </div>
                            <div class="col-md-4 mb-3">
                                <ul class="list-unstyled">
                                    <li><a href="about.html">About Us</a></li>
                                    <li><a href="contact.html">Contact Information</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

     <script>
        $(document).ready(function() {
            
            
            // Error page search form
            $('#btnErrorSearchForm').click(function(e) {
                e.preventDefault();
                var searchQuery = $(this).find('input').val().trim();
                if (searchQuery) {
                    // Simple search redirection (you can enhance this)
                    alert('Searching for: ' + searchQuery);
                    // In a real implementation, you would redirect to search results
                    // window.location.href = 'search.html?q=' + encodeURIComponent(searchQuery);
                }
            });
            
            // Add some interactive elements to the error page
            $('.error-icon').hover(
                function() {
                    $(this).css('transform', 'scale(1.1)');
                },
                function() {
                    $(this).css('transform', 'scale(1)');
                }
            );
            
            // Animate the error number
            $('.display-1').hide().fadeIn(1000);
        });
     </script>
</asp:Content>
