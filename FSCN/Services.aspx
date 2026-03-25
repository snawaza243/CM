<%@ Page Title="Services" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="FSCN.Services" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section>
        <!-- Page Hero Section -->
        <section class="page-hero">
            <div class="container">
                <h1 class="display-4 fw-bold ">Our Construction Services</h1>
                <p class="lead">Quality craftsmanship for every building need</p>
            </div>
        </section>


     <%--   <section class="py-5 show-data-in-tab-view">
            <style>
        .show-data-in-tab-view {
            background-color: #f8f9fa;
            padding: 2rem 0;
        }
        .filter-row-button-section .nav-link {
            background-color: #fff;
            border: 1px solid #dee2e6;
            color: #495057;
            padding: 12px 20px;
            font-weight: 500;
            transition: all 0.3s ease;
            margin-bottom: 10px;
        }
        .filter-row-button-section .nav-link:hover {
            background-color: #e9ecef;
        }
        .filter-row-button-section .nav-link.active {
            background-color: #0d6efd;
            color: white;
            border-color: #0d6efd;
        }
        .tab-content {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
            padding: 2rem;
            min-height: 400px;
        }
        .service-icon {
            font-size: 2.5rem;
            color: #0d6efd;
            margin-bottom: 1rem;
        }
        .service-details {
            margin-top: 1.5rem;
        }
        .detail-item {
            margin-bottom: 0.8rem;
            display: flex;
        }
        .detail-label {
            font-weight: 600;
            min-width: 150px;
        }
        .priority-high {
            color: #dc3545;
            font-weight: 600;
        }
        .priority-medium {
            color: #fd7e14;
            font-weight: 600;
        }
        .priority-low {
            color: #198754;
            font-weight: 600;
        }
        .service-image {
            width: 100%;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            height: 200px;
            object-fit: cover;
            background-color: #e9ecef;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #6c757d;
        }
    </style>
        <div class="container">
            <div class="row mb-4">
                <div class="col-12 text-center">
                    <h1>Top 10 Requested Construction Services</h1>
                    <p class="lead">Explore the most in-demand construction services with detailed information</p>
                </div>
            </div>

            <!-- Service Tabs (Responsive Grid) -->
            <div class="row g-2 mb-4 justify-content-center" id="serviceTabs0" role="tablist">
                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                    <button class="nav-link active w-100" id="foundation-tab" data-bs-toggle="pill" data-bs-target="#foundation" type="button" role="tab">Foundation Work</button>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                    <button class="nav-link w-100" id="framing-tab" data-bs-toggle="pill" data-bs-target="#framing" type="button" role="tab">Framing & Structure</button>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                    <button class="nav-link w-100" id="electrical-tab" data-bs-toggle="pill" data-bs-target="#electrical" type="button" role="tab">Electrical Systems</button>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                    <button class="nav-link w-100" id="plumbing-tab" data-bs-toggle="pill" data-bs-target="#plumbing" type="button" role="tab">Plumbing Systems</button>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                    <button class="nav-link w-100" id="hvac-tab" data-bs-toggle="pill" data-bs-target="#hvac" type="button" role="tab">HVAC Installation</button>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                    <button class="nav-link w-100" id="drywall-tab" data-bs-toggle="pill" data-bs-target="#drywall" type="button" role="tab">Drywall & Insulation</button>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                    <button class="nav-link w-100" id="flooring-tab" data-bs-toggle="pill" data-bs-target="#flooring" type="button" role="tab">Flooring Installation</button>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                    <button class="nav-link w-100" id="painting-tab" data-bs-toggle="pill" data-bs-target="#painting" type="button" role="tab">Painting & Finishing</button>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                    <button class="nav-link w-100" id="cabinetry-tab" data-bs-toggle="pill" data-bs-target="#cabinetry" type="button" role="tab">Cabinetry & Millwork</button>
                </div>
                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                    <button class="nav-link w-100" id="landscaping-tab" data-bs-toggle="pill" data-bs-target="#landscaping" type="button" role="tab">Landscaping & Exterior</button>
                </div>
            </div>

            <!-- Tab Content -->
            <div class="tab-content" id="tabViewDataList">
                <!-- Foundation Work -->
                <div class="tab-pane fade show active" id="foundation" role="tabpanel" aria-labelledby="foundation-tab">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="service-image">
                                [Foundation Work Image]
                            </div>
                            <div class="service-icon">
                                🏗️
                            </div>
                            <h3>Foundation Work</h3>
                            <p class="priority-high">Priority: High</p>
                        </div>
                        <div class="col-md-8">
                            <p>Foundation work is the most critical phase of any construction project, providing the structural base that supports the entire building.</p>
                            
                            <div class="service-details">
                                <div class="detail-item">
                                    <span class="detail-label">Request Frequency:</span>
                                    <span>92% of construction projects</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Avg. Completion Time:</span>
                                    <span>2-3 weeks</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Key Materials:</span>
                                    <span>Concrete, rebar, footings</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Special Requirements:</span>
                                    <span>Soil testing, engineering approval</span>
                                </div>
                            </div>
                            
                            <h5 class="mt-4">Description</h5>
                            <p>Foundation work involves preparing the site, excavating, and constructing the base structure that will support the building. This includes pouring concrete footings and foundation walls, installing reinforcement, and ensuring proper drainage. A solid foundation is essential for structural integrity and preventing future issues like settling or water damage.</p>
                        </div>
                    </div>
                </div>

                <!-- Framing & Structure -->
                <div class="tab-pane fade" id="framing" role="tabpanel" aria-labelledby="framing-tab">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="service-image">
                                [Framing & Structure Image]
                            </div>
                            <div class="service-icon">
                                🏠
                            </div>
                            <h3>Framing & Structure</h3>
                            <p class="priority-high">Priority: High</p>
                        </div>
                        <div class="col-md-8">
                            <p>Framing creates the skeletal structure of a building, defining its shape and providing support for all other components.</p>
                            
                            <div class="service-details">
                                <div class="detail-item">
                                    <span class="detail-label">Request Frequency:</span>
                                    <span>88% of construction projects</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Avg. Completion Time:</span>
                                    <span>3-4 weeks</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Key Materials:</span>
                                    <span>Lumber, steel beams, fasteners</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Special Requirements:</span>
                                    <span>Structural engineering plans</span>
                                </div>
                            </div>
                            
                            <h5 class="mt-4">Description</h5>
                            <p>Structural framing involves constructing the framework of walls, floors, and roofs using wood or steel. This phase includes installing floor joists, wall studs, roof trusses, and sheathing. Proper framing is crucial for ensuring the building's strength, stability, and ability to withstand environmental forces like wind and snow loads.</p>
                        </div>
                    </div>
                </div>

                <!-- Electrical Systems -->
                <div class="tab-pane fade" id="electrical" role="tabpanel" aria-labelledby="electrical-tab">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="service-image">
                                [Electrical Systems Image]
                            </div>
                            <div class="service-icon">
                                ⚡
                            </div>
                            <h3>Electrical Systems</h3>
                            <p class="priority-high">Priority: High</p>
                        </div>
                        <div class="col-md-8">
                            <p>Electrical installation provides power distribution, lighting, and connectivity throughout the building.</p>
                            
                            <div class="service-details">
                                <div class="detail-item">
                                    <span class="detail-label">Request Frequency:</span>
                                    <span>85% of construction projects</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Avg. Completion Time:</span>
                                    <span>1-2 weeks</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Key Materials:</span>
                                    <span>Wiring, outlets, panels, fixtures</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Special Requirements:</span>
                                    <span>Licensed electrician, inspections</span>
                                </div>
                            </div>
                            
                            <h5 class="mt-4">Description</h5>
                            <p>Electrical system installation includes running wires through walls and ceilings, installing electrical panels, outlets, switches, and lighting fixtures. This work must comply with local building codes and safety standards. Modern electrical installations often include smart home features, dedicated circuits for appliances, and adequate capacity for future needs.</p>
                        </div>
                    </div>
                </div>

                <!-- Plumbing Systems -->
                <div class="tab-pane fade" id="plumbing" role="tabpanel" aria-labelledby="plumbing-tab">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="service-image">
                                [Plumbing Systems Image]
                            </div>
                            <div class="service-icon">
                                🚿
                            </div>
                            <h3>Plumbing Systems</h3>
                            <p class="priority-high">Priority: High</p>
                        </div>
                        <div class="col-md-8">
                            <p>Plumbing systems provide water supply and drainage for the building, essential for functionality and sanitation.</p>
                            
                            <div class="service-details">
                                <div class="detail-item">
                                    <span class="detail-label">Request Frequency:</span>
                                    <span>83% of construction projects</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Avg. Completion Time:</span>
                                    <span>1-2 weeks</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Key Materials:</span>
                                    <span>Pipes, fittings, fixtures, valves</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Special Requirements:</span>
                                    <span>Licensed plumber, pressure testing</span>
                                </div>
                            </div>
                            
                            <h5 class="mt-4">Description</h5>
                            <p>Plumbing installation involves running supply lines for hot and cold water, drain pipes, and vent stacks. This includes installing fixtures like sinks, toilets, showers, and water heaters. Proper plumbing ensures adequate water pressure, efficient drainage, and prevents leaks. Modern plumbing often includes water-saving fixtures and tankless water heaters for energy efficiency.</p>
                        </div>
                    </div>
                </div>

                <!-- HVAC Installation -->
                <div class="tab-pane fade" id="hvac" role="tabpanel" aria-labelledby="hvac-tab">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="service-image">
                                [HVAC Installation Image]
                            </div>
                            <div class="service-icon">
                                ❄️
                            </div>
                            <h3>HVAC Installation</h3>
                            <p class="priority-medium">Priority: Medium</p>
                        </div>
                        <div class="col-md-8">
                            <p>HVAC systems provide heating, ventilation, and air conditioning for comfortable indoor environments.</p>
                            
                            <div class="service-details">
                                <div class="detail-item">
                                    <span class="detail-label">Request Frequency:</span>
                                    <span>78% of construction projects</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Avg. Completion Time:</span>
                                    <span>1 week</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Key Materials:</span>
                                    <span>Ductwork, units, thermostats, vents</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Special Requirements:</span>
                                    <span>Load calculations, energy efficiency</span>
                                </div>
                            </div>
                            
                            <h5 class="mt-4">Description</h5>
                            <p>HVAC installation includes placing heating and cooling equipment, running ductwork through the building, installing vents and returns, and setting up thermostats. Proper sizing and installation are crucial for energy efficiency and comfort. Modern HVAC systems often include zoning capabilities, smart thermostats, and high-efficiency units that reduce energy consumption.</p>
                        </div>
                    </div>
                </div>

                <!-- Drywall & Insulation -->
                <div class="tab-pane fade" id="drywall" role="tabpanel" aria-labelledby="drywall-tab">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="service-image">
                                [Drywall & Insulation Image]
                            </div>
                            <div class="service-icon">
                                🧱
                            </div>
                            <h3>Drywall & Insulation</h3>
                            <p class="priority-medium">Priority: Medium</p>
                        </div>
                        <div class="col-md-8">
                            <p>Drywall and insulation create interior surfaces and improve energy efficiency by regulating temperature.</p>
                            
                            <div class="service-details">
                                <div class="detail-item">
                                    <span class="detail-label">Request Frequency:</span>
                                    <span>75% of construction projects</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Avg. Completion Time:</span>
                                    <span>1-2 weeks</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Key Materials:</span>
                                    <span>Drywall panels, insulation, tape, mud</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Special Requirements:</span>
                                    <span>Proper vapor barriers, fire rating</span>
                                </div>
                            </div>
                            
                            <h5 class="mt-4">Description</h5>
                            <p>This phase involves installing insulation in walls, floors, and ceilings to improve energy efficiency, followed by hanging drywall to create interior surfaces. Drywall is then taped, mudded, and sanded to create smooth walls ready for finishing. Proper insulation reduces heating and cooling costs while improving comfort, and quality drywall installation ensures smooth, durable interior surfaces.</p>
                        </div>
                    </div>
                </div>

                <!-- Flooring Installation -->
                <div class="tab-pane fade" id="flooring" role="tabpanel" aria-labelledby="flooring-tab">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="service-image">
                                [Flooring Installation Image]
                            </div>
                            <div class="service-icon">
                                🪵
                            </div>
                            <h3>Flooring Installation</h3>
                            <p class="priority-medium">Priority: Medium</p>
                        </div>
                        <div class="col-md-8">
                            <p>Flooring installation provides durable, attractive surfaces that define the character of interior spaces.</p>
                            
                            <div class="service-details">
                                <div class="detail-item">
                                    <span class="detail-label">Request Frequency:</span>
                                    <span>72% of construction projects</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Avg. Completion Time:</span>
                                    <span>1 week</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Key Materials:</span>
                                    <span>Hardwood, tile, carpet, underlayment</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Special Requirements:</span>
                                    <span>Subfloor preparation, moisture barriers</span>
                                </div>
                            </div>
                            
                            <h5 class="mt-4">Description</h5>
                            <p>Flooring installation includes preparing subfloors and installing the chosen flooring material such as hardwood, tile, laminate, or carpet. Proper installation ensures durability, level surfaces, and resistance to wear. Different rooms may require different flooring types based on usage, moisture exposure, and aesthetic preferences. Quality flooring installation enhances both the appearance and functionality of a space.</p>
                        </div>
                    </div>
                </div>

                <!-- Painting & Finishing -->
                <div class="tab-pane fade" id="painting" role="tabpanel" aria-labelledby="painting-tab">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="service-image">
                                [Painting & Finishing Image]
                            </div>
                            <div class="service-icon">
                                🎨
                            </div>
                            <h3>Painting & Finishing</h3>
                            <p class="priority-medium">Priority: Medium</p>
                        </div>
                        <div class="col-md-8">
                            <p>Painting and finishing work adds color, protection, and personality to interior and exterior surfaces.</p>
                            
                            <div class="service-details">
                                <div class="detail-item">
                                    <span class="detail-label">Request Frequency:</span>
                                    <span>70% of construction projects</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Avg. Completion Time:</span>
                                    <span>1 week</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Key Materials:</span>
                                    <span>Paint, primer, brushes, rollers</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Special Requirements:</span>
                                    <span>Surface preparation, proper ventilation</span>
                                </div>
                            </div>
                            
                            <h5 class="mt-4">Description</h5>
                            <p>Painting and finishing involves preparing surfaces by cleaning, sanding, and priming, then applying paint or other finishes. This includes interior walls, ceilings, trim, and exterior surfaces. Proper painting protects materials from moisture and wear while enhancing aesthetic appeal. Quality finishing work requires attention to detail, proper technique, and use of appropriate materials for each surface type.</p>
                        </div>
                    </div>
                </div>

                <!-- Cabinetry & Millwork -->
                <div class="tab-pane fade" id="cabinetry" role="tabpanel" aria-labelledby="cabinetry-tab">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="service-image">
                                [Cabinetry & Millwork Image]
                            </div>
                            <div class="service-icon">
                                🔨
                            </div>
                            <h3>Cabinetry & Millwork</h3>
                            <p class="priority-medium">Priority: Medium</p>
                        </div>
                        <div class="col-md-8">
                            <p>Cabinetry and millwork provide custom storage solutions and architectural details throughout the building.</p>
                            
                            <div class="service-details">
                                <div class="detail-item">
                                    <span class="detail-label">Request Frequency:</span>
                                    <span>65% of construction projects</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Avg. Completion Time:</span>
                                    <span>1-2 weeks</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Key Materials:</span>
                                    <span>Wood, plywood, hardware, finishes</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Special Requirements:</span>
                                    <span>Custom measurements, finish matching</span>
                                </div>
                            </div>
                            
                            <h5 class="mt-4">Description</h5>
                            <p>This service involves designing, building, and installing custom cabinets, shelves, and architectural woodwork. This includes kitchen cabinets, bathroom vanities, built-in bookshelves, and trim work. Quality cabinetry combines functionality with aesthetic appeal, providing efficient storage while enhancing the overall design. Custom millwork adds character and value to a space through detailed woodworking.</p>
                        </div>
                    </div>
                </div>

                <!-- Landscaping & Exterior -->
                <div class="tab-pane fade" id="landscaping" role="tabpanel" aria-labelledby="landscaping-tab">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="service-image">
                                [Landscaping & Exterior Image]
                            </div>
                            <div class="service-icon">
                                🌳
                            </div>
                            <h3>Landscaping & Exterior</h3>
                            <p class="priority-low">Priority: Low</p>
                        </div>
                        <div class="col-md-8">
                            <p>Landscaping and exterior work enhances curb appeal and creates functional outdoor spaces.</p>
                            
                            <div class="service-details">
                                <div class="detail-item">
                                    <span class="detail-label">Request Frequency:</span>
                                    <span>60% of construction projects</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Avg. Completion Time:</span>
                                    <span>2-3 weeks</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Key Materials:</span>
                                    <span>Plants, sod, pavers, irrigation</span>
                                </div>
                                <div class="detail-item">
                                    <span class="detail-label">Special Requirements:</span>
                                    <span>Grading, drainage planning</span>
                                </div>
                            </div>
                            
                            <h5 class="mt-4">Description</h5>
                            <p>Landscaping and exterior work includes grading, planting, installing irrigation systems, and creating hardscapes like patios and walkways. This work enhances the property's appearance, provides outdoor living spaces, and can improve energy efficiency through strategic planting. Quality landscaping considers soil conditions, climate, and maintenance requirements to create sustainable, attractive outdoor environments.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
