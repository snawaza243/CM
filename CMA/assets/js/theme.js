


function viewProjectSaveProject() {

    // Project details modal
    $('.view-project').click(function () {
        const row = $(this).closest('tr');
        $('#detailProjectName').text(row.find('td:eq(0)').text());
        $('#detailClient').text(row.find('td:eq(1)').text());
        $('#detailType').text(row.find('td:eq(1)').text());
        $('#detailBudget').text(row.find('td:eq(3)').text());
        $('#detailStartDate').text(row.find('td:eq(2)').text());
        $('#detailDeadline').text(row.find('td:eq(3)').text());
        $('#detailTimeline').text(`${row.find('td:eq(2)').text()} - ${row.find('td:eq(3)').text()}`);
        $('#detailProgressBar').css('width', row.find('.progress-bar').css('width'));
        $('#detailProjectStatus').text(row.find('.status-badge').text()).attr('class', row.find('.status-badge').attr('class'));

        $('#projectDetailsModal').modal('show');
    });

    // Save project
    $('#saveProject').click(function () {
        // Simple form validation
        let valid = true;
        $('#addProjectForm input, #addProjectForm select, #addProjectForm textarea').each(function () {
            if ($(this).prop('required') && !$(this).val()) {
                valid = false;
                $(this).addClass('is-invalid');
            } else {
                $(this).removeClass('is-invalid');
            }
        });

        if (valid) {
            alert('Project added successfully!');
            $('#addProjectModal').modal('hide');
            $('#addProjectForm')[0].reset();
        }
    });
}

