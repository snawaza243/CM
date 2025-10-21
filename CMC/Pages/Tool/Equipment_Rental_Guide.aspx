
<%@ Page Title="Equipment_Rental_Guide" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Equipment_Rental_Guide.aspx.cs" Inherits="CMC.Pages.Tool.Equipment_Rental_Guide" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <main class="content">

 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            margin-bottom: 20px;
            border: none;
            overflow: hidden;
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.15);
        }
        
      
        
        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('https://images.unsplash.com/photo-1581092918056-0c4c3acd3789?ixlib=rb-4.0.3&auto=format&fit=crop&w=1500&q=80');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 100px 0;
            margin-bottom: 40px;
            text-align: center;
        }
        
     
        .equipment-card {
            position: relative;
            overflow: hidden;
            height: 250px;
        }
        
        .equipment-card img {
            object-fit: cover;
            height: 100%;
            width: 100%;
            transition: transform 0.5s ease;
        }
        
        .equipment-card:hover img {
            transform: scale(1.05);
        }
        
        .equipment-overlay {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: linear-gradient(transparent, rgba(0, 0, 0, 0.8));
            padding: 15px;
            color: white;
        }
        
        .equipment-title {
            font-weight: bold;
            font-size: 18px;
            margin-bottom: 5px;
        }
        
        .equipment-spec {
            font-size: 14px;
            opacity: 0.9;
        }
        
        .filter-btn {
            margin: 5px;
            border-radius: 20px;
            padding: 8px 20px;
        }
        
        .filter-btn.active {
            background-color: var(--primary);
            border-color: var(--primary);
        }
        
        .price-tag {
            font-weight: bold;
            color: var(--success);
            font-size: 18px;
        }
        
        .rental-badge {
            position: absolute;
            top: 10px;
            right: 10px;
            z-index: 10;
        }
        
        .vendor-card {
            border-left: 4px solid var(--primary);
        }
        
        .vendor-rating {
            color: #f39c12;
        }
        
        .comparison-table th {
            background-color: var(--light);
        }
        
        .city-selector {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 20px;
        }
        
        .city-pill {
            padding: 8px 20px;
            background-color: white;
            border: 1px solid #dee2e6;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .city-pill.active, .city-pill:hover {
            background-color: var(--primary);
            color: white;
        }
        
        .equipment-detail-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: var(--light);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            color: var(--primary);
        }
        
        @media (max-width: 768px) {
            .equipment-card {
                height: 200px;
            }
            
            .hero-section {
                padding: 60px 0;
            }
            
            .city-selector {
                justify-content: center;
            }
        }
    </style> 

    <!-- Hero Section -->
    <div class="hero-section">
        <div class="container">
            <h1 class="display-4 fw-bold">Equipment Rental Guide</h1>
            <p class="lead">Find and compare construction equipment rental options across India</p>
            <div class="mt-4">
                <div class="input-group mb-3 mx-auto" style="max-width: 500px;">
                    <input type="text" class="form-control" placeholder="Search for equipment, brands, or vendors..." id="search-input">
                    <button class="btn btn-primary" type="button" id="search-btn">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container">
        <!-- City Selector -->
        <div class="row mb-4">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Select Your City</h5>
                        <p class="text-muted">Find equipment available in your location</p>
                        <div class="city-selector">
                            <div class="city-pill active" data-city="all">All Cities</div>
                            <div class="city-pill" data-city="mumbai">Mumbai</div>
                            <div class="city-pill" data-city="delhi">Delhi</div>
                            <div class="city-pill" data-city="bangalore">Bangalore</div>
                            <div class="city-pill" data-city="chennai">Chennai</div>
                            <div class="city-pill" data-city="hyderabad">Hyderabad</div>
                            <div class="city-pill" data-city="kolkata">Kolkata</div>
                            <div class="city-pill" data-city="pune">Pune</div>
                            <div class="city-pill" data-city="ahmedabad">Ahmedabad</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Filter Section -->
        <div class="row mb-4">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Filter Equipment</h5>
                        <div class="d-flex flex-wrap">
                            <button class="btn btn-outline-primary filter-btn active" data-filter="all">All Equipment</button>
                            <button class="btn btn-outline-primary filter-btn" data-filter="earthmoving">Earthmoving</button>
                            <button class="btn btn-outline-primary filter-btn" data-filter="concrete">Concrete</button>
                            <button class="btn btn-outline-primary filter-btn" data-filter="lifting">Lifting</button>
                            <button class="btn btn-outline-primary filter-btn" data-filter="road">Road Construction</button>
                            <button class="btn btn-outline-primary filter-btn" data-filter="material">Material Handling</button>
                            <button class="btn btn-outline-primary filter-btn" data-filter="popular">Most Popular</button>
                            <button class="btn btn-outline-primary filter-btn" data-filter="discount">Special Offers</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Equipment Gallery -->
        <div class="row" id="equipment-gallery">
            <!-- Equipment will be loaded here -->
        </div>
        
        <!-- Loading Indicator -->
        <div class="row mt-4">
            <div class="col-12 text-center">
                <div id="loading-indicator" class="d-none">
                    <div class="spinner-border text-primary" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                    <p class="mt-2">Loading more equipment...</p>
                </div>
                <button class="btn btn-primary mt-3" id="load-more-btn">Load More Equipment</button>
            </div>
        </div>
    </div> 

    <!-- Equipment Detail Modal -->
    <div class="modal fade" id="equipmentDetailModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="equipment-detail-title">Equipment Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <img src="" alt="Equipment image" class="img-fluid rounded" id="equipment-detail-img">
                        </div>
                        <div class="col-md-6">
                            <h4 id="equipment-detail-name"></h4>
                            <div class="price-tag mb-3" id="equipment-detail-price"></div>
                            <div class="d-flex align-items-center mb-2">
                                <div class="equipment-detail-icon">
                                    <i class="fas fa-hard-hat"></i>
                                </div>
                                <div>
                                    <strong>Category:</strong> <span id="equipment-detail-category"></span>
                                </div>
                            </div>
                            <div class="d-flex align-items-center mb-2">
                                <div class="equipment-detail-icon">
                                    <i class="fas fa-weight-hanging"></i>
                                </div>
                                <div>
                                    <strong>Capacity:</strong> <span id="equipment-detail-capacity"></span>
                                </div>
                            </div>
                            <div class="d-flex align-items-center mb-2">
                                <div class="equipment-detail-icon">
                                    <i class="fas fa-bolt"></i>
                                </div>
                                <div>
                                    <strong>Power:</strong> <span id="equipment-detail-power"></span>
                                </div>
                            </div>
                            <div class="d-flex align-items-center mb-2">
                                <div class="equipment-detail-icon">
                                    <i class="fas fa-map-marker-alt"></i>
                                </div>
                                <div>
                                    <strong>Available in:</strong> <span id="equipment-detail-cities"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <h5>Specifications</h5>
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <tbody id="equipment-detail-specs">
                                <!-- Specifications will be loaded here -->
                            </tbody>
                        </table>
                    </div>
                    
                    <h5 class="mt-4">Rental Providers</h5>
                    <div id="equipment-detail-vendors">
                        <!-- Vendors will be loaded here -->
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="contact-rental-btn">Contact Rental Provider</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Comparison Modal -->
    <div class="modal fade" id="comparisonModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Compare Equipment</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="table-responsive">
                        <table class="table table-bordered comparison-table">
                            <thead>
                                <tr>
                                    <th>Specification</th>
                                    <!-- Equipment headers will be loaded here -->
                                </tr>
                            </thead>
                            <tbody id="comparison-table-body">
                                <!-- Comparison data will be loaded here -->
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Contact Modal -->
    <div class="modal fade" id="contactModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Contact Rental Provider</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="contact-form">
                        <div class="mb-3">
                            <label for="contact-name" class="form-label">Your Name</label>
                            <input type="text" class="form-control" id="contact-name" required>
                        </div>
                        <div class="mb-3">
                            <label for="contact-phone" class="form-label">Phone Number</label>
                            <input type="tel" class="form-control" id="contact-phone" required>
                        </div>
                        <div class="mb-3">
                            <label for="contact-email" class="form-label">Email Address</label>
                            <input type="email" class="form-control" id="contact-email">
                        </div>
                        <div class="mb-3">
                            <label for="contact-message" class="form-label">Message</label>
                            <textarea class="form-control" id="contact-message" rows="3" required>I'm interested in renting this equipment. Please share more details.</textarea>
                        </div>
                        <div class="mb-3">
                            <label for="rental-period" class="form-label">Rental Period</label>
                            <select class="form-select" id="rental-period">
                                <option value="1-day">1 Day</option>
                                <option value="1-week">1 Week</option>
                                <option value="2-weeks">2 Weeks</option>
                                <option value="1-month">1 Month</option>
                                <option value="2-months">2 Months</option>
                                <option value="3-months">3+ Months</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" id="send-inquiry-btn">Send Inquiry</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            // Sample equipment data for Indian market
            const equipmentData = [
                {
                    id: 1,
                    name: "JCB 3DX Backhoe Loader",
                    category: "earthmoving",
                    image: "https://images.unsplash.com/photo-1574359173086-6a84c9764886?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80",
                    description: "Versatile backhoe loader for multiple construction applications. Most popular equipment in Indian construction industry.",
                    price: "₹18,000 - ₹22,000 per day",
                    capacity: "1.2 cum bucket capacity",
                    power: "76 HP",
                    cities: ["mumbai", "delhi", "bangalore", "chennai", "hyderabad", "pune"],
                    specs: {
                        "Brand": "JCB",
                        "Model": "3DX",
                        "Bucket Capacity": "1.2 cum",
                        "Engine Power": "76 HP",
                        "Max. Digging Depth": "4.6 m",
                        "Max. Loading Height": "3.9 m",
                        "Fuel Type": "Diesel"
                    },
                    vendors: [
                        {
                            name: "GMMCO Equipment Rentals",
                            rating: 4.5,
                            phone: "+91 98765 43210",
                            price: "₹19,500/day",
                            location: "Mumbai, Delhi, Bangalore"
                        },
                        {
                            name: "Srei Equipment Finance",
                            rating: 4.2,
                            phone: "+91 97654 32109",
                            price: "₹18,000/day",
                            location: "Chennai, Hyderabad"
                        }
                    ],
                    tags: ["popular", "earthmoving", "jcb"]
                },
                {
                    id: 2,
                    name: "Caterpillar D6 Dozer",
                    category: "earthmoving",
                    image: "https://images.unsplash.com/photo-1621494933108-8c6c751a022e?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80",
                    description: "Powerful bulldozer for earthmoving and grading operations. Suitable for large construction projects.",
                    price: "₹45,000 - ₹55,000 per day",
                    capacity: "4.2 cum blade capacity",
                    power: "165 HP",
                    cities: ["delhi", "mumbai", "bangalore", "kolkata"],
                    specs: {
                        "Brand": "Caterpillar",
                        "Model": "D6",
                        "Blade Capacity": "4.2 cum",
                        "Engine Power": "165 HP",
                        "Operating Weight": "18,500 kg",
                        "Track Length": "2,920 mm",
                        "Fuel Type": "Diesel"
                    },
                    vendors: [
                        {
                            name: "TIL Limited",
                            rating: 4.7,
                            phone: "+91 98765 12345",
                            price: "₹52,000/day",
                            location: "Delhi, Mumbai"
                        },
                        {
                            name: "L&T Construction Equipment",
                            rating: 4.6,
                            phone: "+91 97654 12340",
                            price: "₹48,500/day",
                            location: "Bangalore, Kolkata"
                        }
                    ],
                    tags: ["earthmoving", "caterpillar"]
                },
                {
                    id: 3,
                    name: "Schwing Stetter Concrete Pump",
                    category: "concrete",
                    image: "https://images.unsplash.com/photo-1611273426858-450d8e3c9fce?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80",
                    description: "High-capacity concrete pump for high-rise construction projects. German engineering with Indian manufacturing.",
                    price: "₹35,000 - ₹45,000 per day",
                    capacity: "60-90 cum/hour",
                    power: "200 HP",
                    cities: ["mumbai", "delhi", "bangalore", "chennai", "pune"],
                    specs: {
                        "Brand": "Schwing Stetter",
                        "Model": "CP 30",
                        "Output Capacity": "90 cum/hour",
                        "Engine Power": "200 HP",
                        "Max. Vertical Reach": "150 m",
                        "Max. Horizontal Reach": "120 m",
                        "Fuel Type": "Diesel"
                    },
                    vendors: [
                        {
                            name: "Schwing Stetter India",
                            rating: 4.8,
                            phone: "+91 98765 56789",
                            price: "₹42,000/day",
                            location: "Mumbai, Delhi, Bangalore"
                        },
                        {
                            name: "Sany India",
                            rating: 4.4,
                            phone: "+91 97654 56780",
                            price: "₹38,500/day",
                            location: "Chennai, Pune"
                        }
                    ],
                    tags: ["concrete", "discount"]
                },
                {
                    id: 4,
                    name: "Tata Hitachi EX200 Excavator",
                    category: "earthmoving",
                    image: "https://images.unsplash.com/photo-1594708767775-d363c6bb5a56?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80",
                    description: "Reliable and efficient excavator for digging and earthmoving tasks. Fuel-efficient Japanese technology.",
                    price: "₹25,000 - ₹32,000 per day",
                    capacity: "0.8 cum bucket capacity",
                    power: "110 HP",
                    cities: ["delhi", "mumbai", "bangalore", "hyderabad", "ahmedabad"],
                    specs: {
                        "Brand": "Tata Hitachi",
                        "Model": "EX200",
                        "Bucket Capacity": "0.8 cum",
                        "Engine Power": "110 HP",
                        "Max. Digging Depth": "6.6 m",
                        "Operating Weight": "19,500 kg",
                        "Fuel Type": "Diesel"
                    },
                    vendors: [
                        {
                            name: "Tata Hitachi Construction Machinery",
                            rating: 4.6,
                            phone: "+91 98765 98765",
                            price: "₹28,500/day",
                            location: "Delhi, Mumbai, Bangalore"
                        },
                        {
                            name: "ACE Construction Equipment",
                            rating: 4.3,
                            phone: "+91 97654 98760",
                            price: "₹26,000/day",
                            location: "Hyderabad, Ahmedabad"
                        }
                    ],
                    tags: ["earthmoving", "popular"]
                },
                {
                    id: 5,
                    name: "Liebherr Tower Crane",
                    category: "lifting",
                    image: "https://images.unsplash.com/photo-1591522810914-78c6353c5c08?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80",
                    description: "High-capacity tower crane for high-rise construction projects. German precision engineering.",
                    price: "₹60,000 - ₹75,000 per day",
                    capacity: "8-12 tons lifting capacity",
                    power: "Electric",
                    cities: ["mumbai", "delhi", "bangalore", "chennai"],
                    specs: {
                        "Brand": "Liebherr",
                        "Model": "150 EC-B",
                        "Max. Lifting Capacity": "12 tons",
                        "Max. Jib Length": "50 m",
                        "Max. Height": "150 m",
                        "Power Source": "Electric",
                        "Control System": "Radio Remote"
                    },
                    vendors: [
                        {
                            name: "Liebherr India",
                            rating: 4.9,
                            phone: "+91 98765 11111",
                            price: "₹72,000/day",
                            location: "Mumbai, Delhi"
                        },
                        {
                            name: "Sanghvi Movers",
                            rating: 4.7,
                            phone: "+91 97654 11110",
                            price: "₹68,500/day",
                            location: "Bangalore, Chennai"
                        }
                    ],
                    tags: ["lifting"]
                },
                {
                    id: 6,
                    name: "Wirtgen Road Paver",
                    category: "road",
                    image: "https://images.unsplash.com/photo-1611251432587-0dea834c2322?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80",
                    description: "Advanced road paver for asphalt laying with precision leveling. Essential for highway construction.",
                    price: "₹40,000 - ₹50,000 per day",
                    capacity: "6 m paving width",
                    power: "125 HP",
                    cities: ["delhi", "mumbai", "bangalore", "kolkata", "pune"],
                    specs: {
                        "Brand": "Wirtgen",
                        "Model": "Super 1300",
                        "Paving Width": "2.5-6 m",
                        "Engine Power": "125 HP",
                        "Paving Speed": "0-20 m/min",
                        "Hopper Capacity": "10 tons",
                        "Fuel Type": "Diesel"
                    },
                    vendors: [
                        {
                            name: "Wirtgen India",
                            rating: 4.7,
                            phone: "+91 98765 22222",
                            price: "₹47,500/day",
                            location: "Delhi, Mumbai"
                        },
                        {
                            name: "Apollo Inffratech",
                            rating: 4.5,
                            phone: "+91 97654 22220",
                            price: "₹45,000/day",
                            location: "Bangalore, Kolkata, Pune"
                        }
                    ],
                    tags: ["road", "discount"]
                },
                {
                    id: 7,
                    name: "Hyundai HL757 Wheel Loader",
                    category: "material",
                    image: "https://images.unsplash.com/photo-1591522811045-e0f84bf9bb67?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80",
                    description: "Versatile wheel loader for material handling at construction sites. Korean reliability with Indian value.",
                    price: "₹20,000 - ₹25,000 per day",
                    capacity: "1.7 cum bucket capacity",
                    power: "95 HP",
                    cities: ["mumbai", "delhi", "chennai", "hyderabad", "ahmedabad"],
                    specs: {
                        "Brand": "Hyundai",
                        "Model": "HL757",
                        "Bucket Capacity": "1.7 cum",
                        "Engine Power": "95 HP",
                        "Breakout Force": "85 kN",
                        "Operating Weight": "7,200 kg",
                        "Fuel Type": "Diesel"
                    },
                    vendors: [
                        {
                            name: "Hyundai Construction Equipment India",
                            rating: 4.4,
                            phone: "+91 98765 33333",
                            price: "₹23,000/day",
                            location: "Mumbai, Delhi, Chennai"
                        },
                        {
                            name: "ESCORTS Construction Equipment",
                            rating: 4.2,
                            phone: "+91 97654 33330",
                            price: "₹21,500/day",
                            location: "Hyderabad, Ahmedabad"
                        }
                    ],
                    tags: ["material", "popular"]
                },
                {
                    id: 8,
                    name: "Mahindra Construction Equipment",
                    category: "earthmoving",
                    image: "https://images.unsplash.com/photo-1611273426858-450d8e3c9fce?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80",
                    description: "Indian-made earthmoving equipment with excellent after-sales support across the country.",
                    price: "₹16,000 - ₹20,000 per day",
                    capacity: "0.7 cum bucket capacity",
                    power: "80 HP",
                    cities: ["mumbai", "delhi", "bangalore", "chennai", "kolkata", "pune", "ahmedabad", "hyderabad"],
                    specs: {
                        "Brand": "Mahindra",
                        "Model": "Earthmaster",
                        "Bucket Capacity": "0.7 cum",
                        "Engine Power": "80 HP",
                        "Max. Digging Depth": "4.2 m",
                        "Operating Weight": "6,800 kg",
                        "Fuel Type": "Diesel"
                    },
                    vendors: [
                        {
                            name: "Mahindra Construction Equipment",
                            rating: 4.3,
                            phone: "+91 98765 44444",
                            price: "₹18,500/day",
                            location: "All Major Cities"
                        },
                        {
                            name: "Earthmoving Equipment Rentals",
                            rating: 4.1,
                            phone: "+91 97654 44440",
                            price: "₹17,000/day",
                            location: "Mumbai, Delhi, Bangalore"
                        }
                    ],
                    tags: ["earthmoving", "popular", "discount"]
                }
            ];

            // Initialize variables
            let currentFilter = 'all';
            let currentCity = 'all';
            let currentSearch = '';
            let comparisonItems = [];

            // Initialize the app
            function init() {
                loadEquipment();
                setupFilterButtons();
                setupCitySelector();
                setupSearch();
            }

            // Load equipment into the gallery
            function loadEquipment() {
                const gallery = $('#equipment-gallery');
                gallery.empty();
                
                let filteredEquipment = filterEquipment();
                
                if (filteredEquipment.length === 0) {
                    gallery.append('<div class="col-12 text-center py-5"><i class="fas fa-tools fa-3x text-muted mb-3"></i><h5 class="text-muted">No equipment found</h5><p>Try changing your filters or search term</p></div>');
                    return;
                }
                
                filteredEquipment.forEach(equipment => {
                    const isPopular = equipment.tags.includes('popular');
                    const hasDiscount = equipment.tags.includes('discount');
                    
                    const equipmentCard = `
                        <div class="col-md-6 col-lg-4 col-xl-3 mb-4 equipment-item" data-category="${equipment.category}" data-cities="${equipment.cities.join(',')}" data-id="${equipment.id}">
                            <div class="card h-100">
                                <div class="equipment-card">
                                    <img src="${equipment.image}" class="card-img-top" alt="${equipment.name}">
                                    <div class="equipment-overlay">
                                        <div class="equipment-title">${equipment.name}</div>
                                        <div class="equipment-spec">${equipment.capacity}</div>
                                    </div>
                                    ${isPopular ? '<span class="rental-badge badge bg-warning"><i class="fas fa-star me-1"></i>Popular</span>' : ''}
                                    ${hasDiscount ? '<span class="rental-badge badge bg-success"><i class="fas fa-tag me-1"></i>Discount</span>' : ''}
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">${equipment.name}</h5>
                                    <p class="card-text">${equipment.description.substring(0, 80)}...</p>
                                    <div class="price-tag mb-2">${equipment.price}</div>
                                    <div class="d-flex">
                                        <span class="badge bg-light text-dark me-2">${equipment.category}</span>
                                        <span class="badge bg-light text-dark"><i class="fas fa-map-marker-alt me-1"></i>${equipment.cities.length} cities</span>
                                    </div>
                                </div>
                                <div class="card-footer bg-transparent d-flex justify-content-between">
                                    <button class="btn btn-sm btn-outline-primary view-equipment" data-id="${equipment.id}">Details</button>
                                    <button class="btn btn-sm btn-outline-success compare-equipment" data-id="${equipment.id}">Compare</button>
                                </div>
                            </div>
                        </div>
                    `;
                    
                    gallery.append(equipmentCard);
                });
            }
            
            // Filter equipment based on current filter, city and search
            function filterEquipment() {
                let filtered = equipmentData;
                
                // Apply category filter
                if (currentFilter !== 'all') {
                    if (currentFilter === 'popular') {
                        filtered = filtered.filter(equipment => equipment.tags.includes('popular'));
                    } else if (currentFilter === 'discount') {
                        filtered = filtered.filter(equipment => equipment.tags.includes('discount'));
                    } else {
                        filtered = filtered.filter(equipment => equipment.category === currentFilter);
                    }
                }
                
                // Apply city filter
                if (currentCity !== 'all') {
                    filtered = filtered.filter(equipment => equipment.cities.includes(currentCity));
                }
                
                // Apply search filter
                if (currentSearch) {
                    const searchTerm = currentSearch.toLowerCase();
                    filtered = filtered.filter(equipment => 
                        equipment.name.toLowerCase().includes(searchTerm) ||
                        equipment.description.toLowerCase().includes(searchTerm) ||
                        equipment.tags.some(tag => tag.toLowerCase().includes(searchTerm)) ||
                        Object.values(equipment.specs).some(spec => spec.toLowerCase().includes(searchTerm))
                    );
                }
                
                return filtered;
            }
            
            // Set up filter buttons
            function setupFilterButtons() {
                $('.filter-btn').on('click', function() {
                    $('.filter-btn').removeClass('active');
                    $(this).addClass('active');
                    
                    currentFilter = $(this).data('filter');
                    loadEquipment();
                });
            }
            
            // Set up city selector
            function setupCitySelector() {
                $('.city-pill').on('click', function() {
                    $('.city-pill').removeClass('active');
                    $(this).addClass('active');
                    
                    currentCity = $(this).data('city');
                    loadEquipment();
                });
            }
            
            // Set up search functionality
            function setupSearch() {
                $('#search-btn').on('click', function() {
                    currentSearch = $('#search-input').val();
                    loadEquipment();
                });
                
                $('#search-input').on('keyup', function(e) {
                    if (e.key === 'Enter') {
                        currentSearch = $('#search-input').val();
                        loadEquipment();
                    }
                });
            }
            
            // Show equipment details
            function showEquipmentDetails(equipmentId) {
                const equipment = equipmentData.find(e => e.id === equipmentId);
                if (!equipment) return;
                
                // Populate modal
                $('#equipment-detail-title').text(equipment.name);
                $('#equipment-detail-name').text(equipment.name);
                $('#equipment-detail-img').attr('src', equipment.image);
                $('#equipment-detail-price').text(equipment.price);
                $('#equipment-detail-category').text(equipment.category);
                $('#equipment-detail-capacity').text(equipment.capacity);
                $('#equipment-detail-power').text(equipment.power);
                $('#equipment-detail-cities').text(equipment.cities.map(city => city.charAt(0).toUpperCase() + city.slice(1)).join(', '));
                
                // Populate specifications
                const specsHtml = Object.entries(equipment.specs).map(([key, value]) => `
                    <tr>
                        <td width="30%"><strong>${key}</strong></td>
                        <td>${value}</td>
                    </tr>
                `).join('');
                $('#equipment-detail-specs').html(specsHtml);
                
                // Populate vendors
                const vendorsHtml = equipment.vendors.map(vendor => `
                    <div class="card vendor-card mb-3">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center">
                                <h6 class="card-title mb-0">${vendor.name}</h6>
                                <div class="vendor-rating">
                                    ${generateStarRating(vendor.rating)}
                                    <span class="ms-1">${vendor.rating}</span>
                                </div>
                            </div>
                            <p class="card-text mb-1"><i class="fas fa-phone-alt me-2"></i>${vendor.phone}</p>
                            <p class="card-text mb-1"><i class="fas fa-map-marker-alt me-2"></i>${vendor.location}</p>
                            <div class="d-flex justify-content-between align-items-center mt-2">
                                <span class="price-tag">${vendor.price}</span>
                                <button class="btn btn-sm btn-outline-primary contact-vendor" data-vendor='${JSON.stringify(vendor).replace(/'/g, "&#39;")}' data-equipment="${equipment.name}">
                                    <i class="fas fa-envelope me-1"></i>Contact
                                </button>
                            </div>
                        </div>
                    </div>
                `).join('');
                $('#equipment-detail-vendors').html(vendorsHtml);
                
                // Set equipment ID for contact button
                $('#contact-rental-btn').data('id', equipmentId);
                
                // Show modal
                $('#equipmentDetailModal').modal('show');
            }
            
            // Generate star rating HTML
            function generateStarRating(rating) {
                let stars = '';
                for (let i = 1; i <= 5; i++) {
                    if (i <= Math.floor(rating)) {
                        stars += '<i class="fas fa-star"></i>';
                    } else if (i === Math.ceil(rating) && rating % 1 >= 0.5) {
                        stars += '<i class="fas fa-star-half-alt"></i>';
                    } else {
                        stars += '<i class="far fa-star"></i>';
                    }
                }
                return stars;
            }
            
            // Add to comparison
            function addToComparison(equipmentId) {
                const equipment = equipmentData.find(e => e.id === equipmentId);
                if (!equipment) return;
                
                // Check if already in comparison
                if (!comparisonItems.some(item => item.id === equipmentId)) {
                    if (comparisonItems.length >= 4) {
                        showToast('Maximum 4 items can be compared at once', 'warning');
                        return;
                    }
                    
                    comparisonItems.push(equipment);
                    showToast('Added to comparison', 'success');
                } else {
                    showToast('Already in comparison', 'info');
                }
            }
            
            // Show comparison
            function showComparison() {
                if (comparisonItems.length === 0) {
                    showToast('Add items to comparison first', 'warning');
                    return;
                }
                
                const tableHead = $('#comparison-modal thead tr');
                const tableBody = $('#comparison-table-body');
                
                // Clear previous data
                tableHead.html('<th>Specification</th>');
                tableBody.empty();
                
                // Add equipment headers
                comparisonItems.forEach(equipment => {
                    tableHead.append(`<th>${equipment.name}</th>`);
                });
                
                // Add rows for each specification
                const allSpecs = new Set();
                comparisonItems.forEach(equipment => {
                    Object.keys(equipment.specs).forEach(spec => allSpecs.add(spec));
                });
                
                allSpecs.forEach(spec => {
                    const row = $('<tr></tr>');
                    row.append(`<td><strong>${spec}</strong></td>`);
                    
                    comparisonItems.forEach(equipment => {
                        const value = equipment.specs[spec] || 'N/A';
                        row.append(`<td>${value}</td>`);
                    });
                    
                    tableBody.append(row);
                });
                
                // Add price row
                const priceRow = $('<tr></tr>');
                priceRow.append('<td><strong>Rental Price</strong></td>');
                comparisonItems.forEach(equipment => {
                    priceRow.append(`<td class="price-tag">${equipment.price}</td>`);
                });
                tableBody.append(priceRow);
                
                // Show modal
                $('#comparisonModal').modal('show');
            }
            
            // Show contact form
            function showContactForm(vendor, equipmentName) {
                // Pre-fill message with equipment details
                const message = `I'm interested in renting ${equipmentName}. Please share availability and terms.`;
                $('#contact-message').val(message);
                
                // Set vendor name as title
                $('.modal-title').text(`Contact ${vendor.name}`);
                
                // Show modal
                $('#contactModal').modal('show');
            }
            
            // Send inquiry
            function sendInquiry() {
                const name = $('#contact-name').val();
                const phone = $('#contact-phone').val();
                const email = $('#contact-email').val();
                const message = $('#contact-message').val();
                const period = $('#rental-period').val();
                
                // Simple validation
                if (!name || !phone) {
                    showToast('Please fill required fields', 'warning');
                    return;
                }
                
                // In a real app, this would send data to a server
                showToast('Inquiry sent successfully! Vendor will contact you soon.', 'success');
                
                // Close modal
                $('#contactModal').modal('hide');
                
                // Reset form
                $('#contact-form')[0].reset();
            }
            
            // Show toast notification
            function showToast(message, type) {
                // Remove existing toasts
                $('.toast').remove();
                
                const toast = $(`
                    <div class="toast align-items-center text-white bg-${type === 'success' ? 'success' : type === 'warning' ? 'warning' : 'info'} border-0 position-fixed bottom-0 end-0 m-3" role="alert" aria-live="assertive" aria-atomic="true">
                        <div class="d-flex">
                            <div class="toast-body">
                                ${message}
                            </div>
                            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                        </div>
                    </div>
                `);
                
                $('body').append(toast);
                
                const bsToast = new bootstrap.Toast(toast);
                bsToast.show();
            }
            
            // Event delegation for equipment actions
            $(document).on('click', '.view-equipment', function() {
                const equipmentId = parseInt($(this).data('id'));
                showEquipmentDetails(equipmentId);
            });
            
            $(document).on('click', '.compare-equipment', function() {
                const equipmentId = parseInt($(this).data('id'));
                addToComparison(equipmentId);
            });
            
            $(document).on('click', '.contact-vendor', function() {
                const vendor = JSON.parse($(this).data('vendor').replace(/&#39;/g, "'"));
                const equipmentName = $(this).data('equipment');
                showContactForm(vendor, equipmentName);
            });
            
            $(document).on('click', '#contact-rental-btn', function() {
                const equipmentId = parseInt($(this).data('id'));
                const equipment = equipmentData.find(e => e.id === equipmentId);
                if (!equipment) return;
                
                // Show contact form with first vendor
                showContactForm(equipment.vendors[0], equipment.name);
            });
            
            $(document).on('click', '#send-inquiry-btn', function() {
                sendInquiry();
            });
            
            // Load more equipment (simulated)
            $('#load-more-btn').on('click', function() {
                $(this).prop('disabled', true);
                $('#loading-indicator').removeClass('d-none');
                
                // Simulate loading
                setTimeout(() => {
                    // In a real app, this would load more data from a server
                    $('#loading-indicator').addClass('d-none');
                    $(this).prop('disabled', false);
                    
                    showToast('No more equipment to load', 'info');
                }, 1500);
            });
            
            // Initialize the app
            init();
        });
    </script> 
</main>

</asp:Content>
 