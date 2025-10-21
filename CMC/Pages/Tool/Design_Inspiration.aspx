<%@ Page Title="Design_Inspiration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Design_Inspiration.aspx.cs" Inherits="CMC.Pages.Tool.Design_Inspiration" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <main class="content">


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        :root { 
        }

        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

         

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

        .btn-primary {
            background-color: var(--primary);
            border-color: var(--primary);
        }

            .btn-primary:hover {
                background-color: var(--secondary);
                border-color: var(--secondary);
            }

        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('https://images.unsplash.com/photo-1588880331179-bc9b93a8cb5e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1500&q=80');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 100px 0;
            margin-bottom: 40px;
            text-align: center;
        }

        .footer {
            background-color: var(--dark);
            color: white;
            padding: 30px 0;
            margin-top: 40px;
        }

        .design-card {
            position: relative;
            overflow: hidden;
            height: 300px;
        }

            .design-card img {
                object-fit: cover;
                height: 100%;
                width: 100%;
                transition: transform 0.5s ease;
            }

            .design-card:hover img {
                transform: scale(1.05);
            }

        .design-overlay {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: linear-gradient(transparent, rgba(0, 0, 0, 0.8));
            padding: 20px;
            color: white;
            opacity: 0;
            transition: opacity 0.3s ease;
            transform: translateY(20px);
        }

        .design-card:hover .design-overlay {
            opacity: 1;
            transform: translateY(0);
        }

        .design-title {
            font-weight: bold;
            font-size: 18px;
            margin-bottom: 5px;
        }

        .design-category {
            font-size: 14px;
            opacity: 0.8;
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

        .inspiration-card {
            border: none;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
        }

            .inspiration-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            }

        .inspiration-img {
            height: 200px;
            object-fit: cover;
        }

        .inspiration-tags {
            margin-top: 10px;
        }

        .tag {
            display: inline-block;
            background-color: var(--light);
            padding: 3px 10px;
            border-radius: 15px;
            font-size: 12px;
            margin-right: 5px;
            margin-bottom: 5px;
            color: var(--dark);
        }

        .detail-modal-img {
            width: 100%;
            border-radius: 10px;
            margin-bottom: 15px;
        }

        .saved-items-indicator {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 1000;
            background-color: var(--primary);
            color: white;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            cursor: pointer;
        }

        .category-header {
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
            color: white;
        }

        .category-residential {
            background: linear-gradient(45deg, #3498db, #2c3e50);
        }

        .category-commercial {
            background: linear-gradient(45deg, #e74c3c, #c0392b);
        }

        .category-interior {
            background: linear-gradient(45deg, #27ae60, #16a085);
        }

        .category-exterior {
            background: linear-gradient(45deg, #f39c12, #d35400);
        }

        @media (max-width: 768px) {
            .design-card {
                height: 250px;
            }

            .hero-section {
                padding: 60px 0;
            }
        }
    </style>

    <!-- Hero Section -->
    <div class="hero-section">
        <div class="container">
            <h1 class="display-4 fw-bold">Design Inspiration Gallery</h1>
            <p class="lead">Browse home, office, and interior design concepts for your next project</p>
            <div class="mt-4">
                <div class="input-group mb-3 mx-auto" style="max-width: 500px;">
                    <input type="text" class="form-control" placeholder="Search for designs, styles, or materials..." id="search-input">
                    <button class="btn btn-primary" type="button" id="search-btn">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container">
        <!-- Filter Section -->
        <div class="row mb-4">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Filter Designs</h5>
                        <div class="d-flex flex-wrap">
                            <button class="btn btn-outline-primary filter-btn active" data-filter="all">All Designs</button>
                            <button class="btn btn-outline-primary filter-btn" data-filter="residential">Residential</button>
                            <button class="btn btn-outline-primary filter-btn" data-filter="commercial">Commercial</button>
                            <button class="btn btn-outline-primary filter-btn" data-filter="interior">Interior</button>
                            <button class="btn btn-outline-primary filter-btn" data-filter="exterior">Exterior</button>
                            <button class="btn btn-outline-primary filter-btn" data-filter="modern">Modern</button>
                            <button class="btn btn-outline-primary filter-btn" data-filter="traditional">Traditional</button>
                            <button class="btn btn-outline-primary filter-btn" data-filter="saved">Saved Ideas</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Design Gallery -->
        <div class="row" id="design-gallery">
            <!-- Designs will be loaded here -->
        </div>

        <!-- Loading Indicator -->
        <div class="row mt-4">
            <div class="col-12 text-center">
                <div id="loading-indicator" class="d-none">
                    <div class="spinner-border text-primary" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                    <p class="mt-2">Loading more designs...</p>
                </div>
                <button class="btn btn-primary mt-3" id="load-more-btn">Load More Designs</button>
            </div>
        </div>
    </div>


    <!-- Design Detail Modal -->
    <div class="modal fade" id="designDetailModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="design-detail-title">Design Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <img src="" alt="Design image" class="detail-modal-img" id="design-detail-img">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <p><strong>Category:</strong> <span id="design-detail-category"></span></p>
                            <p><strong>Style:</strong> <span id="design-detail-style"></span></p>
                        </div>
                        <div class="col-md-6">
                            <p><strong>Square Footage:</strong> <span id="design-detail-area"></span></p>
                            <p><strong>Estimated Cost:</strong> <span id="design-detail-cost"></span></p>
                        </div>
                    </div>
                    <h6>Description</h6>
                    <p id="design-detail-description"></p>
                    <h6>Materials</h6>
                    <div id="design-detail-materials"></div>
                    <h6 class="mt-3">Tags</h6>
                    <div id="design-detail-tags"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="save-design-btn">Save to My Ideas</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Saved Items Indicator -->
    <div class="saved-items-indicator" data-bs-toggle="tooltip" title="View saved designs" id="saved-items-btn">
        <i class="fas fa-bookmark"></i>
        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" id="saved-count">0</span>
    </div>

    <!-- Saved Designs Modal -->
    <div class="modal fade" id="savedDesignsModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">My Saved Design Ideas</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row" id="saved-designs-container">
                        <!-- Saved designs will be loaded here -->
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-danger" id="clear-saved-btn">Clear All</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            // Sample design data
            const designData = [
                {
                    id: 1,
                    title: "Modern Kitchen Renovation",
                    category: "residential",
                    style: "modern",
                    image: "https://images.unsplash.com/photo-1556911220-e15b29be8c8f?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",
                    description: "A sleek and functional kitchen design with quartz countertops, custom cabinetry, and energy-efficient appliances. Perfect for modern families who love to cook and entertain.",
                    area: "250 sq ft",
                    cost: "$25,000 - $35,000",
                    materials: ["Quartz countertops", "Maple cabinets", "Stainless steel appliances", "Porcelain tile flooring"],
                    tags: ["kitchen", "modern", "quartz", "smart home"]
                },
                {
                    id: 2,
                    title: "Contemporary Office Space",
                    category: "commercial",
                    style: "modern",
                    image: "https://images.unsplash.com/photo-1497366754035-f200968a6e72?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",
                    description: "An open-concept office design that promotes collaboration while providing private spaces for focused work. Features ergonomic furniture and plenty of natural light.",
                    area: "1,200 sq ft",
                    cost: "$50,000 - $75,000",
                    materials: ["Glass partitions", "Engineered hardwood", "Acoustic panels", "LED lighting"],
                    tags: ["office", "commercial", "collaborative", "ergonomic"]
                },
                {
                    id: 3,
                    title: "Cozy Living Room",
                    category: "interior",
                    style: "traditional",
                    image: "https://images.unsplash.com/photo-1540518614846-7eded433c457?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",
                    description: "A warm and inviting living room with a fireplace as the focal point. Features custom built-in shelving and comfortable seating for family gatherings.",
                    area: "350 sq ft",
                    cost: "$15,000 - $25,000",
                    materials: ["Hardwood flooring", "Stone fireplace", "Custom millwork", "Wool carpet"],
                    tags: ["living room", "fireplace", "cozy", "family"]
                },
                {
                    id: 4,
                    title: "Modern Exterior Facade",
                    category: "exterior",
                    style: "modern",
                    image: "https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",
                    description: "A striking exterior design combining natural materials with clean lines. Features large windows for natural light and a mix of wood and stone elements.",
                    area: "2,000 sq ft",
                    cost: "$45,000 - $65,000",
                    materials: ["Fiber cement siding", "Natural stone veneer", "Energy-efficient windows", "Metal roofing"],
                    tags: ["exterior", "curb appeal", "modern", "sustainable"]
                },
                {
                    id: 5,
                    title: "Luxury Master Bathroom",
                    category: "residential",
                    style: "modern",
                    image: "https://images.unsplash.com/photo-1631889992022-7cf37f3e7fcd?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",
                    description: "A spa-like master bathroom with a freestanding tub, dual vanities, and a spacious walk-in shower. Features premium fixtures and elegant finishes.",
                    area: "180 sq ft",
                    cost: "$30,000 - $45,000",
                    materials: ["Marble tiles", "Frameless glass shower", "Custom vanities", "Heated flooring"],
                    tags: ["bathroom", "luxury", "spa", "master suite"]
                },
                {
                    id: 6,
                    title: "Restaurant Interior",
                    category: "commercial",
                    style: "industrial",
                    image: "https://images.unsplash.com/photo-1514933651103-005eec06c04b?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",
                    description: "An industrial-chic restaurant design with exposed brick, ductwork, and custom lighting. Creates a warm atmosphere for dining with rustic elements.",
                    area: "1,800 sq ft",
                    cost: "$85,000 - $120,000",
                    materials: ["Reclaimed wood", "Exposed brick", "Concrete flooring", "Custom metalwork"],
                    tags: ["restaurant", "industrial", "commercial", "rustic"]
                },
                {
                    id: 7,
                    title: "Traditional Home Office",
                    category: "interior",
                    style: "traditional",
                    image: "https://images.unsplash.com/photo-1524758631624-e2822e304c36?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",
                    description: "A classic home office with rich wood paneling, built-in bookshelves, and comfortable leather furniture. Perfect for productive work sessions.",
                    area: "150 sq ft",
                    cost: "$12,000 - $18,000",
                    materials: ["Wood paneling", "Hardwood flooring", "Custom built-ins", "Brass fixtures"],
                    tags: ["home office", "traditional", "wood", "library"]
                },
                {
                    id: 8,
                    title: "Outdoor Living Space",
                    category: "exterior",
                    style: "modern",
                    image: "https://images.unsplash.com/photo-1580 5328636-820e85c64884?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80",
                    description: "An expansive outdoor living area with a covered patio, outdoor kitchen, and fireplace. Perfect for entertaining in all seasons.",
                    area: "600 sq ft",
                    cost: "$35,000 - $50,000",
                    materials: ["Pavers", "Stone veneer", "Stainless steel appliances", "Cedar pergola"],
                    tags: ["outdoor", "patio", "entertaining", "landscaping"]
                }
            ];

            // Initialize variables
            let savedDesigns = JSON.parse(localStorage.getItem('savedDesigns')) || [];
            let currentFilter = 'all';
            let currentSearch = '';

            // Initialize the app
            function init() {
                loadDesigns();
                updateSavedCount();
                setupFilterButtons();
                setupSearch();

                // Initialize tooltips
                $('[data-bs-toggle="tooltip"]').tooltip();
            }

            // Load designs into the gallery
            function loadDesigns() {
                const gallery = $('#design-gallery');
                gallery.empty();

                let filteredDesigns = filterDesigns();

                if (filteredDesigns.length === 0) {
                    gallery.append('<div class="col-12 text-center py-5"><i class="fas fa-image fa-3x text-muted mb-3"></i><h5 class="text-muted">No designs found</h5><p>Try changing your filters or search term</p></div>');
                    return;
                }

                filteredDesigns.forEach(design => {
                    const isSaved = savedDesigns.includes(design.id);

                    const designCard = `
                        <div class="col-md-6 col-lg-4 col-xl-3 mb-4 design-item" data-category="${design.category}" data-style="${design.style}" data-id="${design.id}">
                            <div class="card inspiration-card h-100">
                                <div class="design-card">
                                    <img src="${design.image}" class="card-img-top" alt="${design.title}">
                                    <div class="design-overlay">
                                        <div class="design-title">${design.title}</div>
                                        <div class="design-category">${design.category} • ${design.style}</div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">${design.title}</h5>
                                    <p class="card-text">${design.description.substring(0, 100)}...</p>
                                    <div class="inspiration-tags">
                                        ${design.tags.map(tag => `<span class="tag">${tag}</span>`).join('')}
                                    </div>
                                </div>
                                <div class="card-footer bg-transparent d-flex justify-content-between">
                                    <button class="btn btn-sm btn-outline-primary view-design" data-id="${design.id}">View Details</button>
                                    <button class="btn btn-sm ${isSaved ? 'btn-danger' : 'btn-outline-danger'} save-design" data-id="${design.id}">
                                        <i class="fas ${isSaved ? 'fa-bookmark' : 'fa-bookmark'}"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    `;

                    gallery.append(designCard);
                });
            }

            // Filter designs based on current filter and search
            function filterDesigns() {
                let filtered = designData;

                // Apply category filter
                if (currentFilter !== 'all') {
                    if (currentFilter === 'saved') {
                        filtered = filtered.filter(design => savedDesigns.includes(design.id));
                    } else {
                        filtered = filtered.filter(design =>
                            design.category === currentFilter ||
                            design.style === currentFilter ||
                            design.tags.includes(currentFilter)
                        );
                    }
                }

                // Apply search filter
                if (currentSearch) {
                    const searchTerm = currentSearch.toLowerCase();
                    filtered = filtered.filter(design =>
                        design.title.toLowerCase().includes(searchTerm) ||
                        design.description.toLowerCase().includes(searchTerm) ||
                        design.tags.some(tag => tag.toLowerCase().includes(searchTerm)) ||
                        design.materials.some(material => material.toLowerCase().includes(searchTerm))
                    );
                }

                return filtered;
            }

            // Set up filter buttons
            function setupFilterButtons() {
                $('.filter-btn').on('click', function () {
                    $('.filter-btn').removeClass('active');
                    $(this).addClass('active');

                    currentFilter = $(this).data('filter');
                    loadDesigns();
                });
            }

            // Set up search functionality
            function setupSearch() {
                $('#search-btn').on('click', function () {
                    currentSearch = $('#search-input').val();
                    loadDesigns();
                });

                $('#search-input').on('keyup', function (e) {
                    if (e.key === 'Enter') {
                        currentSearch = $('#search-input').val();
                        loadDesigns();
                    }
                });
            }

            // Update saved designs count
            function updateSavedCount() {
                $('#saved-count').text(savedDesigns.length);
            }

            // Show design details
            function showDesignDetails(designId) {
                const design = designData.find(d => d.id === designId);
                if (!design) return;

                // Check if design is saved
                const isSaved = savedDesigns.includes(designId);

                // Populate modal
                $('#design-detail-title').text(design.title);
                $('#design-detail-img').attr('src', design.image);
                $('#design-detail-category').text(design.category);
                $('#design-detail-style').text(design.style);
                $('#design-detail-area').text(design.area);
                $('#design-detail-cost').text(design.cost);
                $('#design-detail-description').text(design.description);

                // Populate materials
                const materialsHtml = design.materials.map(material =>
                    `<span class="badge bg-light text-dark me-2 mb-2">${material}</span>`
                ).join('');
                $('#design-detail-materials').html(materialsHtml);

                // Populate tags
                const tagsHtml = design.tags.map(tag =>
                    `<span class="tag">${tag}</span>`
                ).join('');
                $('#design-detail-tags').html(tagsHtml);

                // Update save button
                $('#save-design-btn')
                    .data('id', designId)
                    .html(isSaved ? 'Remove from Saved' : 'Save to My Ideas')
                    .toggleClass('btn-primary', !isSaved)
                    .toggleClass('btn-danger', isSaved);

                // Show modal
                $('#designDetailModal').modal('show');
            }

            // Toggle save design
            function toggleSaveDesign(designId) {
                const index = savedDesigns.indexOf(designId);

                if (index === -1) {
                    // Add to saved
                    savedDesigns.push(designId);
                    showToast('Design added to your saved ideas!', 'success');
                } else {
                    // Remove from saved
                    savedDesigns.splice(index, 1);
                    showToast('Design removed from your saved ideas.', 'info');
                }

                // Save to localStorage
                localStorage.setItem('savedDesigns', JSON.stringify(savedDesigns));

                // Update UI
                updateSavedCount();

                // If we're on the saved filter, reload designs
                if (currentFilter === 'saved') {
                    loadDesigns();
                }
            }

            // Show saved designs
            function showSavedDesigns() {
                const container = $('#saved-designs-container');
                container.empty();

                if (savedDesigns.length === 0) {
                    container.append('<div class="col-12 text-center py-5"><i class="fas fa-bookmark fa-3x text-muted mb-3"></i><h5 class="text-muted">No saved designs</h5><p>Save designs you like to view them here</p></div>');
                    return;
                }

                savedDesigns.forEach(designId => {
                    const design = designData.find(d => d.id === designId);
                    if (!design) return;

                    const savedDesignCard = `
                        <div class="col-md-6 col-lg-4 mb-4">
                            <div class="card h-100">
                                <img src="${design.image}" class="card-img-top" alt="${design.title}" style="height: 200px; object-fit: cover;">
                                <div class="card-body">
                                    <h5 class="card-title">${design.title}</h5>
                                    <p class="card-text">${design.description.substring(0, 80)}...</p>
                                </div>
                                <div class="card-footer bg-transparent d-flex justify-content-between">
                                    <button class="btn btn-sm btn-outline-primary view-saved-design" data-id="${design.id}">View Details</button>
                                    <button class="btn btn-sm btn-danger remove-saved-design" data-id="${design.id}">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    `;

                    container.append(savedDesignCard);
                });

                // Show modal
                $('#savedDesignsModal').modal('show');
            }

            // Clear all saved designs
            function clearSavedDesigns() {
                savedDesigns = [];
                localStorage.setItem('savedDesigns', JSON.stringify(savedDesigns));
                updateSavedCount();
                showToast('All saved designs have been removed.', 'info');

                // Close modal and reload if on saved filter
                $('#savedDesignsModal').modal('hide');
                if (currentFilter === 'saved') {
                    loadDesigns();
                }
            }

            // Show toast notification
            function showToast(message, type) {
                // Remove existing toasts
                $('.toast').remove();

                const toast = $(`
                    <div class="toast align-items-center text-white bg-${type === 'success' ? 'success' : 'info'} border-0 position-fixed bottom-0 end-0 m-3" role="alert" aria-live="assertive" aria-atomic="true">
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

            // Event delegation for design actions
            $(document).on('click', '.view-design', function () {
                const designId = parseInt($(this).data('id'));
                showDesignDetails(designId);
            });

            $(document).on('click', '.save-design', function () {
                const designId = parseInt($(this).data('id'));
                toggleSaveDesign(designId);

                // Update button appearance
                const isSaved = savedDesigns.includes(designId);
                $(this)
                    .toggleClass('btn-outline-danger', !isSaved)
                    .toggleClass('btn-danger', isSaved);
            });

            $(document).on('click', '#save-design-btn', function () {
                const designId = parseInt($(this).data('id'));
                toggleSaveDesign(designId);

                // Update button appearance
                const isSaved = savedDesigns.includes(designId);
                $(this)
                    .html(isSaved ? 'Remove from Saved' : 'Save to My Ideas')
                    .toggleClass('btn-primary', !isSaved)
                    .toggleClass('btn-danger', isSaved);
            });

            $(document).on('click', '#saved-items-btn', function () {
                showSavedDesigns();
            });

            $(document).on('click', '#clear-saved-btn', function () {
                if (confirm('Are you sure you want to clear all your saved designs?')) {
                    clearSavedDesigns();
                }
            });

            $(document).on('click', '.view-saved-design', function () {
                const designId = parseInt($(this).data('id'));
                $('#savedDesignsModal').modal('hide');
                showDesignDetails(designId);
            });

            $(document).on('click', '.remove-saved-design', function () {
                const designId = parseInt($(this).data('id'));
                toggleSaveDesign(designId);

                // Update the saved designs modal
                showSavedDesigns();
            });

            // Load more designs (simulated)
            $('#load-more-btn').on('click', function () {
                $(this).prop('disabled', true);
                $('#loading-indicator').removeClass('d-none');

                // Simulate loading
                setTimeout(() => {
                    // In a real app, this would load more data from a server
                    $('#loading-indicator').addClass('d-none');
                    $(this).prop('disabled', false);

                    showToast('No more designs to load', 'info');
                }, 1500);
            });

            // Initialize the app
            init();
        });
    </script>
</main>

</asp:Content>
