<%@ Page Title="Project Timeline Planner" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Project_Timeline_Planner.aspx.cs" Inherits="CMC.Pages.Tool.Project_Timeline_Planner" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  <main class="content">


    <style>
      
        
        
        
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
            margin-bottom: 20px;
        }
        
        .card:hover {
            transform: translateY(-5px);
        }
        
        
        
        
        
        .timeline {
            position: relative;
            padding: 20px 0;
        }
        
        .timeline::before {
            content: '';
            position: absolute;
            left: 50%;
            width: 4px;
            height: 100%;
            background: var(--accent);
            transform: translateX(-50%);
        }
        
        .timeline-item {
            position: relative;
            margin-bottom: 40px;
        }
        
        .timeline-content {
            position: relative;
            width: 45%;
            padding: 20px;
            border-radius: 10px;
            background: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .timeline-item:nth-child(odd) .timeline-content {
            margin-left: auto;
        }
        
        .timeline-item:nth-child(even) .timeline-content {
            margin-right: auto;
        }
        
        .timeline-content::after {
            content: '';
            position: absolute;
            top: 20px;
            width: 20px;
            height: 20px;
            background: var(--accent);
            border-radius: 50%;
        }
        
        .timeline-item:nth-child(odd) .timeline-content::after {
            left: -30px;
        }
        
        .timeline-item:nth-child(even) .timeline-content::after {
            right: -30px;
        }
        
        .progress {
            height: 25px;
            border-radius: 5px;
        }
        
        .milestone-status {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }
        
        .status-not-started {
            background-color: #f8f9fa;
            color: #6c757d;
        }
        
        .status-in-progress {
            background-color: #fff3cd;
            color: #856404;
        }
        
        .status-completed {
            background-color: #d4edda;
            color: #155724;
        }
        
        .status-delayed {
            background-color: #f8d7da;
            color: #721c24;
        }
        
        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('https://images.unsplash.com/photo-1503387762-592deb58ef4e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1500&q=80');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 80px 0;
            margin-bottom: 40px;
        }
        
        .footer {
            background-color: var(--dark);
            color: white;
            padding: 30px 0;
            margin-top: 40px;
        }
        
        @media (max-width: 768px) {
            .timeline::before {
                left: 30px;
            }
            
            .timeline-content {
                width: calc(100% - 80px);
                margin-left: 80px !important;
            }
            
            .timeline-content::after {
                left: -50px !important;
                right: auto !important;
            }
        }
    </style>
 
    <!-- Hero Section -->
    <div class="hero-section">
        <div class="container text-center">
            <h1 class="display-4 fw-bold">Project Timeline Planner</h1>
            <p class="lead">Plan milestones and deadlines to keep your construction project on track</p>
            <button class="btn btn-primary btn-lg mt-3" data-bs-toggle="modal" data-bs-target="#projectModal">
                <i class="fas fa-plus me-2"></i>Create New Project
            </button>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h5 class="card-title mb-0"><i class="fas fa-list me-2"></i>Your Projects</h5>
                    </div>
                    <div class="card-body">
                        <div id="projects-list">
                            <!-- Projects will be loaded here -->
                        </div>
                    </div>
                </div>
                
                <div class="card mt-4">
                    <div class="card-header bg-primary text-white">
                        <h5 class="card-title mb-0"><i class="fas fa-chart-pie me-2"></i>Project Stats</h5>
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <span class="fw-bold">Total Projects:</span>
                            <span id="total-projects" class="float-end">0</span>
                        </div>
                        <div class="mb-3">
                            <span class="fw-bold">Active Projects:</span>
                            <span id="active-projects" class="float-end">0</span>
                        </div>
                        <div class="mb-3">
                            <span class="fw-bold">Completed Projects:</span>
                            <span id="completed-projects" class="float-end">0</span>
                        </div>
                        <div class="progress mt-4">
                            <div id="overall-progress" class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
                        </div>
                        <small class="text-muted">Overall Completion</small>
                    </div>
                </div>
            </div>
            
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                        <h5 class="card-title mb-0"><i class="fas fa-project-diagram me-2"></i>Project Timeline</h5>
                        <div id="current-project-name" class="fw-bold">No Project Selected</div>
                    </div>
                    <div class="card-body">
                        <div id="no-project" class="text-center py-5">
                            <i class="fas fa-folder-open fa-3x text-muted mb-3"></i>
                            <p class="text-muted">Select a project from the list to view its timeline</p>
                        </div>
                        
                        <div id="project-details" class="d-none">
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <div>
                                    <span class="fw-bold">Start Date: </span>
                                    <span id="project-start-date"></span>
                                </div>
                                <div>
                                    <span class="fw-bold">End Date: </span>
                                    <span id="project-end-date"></span>
                                </div>
                                <div>
                                    <span class="fw-bold">Status: </span>
                                    <span id="project-status" class="milestone-status status-not-started"></span>
                                </div>
                            </div>
                            
                            <div class="progress mb-4">
                                <div id="project-progress-bar" class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
                            </div>
                            
                            <div class="d-flex justify-content-between mb-3">
                                <h5>Milestones</h5>
                                <button class="btn btn-sm btn-primary" id="add-milestone-btn">
                                    <i class="fas fa-plus me-1"></i>Add Milestone
                                </button>
                            </div>
                            
                            <div class="timeline" id="milestones-timeline">
                                <!-- Timeline items will be loaded here -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <!-- Create Project Modal -->
    <div class="modal fade" id="projectModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title" id="projectModalTitle">Create New Project</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="project-form">
                        <input type="hidden" id="project-id">
                        <div class="mb-3">
                            <label for="project-name" class="form-label">Project Name</label>
                            <input type="text" class="form-control" id="project-name" required>
                        </div>
                        <div class="mb-3">
                            <label for="project-description" class="form-label">Description</label>
                            <textarea class="form-control" id="project-description" rows="3"></textarea>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="project-start-date-input" class="form-label">Start Date</label>
                                <input type="date" class="form-control" id="project-start-date-input" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="project-end-date-input" class="form-label">End Date</label>
                                <input type="date" class="form-control" id="project-end-date-input" required>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" id="save-project-btn">Save Project</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Milestone Modal -->
    <div class="modal fade" id="milestoneModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title" id="milestoneModalTitle">Add Milestone</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="milestone-form">
                        <input type="hidden" id="milestone-id">
                        <input type="hidden" id="milestone-project-id">
                        <div class="mb-3">
                            <label for="milestone-name" class="form-label">Milestone Name</label>
                            <input type="text" class="form-control" id="milestone-name" required>
                        </div>
                        <div class="mb-3">
                            <label for="milestone-description" class="form-label">Description</label>
                            <textarea class="form-control" id="milestone-description" rows="3"></textarea>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="milestone-date" class="form-label">Due Date</label>
                                <input type="date" class="form-control" id="milestone-date" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="milestone-status" class="form-label">Status</label>
                                <select class="form-select" id="milestone-status">
                                    <option value="not-started">Not Started</option>
                                    <option value="in-progress">In Progress</option>
                                    <option value="completed">Completed</option>
                                    <option value="delayed">Delayed</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" id="save-milestone-btn">Save Milestone</button>
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
                    <p id="confirmation-message">Are you sure you want to delete this project?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-danger" id="confirm-action-btn">Delete</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            // Data storage
            let projects = JSON.parse(localStorage.getItem('constructionProjects')) || [];
            let currentProjectId = null;
            
            // Initialize the app
            function init() {
                loadProjects();
                updateStats();
                
                // Set default dates to today and 30 days from today
                const today = new Date().toISOString().split('T')[0];
                const nextMonth = new Date();
                nextMonth.setDate(nextMonth.getDate() + 30);
                const nextMonthFormatted = nextMonth.toISOString().split('T')[0];
                
                $('#project-start-date-input').val(today);
                $('#project-end-date-input').val(nextMonthFormatted);
            }
            
            // Load projects into the sidebar
            function loadProjects() {
                const projectsList = $('#projects-list');
                projectsList.empty();
                
                if (projects.length === 0) {
                    projectsList.append('<p class="text-muted text-center">No projects yet. Create your first project!</p>');
                    return;
                }
                
                projects.forEach(project => {
                    const progress = calculateProjectProgress(project);
                    const status = getProjectStatus(project);
                    
                    const projectItem = `
                        <div class="card mb-3 project-item ${currentProjectId === project.id ? 'border-primary' : ''}" data-id="${project.id}">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <h6 class="card-title">${project.name}</h6>
                                    <span class="milestone-status status-${status}">${status.replace('-', ' ')}</span>
                                </div>
                                <p class="card-text text-muted small">${project.description || 'No description'}</p>
                                <div class="progress mb-2" style="height: 10px;">
                                    <div class="progress-bar" role="progressbar" style="width: ${progress}%;" aria-valuenow="${progress}" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <small class="text-muted">${progress}% complete</small>
                                    <div>
                                        <button class="btn btn-sm btn-outline-primary edit-project" data-id="${project.id}">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="btn btn-sm btn-outline-danger delete-project" data-id="${project.id}">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    `;
                    
                    projectsList.append(projectItem);
                });
            }
            
            // Calculate project progress based on milestones
            function calculateProjectProgress(project) {
                if (!project.milestones || project.milestones.length === 0) return 0;
                
                const completed = project.milestones.filter(m => m.status === 'completed').length;
                return Math.round((completed / project.milestones.length) * 100);
            }
            
            // Get project status based on dates and milestones
            function getProjectStatus(project) {
                const today = new Date();
                const startDate = new Date(project.startDate);
                const endDate = new Date(project.endDate);
                
                if (today < startDate) return 'not-started';
                if (today > endDate) {
                    const progress = calculateProjectProgress(project);
                    return progress === 100 ? 'completed' : 'delayed';
                }
                
                const progress = calculateProjectProgress(project);
                if (progress === 100) return 'completed';
                if (progress > 0) return 'in-progress';
                
                return 'not-started';
            }
            
            // Update statistics
            function updateStats() {
                $('#total-projects').text(projects.length);
                
                const activeProjects = projects.filter(p => {
                    const status = getProjectStatus(p);
                    return status === 'in-progress' || status === 'not-started';
                }).length;
                
                const completedProjects = projects.filter(p => {
                    const status = getProjectStatus(p);
                    return status === 'completed';
                }).length;
                
                $('#active-projects').text(activeProjects);
                $('#completed-projects').text(completedProjects);
                
                // Calculate overall progress
                let totalProgress = 0;
                if (projects.length > 0) {
                    projects.forEach(p => {
                        totalProgress += calculateProjectProgress(p);
                    });
                    totalProgress = Math.round(totalProgress / projects.length);
                }
                
                $('#overall-progress').css('width', `${totalProgress}%`).text(`${totalProgress}%`);
            }
            
            // Load project details
            function loadProjectDetails(projectId) {
                const project = projects.find(p => p.id === projectId);
                if (!project) return;
                
                currentProjectId = projectId;
                
                // Update UI
                $('#no-project').addClass('d-none');
                $('#project-details').removeClass('d-none');
                $('#current-project-name').text(project.name);
                $('#project-start-date').text(formatDate(project.startDate));
                $('#project-end-date').text(formatDate(project.endDate));
                
                const progress = calculateProjectProgress(project);
                $('#project-progress-bar').css('width', `${progress}%`).text(`${progress}%`);
                
                const status = getProjectStatus(project);
                $('#project-status').removeClass().addClass(`milestone-status status-${status}`).text(status.replace('-', ' '));
                
                // Load milestones
                loadMilestones(project);
                
                // Highlight selected project
                $('.project-item').removeClass('border-primary');
                $(`.project-item[data-id="${projectId}"]`).addClass('border-primary');
            }
            
            // Load milestones for a project
            function loadMilestones(project) {
                const timeline = $('#milestones-timeline');
                timeline.empty();
                
                if (!project.milestones || project.milestones.length === 0) {
                    timeline.append('<p class="text-muted text-center">No milestones yet. Add your first milestone!</p>');
                    return;
                }
                
                // Sort milestones by date
                project.milestones.sort((a, b) => new Date(a.date) - new Date(b.date));
                
                project.milestones.forEach(milestone => {
                    const milestoneItem = `
                        <div class="timeline-item" data-id="${milestone.id}">
                            <div class="timeline-content">
                                <div class="d-flex justify-content-between align-items-start">
                                    <h6>${milestone.name}</h6>
                                    <span class="milestone-status status-${milestone.status}">${milestone.status.replace('-', ' ')}</span>
                                </div>
                                <p class="small text-muted">${milestone.description || 'No description'}</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <small class="text-muted">Due: ${formatDate(milestone.date)}</small>
                                    <div>
                                        <button class="btn btn-sm btn-outline-primary edit-milestone" data-id="${milestone.id}">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button class="btn btn-sm btn-outline-danger delete-milestone" data-id="${milestone.id}">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    `;
                    
                    timeline.append(milestoneItem);
                });
            }
            
            // Format date for display
            function formatDate(dateString) {
                const options = { year: 'numeric', month: 'short', day: 'numeric' };
                return new Date(dateString).toLocaleDateString(undefined, options);
            }
            
            // Save project
            $('#save-project-btn').click(function() {
                const projectId = $('#project-id').val();
                const projectData = {
                    name: $('#project-name').val(),
                    description: $('#project-description').val(),
                    startDate: $('#project-start-date-input').val(),
                    endDate: $('#project-end-date-input').val(),
                    milestones: []
                };
                
                if (projectId) {
                    // Update existing project
                    const index = projects.findIndex(p => p.id === projectId);
                    if (index !== -1) {
                        projectData.id = projectId;
                        projectData.milestones = projects[index].milestones || [];
                        projects[index] = projectData;
                    }
                } else {
                    // Create new project
                    projectData.id = Date.now().toString();
                    projects.push(projectData);
                }
                
                // Save to localStorage
                localStorage.setItem('constructionProjects', JSON.stringify(projects));
                
                // Update UI
                loadProjects();
                updateStats();
                
                // If this is the current project or it's a new project, load it
                if (!projectId || currentProjectId === projectId) {
                    loadProjectDetails(projectData.id);
                }
                
                // Close modal
                $('#projectModal').modal('hide');
                
                // Reset form
                $('#project-form')[0].reset();
                $('#project-id').val('');
            });
            
            // Save milestone
            $('#save-milestone-btn').click(function() {
                const milestoneId = $('#milestone-id').val();
                const projectId = $('#milestone-project-id').val();
                const milestoneData = {
                    name: $('#milestone-name').val(),
                    description: $('#milestone-description').val(),
                    date: $('#milestone-date').val(),
                    status: $('#milestone-status').val()
                };
                
                const project = projects.find(p => p.id === projectId);
                if (!project) return;
                
                if (!project.milestones) {
                    project.milestones = [];
                }
                
                if (milestoneId) {
                    // Update existing milestone
                    const index = project.milestones.findIndex(m => m.id === milestoneId);
                    if (index !== -1) {
                        milestoneData.id = milestoneId;
                        project.milestones[index] = milestoneData;
                    }
                } else {
                    // Create new milestone
                    milestoneData.id = Date.now().toString();
                    project.milestones.push(milestoneData);
                }
                
                // Save to localStorage
                localStorage.setItem('constructionProjects', JSON.stringify(projects));
                
                // Update UI
                loadProjectDetails(projectId);
                updateStats();
                
                // Close modal
                $('#milestoneModal').modal('hide');
                
                // Reset form
                $('#milestone-form')[0].reset();
                $('#milestone-id').val('');
                $('#milestone-project-id').val('');
            });
            
            // Event delegation for project actions
            $('#projects-list').on('click', '.project-item', function(e) {
                if (!$(e.target).hasClass('edit-project') && !$(e.target).hasClass('delete-project') && 
                    !$(e.target).closest('.edit-project').length && !$(e.target).closest('.delete-project').length) {
                    const projectId = $(this).data('id');
                    loadProjectDetails(projectId);
                }
            });
            
            $('#projects-list').on('click', '.edit-project', function(e) {
                e.stopPropagation();
                const projectId = $(this).data('id');
                const project = projects.find(p => p.id === projectId);
                if (!project) return;
                
                // Fill form
                $('#project-id').val(project.id);
                $('#project-name').val(project.name);
                $('#project-description').val(project.description || '');
                $('#project-start-date-input').val(project.startDate);
                $('#project-end-date-input').val(project.endDate);
                
                // Show modal
                $('#projectModalTitle').text('Edit Project');
                $('#projectModal').modal('show');
            });
            
            $('#projects-list').on('click', '.delete-project', function(e) {
                e.stopPropagation();
                const projectId = $(this).data('id');
                
                // Set confirmation message
                $('#confirmation-message').html(`Are you sure you want to delete the project "<strong>${projects.find(p => p.id === projectId).name}</strong>"?`);
                
                // Set confirm button action
                $('#confirm-action-btn').off('click').on('click', function() {
                    // Remove project
                    projects = projects.filter(p => p.id !== projectId);
                    
                    // Save to localStorage
                    localStorage.setItem('constructionProjects', JSON.stringify(projects));
                    
                    // Update UI
                    loadProjects();
                    updateStats();
                    
                    // If the deleted project was the current one, clear the details view
                    if (currentProjectId === projectId) {
                        currentProjectId = null;
                        $('#no-project').removeClass('d-none');
                        $('#project-details').addClass('d-none');
                        $('#current-project-name').text('No Project Selected');
                    }
                    
                    // Close modal
                    $('#confirmationModal').modal('hide');
                });
                
                // Show confirmation modal
                $('#confirmationModal').modal('show');
            });
            
            // Add milestone button
            $('#add-milestone-btn').click(function() {
                if (!currentProjectId) return;
                
                // Set project ID
                $('#milestone-project-id').val(currentProjectId);
                
                // Set default date to project end date
                const project = projects.find(p => p.id === currentProjectId);
                if (project) {
                    $('#milestone-date').val(project.endDate);
                }
                
                // Reset form
                $('#milestone-form')[0].reset();
                $('#milestone-id').val('');
                
                // Show modal
                $('#milestoneModalTitle').text('Add Milestone');
                $('#milestoneModal').modal('show');
            });
            
            // Event delegation for milestone actions
            $('#milestones-timeline').on('click', '.edit-milestone', function() {
                const milestoneId = $(this).data('id');
                const project = projects.find(p => p.id === currentProjectId);
                if (!project || !project.milestones) return;
                
                const milestone = project.milestones.find(m => m.id === milestoneId);
                if (!milestone) return;
                
                // Fill form
                $('#milestone-id').val(milestone.id);
                $('#milestone-project-id').val(currentProjectId);
                $('#milestone-name').val(milestone.name);
                $('#milestone-description').val(milestone.description || '');
                $('#milestone-date').val(milestone.date);
                $('#milestone-status').val(milestone.status);
                
                // Show modal
                $('#milestoneModalTitle').text('Edit Milestone');
                $('#milestoneModal').modal('show');
            });
            
            $('#milestones-timeline').on('click', '.delete-milestone', function() {
                const milestoneId = $(this).data('id');
                const project = projects.find(p => p.id === currentProjectId);
                if (!project || !project.milestones) return;
                
                const milestone = project.milestones.find(m => m.id === milestoneId);
                if (!milestone) return;
                
                // Set confirmation message
                $('#confirmation-message').html(`Are you sure you want to delete the milestone "<strong>${milestone.name}</strong>"?`);
                
                // Set confirm button action
                $('#confirm-action-btn').off('click').on('click', function() {
                    // Remove milestone
                    project.milestones = project.milestones.filter(m => m.id !== milestoneId);
                    
                    // Save to localStorage
                    localStorage.setItem('constructionProjects', JSON.stringify(projects));
                    
                    // Update UI
                    loadProjectDetails(currentProjectId);
                    updateStats();
                    
                    // Close modal
                    $('#confirmationModal').modal('hide');
                });
                
                // Show confirmation modal
                $('#confirmationModal').modal('show');
            });
            
            // Initialize the app
            init();
        });
    </script>
</main>

</asp:Content>

