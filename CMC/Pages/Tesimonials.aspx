<%@ Page Language="C#" MasterPageFile="~/Site.Master" Title="Testimonials" AutoEventWireup="true" CodeBehind="Tesimonials.aspx.cs" Inherits="CMC.Pages.Tesimonials" %>

<%-- MasterPageFile="~/Site.Master" --%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="content">
        <!-- Testimonials Section -->
        <section id="testimonials" class="section d-block">
            <div class="container">
                <h2 class="mb-5 text-center">What Our Clients Say</h2>
                <div class="row">
                    <div class="col-md-4">
                        <div class="card glass">
                            <div class="card-body testimonial-card">
                                <img src="https://randomuser.me/api/portraits/women/68.jpg" alt="Client"
                                    class="testimonial-img"> 
                                <h5>Jennifer Martinez</h5>
                                <p class="text-muted">Homeowner</p>
                                <p>
                                    "BuildRight transformed our outdated home into a modern living space. Their attention
                                    to detail and professionalism exceeded our expectations."
                                </p>
                                <div class="rating">
                                    <i class="fas fa-star text-warning"></i>
                                    <i class="fas fa-star text-warning"></i>
                                    <i class="fas fa-star text-warning"></i>
                                    <i class="fas fa-star text-warning"></i>
                                    <i class="fas fa-star text-warning"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card glass">
                            <div class="card-body testimonial-card">
                                <img src="https://randomuser.me/api/portraits/men/81.jpg" alt="Client"
                                    class="testimonial-img">
                                <h5>David Thompson</h5>
                                <p class="text-muted">Business Owner</p>
                                <p>
                                    "The commercial space BuildRight created for our company has improved our workflow
                                    and impressed our clients. They delivered on time and within budget."
                                </p>
                                <div class="rating">
                                    <i class="fas fa-star text-warning"></i>
                                    <i class="fas fa-star text-warning"></i>
                                    <i class="fas fa-star text-warning"></i>
                                    <i class="fas fa-star text-warning"></i>
                                    <i class="fas fa-star text-warning"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card glass">
                            <div class="card-body testimonial-card">
                                <img src="https://randomuser.me/api/portraits/women/26.jpg" alt="Client"
                                    class="testimonial-img">
                                <h5>Amanda Roberts</h5>
                                <p class="text-muted">Property Developer</p>
                                <p>
                                    "We've partnered with BuildRight on multiple projects. Their expertise in
                                    construction management and quality control is unmatched in the industry."
                                </p>
                                <div class="rating">
                                    <i class="fas fa-star text-warning"></i>
                                    <i class="fas fa-star text-warning"></i>
                                    <i class="fas fa-star text-warning"></i>
                                    <i class="fas fa-star text-warning"></i>
                                    <i class="fas fa-star text-warning"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

</asp:Content>