function createCharts() {
    // Progress Chart
    const progressCtx = document.getElementById('progressChart').getContext('2d');
    const progressChart = new Chart(progressCtx, {
        type: 'bar',
        data: {
            labels: ['Hilltop Residence', 'Downtown Plaza', 'Logistics Hub', 'Old Town Theater', 'Riverfront Condos', 'Tech Park'],
            datasets: [{
                label: 'Progress %',
                data: [100, 75, 100, 40, 60, 25],
                backgroundColor: [
                    'rgba(46, 204, 113, 0.7)',
                    'rgba(52, 152, 219, 0.7)',
                    'rgba(46, 204, 113, 0.7)',
                    'rgba(243, 156, 18, 0.7)',
                    'rgba(52, 152, 219, 0.7)',
                    'rgba(155, 89, 182, 0.7)'
                ],
                borderColor: [
                    'rgba(46, 204, 113, 1)',
                    'rgba(52, 152, 219, 1)',
                    'rgba(46, 204, 113, 1)',
                    'rgba(243, 156, 18, 1)',
                    'rgba(52, 152, 219, 1)',
                    'rgba(155, 89, 182, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                y: {
                    beginAtZero: true,
                    max: 100,
                    ticks: {
                        callback: function (value) {
                            return value + '%';
                        }
                    }
                }
            }
        }
    });

    // Budget Chart
    const budgetCtx = document.getElementById('budgetChart').getContext('2d');
    const budgetChart = new Chart(budgetCtx, {
        type: 'doughnut',
        data: {
            labels: ['Labor', 'Materials', 'Equipment', 'Subcontractors', 'Permits', 'Other'],
            datasets: [{
                data: [35, 25, 15, 15, 5, 5],
                backgroundColor: [
                    'rgba(248, 181, 0, 0.7)',
                    'rgba(46, 204, 113, 0.7)',
                    'rgba(52, 152, 219, 0.7)',
                    'rgba(155, 89, 182, 0.7)',
                    'rgba(243, 156, 18, 0.7)',
                    'rgba(231, 76, 60, 0.7)'
                ],
                borderColor: [
                    'rgba(248, 181, 0, 1)',
                    'rgba(46, 204, 113, 1)',
                    'rgba(52, 152, 219, 1)',
                    'rgba(155, 89, 182, 1)',
                    'rgba(243, 156, 18, 1)',
                    'rgba(231, 76, 60, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'bottom'
                }
            }
        }
    });

    // Finance Chart
    const financeCtx = document.getElementById('financeChart').getContext('2d');
    const financeChart = new Chart(financeCtx, {
        type: 'line',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
            datasets: [{
                label: 'Revenue',
                data: [85000, 102000, 98000, 110000, 125000, 140000, 135000, 150000, 145000, 160000, 155000, 170000],
                borderColor: 'rgba(46, 204, 113, 1)',
                backgroundColor: 'rgba(46, 204, 113, 0.1)',
                tension: 0.3,
                fill: true
            }, {
                label: 'Expenses',
                data: [65000, 72000, 68000, 75000, 82000, 90000, 95000, 92000, 98000, 105000, 102000, 110000],
                borderColor: 'rgba(231, 76, 60, 1)',
                backgroundColor: 'rgba(231, 76, 60, 0.1)',
                tension: 0.3,
                fill: true
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        callback: function (value) {
                            return '$' + value.toLocaleString();
                        }
                    }
                }
            }
        }
    });

    // Project Status Chart
    const projectStatusCtx = document.getElementById('projectStatusChart').getContext('2d');
    const projectStatusChart = new Chart(projectStatusCtx, {
        type: 'pie',
        data: {
            labels: ['Completed', 'Active', 'Planning', 'Delayed'],
            datasets: [{
                data: [5, 4, 2, 1],
                backgroundColor: [
                    'rgba(46, 204, 113, 0.7)',
                    'rgba(52, 152, 219, 0.7)',
                    'rgba(243, 156, 18, 0.7)',
                    'rgba(231, 76, 60, 0.7)'
                ],
                borderColor: [
                    'rgba(46, 204, 113, 1)',
                    'rgba(52, 152, 219, 1)',
                    'rgba(243, 156, 18, 1)',
                    'rgba(231, 76, 60, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'bottom'
                }
            }
        }
    });

    // Timeline Chart
    const timelineCtx = document.getElementById('timelineChart').getContext('2d');
    const timelineChart = new Chart(timelineCtx, {
        type: 'bar',
        data: {
            labels: ['Q1', 'Q2', 'Q3', 'Q4'],
            datasets: [{
                label: 'Projects Started',
                data: [3, 4, 3, 2],
                backgroundColor: 'rgba(52, 152, 219, 0.7)'
            }, {
                label: 'Projects Completed',
                data: [2, 3, 2, 5],
                backgroundColor: 'rgba(46, 204, 113, 0.7)'
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                x: {
                    stacked: false
                },
                y: {
                    stacked: false,
                    beginAtZero: true
                }
            }
        }
    });
}

// Initialize charts on page load

function menuAnimation() {

    // Animate progress bars on scroll
    function animateProgressBars() {
        $('.progress-bar').each(function () {
            const width = $(this).css('width');
            $(this).css('width', '0');
            setTimeout(() => {
                $(this).css('width', width);
            }, 500);
        });
    }

    // Animate progress bars when section becomes active
    $('.menu-link').click(function () {
        setTimeout(animateProgressBars, 300);
    });
}

// Responsive sidebar behavior
function handleSidebar() {
    if ($(window).width() < 992) {
        $('.sidebar').addClass('collapsed');
    } else {
        $('.sidebar').removeClass('collapsed');
    }
}

function highlightActiveMenu() {
    const currentUrl = window.location.pathname.toLowerCase();

    $('.menu-link').removeClass('active');

    const redirectMap = {
        dashboard: '/',
        projects: '/Pages/Projects.aspx',
        clients: '/Pages/Client.aspx',
        contractors: '/Pages/Contractors.aspx',
        employees: '/Pages/Employee.aspx',
        services: '/Pages/Services.aspx',
        payments: '/Pages/Payments.aspx',
        reports: '/Pages/Reports.aspx',
        settings: '/Pages/Settings.aspx'
    };

    $('.menu-link').each(function () {
        const linkText = $(this).find('.menu-text').text().trim().toLowerCase();
        const mappedUrl = redirectMap[linkText];

        if (mappedUrl) {
            if (linkText === 'dashboard' && currentUrl === '/' || currentUrl.endsWith('/default.aspx')) {
                $(this).addClass('active');
                $('.page-title').text($(this).find('.menu-text').text().trim());
            }
            else if (linkText !== 'dashboard' && currentUrl.includes(mappedUrl.toLowerCase())) {
                $(this).addClass('active');
                $('.page-title').text($(this).find('.menu-text').text().trim());
            }
        }
    });


}


$(document).ready(function () {
    $('.sidebar-toggle').click(function () {
        $('.sidebar').toggleClass('collapsed');
    });

     

    $('.menu-link').click(function (e) {
        e.preventDefault();

        $('.menu-link').removeClass('active');

        $(this).addClass('active');

        const clickedText = $(this).find('.menu-text').text().trim().toLowerCase();

        const redirectMap = {
            dashboard: '/',
            projects: '/Pages/Projects.aspx',
            clients: '/Pages/Client.aspx',
            contractors: '/Pages/Contractors.aspx',
            employees: '/Pages/Employee.aspx',
            services: '/Pages/Services.aspx',
            payments: '/Pages/Payments.aspx',
            reports: '/Pages/Reports.aspx',
            settings: '/Pages/Settings.aspx'
        };

        if (redirectMap[clickedText]) {
            window.location.href = redirectMap[clickedText];
        } else {
            alert('Page not found!');
            console.warn('No redirect mapping for:', clickedText);
            window.location.href = '/';
        }

        if ($(window).width() < 768) {
            $('.sidebar').removeClass('active');
            $('.sidebar-overlay').removeClass('active');
        }
    });

    highlightActiveMenu();


    $('.theme-btn').click(function () {
        const theme = $(this).data('theme');
        $('body').attr('data-theme', theme);
        localStorage.setItem('admin-theme', theme);

        // Update charts when theme changes
        createCharts();
    });

    const savedTheme = localStorage.getItem('admin-theme') || 'default';
    $('body').attr('data-theme', savedTheme);

    createCharts();
    handleSidebar();
    menuAnimation();
    // Handle resize
    $(window).resize(function () {
        handleSidebar();
    });
});
