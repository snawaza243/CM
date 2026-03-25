<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="FSCN.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <section>

        <!-- Page Hero Section -->
        <section class="page-hero">
            <div class="container">
                <h1 class="display-4 fw-bold">Get in Touch</h1>
                <p class="lead">We’re here to answer your questions and discuss your project</p>
            </div>
        </section>



        <!-- Contact Form Section -->
        <section class="py-5">
            <div class="container">
                <div class="row">
                    <!-- Contact Form -->
                    <div class="col-lg-7 mb-5 mb-lg-0">
                        <div class="card shadow-sm">
                            <div class="card-body p-4 p-md-5">
                                <h2 class="card-title text-center mb-4">Send Us a Message</h2>
                                <div id="contactForm">
                                    <div class="row g-3">

                                        <div class="col-md-6">
                                            <label for="name" class="form-label">Your Name:</label>
                                            <input type="text" class="form-control form-control-lg" id="name" name="name" required>
                                        </div>

                                        <div class="col-md-6">
                                            <label for="email" class="form-label">Email Address:</label>
                                            <input type="email" class="form-control form-control-lg" id="email" name="email" required>
                                        </div>

                                        <div class="col-md-6">
                                            <label for="phone" class="form-label">Phone Number:</label>
                                            <input type="tel" class="form-control form-control-lg" id="phone" name="phone" required>
                                        </div>

                                        <div class="col-md-6">
                                            <label for="service" class="form-label">Service Needed:</label>
                                            <select class="form-select form-select-lg" id="service" name="service">
                                                <option value="">Select a service</option>
                                                <option value="new-home">New Home Construction</option>
                                                <option value="renovation">Home Renovation</option>
                                                <option value="extension">Room Extension</option>
                                                <option value="roofing">Roofing Work</option>
                                                <option value="other">Other Inquiry</option>
                                            </select>
                                        </div>

                                        <div class="col-12">
                                            <label for="message" class="form-label">Your Message:</label>
                                            <textarea class="form-control form-control-lg" id="message" name="message" rows="5" required></textarea>
                                        </div>


                                        <div class="col-12">
                                            <label for="files" class="form-label">Upload Plans/Photos (optional):</label>
                                            <input class="form-control form-control-lg" type="file" id="files" name="files" multiple>
                                        </div>

                                        <div class="col-md-12">
                                            <button id="btnContactForm" type="submit" class="btn btn-primary btn-lg w-100">
                                                Send Message
                                            </button>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <!-- Contact Information -->
                    <div class="col-lg-5">
                        <h2 class="text-center mb-4">Contact Information</h2>

                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="d-flex">
                                    <div class="me-3 text-primary">
                                        <i class="fas fa-map-marker-alt fa-2x"></i>
                                    </div>
                                    <div>
                                        <h3 class="h5">Our Office</h3>
                                        <p class="mb-2">
                                            Main Road, [Your Village]<br>
                                            [State], [PIN Code]
                                        </p>
                                        <a href="https://maps.google.com" target="_blank" class="btn btn-sm btn-outline-primary">View on Map</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="d-flex">
                                    <div class="me-3 text-primary">
                                        <i class="fas fa-phone fa-2x"></i>
                                    </div>
                                    <div>
                                        <h3 class="h5">Phone Numbers</h3>
                                        <p class="mb-1">Primary: +91 98765 43210</p>
                                        <p class="mb-2">Office: +91 [Office Number]</p>
                                        <a href="tel:+919876543210" class="btn btn-sm btn-outline-primary">Call Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="d-flex">
                                    <div class="me-3 text-primary">
                                        <i class="fas fa-envelope fa-2x"></i>
                                    </div>
                                    <div>
                                        <h3 class="h5">Email Addresses</h3>
                                        <p class="mb-1">General: info@villageconstruct.com</p>
                                        <p class="mb-2">Estimates: quotes@villageconstruct.com</p>
                                        <a href="mailto:info@villageconstruct.com" class="btn btn-sm btn-outline-primary">Email Us</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="d-flex">
                                    <div class="me-3 text-primary">
                                        <i class="fas fa-clock fa-2x"></i>
                                    </div>
                                    <div>
                                        <h3 class="h5">Working Hours</h3>
                                        <p class="mb-1">Monday-Saturday: 8:00 AM - 6:00 PM</p>
                                        <p class="mb-2">Sunday: Emergency calls only</p>
                                        <a href="https://wa.me/919876543210" target="_blank" class="btn btn-sm btn-outline-primary">WhatsApp Us</a>
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
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d[LATITUDE]!2d[LONGITUDE]!3d[ZOOM]!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zNMKwMTUnMDkuOCJOIDfCsDAxJzQ1LjciRQ!5e0!3m2!1sen!2sin!4v1620000000000!5m2!1sen!2sin" height="450" style="border: 0; width: 100%;" allowfullscreen="" loading="lazy"></iframe>
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
                                        border: 2px dashed var(--secondary-color);
                                        border-radius: 50%;
                                        pointer-events: none;
                                    }

                                    .radius-label {
                                        position: absolute;
                                        bottom: -30px;
                                        left: 50%;
                                        transform: translateX(-50%);
                                        background-color: var(--secondary-color);
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


    </section>


    <script>
        $(document).ready(function () {
            // Contact Form Validation
            $('#contactForm').on('submit', function (e) {
                e.preventDefault();

                // Simple validation
                const name = $('#name').val();
                const email = $('#email').val();
                const phone = $('#phone').val();
                const message = $('#message').val();

                if (!name || !email || !phone || !message) {
                    alert('Please fill all required fields');
                    return;
                }

                // Phone number validation (Indian format)
                const phoneRegex = /^[6-9]\d{9}$/;
                if (!phoneRegex.test(phone)) {
                    alert('Please enter a valid Indian phone number');
                    return;
                }

                // Email validation
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailRegex.test(email)) {
                    alert('Please enter a valid email address');
                    return;
                }

                // If all validations pass, submit the form
                alert('Thank you for your message! We will contact you soon.');
                this.reset();
            });

            // Initialize Google Maps
            function initMap() {
                // This would be replaced with your actual Google Maps API code
                console.log('Map would be initialized here with API key');
            }

            // Load Google Maps API
            function loadGoogleMaps() {
                const script = document.createElement('script');
                script.src = `https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap`;
                script.async = true;
                script.defer = true;
                document.head.appendChild(script);
            }

            // Load map when user scrolls to it
            $(window).on('scroll', function () {
                const mapSection = $('.contact-map');
                if (mapSection.length === 0) return;

                const mapPosition = mapSection.offset().top;
                const screenPosition = $(window).scrollTop() + ($(window).height() / 1.3);

                if (screenPosition > mapPosition) {
                    loadGoogleMaps();
                    $(window).off('scroll');
                }
            });
        });
    </script>
</asp:Content>
