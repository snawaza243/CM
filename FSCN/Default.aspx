<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FSCN._Default"
    EnableSessionState="True" 
    %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class="">

        <!-- Hero Carousel -->
        <div id="heroCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active" style="background-image: url('https://images.unsplash.com/photo-1448630360428-65456885c650?ixlib=rb-4.0.3&auto=format&fit=crop&w=1500&q=80'); background-size: cover; background-position: center;">
                    <div class="carousel-caption">
                        <h2>Quality Construction for Your Village Home</h2>
                        <p>Custom-built homes with traditional craftsmanship</p>
                        <a href="#" class="btn btn-primary">Get Free Estimate</a>
                    </div>
                </div>
                <div class="carousel-item" style="background-image: url('https://images.unsplash.com/photo-1487958449943-2429e8be8625?ixlib=rb-4.0.3&auto=format&fit=crop&w=1500&q=80'); background-size: cover; background-position: center;">
                    <div class="carousel-caption">
                        <h2>Renovations That Respect Your Heritage</h2>
                        <p>Modern comforts with village character</p>
                        <a href="#" class="btn btn-primary">View Our Work</a>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <!-- Quick Quote Section -->
        <section class="quick-quote">
            <div class="container">
                <h2 class="text-center mb-4">Quick Estimate Calculator</h2>
                <div id="quickQuoteForm" class="row g-3 justify-content-center">
                    <div class="col-md-3">
                        <select id="projectType" class="form-select form-select-lg">
                            <option value="">Select Project Type</option>
                            <option value="new_home">New Home Construction</option>
                            <option value="renovation">Home Renovation</option>
                            <option value="extension">Room Extension</option>
                            <option value="roofing">Roof Work</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <input type="number" id="areaSize" class="form-control form-control-lg" placeholder="Area in sq.ft">
                    </div>
                    <div class="col-md-2">
                        <button id="clcEstimate" class="btn btn-primary w-100">Calculate Estimate</button>
                    </div>
                </div>
                <div id="quoteResult" class="mt-4 d-none">
                    <div class="alert alert-info text-center">
                        <h4>Approximate Cost: <span id="estimateAmount" class="fw-bold">₹0</span></h4>
                        <p class="mb-0">For accurate pricing, please <a href="/Contact" class="alert-link">contact us</a> for a detailed quote.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Services Section -->
        <section class="py-5">
            <div class="container">
                <h2 class="section-title">Our Services</h2>
                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="service-card">
                            <div class="icon"><i class="fas fa-home"></i></div>
                            <h3>New Home Construction</h3>
                            <p>Custom-built homes designed for village living with modern amenities.</p>
                            <a href="#" class="btn btn-sm btn-primary">Learn More</a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="service-card">
                            <div class="icon"><i class="fas fa-hammer"></i></div>
                            <h3>Renovations</h3>
                            <p>Transform your existing home while preserving its character.</p>
                            <a href="#" class="btn btn-sm btn-primary">Learn More</a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="service-card">
                            <div class="icon"><i class="fas fa-expand"></i></div>
                            <h3>Extensions</h3>
                            <p>Add rooms or floors to accommodate your growing family.</p>
                            <a href="#" class="btn btn-sm btn-primary">Learn More</a>
                        </div>
                    </div>
                </div>
                <div class="text-center mt-5">
                    <a href="#" class="btn btn-primary">View All Services</a>
                </div>
            </div>
        </section>

        <!-- Projects Section -->
        <section class="py-5 featured-prject-section">
            <div class="container">
                <h2 class="section-title">Featured Projects</h2>
                <div class="row g-4">
                    <div class="col-md-6 col-lg-4 custom-gallery-card-item" data-category="new-homes" data-tags="traditional village 3bedroom">
                        <div class="custom-gallery-card-upper">
                            <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Traditional Village Home">
                            <div class="custom-gallery-card-overlay">
                                <h3>Traditional Village Home</h3>
                                <p>Complete 3-bedroom home with courtyard</p>
                                <a href="#" class="btn btn-sm btn-primary">View Project</a>

                            </div>
                        </div>
                        <div class="custom-gallery-card-info d-none">
                            <h3>Traditional Village Home</h3>
                            <div class="project-meta">
                                <span class="d-block"><i class="bi bi-geo-alt"></i>Village Area</span>
                                <span class="d-block"><i class="bi bi-calendar"></i>Completed: 2024</span>
                            </div>
                            <a href="#" class="btn btn-sm btn-primary">View Details</a>
                        </div>
                    </div>

                    <!-- Modern Farmhouse -->
                    <div class="col-md-6 col-lg-4 custom-gallery-card-item" data-category="new-homes" data-tags="modern farmhouse contemporary">
                        <div class="custom-gallery-card-upper">
                            <img src="https://images.unsplash.com/photo-1574362848149-11496d93a7c7?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Modern Farmhouse">
                            <div class="custom-gallery-card-overlay">
                                <h3>Modern Farmhouse</h3>
                                <p>Contemporary design with traditional materials</p>
                                <a href="#" class="btn btn-sm btn-primary">View Project</a>
                            </div>
                        </div>
                        <div class="custom-gallery-card-info d-none">
                            <h3>Modern Farmhouse</h3>
                            <div class="project-meta">
                                <span class="d-block"><i class="bi bi-geo-alt"></i>Countryside</span>
                                <span class="d-block"><i class="bi bi-calendar"></i>Completed: 2023</span>
                            </div>
                            <a href="#" class="btn btn-sm btn-primary">View Details</a>
                        </div>
                    </div>

                    <!-- Heritage Renovation -->
                    <div class="col-md-6 col-lg-4 custom-gallery-card-item" data-category="renovations" data-tags="heritage restoration traditional">
                        <div class="custom-gallery-card-upper">
                            <img src="https://images.unsplash.com/photo-1588880331179-bc9b93a8cb5e?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Heritage Renovation">
                            <div class="custom-gallery-card-overlay">
                                <h3>Heritage Renovation</h3>
                                <p>Restored 100-year-old home with modern upgrades</p>
                                <a href="#" class="btn btn-sm btn-primary">View Project</a>
                            </div>
                        </div>
                        <div class="custom-gallery-card-info d-none">
                            <h3>Heritage Renovation</h3>
                            <div class="project-meta">
                                <span class="d-block"><i class="bi bi-geo-alt"></i>Old Town</span>
                                <span class="d-block"><i class="bi bi-calendar"></i>Completed: 2022</span>
                            </div>
                            <a href="#" class="btn btn-sm btn-primary">View Details</a>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <!-- Testimonials Section -->
        <section class="py-5 testimonial-section">
            <div class="container">
                <div class="service-header text-center mb-5">
                    <h2 class="fw-bold section-title">What Our Clients Say</h2>
                    <p class="lead">Hear from our satisfied customers</p>
                </div>

                <div id="testimonialCarousel" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active h-25">
                            <div class="testimonial-item ">
                                <div class="quote">"VillageConstruct built our family home exactly as we envisioned. They understood our needs and delivered exceptional quality."</div>
                                <div class="client">
                                    <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Ramesh Patel">
                                    <div class="client-info">
                                        <h4>Ramesh Patel</h4>
                                        <p>Shivaji Nagar</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item h-25">
                            <div class="testimonial-item">
                                <div class="quote">"The team completed our renovation on time and within budget. Their attention to detail is remarkable."</div>
                                <div class="client">
                                    <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="Sunita Desai">
                                    <div class="client-info">
                                        <h4>Sunita Desai</h4>
                                        <p>Gandhi Gram</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item h-25">
                            <div class="testimonial-item">
                                <div class="quote">"We've worked with many contractors, but VillageConstruct stands out for their honesty and craftsmanship."</div>
                                <div class="client">
                                    <img src="https://randomuser.me/api/portraits/men/22.jpg" alt="Vijay Kumar">
                                    <div class="client-info">
                                        <h4>Vijay Kumar</h4>
                                        <p>Krishna Puram</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </section>

    </section>

    <script>
        $(document).ready(function () {


            // Quick Quote Calculator
            $('#clcEstimate').click(function (e) {
                e.preventDefault();

                const projectType = $('#projectType').val();
                const areaSize = parseFloat($('#areaSize').val());

                if (!projectType || !areaSize) {
                    alert('Please fill all fields');
                    return;
                }

                // Base rates (adjust according to local prices)
                const rates = {
                    new_home: 1200,
                    renovation: 800,
                    extension: 900,
                    roofing: 500
                };

                const estimate = Math.round(areaSize * rates[projectType]);
                $('#estimateAmount').text('₹' + estimate.toLocaleString());
                $('#quoteResult').removeClass('d-none');
            });
        });


    </script>
</asp:Content>
