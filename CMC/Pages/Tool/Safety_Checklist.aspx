<%@ Page Title="Safety_Checklist" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Safety_Checklist.aspx.cs" Inherits="CMC.Pages.Tool.Safety_Checklist" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <main class="content">



    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        :root {
            /*--primary: #2c3e50;*/
            /*--secondary: #e74c3c;*/
            --accent: #3498db;
            /*--light: #ecf0f1;*/
            /*--dark: #2c3e50;*/
            --safe: #27ae60;
            --warning: #f39c12;
            --danger: #e74c3c;
        }



        .card {
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
            margin-bottom: 20px;
            border: none;
        }

            .card:hover {
                transform: translateY(-5px);
            }

        .btn-primary {
            background-color: var(--primary);
            border-color: var(--primary);
        }

            .btn-primary:hover {
                background-color: var(--secondary);
                border-color: var(--secondary);
            }

        .btn-success {
            background-color: var(--safe);
            border-color: var(--safe);
        }

        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('https://images.unsplash.com/photo-1581092918056-0c4c3acd3789?ixlib=rb-4.0.3&auto=format&fit=crop&w=1500&q=80');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 80px 0;
            margin-bottom: 40px;
        }



        .safety-item {
            border-left: 5px solid var(--warning);
            margin-bottom: 15px;
            transition: all 0.3s;
        }

            .safety-item.completed {
                border-left-color: var(--safe);
                background-color: #f8fff9;
            }

            .safety-item.issue {
                border-left-color: var(--danger);
                background-color: #fff8f8;
            }

        .checklist-category {
            background-color: var(--light);
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 25px;
        }

        .progress {
            height: 25px;
            border-radius: 5px;
        }

        .status-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }

        .status-compliant {
            background-color: #d4edda;
            color: #155724;
        }

        .status-noncompliant {
            background-color: #f8d7da;
            color: #721c24;
        }

        .status-pending {
            background-color: #fff3cd;
            color: #856404;
        }

        .safety-icon {
            font-size: 24px;
            margin-right: 15px;
            color: var(--primary);
        }

        .check-item {
            display: flex;
            align-items: center;
            padding: 12px 15px;
            border-bottom: 1px solid #eee;
        }

            .check-item:last-child {
                border-bottom: none;
            }

        .check-item-content {
            flex: 1;
        }

        .check-item-actions {
            display: flex;
            gap: 10px;
        }

        .category-title {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--primary);
        }

        .emergency-contact {
            background: linear-gradient(45deg, var(--danger), #c0392b);
            color: white;
            border-radius: 10px;
            padding: 15px;
        }

        .safety-stats {
            display: flex;
            justify-content: space-around;
            text-align: center;
            margin: 20px 0;
        }

        .stat-item {
            padding: 15px;
        }

        .stat-number {
            font-size: 24px;
            font-weight: bold;
        }

        .stat-label {
            font-size: 14px;
            color: #6c757d;
        }

        @media (max-width: 768px) {
            .safety-stats {
                flex-direction: column;
            }

            .check-item {
                flex-direction: column;
                align-items: flex-start;
            }

            .check-item-actions {
                margin-top: 10px;
                width: 100%;
                justify-content: flex-end;
            }
        }
    </style>


    <!-- Hero Section -->
    <div class="hero-section">
        <div class="container text-center">
            <h1 class="display-4 fw-bold">Safety Checklist</h1>
            <p class="lead">Ensure compliance with safety standards and keep your site accident-free</p>
            <button class="btn btn-success btn-lg mt-3" data-bs-toggle="modal" data-bs-target="#newChecklistModal">
                <i class="fas fa-plus me-2"></i>Create New Checklist
            </button>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h5 class="card-title mb-0"><i class="fas fa-list me-2"></i>Your Safety Checklists</h5>
                    </div>
                    <div class="card-body">
                        <div id="checklists-list">
                            <!-- Checklists will be loaded here -->
                            <div class="text-center py-4">
                                <i class="fas fa-clipboard-list fa-2x text-muted mb-3"></i>
                                <p class="text-muted">No checklists yet. Create your first safety checklist!</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card mt-4">
                    <div class="card-header bg-success text-white">
                        <h5 class="card-title mb-0"><i class="fas fa-phone-alt me-2"></i>Emergency Contacts</h5>
                    </div>
                    <div class="card-body">
                        <div class="emergency-contact mb-3">
                            <h6><i class="fas fa-ambulance me-2"></i>Medical Emergency</h6>
                            <p class="mb-0">911</p>
                        </div>
                        <div class="emergency-contact mb-3">
                            <h6><i class="fas fa-fire-extinguisher me-2"></i>Fire Department</h6>
                            <p class="mb-0">911</p>
                        </div>
                        <div class="emergency-contact mb-3">
                            <h6><i class="fas fa-hard-hat me-2"></i>Site Supervisor</h6>
                            <p class="mb-0">John Smith: (555) 123-4567</p>
                        </div>
                        <div class="emergency-contact">
                            <h6><i class="fas fa-first-aid me-2"></i>First Aid Officer</h6>
                            <p class="mb-0">Maria Garcia: (555) 987-6543</p>
                        </div>
                    </div>
                </div>

                <div class="card mt-4">
                    <div class="card-header bg-warning text-dark">
                        <h5 class="card-title mb-0"><i class="fas fa-exclamation-triangle me-2"></i>Safety Tips</h5>
                    </div>
                    <div class="card-body">
                        <div class="alert alert-warning">
                            <i class="fas fa-hard-hat me-2"></i>Always wear appropriate PPE on site
                        </div>
                        <div class="alert alert-info">
                            <i class="fas fa-tools me-2"></i>Inspect tools and equipment before use
                        </div>
                        <div class="alert alert-danger">
                            <i class="fas fa-ban me-2"></i>Keep work areas clean and free of hazards
                        </div>
                        <div class="alert alert-success">
                            <i class="fas fa-list-check me-2"></i>Conduct regular safety meetings with your team
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-8">
                <div class="card">
                    <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                        <h5 class="card-title mb-0"><i class="fas fa-clipboard-check me-2"></i>Safety Checklist</h5>
                        <div id="current-checklist-name" class="fw-bold">No Checklist Selected</div>
                    </div>
                    <div class="card-body">
                        <div id="no-checklist" class="text-center py-5">
                            <i class="fas fa-clipboard-list fa-3x text-muted mb-3"></i>
                            <p class="text-muted">Select a checklist from the list to view details</p>
                        </div>

                        <div id="checklist-details" class="d-none">
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <div>
                                    <span class="fw-bold">Site: </span>
                                    <span id="checklist-site"></span>
                                </div>
                                <div>
                                    <span class="fw-bold">Supervisor: </span>
                                    <span id="checklist-supervisor"></span>
                                </div>
                                <div>
                                    <span class="fw-bold">Status: </span>
                                    <span id="checklist-status" class="status-badge status-pending">Pending</span>
                                </div>
                            </div>

                            <div class="progress mb-4">
                                <div id="checklist-progress-bar" class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
                            </div>

                            <div class="safety-stats">
                                <div class="stat-item">
                                    <div class="stat-number text-success" id="stat-compliant">0</div>
                                    <div class="stat-label">Compliant</div>
                                </div>
                                <div class="stat-item">
                                    <div class="stat-number text-warning" id="stat-pending">0</div>
                                    <div class="stat-label">Pending</div>
                                </div>
                                <div class="stat-item">
                                    <div class="stat-number text-danger" id="stat-noncompliant">0</div>
                                    <div class="stat-label">Non-Compliant</div>
                                </div>
                            </div>

                            <div class="d-flex justify-content-between mb-3">
                                <h5>Checklist Items</h5>
                                <button class="btn btn-sm btn-primary" id="add-item-btn">
                                    <i class="fas fa-plus me-1"></i>Add Custom Item
                                </button>
                            </div>

                            <div id="checklist-items">
                                <!-- Checklist items will be loaded here -->
                            </div>

                            <div class="mt-4">
                                <h5>Notes & Actions</h5>
                                <textarea class="form-control" id="checklist-notes" rows="3" placeholder="Add any additional notes or required actions here..."></textarea>
                            </div>

                            <div class="d-flex justify-content-between mt-4">
                                <button class="btn btn-outline-secondary" id="save-checklist-btn">
                                    <i class="fas fa-save me-1"></i>Save Progress
                                </button>
                                <button class="btn btn-success" id="complete-checklist-btn">
                                    <i class="fas fa-check-circle me-1"></i>Mark as Complete
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <!-- Create Checklist Modal -->
    <div class="modal fade" id="newChecklistModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title">Create New Safety Checklist</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="checklist-form">
                        <input type="hidden" id="checklist-id">
                        <div class="mb-3">
                            <label for="checklist-name" class="form-label">Checklist Name</label>
                            <input type="text" class="form-control" id="checklist-name" required placeholder="e.g., Daily Site Safety Inspection">
                        </div>
                        <div class="mb-3">
                            <label for="checklist-site" class="form-label">Site/Location</label>
                            <input type="text" class="form-control" id="checklist-sitej" required placeholder="e.g., 123 Main St Construction Site">
                        </div>
                        <div class="mb-3">
                            <label for="checklist-supervisor-input" class="form-label">Supervisor</label>
                            <input type="text" class="form-control" id="checklist-supervisor-input" required placeholder="e.g., John Smith">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Checklist Template</label>
                            <select class="form-select" id="checklist-template">
                                <option value="default">Default Safety Checklist</option>
                                <option value="daily">Daily Site Inspection</option>
                                <option value="weekly">Weekly Equipment Check</option>
                                <option value="new">Empty Checklist</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" id="create-checklist-btn">Create Checklist</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Item Modal -->
    <div class="modal fade" id="addItemModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title">Add Custom Safety Item</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="item-form">
                        <input type="hidden" id="item-id">
                        <div class="mb-3">
                            <label for="item-category" class="form-label">Category</label>
                            <select class="form-select" id="item-category">
                                <option value="ppe">PPE</option>
                                <option value="equipment">Equipment</option>
                                <option value="site">Site Conditions</option>
                                <option value="procedures">Procedures</option>
                                <option value="other">Other</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="item-title" class="form-label">Item Title</label>
                            <input type="text" class="form-control" id="item-title" required placeholder="e.g., Hard hats worn at all times">
                        </div>
                        <div class="mb-3">
                            <label for="item-description" class="form-label">Description (Optional)</label>
                            <textarea class="form-control" id="item-description" rows="2" placeholder="Additional details about this safety requirement..."></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" id="save-item-btn">Add Item</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Confirmation Modal -->
    <div class="modal fade" id="confirmationModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-warning">
                    <h5 class="modal-title">Confirm Action</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p id="confirmation-message">Are you sure you want to delete this checklist?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-danger" id="confirm-action-btn">Delete</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            // Data storage
            let checklists = JSON.parse(localStorage.getItem('safetyChecklists')) || [];
            let currentChecklistId = null;

            // Default checklist items by category
            const defaultItems = {
                ppe: [
                    { title: "Hard hats worn at all times", description: "All personnel must wear hard hats in construction areas" },
                    { title: "Safety glasses/goggles worn when needed", description: "Eye protection required for tasks with flying debris" },
                    { title: "High-visibility vests worn", description: "All personnel must wear high-vis clothing on site" },
                    { title: "Steel-toed boots worn", description: "Appropriate footwear required at all times" },
                    { title: "Gloves worn for appropriate tasks", description: "Cut-resistant gloves for material handling, etc." }
                ],
                equipment: [
                    { title: "Tools and equipment in good condition", description: "No damaged or defective equipment in use" },
                    { title: "Guards in place on power tools", description: "All safety guards installed and functional" },
                    { title: "Electrical cords inspected for damage", description: "No frayed or damaged electrical cords" },
                    { title: "Ladders and scaffolding properly set up", description: "Ladders on stable surface, scaffolding properly assembled" },
                    { title: "Heavy equipment operators certified", description: "All equipment operators properly trained and certified" }
                ],
                site: [
                    { title: "Work areas kept clean and organized", description: "No tripping hazards, materials properly stored" },
                    { title: "Adequate lighting in all work areas", description: "All areas properly lit for safe work" },
                    { title: "Proper signage and barriers in place", description: "Hazard areas clearly marked, barriers installed" },
                    { title: "Emergency exits clear and accessible", description: "No obstructions blocking emergency exits" },
                    { title: "Fire extinguishers available and charged", description: "Extinguishers accessible and properly maintained" }
                ],
                procedures: [
                    { title: "Safety briefing conducted at start of shift", description: "Daily safety meeting with all crew members" },
                    { title: "Lockout/tagout procedures followed", description: "Proper procedures for equipment maintenance" },
                    { title: "Fall protection used where required", description: "Harnesses, guardrails, etc. for elevated work" },
                    { title: "First aid kit fully stocked and accessible", description: "Kit complete and readily available" },
                    { title: "Material safety data sheets available", description: "MSDS available for all hazardous materials" }
                ]
            };

            // Initialize the app
            function init() {
                loadChecklists();

                // Set default supervisor name
                $('#checklist-supervisor-input').val('John Smith');
            }

            // Load checklists into the sidebar
            function loadChecklists() {
                const checklistsList = $('#checklists-list');
                checklistsList.empty();

                if (checklists.length === 0) {
                    checklistsList.append('<div class="text-center py-4"><i class="fas fa-clipboard-list fa-2x text-muted mb-3"></i><p class="text-muted">No checklists yet. Create your first safety checklist!</p></div>');
                    return;
                }

                checklists.forEach(checklist => {
                    const progress = calculateChecklistProgress(checklist);
                    const status = getChecklistStatus(checklist);

                    const checklistItem = `
                        <div class="card mb-3 checklist-item ${currentChecklistId === checklist.id ? 'border-primary' : ''}" data-id="${checklist.id}">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <h6 class="card-title">${checklist.name}</h6>
                                    <span class="status-badge status-${status}">${status.replace('-', ' ')}</span>
                                </div>
                                <p class="card-text text-muted small">Site: ${checklist.site}</p>
                                <p class="card-text text-muted small">Supervisor: ${checklist.supervisor}</p>
                                <div class="progress mb-2" style="height: 10px;">
                                    <div class="progress-bar" role="progressbar" style="width: ${progress}%;" aria-valuenow="${progress}" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <small class="text-muted">${progress}% complete</small>
                                    <div>
                                        <button class="btn btn-sm btn-outline-primary edit-checklist" data-id="${checklist.id}">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="btn btn-sm btn-outline-danger delete-checklist" data-id="${checklist.id}">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    `;

                    checklistsList.append(checklistItem);
                });
            }

            // Calculate checklist progress
            function calculateChecklistProgress(checklist) {
                if (!checklist.items || checklist.items.length === 0) return 0;

                const completed = checklist.items.filter(item => item.status === 'compliant' || item.status === 'noncompliant').length;
                return Math.round((completed / checklist.items.length) * 100);
            }

            // Get checklist status
            function getChecklistStatus(checklist) {
                if (checklist.status === 'completed') return 'compliant';

                const progress = calculateChecklistProgress(checklist);
                if (progress === 100) return 'compliant';
                if (progress > 0) return 'pending';

                return 'pending';
            }

            // Load checklist details
            function loadChecklistDetails(checklistId) {
                const checklist = checklists.find(c => c.id === checklistId);
                if (!checklist) return;

                currentChecklistId = checklistId;

                // Update UI
                $('#no-checklist').addClass('d-none');
                $('#checklist-details').removeClass('d-none');
                $('#current-checklist-name').text(checklist.name);
                $('#checklist-site').text(checklist.site);
                $('#checklist-supervisor').text(checklist.supervisor);

                const progress = calculateChecklistProgress(checklist);
                $('#checklist-progress-bar').css('width', `${progress}%`).text(`${progress}%`);

                const status = getChecklistStatus(checklist);
                $('#checklist-status').removeClass().addClass(`status-badge status-${status}`).text(status.replace('-', ' '));

                // Load items
                loadChecklistItems(checklist);

                // Load notes
                $('#checklist-notes').val(checklist.notes || '');

                // Highlight selected checklist
                $('.checklist-item').removeClass('border-primary');
                $(`.checklist-item[data-id="${checklistId}"]`).addClass('border-primary');
            }

            // Load checklist items
            function loadChecklistItems(checklist) {
                const container = $('#checklist-items');
                container.empty();

                if (!checklist.items || checklist.items.length === 0) {
                    container.append('<p class="text-muted text-center">No items yet. Add your first safety check item!</p>');
                    updateStats(0, 0, 0);
                    return;
                }

                // Group items by category
                const itemsByCategory = {};
                checklist.items.forEach(item => {
                    if (!itemsByCategory[item.category]) {
                        itemsByCategory[item.category] = [];
                    }
                    itemsByCategory[item.category].push(item);
                });

                // Display items by category
                for (const category in itemsByCategory) {
                    const categoryTitle = category.charAt(0).toUpperCase() + category.slice(1);

                    const categoryHtml = `
                        <div class="checklist-category mb-4">
                            <div class="category-title">
                                <i class="fas fa-folder safety-icon"></i>
                                <h5>${categoryTitle}</h5>
                            </div>
                            <div class="category-items">
                                ${itemsByCategory[category].map(item => createItemHtml(item)).join('')}
                            </div>
                        </div>
                    `;

                    container.append(categoryHtml);
                }

                // Update stats
                updateChecklistStats(checklist);
            }

            // Create HTML for a checklist item
            function createItemHtml(item) {
                const statusClass = item.status === 'compliant' ? 'compliant' :
                    item.status === 'noncompliant' ? 'issue' : '';

                return `
                    <div class="safety-item ${statusClass}" data-id="${item.id}">
                        <div class="check-item">
                            <div class="check-item-content">
                                <h6 class="mb-1">${item.title}</h6>
                                <p class="mb-0 text-muted small">${item.description || ''}</p>
                            </div>
                            <div class="check-item-actions">
                                <button class="btn btn-sm btn-outline-success compliant-btn" data-id="${item.id}">
                                    <i class="fas fa-check"></i>
                                </button>
                                <button class="btn btn-sm btn-outline-danger noncompliant-btn" data-id="${item.id}">
                                    <i class="fas fa-times"></i>
                                </button>
                                <button class="btn btn-sm btn-outline-secondary pending-btn" data-id="${item.id}">
                                    <i class="fas fa-minus"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                `;
            }

            // Update checklist statistics
            function updateChecklistStats(checklist) {
                if (!checklist.items || checklist.items.length === 0) {
                    updateStats(0, 0, 0);
                    return;
                }

                const compliant = checklist.items.filter(item => item.status === 'compliant').length;
                const noncompliant = checklist.items.filter(item => item.status === 'noncompliant').length;
                const pending = checklist.items.filter(item => !item.status || item.status === 'pending').length;

                updateStats(compliant, noncompliant, pending);
            }

            // Update stats display
            function updateStats(compliant, noncompliant, pending) {
                $('#stat-compliant').text(compliant);
                $('#stat-noncompliant').text(noncompliant);
                $('#stat-pending').text(pending);
            }

            // Create a new checklist
            $('#create-checklist-btn').click(function () {
                const checklistData = {
                    name: $('#checklist-name').val(),
                    site: $('#checklist-site').val(),
                    supervisor: $('#checklist-supervisor-input').val(),
                    status: 'pending',
                    items: [],
                    notes: ''
                };

                // Add ID
                checklistData.id = Date.now().toString();

                // Add items based on template
                const template = $('#checklist-template').val();
                if (template !== 'new') {
                    for (const category in defaultItems) {
                        defaultItems[category].forEach(item => {
                            checklistData.items.push({
                                id: Date.now().toString() + Math.random().toString(36).substr(2, 5),
                                category: category,
                                title: item.title,
                                description: item.description,
                                status: 'pending'
                            });
                        });
                    }
                }

                // Add to checklists
                checklists.push(checklistData);

                // Save to localStorage
                localStorage.setItem('safetyChecklists', JSON.stringify(checklists));

            });
            loadChecklists();



            // Update UI

            // Load the new checklist
            loadChecklistDetails(checklistData.id);
        
            // Close modal
            $('#newChecklistModal').modal('hide');

            // Reset form
            $('#checklist-form')[0].reset();
            $('#checklist-supervisor-input').val('John Smith');
                

            // Save checklist progress
            $('#save-checklist-btn').click(function () {
                if (!currentChecklistId) return;

                const checklist = checklists.find(c => c.id === currentChecklistId);
                if (!checklist) return;

                // Update notes
                checklist.notes = $('#checklist-notes').val();

                // Save to localStorage
                localStorage.setItem('safetyChecklists', JSON.stringify(checklists));

                // Show confirmation
                showToast('Checklist saved successfully!', 'success');
            });

            // Mark checklist as complete
            $('#complete-checklist-btn').click(function () {
                if (!currentChecklistId) return;

                const checklist = checklists.find(c => c.id === currentChecklistId);
                if (!checklist) return;

                // Check if all items are completed
                const incompleteItems = checklist.items.filter(item => !item.status || item.status === 'pending');
                if (incompleteItems.length > 0) {
                    showToast('Please complete all items before marking as complete.', 'warning');
                    return;
                }

                // Update status
                checklist.status = 'completed';

                // Save to localStorage
                localStorage.setItem('safetyChecklists', JSON.stringify(checklists));

                // Update UI
                loadChecklists();
                loadChecklistDetails(currentChecklistId);

                // Show confirmation
                showToast('Checklist marked as complete!', 'success');
            });

            // Add custom item
            $('#add-item-btn').click(function () {
                if (!currentChecklistId) return;

                // Reset form
                $('#item-form')[0].reset();
                $('#item-id').val('');

                // Show modal
                $('#addItemModal').modal('show');
            });

            // Save custom item
            $('#save-item-btn').click(function () {
                if (!currentChecklistId) return;

                const checklist = checklists.find(c => c.id === currentChecklistId);
                if (!checklist) return;

                const itemData = {
                    id: $('#item-id').val() || Date.now().toString(),
                    category: $('#item-category').val(),
                    title: $('#item-title').val(),
                    description: $('#item-description').val(),
                    status: 'pending'
                };

                if (!checklist.items) {
                    checklist.items = [];
                }

                if ($('#item-id').val()) {
                    // Update existing item
                    const index = checklist.items.findIndex(item => item.id === $('#item-id').val());
                    if (index !== -1) {
                        checklist.items[index] = itemData;
                    }
                } else {
                    // Add new item
                    checklist.items.push(itemData);
                }

                // Save to localStorage
                localStorage.setItem('safetyChecklists', JSON.stringify(checklists));

                // Update UI
                loadChecklistDetails(currentChecklistId);

                // Close modal
                $('#addItemModal').modal('hide');

                // Show confirmation
                showToast('Item added successfully!', 'success');
            });

            // Event delegation for checklist actions
            $('#checklists-list').on('click', '.checklist-item', function (e) {
                if (!$(e.target).hasClass('edit-checklist') && !$(e.target).hasClass('delete-checklist') &&
                    !$(e.target).closest('.edit-checklist').length && !$(e.target).closest('.delete-checklist').length) {
                    const checklistId = $(this).data('id');
                    loadChecklistDetails(checklistId);
                }
            });

            $('#checklists-list').on('click', '.edit-checklist', function (e) {
                e.stopPropagation();
                const checklistId = $(this).data('id');
                const checklist = checklists.find(c => c.id === checklistId);
                if (!checklist) return;

                // Fill form
                $('#checklist-id').val(checklist.id);
                $('#checklist-name').val(checklist.name);
                $('#checklist-site').val(checklist.site);
                $('#checklist-supervisor-input').val(checklist.supervisor);

                // Show modal
                $('#newChecklistModal').modal('show');
            });

            $('#checklists-list').on('click', '.delete-checklist', function (e) {
                e.stopPropagation();
                const checklistId = $(this).data('id');

                // Set confirmation message
                $('#confirmation-message').html(`Are you sure you want to delete the checklist "<strong>${checklists.find(c => c.id === checklistId).name}</strong>"?`);

                // Set confirm button action
                $('#confirm-action-btn').off('click').on('click', function () {
                    // Remove checklist
                    checklists = checklists.filter(c => c.id !== checklistId);

                    // Save to localStorage
                    localStorage.setItem('safetyChecklists', JSON.stringify(checklists));

                    // Update UI
                    loadChecklists();

                    // If the deleted checklist was the current one, clear the details view
                    if (currentChecklistId === checklistId) {
                        currentChecklistId = null;
                        $('#no-checklist').removeClass('d-none');
                        $('#checklist-details').addClass('d-none');
                        $('#current-checklist-name').text('No Checklist Selected');
                    }

                    // Close modal
                    $('#confirmationModal').modal('hide');
                });

                // Show confirmation modal
                $('#confirmationModal').modal('show');
            });

            // Event delegation for item status buttons
            $('#checklist-items').on('click', '.compliant-btn', function () {
                const itemId = $(this).data('id');
                updateItemStatus(itemId, 'compliant');
            });

            $('#checklist-items').on('click', '.noncompliant-btn', function () {
                const itemId = $(this).data('id');
                updateItemStatus(itemId, 'noncompliant');
            });

            $('#checklist-items').on('click', '.pending-btn', function () {
                const itemId = $(this).data('id');
                updateItemStatus(itemId, 'pending');
            });

            // Update item status
            function updateItemStatus(itemId, status) {
                if (!currentChecklistId) return;

                const checklist = checklists.find(c => c.id === currentChecklistId);
                if (!checklist || !checklist.items) return;

                const item = checklist.items.find(i => i.id === itemId);
                if (!item) return;

                // Update status
                item.status = status;

                // Save to localStorage
                localStorage.setItem('safetyChecklists', JSON.stringify(checklists));

                // Update UI
                loadChecklistDetails(currentChecklistId);
            }

            // Show toast notification
            function showToast(message, type) {
                // Remove existing toasts
                $('.toast').remove();

                const toast = $(`
                        <div class="toast align-items-center text-white bg-${type === 'success' ? 'success' : type === 'warning' ? 'warning' : 'danger'} border-0 position-fixed bottom-0 end-0 m-3" role="alert" aria-live="assertive" aria-atomic="true">
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

            // Initialize the app
            init();
        });
    </script>
</main>
</asp:Content>

