<%@ Page Title="Portfolio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Portfolio.aspx.cs" Inherits="FSCN.Portfolio" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <section>

        <!-- Page Hero Section -->
        <section class="page-hero">
            <div class="container">
                <h1 class="display-4 fw-bold">Our Construction Portfolio</h1>
                <p class="lead">Showcasing our quality craftsmanship</p>
            </div>
        </section>


        <!-- Row Button Filter Section -->
        <section class="py-5 filter-row-button-section">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-8">
                        <div class="filter-buttons d-flex flex-wrap">
                            <button class="filter-btn btn btn-primary active" data-filter="all">All Projects</button>
                            <button class="filter-btn btn btn-outline-primary" data-filter="new-homes">New Homes</button>
                            <button class="filter-btn btn btn-outline-primary" data-filter="renovations">Renovations</button>
                            <button class="filter-btn btn btn-outline-primary" data-filter="extensions">Extensions</button>
                            <button class="filter-btn btn btn-outline-primary" data-filter="roofing">Roofing</button>
                            <button class="filter-btn btn btn-outline-primary" data-filter="commercial">Commercial</button>
                        </div>
                    </div>
                    <div class="col-md-4 mt-3 mt-md-0">
                        <div class="search-box input-group">
                            <input type="text" id="projectSearch" class="form-control" placeholder="Search projects...">
                            <button class="btn btn-primary" type="button"><i class="fa fa-search"></i>
