<%@ Page Language="C#" Title="About" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="About.aspx.cs" Inherits="CMC.Pages.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="content">
        <section id="about0" class="section d-block">
            <div class="container">
                <h2 class="text-center">About</h2>
                <p class="text-center">Our story, values, and commitment to quality</p>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card glass about-form">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class=" mb-4 mb-lg-0">
                                            <h2 class="mb-4">Building Sultanpur Khurd's Future Since 2015</h2>
                                            <p class="mb-4">FatherSonConstruction was founded with a simple mission: to provide quality construction services to our village community while preserving the traditional architectural styles that make our area unique.</p>
                                            <p class="mb-4">What began as a small family operation has grown into Sultanpur Khurd's most trusted construction company, with over 100+ homes and buildings completed to date.</p>
                                        </div>

                                        <div class="row about-stats">
                                            <div class="col-4 text-center">
                                                <div class="stat-number">10+</div>
                                                <div class="stat-label">Years Experience</div>
                                            </div>
                                            <div class="col-4 text-center">
                                                <div class="stat-number">100+</div>
                                                <div class="stat-label">Projects Completed</div>
                                            </div>
                                            <div class="col-4 text-center">
                                                <div class="stat-number">15+</div>
                                                <div class="stat-label">Skilled Craftsmen</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-4 text-center p-3">

                                        <img src="../assets/img/user.png"
                                            alt="Our Founder"
                                            title="Amantullah Ansari"
                                            class="img-fluid rounded shadow mb-3"
                                            style="height: 200px; width: 200px; border-radius: 80%; object-fit: cover;">

                                        <div class="image-caption">
                                            <h4>Amantullah Ansari</h4>
                                            <p>Founder & Lead Contractor</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <h2 class="text-center">Our Journey</h2>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card glass about-form">
                            <div class="card-body">
                                <div class="row justify-content-center">
                                    <div class="col-lg-10">
                                        <div class="about-history mb-5">
                                            <div class="timeline">
                                                <div class="timeline-item">
                                                    <div class="timeline-year">2015</div>
                                                    <div class="timeline-content">
                                                        <h3>Humble Beginnings</h3>
                                                        <p>
                                                            Founded as a small masonry team working on village homes and
                                                    repairs
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="timeline-item">
                                                    <div class="timeline-year">2016</div>
                                                    <div class="timeline-content">
                                                        <h3>First Complete Home</h3>
                                                        <p>Built our first complete 3-bedroom home for the Sharma family</p>
                                                    </div>
                                                </div>
                                                <div class="timeline-item">
                                                    <div class="timeline-year">2018</div>
                                                    <div class="timeline-content">
                                                        <h3>Expanded Services</h3>
                                                        <p>
                                                            Added roofing, renovations, and commercial construction services
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="timeline-item">
                                                    <div class="timeline-year">2022</div>
                                                    <div class="timeline-content">
                                                        <h3>Modern Techniques</h3>
                                                        <p>
                                                            Incorporated modern construction methods while maintaining
                                                    traditional
                                                    aesthetics
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="timeline-item">
                                                    <div class="timeline-year">2025</div>
                                                    <div class="timeline-content">
                                                        <h3>Present Day</h3>
                                                        <p>
                                                            Continuing to serve Sultanpur Khurd with quality and integrity
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <h2 class="text-center">Our Core Values</h2>
                <div class="row">
                    <div class="col-md-6 col-lg-3 mb-4">
                        <div class="card glass">
                            <div class="card-body text-center service-card">
                                <div class="card-icon">
                                    <i class="fas fa-handshake"></i>
                                </div>
                                <h5>Integrity</h5>
                                <p>We believe in honest communication and fair pricing with no hidden costs.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 mb-4">
                        <div class="card glass">
                            <div class="card-body text-center service-card">
                                <div class="card-icon">
                                    <i class="fas fa-home"></i>
                                </div>
                                <h5>Quality</h5>
                                <p>Using the best materials and craftsmanship to build homes that last.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 mb-4">
                        <div class="card glass">
                            <div class="card-body text-center service-card">
                                <div class="card-icon">
                                    <i class="fas fa-users"></i>
                                </div>
                                <h5>Community</h5>
                                <p>Supporting local suppliers and training village youth in construction skills.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 mb-4">
                        <div class="card glass">
                            <div class="card-body text-center service-card">
                                <div class="card-icon">
                                    <i class="fas fa-leaf"></i>
                                </div>
                                <h5>Sustainability</h5>
                                <p>Incorporating eco-friendly practices and materials where possible.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <h2 class="text-center">Meet Our Team</h2>
                <div class="row">
                    <div class="col-md-6 col-lg-3 mb-4">
                        <div class="card glass">
                            <div class="card-body text-center service-card">
                                <img src="images/team1.jpg" alt="Rajesh Patel" class="img-fluid rounded-circle mb-3"
                                    style="width: 120px; height: 120px; object-fit: cover;">
                                <h5>Rajesh Patel</h5>
                                <p class="position text-muted">Founder & Lead Contractor</p>
                                <p class="bio">
                                    With over 30 years in construction, Rajesh ensures every project meets our high standards.
                                </p>
                                <div class="member-contact">
                                    <a href="tel:+919876543210" class="btn btn-sm btn-outline-primary me-1">
                                        <i class="fas fa-phone"></i>
                                    </a>
                                    <a href="mailto:rajesh@villageconstruct.com" class="btn btn-sm btn-outline-primary">
                                        <i class="fas fa-envelope"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 mb-4">
                        <div class="card glass">
                            <div class="card-body text-center service-card">
                                <img src="images/team2.jpg" alt="Priya Patel" class="img-fluid rounded-circle mb-3"
                                    style="width: 120px; height: 120px; object-fit: cover;">
                                <h5>Priya Patel</h5>
                                <p class="position text-muted">Project Manager</p>
                                <p class="bio">Oversees all projects to ensure they stay on schedule and budget.</p>
                                <div class="member-contact">
                                    <a href="tel:+919876543211" class="btn btn-sm btn-outline-primary me-1">
                                        <i class="fas fa-phone"></i>
                                    </a>
                                    <a href="mailto:priya@villageconstruct.com" class="btn btn-sm btn-outline-primary">
                                        <i class="fas fa-envelope"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 mb-4">
                        <div class="card glass">
                            <div class="card-body text-center service-card">
                                <img src="images/team3.jpg" alt="Vijay Kumar" class="img-fluid rounded-circle mb-3"
                                    style="width: 120px; height: 120px; object-fit: cover;">
                                <h5>Vijay Kumar</h5>
                                <p class="position text-muted">Head Mason</p>
                                <p class="bio">
                                    Master craftsman specializing in traditional brick and stone work.
                                </p>
                                <div class="member-contact">
                                    <a href="tel:+919876543212" class="btn btn-sm btn-outline-primary me-1">
                                        <i class="fas fa-phone"></i>
                                    </a>
                                    <a href="mailto:vijay@villageconstruct.com" class="btn btn-sm btn-outline-primary">
                                        <i class="fas fa-envelope"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 mb-4">
                        <div class="card glass">
                            <div class="card-body text-center service-card">
                                <img src="images/team4.jpg" alt="Anjali Sharma"
                                    class="img-fluid rounded-circle mb-3"
                                    style="width: 120px; height: 120px; object-fit: cover;">
                                <h5>Anjali Sharma</h5>
                                <p class="position text-muted">Design Consultant</p>
                                <p class="bio">Helps clients plan functional and beautiful living spaces.</p>
                                <div class="member-contact">
                                    <a href="tel:+919876543213" class="btn btn-sm btn-outline-primary me-1">
                                        <i class="fas fa-phone"></i>
                                    </a>
                                    <a href="mailto:anjali@villageconstruct.com" class="btn btn-sm btn-outline-primary">
                                        <i class="fas fa-envelope"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <h2 class="text-center">Client Portal</h2>
                <p class="text-center mb-4">
                    Existing clients can login to track their project progress, or new
                                clients can create an account to get started. 
                            <a href="../Pages/Account.aspx" class="btn btn-sm btn-outline-primary me-1">
                                <i class="fas fa-external-link"></i>
                            </a>
                </p>



            </div>

        </section>
    </main>

    <!-- Forgot Password Modal -->
    <div class="modal fade" id="forgotPasswordModal" tabindex="-1" aria-labelledby="forgotPasswordModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="forgotPasswordModalLabel">Reset Password</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Enter your email address and we'll send you instructions to reset your password.</p>
                    <div id="forgotPasswordForm">
                        <div class="mb-3">
                            <label for="resetEmail" class="form-label">Email Address</label>
                            <input type="email" class="form-control" id="resetEmail" required>
                        </div>
                        <div class="d-grid">
                            <button id="btnForgotPasswordForm" class="btn btn-primary">Send Reset Instructions</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Timeline Styles -->
    <style>
        .timeline {
            position: relative;
            max-width: 800px;
            margin: 0 auto;
            padding: 40px 0;
        }

            .timeline::before {
                content: '';
                position: absolute;
                top: 0;
                left: 50%;
                transform: translateX(-50%);
                width: 4px;
                height: 100%;
                background-color: var(--primary-color);
            }

        .timeline-item {
            position: relative;
            margin-bottom: 50px;
            width: 50%;
            padding: 0 40px;
            box-sizing: border-box;
        }

            .timeline-item:nth-child(odd) {
                left: 0;
            }

            .timeline-item:nth-child(even) {
                left: 50%;
            }

        .timeline-year {
            position: absolute;
            top: 0;
            width: 80px;
            height: 80px;
            background-color: var(--secondary-color);
            color: var(--primary-color);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            font-weight: 700;
            z-index: 1;
        }

        .timeline-item:nth-child(odd) .timeline-year {
            right: -40px;
        }

        .timeline-item:nth-child(even) .timeline-year {
            left: -40px;
        }

        .timeline-content {
            padding: 20px;
            background-color: var(--white);
            border-radius: 5px;
            box-shadow: var(--shadow);
            position: relative;
        }

            .timeline-content h3 {
                color: var(--primary-color);
                margin-bottom: 10px;
            }

        /* Bio with more styles */
        .bio {
            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            position: relative;
        }

            .bio.more {
                -webkit-line-clamp: unset;
            }

        .bio-toggle {
            color: #0d6efd;
            cursor: pointer;
            font-size: 0.9rem;
            display: inline-block;
            margin-top: 0.25rem;
        }
    </style>

    <script>
        $(document).ready(function () {
            function doBioWithMore() {
                $('.team-member .bio').each(function () {
                    const $bio = $(this);
                    const fullText = $bio.text();

                    if (fullText.length > 100) {
                        $bio.addClass('short');
                        const $toggle = $('<span class="bio-toggle">…more</span>');
                        $bio.after($toggle);

                        $toggle.click(function () {
                            $bio.toggleClass('more');
                            if ($bio.hasClass('more')) {
                                $(this).text('less');
                            } else {
                                $(this).text('…more');
                            }
                        });
                    }
                });
            }

            doBioWithMore();
        });
    </script>

</asp:Content>
