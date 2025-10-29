
function showAlert(message, type = 'info') {
    const alertClass = type === 'error' ? 'danger' : type === 'success' ? 'success' : 'info';
    const alertBox = $(`
            <div class="alert alert-${alertClass} alert-dismissible fade show position-fixed top-0 end-0 m-3" style="z-index:1055;">
                ${message}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        `);
    $('body').append(alertBox);
    setTimeout(() => alertBox.alert('close'), 3000);
}


$(document).ready(function () {
    // Sidebar toggle
    $('.sidebar-toggle').click(function (e) {
        e.preventDefault();

        $('.sidebar').toggleClass('active');
        $('.sidebar-overlay').toggleClass('active');
    });

    $('.sidebar-overlay').click(function () {
        $('.sidebar').removeClass('active');
        $('.sidebar-overlay').removeClass('active');
    });

    // Navigation


    $('.nav-link, .bottom-nav-item').click(function (e) {
        e.preventDefault();

        $('.nav-link').removeClass('active');
        $('.bottom-nav-item').removeClass('active');

        $(this).addClass('active');

        const clickedText = $(this).text().trim().toLowerCase();

        
        const redirectMap = {
            services: '/Pages/Services.aspx',
            projects: '/Pages/Projects.aspx',
            tools: '/Pages/Tools.aspx',
            about: '/Pages/About.aspx',
            contact: '/Pages/Contact.aspx',
        };

        // If the text matches any key in the map, redirect
        if (redirectMap[clickedText]) {
            window.location.href = redirectMap[clickedText];
        } else {
            showAlert('Not page exist!', 'error');
            window.location.href = '/';
            console.log('No redirect mapping found for:', clickedText);
        }


        if ($(window).width() < 768) {
            $('.sidebar').removeClass('active');
            $('.sidebar-overlay').removeClass('active');
        }
    });

    function highlightActiveNav() {
        const currentUrl = window.location.pathname.toLowerCase();

        // Remove all active states first
        $('.nav-link, .bottom-nav-item').removeClass('active');

        // Loop through each nav link
        $('.nav-link, .bottom-nav-item').each(function () {
            const linkText = $(this).text().trim().toLowerCase();

            // Define same mapping used in click event
            const redirectMap = {
                services: '/Pages/Services.aspx',
                projects: '/Pages/Projects.aspx',
                tools: '/Pages/Tools.aspx',
                about: '/Pages/About.aspx',
                contact: '/Pages/Contact.aspx',
            };

            // If current URL contains the mapped page, highlight it
            if (redirectMap[linkText] && currentUrl.includes(redirectMap[linkText].toLowerCase())) {
                $(this).addClass('active');
            }

            /*
            if ($(window).width() < 768) {
                $('.sidebar').removeClass('active');
                $('.sidebar-overlay').removeClass('active');
            } else {
                $('.sidebar').addClass('active');
                $('.sidebar-overlay').addClass('active');
            }*/
        });
    }

    highlightActiveNav();
    function redirectToPageOnSidebar() {


        $('.nav-link, .bottom-nav-item').click(function (e) {
            e.preventDefault();

            // Remove active class from all nav items
            $('.nav-link').removeClass('active');
            $('.bottom-nav-item').removeClass('active');

            // Add active class to clicked nav item
            $(this).addClass('active');

            // Get section to show
            const section = $(this).data('section');

            // Hide all sections
            $('.section').removeClass('active');

            // Show selected section
            $(`#${section}`).addClass('active');

            // Close sidebar on mobile after selection
            if ($(window).width() < 768) {
                $('.sidebar').removeClass('active');
                $('.sidebar-overlay').removeClass('active');
            }
        });
    }

    // Theme switching
    $('.theme-btn').click(function () {
        const theme = $(this).data('theme');
        $('body').attr('data-theme', theme);
        localStorage.setItem('construction-theme', theme);
    });

    // Load saved theme
    const savedTheme = localStorage.getItem('construction-theme') || 'default';
    $('body').attr('data-theme', savedTheme);

    // Header scroll effect
    $(window).scroll(function () {
        if ($(window).scrollTop() > 50) {
            $('.header').addClass('scrolled');
        } else {
            $('.header').removeClass('scrolled');
        }
    });

   
    // Contact form submission
    $('#contactForm').submit(function (e) {
        e.preventDefault();

        // Simple form validation
        let valid = true;
        $('#contactForm input, #contactForm textarea').each(function () {
            if (!$(this).val()) {
                valid = false;
                $(this).addClass('is-invalid');
            } else {
                $(this).removeClass('is-invalid');
            }
        });

        if (valid) {
            alert('Thank you for your message! We will get back to you soon.');
            $('#contactForm')[0].reset();
        }
    });
});

