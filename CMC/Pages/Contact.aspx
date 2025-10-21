<%@ Page Language="C#" Title="Contact" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="CMC.Pages.Contact" %>

<%--  --%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <main class="content">

           <!-- Contact Section -->
        <section id="contact" class="section d-block ">
            <div class="container">
                <h2 class="mb-5 text-center">Get In Touch</h2>
                <div class="row">
                    <div class="col-md-8">
                        <div class="card glass contact-form">
                            <div class="card-body">
                                <div id="contactForm">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label for="name" class="form-label">Full Name</label>
                                                <input type="text" class="form-control" id="name" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label for="email" class="form-label">Email Address</label>
                                                <input type="email" class="form-control" id="email" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="subject" class="form-label">Subject</label>
                                        <input type="text" class="form-control" id="subject" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="message" class="form-label">Message</label>
                                        <textarea class="form-control" id="message" rows="5" required></textarea>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Send Message</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card glass">
                            <div class="card-body">
                                <h5>Contact Information</h5>
                                <div class="d-flex align-items-start mb-3">
                                    <i class="fas fa-map-marker-alt me-3 mt-1 i-contact"></i>
                                    <div>
                                        <h6>Address</h6>
                                        <p> Sultanpur Khurd, Goreakothi, Siwan, Bihar - 841413</p>
                                    </div>
                                </div>
                                <div class="d-flex align-items-start mb-3">
                                    <i class="fas fa-phone-alt me-3 mt-1 i-contact"></i>
                                    <div>
                                        <h6>Phone</h6>
                                        <p>+91 89698 13910</p>
                                    </div>
                                </div>
                                <div class="d-flex align-items-start mb-3">
                                    <i class="fas fa-envelope me-3 mt-1 i-contact"></i>
                                    <div>
                                        <h6>Email</h6>
                                        <p>hellofathersonconstruction@gmail.com</p>
                                    </div>
                                </div>
                                <div class="d-flex align-items-start">
                                    <i class="fas fa-clock me-3 mt-1 i-contact"></i>
                                    <div>
                                        <h6>Business Hours</h6>
                                        <p>Monday - Friday: 8:00 AM - 6:00 PM</p>
                                        <p>Saturday: 9:00 AM - 2:00 PM</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
   
           <!-- Map Section -->
        <section class="py-5 ">
            <div class="container">
                <h2 class="text-center mb-4">Our Service Area</h2>
                <div class="card shadow-sm">
                    <div class="card-body p-0">
                        <div class="position-relative">
                            <%--<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d[LATITUDE]!2d[LONGITUDE]!3d[ZOOM]!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zNMKwMTUnMDkuOCJOIDfCsDAxJzQ1LjciRQ!5e0!3m2!1sen!2sin!4v1620000000000!5m2!1sen!2sin" height="450" style="border: 0; width: 100%;" allowfullscreen="" loading="lazy"></iframe>--%>
                            
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7155.372120700201!2d84.54769879999999!3d26.271850549999996!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3992e1a0d80af229%3A0x97042b8543e45830!2sSultanpur%20Khurd%2C%20Bihar%20841434!5e0!3m2!1sen!2sin!4v1760931063917!5m2!1sen!2sin" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                            <div class="service-radius">
                                <div class="radius-label">We serve within 25km radius</div>
                                <style>
                                    .service-radius {
                                        position: absolute;
                                        top: 50%;
                                        left: 50%;
                                        transform: translate(-50%, -50%);
                                        width: 80%;
                                        height: 80%;
                                        border: 4px dashed var(--primary-color);
                                        border-radius: 50%;
                                        pointer-events: none;
                                    }

                                    .radius-label {
                                        position: absolute;
                                        bottom: -30px;
                                        left: 50%;
                                        transform: translateX(-50%);
                                        background-color: var(--primary-color);
                                        color: var(--white);
                                        padding: 5px 15px;
                                        border-radius: 20px;
                                        font-size: 0.9rem;
                                        white-space: nowrap;
                                    }
                                </style>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

</main>

</asp:Content>