</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Portfolio Gallery Section -->
        <section class="py-5">
            <div class="container">
                <div class="row g-4" >
                    <!-- Project 1 -->
                    <div class="col-md-6 col-lg-4 custom-gallery-card-item" data-category="new-homes" data-tags="modern traditional 3bedroom">
                        <div class="custom-gallery-card-upper">
                            <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Modern Village Home">
                            <div class="custom-gallery-card-overlay">
                                <h3>Modern Village Home</h3>
                                <p>3 BHK with courtyard</p>
                                <a href="project-details.html?id=1" class="btn btn-sm btn-primary mt-2">View Project</a>
                            </div>
                        </div>
                        <div class="custom-gallery-card-info d-none">
                            <h3>Modern Village Home</h3>
                            <div class="project-meta">
                                <span class="d-block"><i class="bi bi-geo-alt"></i>Krishna Puram</span>
                                <span class="d-block"><i class="bi bi-calendar"></i>Completed: Jan 2023</span>
                            </div>
                            <a href="project-details.html?id=1" class="btn btn-sm btn-primary">View Details</a>
                        </div>
                    </div>

                    <!-- Project 2 -->
                    <div class="col-md-6 col-lg-4 custom-gallery-card-item" data-category="renovations" data-tags="heritage restoration">
                        <div class="custom-gallery-card-upper">
                            <img src="https://images.unsplash.com/photo-1574362848149-11496d93a7c7?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Heritage Home Renovation">
                            <div class="custom-gallery-card-overlay">
                                <h3>Heritage Home Renovation</h3>
                                <p>100-year-old restoration</p>
                                <a href="project-details.html?id=2" class="btn btn-sm btn-primary mt-2">View Project</a>
                            </div>
                        </div>
                        <div class="custom-gallery-card-info d-none">
                            <h3>Heritage Home Renovation</h3>
                            <div class="project-meta">
                                <span class="d-block"><i class="bi bi-geo-alt"></i>Gandhi Gram</span>
                                <span class="d-block"><i class="bi bi-calendar"></i>Completed: Aug 2022</span>
                            </div>
                            <a href="project-details.html?id=2" class="btn btn-sm btn-primary">View Details</a>
                        </div>
                    </div>

                    <!-- Project 3 -->
                    <div class="col-md-6 col-lg-4 custom-gallery-card-item" data-category="extensions" data-tags="room-addition">
                        <div class="custom-gallery-card-upper">
                            <img src="https://images.unsplash.com/photo-1613490493576-7fde63acd811?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Family Room Extension">
                            <div class="custom-gallery-card-overlay">
                                <h3>Family Room Extension</h3>
                                <p>2-room addition</p>
                                <a href="project-details.html?id=3" class="btn btn-sm btn-primary mt-2">View Project</a>
                            </div>
                        </div>
                        <div class="custom-gallery-card-info d-none">
                            <h3>Family Room Extension</h3>
                            <div class="project-meta">
                                <span class="d-block"><i class="bi bi-geo-alt"></i>Shivaji Nagar</span>
                                <span class="d-block"><i class="bi bi-calendar"></i>Completed: Mar 2023</span>
                            </div>
                            <a href="project-details.html?id=3" class="btn btn-sm btn-primary">View Details</a>
                        </div>
                    </div>

                    <!-- Project 4 -->
                    <div class="col-md-6 col-lg-4 custom-gallery-card-item" data-category="roofing" data-tags="roof-replacement">
                        <div class="custom-gallery-card-upper">
                            <img src="https://images.unsplash.com/photo-1591955506264-3f5a6834570a?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Traditional Tile Roof">
                            <div class="custom-gallery-card-overlay">
                                <h3>Traditional Tile Roof</h3>
                                <p>Complete roof replacement</p>
                                <a href="project-details.html?id=4" class="btn btn-sm btn-primary mt-2">View Project</a>
                            </div>
                        </div>
                        <div class="custom-gallery-card-info d-none">
                            <h3>Traditional Tile Roof</h3>
                            <div class="project-meta">
                                <span class="d-block"><i class="bi bi-geo-alt"></i>Nehru Colony</span>
                                <span class="d-block"><i class="bi bi-calendar"></i>Completed: Nov 2022</span>
                            </div>
                            <a href="project-details.html?id=4" class="btn btn-sm btn-primary">View Details</a>
                        </div>
                    </div>

                    <!-- Project 5 -->
                    <div class="col-md-6 col-lg-4 custom-gallery-card-item" data-category="new-homes" data-tags="farmhouse">
                        <div class="custom-gallery-card-upper">
                            <img src="https://images.unsplash.com/photo-1600566753052-d7f4e46c5c7d?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Countryside Farmhouse">
                            <div class="custom-gallery-card-overlay">
                                <h3>Countryside Farmhouse</h3>
                                <p>4 BHK with veranda</p>
                                <a href="project-details.html?id=5" class="btn btn-sm btn-primary mt-2">View Project</a>
                            </div>
                        </div>
                        <div class="custom-gallery-card-info d-none">
                            <h3>Countryside Farmhouse</h3>
                            <div class="project-meta">
                                <span class="d-block"><i class="bi bi-geo-alt"></i>Rural outskirts</span>
                                <span class="d-block"><i class="bi bi-calendar"></i>Completed: Jun 2023</span>
                            </div>
                            <a href="project-details.html?id=5" class="btn btn-sm btn-primary">View Details</a>
                        </div>
                    </div>

                    <!-- Project 6 -->
                    <div class="col-md-6 col-lg-4 custom-gallery-card-item" data-category="commercial" data-tags="shop renovation">
                        <div class="custom-gallery-card-upper">
                            <img src="https://images.unsplash.com/photo-1497366811353-6870744d04b2?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Village Shop Renovation">
                            <div class="custom-gallery-card-overlay">
                                <h3>Village Shop Renovation</h3>
                                <p>General store makeover</p>
                                <a href="project-details.html?id=6" class="btn btn-sm btn-primary mt-2">View Project</a>
                            </div>
                        </div>
                        <div class="custom-gallery-card-info d-none">
                            <h3>Village Shop Renovation</h3>
                            <div class="project-meta">
                                <span class="d-block"><i class="bi bi-geo-alt"></i>Main Bazaar</span>
                                <span class="d-block"><i class="bi bi-calendar"></i>Completed: Feb 2023</span>
                            </div>
                            <a href="project-details.html?id=6" class="btn btn-sm btn-primary">View Details</a>
                        </div>
                    </div>
                </div>

                <div class="text-center mt-5">
                    <button id="loadMore" class="btn btn-primary">Load More Projects</button>
                </div>
            </div>
        </section>


    </section>

    <style>
        .search-box {
            position: relative;
            max-width: 300px;
        }

        

        .project-meta {
            font-size: 0.9rem;
            color: #6c757d;
            margin-bottom: 10px;
        }

        .portfolio-cta {
            background-color: #f8f9fa;
            padding: 80px 0;
            text-align: center;
        }

        .btn-small {
            padding: 0.375rem 0.75rem;
            font-size: 0.875rem;
        }
    </style>


    <script>
        // Basic filter functionality
        document.addEventListener('DOMContentLoaded', function () {
            const filterButtons = document.querySelectorAll('.filter-btn');
            const projectItems = document.querySelectorAll('.custom-gallery-card-item');
            const searchInput = document.getElementById('projectSearch');

            // Filter by category
            filterButtons.forEach(button => {
                button.addEventListener('click', function () {
                    const filterValue = this.getAttribute('data-filter');

                    // Update active button
                    filterButtons.forEach(btn => btn.classList.remove('active'));
                    this.classList.add('active');
                    this.classList.replace('btn-outline-primary', 'btn-primary');

                    filterButtons.forEach(btn => {
                        if (!btn.classList.contains('active')) {
                            btn.classList.replace('btn-primary', 'btn-outline-primary');
                        }
                    });

                    // Filter projects
                    projectItems.forEach(item => {
                        if (filterValue === 'all' || item.getAttribute('data-category') === filterValue) {
                            item.style.display = 'block';
                        } else {
                            item.style.display = 'none';
                        }
                    });
                });
            });

            // Search functionality
            searchInput.addEventListener('keyup', function () {
                const searchText = this.value.toLowerCase();

                projectItems.forEach(item => {
                    const tags = item.getAttribute('data-tags').toLowerCase();
                    const title = item.querySelector('h3').textContent.toLowerCase();

                    if (title.includes(searchText) || tags.includes(searchText)) {
                        item.style.display = 'block';
                    } else {
                        item.style.display = 'none';
                    }
                });
            });

            // Load more functionality (simple version)
            const loadMoreBtn = document.getElementById('loadMore');
            let visibleItems = 6;
            const allItems = document.querySelectorAll('.custom-gallery-card-item');

            // Initially hide items beyond the first 6
            for (let i = visibleItems; i < allItems.length; i++) {
                allItems[i].style.display = 'none';
            }

            loadMoreBtn.addEventListener('click', function () {
                visibleItems += 3;

                for (let i = 0; i < visibleItems; i++) {
                    if (allItems[i]) {
                        allItems[i].style.display = 'block';
                    }
                }

                if (visibleItems >= allItems.length) {
                    loadMoreBtn.style.display = 'none';
                }
            });
        });
    </script>


</asp:Content>
