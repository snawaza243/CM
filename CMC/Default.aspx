<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CMC._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Main Content -->
    <main class="content">
        <!-- Home Section -->
        <section id="home" class="section active">
            <div class="hero">
                <div class="container">
                    <h1>Building Dreams, Creating Legacies</h1>
                    <p>
                        We are a premier construction company specializing in residential, commercial, and industrial
                        projects. With over 20 years of experience, we deliver quality, innovation, and excellence.
                    </p>
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#quoteModal">
                        <i class="fas fa-file-signature"></i>Request a Quote
                    </button>
                </div>
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="card glass">
                            <div class="card-body text-center service-card">
                                <div class="card-icon">
                                    <i class="fas fa-home"></i>
                                </div>
                                <h5>Residential Construction</h5>
                                <p>Custom homes, renovations, and additions tailored to your lifestyle.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card glass">
                            <div class="card-body text-center service-card">
                                <div class="card-icon">
                                    <i class="fas fa-building"></i>
                                </div>
                                <h5>Commercial Projects</h5>
                                <p>Office buildings, retail spaces, and commercial complexes.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card glass">
                            <div class="card-body text-center service-card">
                                <div class="card-icon">
                                    <i class="fas fa-industry"></i>
                                </div>
                                <h5>Industrial Construction</h5>
                                <p>Warehouses, factories, and specialized industrial facilities.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Services Section -->
        <section id="services" class="section">
            <div class="container">
                <h2 class="mb-5 text-center">Our Services</h2>
                <div class="row">
                    <div class="col-md-6">
                        <div class="card glass">
                            <div class="card-body service-card">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="card-icon me-3">
                                        <i class="fas fa-drafting-compass"></i>
                                    </div>
                                    <h5>Architectural Design</h5>
                                </div>
                                <p>
                                    Our team of architects creates innovative and functional designs that meet your
                                    vision and requirements.
                                </p>
                                <ul>
                                    <li>Custom home designs</li>
                                    <li>3D modeling and visualization</li>
                                    <li>Space planning and optimization</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card glass">
                            <div class="card-body service-card">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="card-icon me-3">
                                        <i class="fas fa-tools"></i>
                                    </div>
                                    <h5>Construction Management</h5>
                                </div>
                                <p>
                                    We oversee every aspect of your project from planning to completion, ensuring quality
                                    and timely delivery.
                                </p>
                                <ul>
                                    <li>Project planning and scheduling</li>
                                    <li>Budget management</li>
                                    <li>Quality control and assurance</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card glass">
                            <div class="card-body service-card">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="card-icon me-3">
                                        <i class="fas fa-hammer"></i>
                                    </div>
                                    <h5>Renovation & Remodeling</h5>
                                </div>
                                <p>
                                    Transform your existing space with our renovation and remodeling services tailored to
                                    your needs.
                                </p>
                                <ul>
                                    <li>Kitchen and bathroom remodels</li>
                                    <li>Room additions and expansions</li>
                                    <li>Historic restoration</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card glass">
                            <div class="card-body service-card">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="card-icon me-3">
                                        <i class="fas fa-truck-pickup"></i>
                                    </div>
                                    <h5>Site Preparation</h5>
                                </div>
                                <p>
                                    We prepare your construction site with precision, ensuring a solid foundation for
                                    your project.
                                </p>
                                <ul>
                                    <li>Land clearing and grading</li>
                                    <li>Excavation and foundation work</li>
                                    <li>Utility installation</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Tools Section -->
        <section id="tools" class="section">
            <div class="container">
                <h2 class="mb-5 text-center">Our Tools & Equipment</h2>
                <div class="row">
                    <div class="col-md-4">
                        <div class="card glass">
                            <div class="card-body text-center service-card">
                                <div class="card-icon">
                                    <i class="fas fa-excavator"></i>
                                </div>
                                <h5>Heavy Machinery</h5>
                                <p>State-of-the-art excavators, bulldozers, and cranes for large-scale projects.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card glass">
                            <div class="card-body text-center service-card">
                                <div class="card-icon">
                                    <i class="fas fa-toolbox"></i>
                                </div>
                                <h5>Power Tools</h5>
                                <p>Professional-grade power tools for precision work and efficiency.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card glass">
                            <div class="card-body text-center service-card">
                                <div class="card-icon">
                                    <i class="fas fa-ruler-combined"></i>
                                </div>
                                <h5>Measurement Equipment</h5>
                                <p>Advanced laser levels, theodolites, and measuring tools for accuracy.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-12">
                        <div class="card glass">
                            <div class="card-body">
                                <h5 class="card-title">Technology Integration</h5>
                                <p>We utilize cutting-edge technology to enhance our construction processes:</p>
                                <div class="row">
                                    <div class="col-md-6">
                                        <ul>
                                            <li>Building Information Modeling (BIM)</li>
                                            <li>3D Printing for components</li>
                                            <li>Drone surveying and inspection</li>
                                        </ul>
                                    </div>
                                    <div class="col-md-6">
                                        <ul>
                                            <li>Project management software</li>
                                            <li>Virtual reality walkthroughs</li>
                                            <li>Automated equipment tracking</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Contractors Section -->
        <section id="contractors" class="section">
            <div class="container">
                <h2 class="mb-5 text-center">Our Expert Contractors</h2>
                <div class="row">
                    <div class="col-md-4">
                        <div class="card glass">
                            <div class="card-body text-center contractor-card">
                                <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Contractor"
                                    class="testimonial-img mb-3">
                                <h5>Michael Johnson</h5>
                                <p class="text-muted">General Contractor</p>
                                <p>
                                    With over 15 years of experience, Michael specializes in residential construction and
                                    renovation projects.
                                </p>
                                <div class="d-flex justify-content-center">
                                    <span class="badge bg-primary me-2">Residential</span>
                                    <span class="badge bg-success">Renovation</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card glass">
                            <div class="card-body text-center contractor-card">
                                <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="Contractor"
                                    class="testimonial-img mb-3">
                                <h5>Sarah Williams</h5>
                                <p class="text-muted">Project Manager</p>
                                <p>
                                    Sarah excels in commercial construction management with a focus on sustainable
                                    building practices.
                                </p>
                                <div class="d-flex justify-content-center">
                                    <span class="badge bg-primary me-2">Commercial</span>
                                    <span class="badge bg-info">Sustainable</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card glass">
                            <div class="card-body text-center contractor-card">
                                <img src="https://randomuser.me/api/portraits/men/76.jpg" alt="Contractor"
                                    class="testimonial-img mb-3">
                                <h5>Robert Chen</h5>
                                <p class="text-muted">Structural Engineer</p>
                                <p>
                                    Robert brings technical expertise to complex structural challenges in industrial
                                    construction.
                                </p>
                                <div class="d-flex justify-content-center">
                                    <span class="badge bg-warning me-2">Industrial</span>
                                    <span class="badge bg-danger">Structural</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Projects Section -->
        <section id="projects" class="section">
            <div class="container">
                <h2 class="mb-5 text-center">Our Recent Projects</h2>
                <div class="row">
                    <div class="col-md-6">
                        <div class="card glass project-card">
                            <div class="card-body">
                                <h5>Modern Residence - Hilltop Estate</h5>
                                <p class="text-muted">Completed: June 2023</p>
                                <p>A contemporary 4-bedroom home with sustainable features and panoramic views.</p>
                                <div class="progress">
                                    <div class="progress-bar" style="width: 100%"></div>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <span>Status: Completed</span>
                                    <span>100%</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card glass project-card">
                            <div class="card-body">
                                <h5>Commercial Complex - Downtown Plaza</h5>
                                <p class="text-muted">Expected: December 2023</p>
                                <p>A mixed-use development with retail spaces, offices, and residential units.</p>
                                <div class="progress">
                                    <div class="progress-bar" style="width: 75%"></div>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <span>Status: In Progress</span>
                                    <span>75%</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card glass project-card">
                            <div class="card-body">
                                <h5>Industrial Warehouse - Logistics Hub</h5>
                                <p class="text-muted">Completed: March 2023</p>
                                <p>
                                    A 50,000 sq ft warehouse with advanced automation systems for logistics operations.
                                </p>
                                <div class="progress">
                                    <div class="progress-bar" style="width: 100%"></div>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <span>Status: Completed</span>
                                    <span>100%</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card glass project-card">
                            <div class="card-body">
                                <h5>Historic Renovation - Old Town Theater</h5>
                                <p class="text-muted">Expected: February 2024</p>
                                <p>
                                    Restoration of a historic theater while preserving its original architectural
                                    details.
                                </p>
                                <div class="progress">
                                    <div class="progress-bar" style="width: 40%"></div>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <span>Status: Planning</span>
                                    <span>40%</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Testimonials Section -->
        <section id="testimonials" class="section">
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

        <!-- Contact Section -->
        <section id="contact" class="section">
            <div class="container">
                <h2 class="mb-5 text-center">Get In Touch</h2>
                <div class="row">
                    <div class="col-md-8">
                        <div class="card glass contact-form">
                            <div class="card-body">
                                <form id="contactForm">
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
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card glass">
                            <div class="card-body">
                                <h5>Contact Information</h5>
                                <div class="d-flex align-items-start mb-3">
                                    <i class="fas fa-map-marker-alt me-3 mt-1 text-primary"></i>
                                    <div>
                                        <h6>Address</h6>
                                        <p>123 Construction Ave, Building City, BC 12345</p>
                                    </div>
                                </div>
                                <div class="d-flex align-items-start mb-3">
                                    <i class="fas fa-phone-alt me-3 mt-1 text-primary"></i>
                                    <div>
                                        <h6>Phone</h6>
                                        <p>(555) 123-4567</p>
                                    </div>
                                </div>
                                <div class="d-flex align-items-start mb-3">
                                    <i class="fas fa-envelope me-3 mt-1 text-primary"></i>
                                    <div>
                                        <h6>Email</h6>
                                        <p>info@buildright.com</p>
                                    </div>
                                </div>
                                <div class="d-flex align-items-start">
                                    <i class="fas fa-clock me-3 mt-1 text-primary"></i>
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
   
        
    </main>

    <!-- Bottom Navigation (Mobile) -->
    <nav class="bottom-nav glass">
        <a href="#" class="bottom-nav-item active" data-section="home">
            <i class="fas fa-home"></i>
            <span>Home</span>
        </a>
        <a href="#" class="bottom-nav-item" data-section="services">
            <i class="fas fa-tools"></i>
            <span>Services</span>
        </a>
        <a href="#" class="bottom-nav-item" data-section="projects">
            <i class="fas fa-building"></i>
            <span>Projects</span>
        </a>
        <a href="#" class="bottom-nav-item" data-section="contact">
            <i class="fas fa-phone-alt"></i>
            <span>Contact</span>
        </a>
    </nav>

    <!-- Quote Modal -->
    <div class="modal fade" id="quoteModal" tabindex="-1" aria-labelledby="quoteModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content glass">
                <div class="modal-header">
                    <h5 class="modal-title" id="quoteModalLabel">Request a Quote</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="quoteForm">
                        <div class="mb-3">
                            <label for="quoteName" class="form-label">Full Name</label>
                            <input type="text" class="form-control" id="quoteName" required>
                        </div>
                        <div class="mb-3">
                            <label for="quoteEmail" class="form-label">Email Address</label>
                            <input type="email" class="form-control" id="quoteEmail" required>
                        </div>
                        <div class="mb-3">
                            <label for="quotePhone" class="form-label">Phone Number</label>
                            <input type="tel" class="form-control" id="quotePhone" required>
                        </div>
                        <div class="mb-3">
                            <label for="projectType" class="form-label">Project Type</label>
                            <select class="form-select" id="projectType" required>
                                <option value="" selected disabled>Select project type</option>
                                <option value="residential">Residential</option>
                                <option value="commercial">Commercial</option>
                                <option value="industrial">Industrial</option>
                                <option value="renovation">Renovation</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="projectDetails" class="form-label">Project Details</label>
                            <textarea class="form-control" id="projectDetails" rows="4" required></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="timeline" class="form-label">Desired Timeline</label>
                            <select class="form-select" id="timeline" required>
                                <option value="" selected disabled>Select timeline</option>
                                <option value="asap">As soon as possible</option>
                                <option value="1-3">1-3 months</option>
                                <option value="3-6">3-6 months</option>
                                <option value="6plus">6+ months</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="submitQuote">Submit Request</button>
                </div>
            </div>
        </div>
   
        <script>
            function loadDropdown(forType, by, x, role, logId, ddlId) {
                $.ajax({
                    type: "POST",
                    url: "/Default.aspx/GetCMListServices", 
                    data: JSON.stringify({
                        forType: forType,
                        by: by,
                        x: x,
                        role: role,
                        logId: logId
                    }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var data = response.d || response; // fallback if d is missing
                        var ddl = $("#" + ddlId);
                        ddl.empty();

                        if (data.success) {
                            ddl.append('<option value="" selected disabled>Select...</option>');
                            $.each(data.data, function (index, item) {
                                ddl.append('<option value="' + item.CODE + '">' + item.NAME + '</option>');
                            });
                        } else {
                            ddl.append('<option value="" selected disabled>' + (data.message || "No data") + '</option>');
                        }
                    },
                    error: function (xhr, status, error) {
                        var ddl = $("#" + ddlId);
                        ddl.empty().append('<option value="" selected disabled>Error loading data</option>');

                        console.group("AJAX Error Details");
                        console.log("Status:", status);             // e.g., "error", "timeout"
                        console.log("Error Message:", error);      // textual error info
                        console.log("HTTP Status Code:", xhr.status); // e.g., 500, 404
                        console.log("Response Text:", xhr.responseText); // full server response
                        console.log("Request URL:", this.url);     // URL that was requested
                        console.groupEnd();
                    }
                });
            }


        
            $(document).ready(function () {

                // Example: load services dropdown
                loadDropdown('DDL_CM_SERVICES', '', '', '', '', 'projectType');


            });
        </script>

    </div>



    <!-- Client Projects List Modal -->
    <div class="modal fade" id="clientProjectsModal" tabindex="-1" aria-labelledby="clientProjectsModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content glass">
                <div class="modal-header">
                    <h5 class="modal-title" id="clientProjectsModalLabel">My Projects</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row mb-4">
                        <div class="col-md-3">
                            <div class="card glass text-center">
                                <div class="card-body">
                                    <h3 class="text-primary">5</h3>
                                    <p class="mb-0">Total Projects</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card glass text-center">
                                <div class="card-body">
                                    <h3 class="text-success">2</h3>
                                    <p class="mb-0">Completed</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card glass text-center">
                                <div class="card-body">
                                    <h3 class="text-warning">2</h3>
                                    <p class="mb-0">In Progress</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card glass text-center">
                                <div class="card-body">
                                    <h3 class="text-info">1</h3>
                                    <p class="mb-0">Planning</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-hover" id="clientProjectsTable">
                            <thead>
                                <tr>
                                    <th>Project Name</th>
                                    <th>Type</th>
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
                                    <td>Residential</td>
                                    <td>15 Mar 2023</td>
                                    <td>15 Sep 2023</td>
                                    <td>
                                        <div class="progress" style="height: 8px;">
                                            <div class="progress-bar bg-success" style="width: 100%"></div>
                                        </div>
                                        <small>100% Complete</small>
                                    </td>
                                    <td><span class="badge bg-success">Completed</span></td>
                                    <td>
                                        <button class="btn btn-sm btn-outline-primary view-project-details"
                                            data-project="1">
                                            <i class="fas fa-eye"></i>View
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Office Renovation</td>
                                    <td>Commercial</td>
                                    <td>01 Jun 2023</td>
                                    <td>15 Dec 2023</td>
                                    <td>
                                        <div class="progress" style="height: 8px;">
                                            <div class="progress-bar bg-primary" style="width: 75%"></div>
                                        </div>
                                        <small>75% Complete</small>
                                    </td>
                                    <td><span class="badge bg-primary">In Progress</span></td>
                                    <td>
                                        <button class="btn btn-sm btn-outline-primary view-project-details"
                                            data-project="2">
                                            <i class="fas fa-eye"></i>View
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Kitchen Remodel</td>
                                    <td>Renovation</td>
                                    <td>10 Aug 2023</td>
                                    <td>30 Nov 2023</td>
                                    <td>
                                        <div class="progress" style="height: 8px;">
                                            <div class="progress-bar bg-warning" style="width: 40%"></div>
                                        </div>
                                        <small>40% Complete</small>
                                    </td>
                                    <td><span class="badge bg-warning">Planning</span></td>
                                    <td>
                                        <button class="btn btn-sm btn-outline-primary view-project-details"
                                            data-project="3">
                                            <i class="fas fa-eye"></i>View
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="requestNewProject">
                        <i class="fas fa-plus me-1"></i>Request New Project
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Client Project Details Modal -->
    <div class="modal fade" id="projectDetailsModal" tabindex="-1" aria-labelledby="projectDetailsModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content glass">
                <div class="modal-header">
                    <h5 class="modal-title" id="projectDetailsModalLabel">Project Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row mb-4">
                        <div class="col-md-8">
                            <h4 id="detailProjectName">Hilltop Residence</h4>
                            <p id="detailProjectDescription" class="text-muted">
                                A contemporary 4-bedroom home with
                                sustainable features and panoramic views.
                            </p>
                        </div>
                        <div class="col-md-4 text-end">
                            <span class="badge bg-success fs-6" id="detailProjectStatus">Completed</span>
                        </div>
                    </div>

                    <div class="row mb-4">
                        <div class="col-md-3">
                            <div class="detail-item">
                                <h6>Project Type</h6>
                                <p id="detailProjectType">Residential</p>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="detail-item">
                                <h6>Budget</h6>
                                <p id="detailBudget">$350,000</p>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="detail-item">
                                <h6>Start Date</h6>
                                <p id="detailStartDate">15 Mar 2023</p>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="detail-item">
                                <h6>Deadline</h6>
                                <p id="detailDeadline">15 Sep 2023</p>
                            </div>
                        </div>
                    </div>

                    <div class="mb-4">
                        <h6>Project Progress</h6>
                        <div class="progress mb-2" style="height: 12px;">
                            <div class="progress-bar bg-success" id="detailProgressBar" style="width: 100%"></div>
                        </div>
                        <div class="d-flex justify-content-between">
                            <small>Start: <span id="detailStartDate2">15 Mar 2023</span></small>
                            <small>Deadline: <span id="detailDeadline2">15 Sep 2023</span></small>
                        </div>
                    </div>

                    <div class="row mb-4">
                        <div class="col-md-6">
                            <h6>Assigned Team</h6>
                            <div id="assignedTeam">
                                <div class="d-flex align-items-center mb-2">
                                    <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Contractor"
                                        class="rounded-circle me-2" width="40" height="40">
                                    <div>
                                        <strong>Michael Johnson</strong><br>
                                        <small class="text-muted">General Contractor</small>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center mb-2">
                                    <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="Contractor"
                                        class="rounded-circle me-2" width="40" height="40">
                                    <div>
                                        <strong>Sarah Williams</strong><br>
                                        <small class="text-muted">Project Manager</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <h6>Project Timeline</h6>
                            <div class="timeline">
                                <div class="timeline-item completed">
                                    <div class="timeline-marker"></div>
                                    <div class="timeline-content">
                                        <strong>Planning</strong>
                                        <small class="text-muted">Completed: 30 Mar 2023</small>
                                    </div>
                                </div>
                                <div class="timeline-item completed">
                                    <div class="timeline-marker"></div>
                                    <div class="timeline-content">
                                        <strong>Foundation</strong>
                                        <small class="text-muted">Completed: 15 May 2023</small>
                                    </div>
                                </div>
                                <div class="timeline-item completed">
                                    <div class="timeline-marker"></div>
                                    <div class="timeline-content">
                                        <strong>Construction</strong>
                                        <small class="text-muted">Completed: 30 Jul 2023</small>
                                    </div>
                                </div>
                                <div class="timeline-item completed">
                                    <div class="timeline-marker"></div>
                                    <div class="timeline-content">
                                        <strong>Finishing</strong>
                                        <small class="text-muted">Completed: 10 Sep 2023</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mb-4">
                        <h6>Recent Updates</h6>
                        <div class="updates-list">
                            <div class="update-item">
                                <div class="update-date">Sep 10, 2023</div>
                                <div class="update-content">
                                    Final inspection completed. Project is ready for handover.
                                </div>
                            </div>
                            <div class="update-item">
                                <div class="update-date">Sep 5, 2023</div>
                                <div class="update-content">Landscaping and exterior finishing work completed.</div>
                            </div>
                            <div class="update-item">
                                <div class="update-date">Aug 28, 2023</div>
                                <div class="update-content">Interior painting and flooring installation completed.</div>
                            </div>
                        </div>
                    </div>

                    <div class="mb-4">
                        <h6>Documents & Files</h6>
                        <div class="documents-list">
                            <div class="document-item">
                                <i class="fas fa-file-pdf text-danger me-2"></i>
                                <span>Project_Contract.pdf</span>
                                <button class="btn btn-sm btn-outline-primary ms-2">Download</button>
                            </div>
                            <div class="document-item">
                                <i class="fas fa-file-image text-success me-2"></i>
                                <span>Design_Plans.jpg</span>
                                <button class="btn btn-sm btn-outline-primary ms-2">Download</button>
                            </div>
                            <div class="document-item">
                                <i class="fas fa-file-invoice text-info me-2"></i>
                                <span>Invoice_September.pdf</span>
                                <button class="btn btn-sm btn-outline-primary ms-2">Download</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="contactProjectManager">
                        <i class="fas fa-envelope me-1"></i>Contact Project Manager
                    </button>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
