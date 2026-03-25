// Client Projects Modal Functionality
$(document).ready(function () {


    // Open Client Projects Modal
    $(document).on('click', '.my-projects-link', function (e) {
        e.preventDefault();
        $('#clientProjectsModal').modal('show');
        loadClientProjects();
    });

    // Open Project Details Modal
    $(document).on('click', '.view-project-details', function () {
        const projectId = $(this).data('project');
        loadProjectDetails(projectId);
        $('#projectDetailsModal').modal('show');
    });

    // Request New Project
    $('#requestNewProject').click(function () {
        $('#clientProjectsModal').modal('hide');
        // You can redirect to quote request or open another modal
        $('#quoteModal').modal('show');
    });

    // Contact Project Manager
    $('#contactProjectManager').click(function () {
        const projectName = $('#detailProjectName').text();
        alert(`Contacting project manager for: ${projectName}`);
        // You can implement email functionality here
    });

    // Load Client Projects
    function loadClientProjects() {
        // Mock data - replace with actual API call
        const projects = [
            {
                id: 1,
                name: "Hilltop Residence",
                type: "Residential",
                startDate: "15 Mar 2023",
                deadline: "15 Sep 2023",
                progress: 100,
                status: "Completed",
                budget: "$350,000",
                description: "A contemporary 4-bedroom home with sustainable features and panoramic views."
            },
            {
                id: 2,
                name: "Office Renovation",
                type: "Commercial",
                startDate: "01 Jun 2023",
                deadline: "15 Dec 2023",
                progress: 75,
                status: "In Progress",
                budget: "$150,000",
                description: "Complete office space renovation with modern amenities."
            },
            {
                id: 3,
                name: "Kitchen Remodel",
                type: "Renovation",
                startDate: "10 Aug 2023",
                deadline: "30 Nov 2023",
                progress: 40,
                status: "Planning",
                budget: "$45,000",
                description: "Kitchen remodeling with new cabinets, countertops, and appliances."
            }
        ];

        // Update stats cards
        $('.card:nth-child(1) h3').text(projects.length);
        $('.card:nth-child(2) h3').text(projects.filter(p => p.status === 'Completed').length);
        $('.card:nth-child(3) h3').text(projects.filter(p => p.status === 'In Progress').length);
        $('.card:nth-child(4) h3').text(projects.filter(p => p.status === 'Planning').length);
    }

    // Load Project Details
    function loadProjectDetails(projectId) {
        // Mock data - replace with actual API call
        const projectDetails = {
            1: {
                name: "Hilltop Residence",
                type: "Residential",
                budget: "$350,000",
                startDate: "15 Mar 2023",
                deadline: "15 Sep 2023",
                progress: 100,
                status: "Completed",
                description: "A contemporary 4-bedroom home with sustainable features and panoramic views.",
                team: [
                    { name: "Michael Johnson", role: "General Contractor", avatar: "men/32" },
                    { name: "Sarah Williams", role: "Project Manager", avatar: "women/44" }
                ]
            },
            2: {
                name: "Office Renovation",
                type: "Commercial",
                budget: "$150,000",
                startDate: "01 Jun 2023",
                deadline: "15 Dec 2023",
                progress: 75,
                status: "In Progress",
                description: "Complete office space renovation with modern amenities.",
                team: [
                    { name: "Robert Chen", role: "Project Manager", avatar: "men/76" }
                ]
            },
            3: {
                name: "Kitchen Remodel",
                type: "Renovation",
                budget: "$45,000",
                startDate: "10 Aug 2023",
                deadline: "30 Nov 2023",
                progress: 40,
                status: "Planning",
                description: "Kitchen remodeling with new cabinets, countertops, and appliances.",
                team: [
                    { name: "Michael Johnson", role: "General Contractor", avatar: "men/32" }
                ]
            }
        };

        const project = projectDetails[projectId];
        if (project) {
            // Update modal content
            $('#detailProjectName').text(project.name);
            $('#detailProjectDescription').text(project.description);
            $('#detailProjectType').text(project.type);
            $('#detailBudget').text(project.budget);
            $('#detailStartDate').text(project.startDate);
            $('#detailDeadline').text(project.deadline);
            $('#detailStartDate2').text(project.startDate);
            $('#detailDeadline2').text(project.deadline);
            $('#detailProgressBar').css('width', project.progress + '%');
            $('#detailProjectStatus').text(project.status).removeClass('bg-success bg-primary bg-warning').addClass(getStatusClass(project.status));

            // Update assigned team
            $('#assignedTeam').empty();
            project.team.forEach(member => {
                $('#assignedTeam').append(`
                    <div class="d-flex align-items-center mb-2">
                        <img src="https://randomuser.me/api/portraits/${member.avatar}.jpg" alt="${member.name}" class="rounded-circle me-2" width="40" height="40">
                        <div>
                            <strong>${member.name}</strong><br>
                            <small class="text-muted">${member.role}</small>
                        </div>
                    </div>
                `);
            });
        }
    }

    // Helper function to get status class
    function getStatusClass(status) {
        const statusClasses = {
            'Completed': 'bg-success',
            'In Progress': 'bg-primary',
            'Planning': 'bg-warning',
            'Delayed': 'bg-danger'
        };
        return statusClasses[status] || 'bg-secondary';
    }
});