--%>





















        <!-- Services Detail Section -->
        <section class="py-5 services-detail filter-row-button-section ">
            <div class="container">
                <!-- Service Tabs -->
                <ul class="nav nav-pills service-tabs mb-4 d-flex flex-wrap justify-content-center" id="serviceTabs" role="tablist">
                    <li class="nav-item me-2" role="presentation">
                        <button class="nav-link active" id="new-homes-tab" data-bs-toggle="pill" data-bs-target="#new-homes" type="button" role="tab">New Home Construction</button>
                    </li>
                    <li class="nav-ite me-2" role="presentation">
                        <button class="nav-link" id="renovations-tab" data-bs-toggle="pill" data-bs-target="#renovations" type="button" role="tab">Home Renovations</button>
                    </li>
                    <li class="nav-item me-2" role="presentation">
                        <button class="nav-link" id="extensions-tab" data-bs-toggle="pill" data-bs-target="#extensions" type="button" role="tab">Room Extensions</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="roofing-tab" data-bs-toggle="pill" data-bs-target="#roofing" type="button" role="tab">Roofing Solutions</button>
                    </li>
                </ul>

                <style>
      
        
        /* Mobile-specific styles */
        @media (max-width: 991.98px) {
            .service-tabs {
                display: flex;
                flex-wrap: nowrap;
                justify-content: flex-start;
            }
            
            .service-tabs .nav-item {
                flex: 0 0 auto;
            }
            
            .service-tabs .nav-link {
                font-size: 0.9rem;
                padding: 8px 16px;
            }
        }
        
        /* Content area styling */
        .tab-content {
            margin-top: 20px;
        }
        
        .tab-pane {
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 8px;
        }
        
        /* Fix for the typo in your HTML */
        .nav-ite {
            display: none; /* This will hide the element with the typo */
        }
    </style>
            </div>
        </section>
        <section class="py-5 services-detail  ">
            <div class="container">

                <!-- Tab Content -->
                <div class="tab-content" id="serviceTabsContent">
                    <!-- New Homes Service -->
                    <div class="tab-pane fade show active" id="new-homes" role="tabpanel">
                        <div class="service-header text-center mb-5">
                            <h2 class="fw-bold section-title">Custom Home Construction</h2>
                            <p class="lead">Building your dream home from the ground up</p>
                        </div>
                        <div class="service-body row">
                            <div class="service-image col-md-6">
                                <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="New Home Construction" class="img-fluid rounded">
                                <div class="image-overlay">
                                    <a href="portfolio.html#new-homes" class="btn btn-primary">View New Home Projects</a>
                                </div>
                            </div>
                            <div class="service-info col-md-6">
                                <h3>Complete Home Building Service</h3>
                                <p>We specialize in constructing beautiful, functional homes tailored to your village lifestyle. Our process includes:</p>
                                <ul>
                                    <li><i class="fas fa-check-circle"></i>Custom home design consultation</li>
                                    <li><i class="fas fa-check-circle"></i>Foundation and structural work</li>
                                    <li><i class="fas fa-check-circle"></i>Masonry and brickwork</li>
                                    <li><i class="fas fa-check-circle"></i>Roofing and waterproofing</li>
                                    <li><i class="fas fa-check-circle"></i>Electrical and plumbing systems</li>
                                    <li><i class="fas fa-check-circle"></i>Interior finishing</li>
                                </ul>
                                <div class="service-features row">
                                    <div class="feature col-md-4 text-center">
                                        <i class="fas fa-clock fa-2x mb-2"></i>
                                        <h4>Project Timeline</h4>
                                        <p>4-8 months depending on size and complexity</p>
                                    </div>
                                    <div class="feature col-md-4 text-center">
                                        <i class="fas fa-rupee-sign fa-2x mb-2"></i>
                                        <h4>Pricing</h4>
                                        <p>₹1,200-₹1,800 per sq.ft.</p>
                                    </div>
                                    <div class="feature col-md-4 text-center">
                                        <i class="fas fa-star fa-2x mb-2"></i>
                                        <h4>Warranty</h4>
                                        <p>5 years on structure, 2 years on finishes</p>
                                    </div>
                                </div>
                                <a href="/Contact" class="btn btn-primary btn-lg">Get a Quote for Your Home</a>
                            </div>
                        </div>
                    </div>

                    <!-- Renovations Service -->
                    <div class="tab-pane fade" id="renovations" role="tabpanel">
                        <div class="service-header text-center mb-5">
                            <h2 class="fw-bold section-title">Home Renovations</h2>
                            <p class="lead">Transforming your existing home with quality upgrades</p>
                        </div>
                        <div class="service-body row">
                            <div class="service-image col-md-6">
                                <img src="https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Home Renovation" class="img-fluid rounded">
                                <div class="image-overlay">
                                    <a href="portfolio.html#renovations" class="btn btn-primary">View Renovation Projects</a>
                                </div>
                            </div>
                            <div class="service-info col-md-6">
                                <h3>Complete Home Makeovers</h3>
                                <p>We breathe new life into older homes while preserving their character. Our renovation services include:</p>
                                <ul>
                                    <li><i class="fas fa-check-circle"></i>Kitchen and bathroom remodeling</li>
                                    <li><i class="fas fa-check-circle"></i>Flooring replacement</li>
                                    <li><i class="fas fa-check-circle"></i>Wall repairs and plastering</li>
                                    <li><i class="fas fa-check-circle"></i>Electrical and plumbing upgrades</li>
                                    <li><i class="fas fa-check-circle"></i>Roof repairs and replacement</li>
                                    <li><i class="fas fa-check-circle"></i>Exterior facelifts</li>
                                </ul>
                                <div class="service-features row">
                                    <div class="feature col-md-4 text-center">
                                        <i class="fas fa-clock fa-2x mb-2"></i>
                                        <h4>Project Timeline</h4>
                                        <p>2-6 weeks depending on scope</p>
                                    </div>
                                    <div class="feature col-md-4 text-center">
                                        <i class="fas fa-rupee-sign fa-2x mb-2"></i>
                                        <h4>Pricing</h4>
                                        <p>₹800-₹1,200 per sq.ft.</p>
                                    </div>
                                    <div class="feature col-md-4 text-center">
                                        <i class="fas fa-star fa-2x mb-2"></i>
                                        <h4>Warranty</h4>
                                        <p>2 years on all workmanship</p>
                                    </div>
                                </div>
                                <a href="/Contact" class="btn btn-primary btn-lg">Discuss Your Renovation</a>
                            </div>
                        </div>
                    </div>

                    <!-- Extensions Service -->
                    <div class="tab-pane fade" id="extensions" role="tabpanel">
                        <div class="service-header text-center mb-5">
                            <h2 class="fw-bold section-title">Room Extensions</h2>
                            <p class="lead">Adding space to your existing home</p>
                        </div>
                        <div class="service-body row">
                            <div class="service-image col-md-6">
                                <img src="https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Room Extension" class="img-fluid rounded">
                                <div class="image-overlay">
                                    <a href="portfolio.html#extensions" class="btn btn-primary">View Extension Projects</a>
                                </div>
                            </div>
                            <div class="service-info col-md-6">
                                <h3>Seamless Home Additions</h3>
                                <p>Expand your living space with our expert extension services:</p>
                                <ul>
                                    <li><i class="fas fa-check-circle"></i>Single and multi-room additions</li>
                                    <li><i class="fas fa-check-circle"></i>Second floor additions</li>
                                    <li><i class="fas fa-check-circle"></i>Veranda and porch extensions</li>
                                    <li><i class="fas fa-check-circle"></i>Kitchen expansions</li>
                                    <li><i class="fas fa-check-circle"></i>Garage conversions</li>
                                    <li><i class="fas fa-check-circle"></i>Seamless integration with existing structure</li>
                                </ul>
                                <div class="service-features row">
                                    <div class="feature col-md-4 text-center">
                                        <i class="fas fa-clock fa-2x mb-2"></i>
                                        <h4>Project Timeline</h4>
                                        <p>6-12 weeks depending on size</p>
                                    </div>
                                    <div class="feature col-md-4 text-center">
                                        <i class="fas fa-rupee-sign fa-2x mb-2"></i>
                                        <h4>Pricing</h4>
                                        <p>₹900-₹1,400 per sq.ft.</p>
                                    </div>
                                    <div class="feature col-md-4 text-center">
                                        <i class="fas fa-star fa-2x mb-2"></i>
                                        <h4>Warranty</h4>
                                        <p>3 years on structure</p>
                                    </div>
                                </div>
                                <a href="/Contact" class="btn btn-primary btn-lg">Plan Your Extension</a>
                            </div>
                        </div>
                    </div>

                    <!-- Roofing Service -->
                    <div class="tab-pane fade" id="roofing" role="tabpanel">
                        <div class="service-header text-center mb-5">
                            <h2 class="fw-bold section-title">Roofing Solutions</h2>
                            <p class="lead">Protecting your home from top to bottom</p>
                        </div>
                        <div class="service-body row">
                            <div class="service-image col-md-6">
                                <img src="https://images.unsplash.com/photo-1598030896797-9c9ca6b95b63?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Roofing Services" class="img-fluid rounded">
                                <div class="image-overlay">
                                    <a href="portfolio.html#roofing" class="btn btn-primary">View Roofing Projects</a>
                                </div>
                            </div>
                            <div class="service-info col-md-6">
                                <h3>Complete Roofing Services</h3>
                                <p>We provide comprehensive roofing solutions for all types of homes:</p>
                                <ul>
                                    <li><i class="fas fa-check-circle"></i>New roof installation</li>
                                    <li><i class="fas fa-check-circle"></i>Roof repairs and maintenance</li>
                                    <li><i class="fas fa-check-circle"></i>Leak detection and repair</li>
                                    <li><i class="fas fa-check-circle"></i>Roof waterproofing</li>
                                    <li><i class="fas fa-check-circle"></i>Roof insulation</li>
                                    <li><i class="fas fa-check-circle"></i>Gutter installation and repair</li>
                                </ul>
                                <div class="service-features row">
                                    <div class="feature col-md-4 text-center">
                                        <i class="fas fa-clock fa-2x mb-2"></i>
                                        <h4>Project Timeline</h4>
                                        <p>1-4 weeks depending on size</p>
                                    </div>
                                    <div class="feature col-md-4 text-center">
                                        <i class="fas fa-rupee-sign fa-2x mb-2"></i>
                                        <h4>Pricing</h4>
                                        <p>₹500-₹900 per sq.ft.</p>
                                    </div>
                                    <div class="feature col-md-4 text-center">
                                        <i class="fas fa-star fa-2x mb-2"></i>
                                        <h4>Warranty</h4>
                                        <p>5 years on materials and workmanship</p>
                                    </div>
                                </div>
                                <a href="/Contact" class="btn btn-primary btn-lg">Get Roofing Consultation</a>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </section>

        <!-- Service Process Section -->
        <section class="py-5 service-process ">
            <div class="container">
                <h2 class="section-title text-center mb-5">Our Construction Process</h2>
                <div class="process-steps">
                    <div class="step">
                        <div class="step-number">1</div>
                        <h3>Consultation</h3>
                        <p>We discuss your needs, budget, and vision for the project.</p>
                    </div>
                    <div class="step">
                        <div class="step-number">2</div>
                        <h3>Planning</h3>
                        <p>Detailed plans and material selection with our experts.</p>
                    </div>
                    <div class="step">
                        <div class="step-number">3</div>
                        <h3>Approval</h3>
                        <p>Finalizing designs and obtaining necessary permits.</p>
                    </div>
                    <div class="step">
                        <div class="step-number">4</div>
                        <h3>Construction</h3>
                        <p>Quality building with regular progress updates.</p>
                    </div>
                    <div class="step">
                        <div class="step-number">5</div>
                        <h3>Completion</h3>
                        <p>Final walkthrough and handover of your project.</p>
                    </div>
                </div>
            </div>
        </section>
    </section>

    <style>
        .service-tabs .nav-link {
            border: 1px solid #dee2e6;
            margin: 0 5px 10px;
            border-radius: 5px;
            color: #495057;
            font-weight: 500;
        }

            .service-tabs .nav-link.active {
                background-color: #0d6efd;
                color: white;
                border-color: #0d6efd;
            }

        .service-pane {
            display: none;
        }

            .service-pane.active {
                display: block;
            }

        .service-image {
            position: relative;
            overflow: hidden;
            border-radius: 8px;
            margin-bottom: 20px;
        }

            .service-image img {
                width: 100%;
                height: auto;
                transition: transform 0.3s;
            }

            .service-image:hover img {
                transform: scale(1.05);
            }

        .image-overlay {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(0, 0, 0, 0.7);
            padding: 15px;
            text-align: center;
            opacity: 0;
            transition: opacity 0.3s;
        }

        .service-image:hover .image-overlay {
            opacity: 1;
        }

        .service-info ul {
            list-style: none;
            padding-left: 0;
        }

        .service-info li {
            margin-bottom: 10px;
        }

        .service-info i {
            color: #0d6efd;
            margin-right: 10px;
        }

        .service-features {
            border-radius: 8px;
            padding: 20px;
            margin: 25px 0;
        }

        .process-steps {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin-top: 40px;
        }

        .step {
            flex: 1;
            min-width: 200px;
            text-align: center;
            padding: 20px;
            border-radius: 8px;
        }

        .step-number {
            width: 50px;
            height: 50px;
            background: #0d6efd;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 15px;
            font-size: 1.5rem;
            font-weight: bold;
        }

        .service-cta {
            background-color: #f8f9fa;
            padding: 60px 0;
            text-align: center;
            margin-top: 40px;
        }

        @media (max-width: 768px) {
            .service-tabs .nav-link {
                margin-bottom: 5px;
                display: block;
                width: 100%;
            }

            .process-steps {
                flex-direction: column;
            }
        }
    </style>
</asp:Content>

