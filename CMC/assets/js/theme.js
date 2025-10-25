
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

