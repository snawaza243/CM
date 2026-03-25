// Alert notification function
function showAlert(message, type = 'info') {
    const alertClass = {
        'success': 'alert-success',
        'error': 'alert-danger',
        'warning': 'alert-warning',
        'info': 'alert-info'
    }[type] || 'alert-info';

    const alertHtml = `
                            <div class="alert ${alertClass} alert-dismissible fade show position-fixed top-0 end-0 m-3" style="z-index: 1060;">
                                ${message}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        `;

    $('body').append(alertHtml);

    setTimeout(() => {
        $('.alert').alert('close');
    }, 5000);
}

// Check login status on page load
function checkLoginStatus() {
    const isLoggedIn = localStorage.getItem('isLoggedIn') === 'true';
    1111(isLoggedIn);
}

// Update UI based on login status
function updateUserInterface(isLoggedIn) {
    if (isLoggedIn) {
        const userName = localStorage.getItem('userName') || 'User';
        const userRole = localStorage.getItem('userRole') || 'user';
        const userType = localStorage.getItem('userType') || 'client';

        // Hide login link, show user options
        $('.login-link').hide();
        $('.logged-in-options').show();

        // Update user info
        $('.user-name').text(userName);
        $('.user-role').text(userRole.charAt(0).toUpperCase() + userRole.slice(1));

    } else {
        // Show login link, hide user options
        $('.login-link').show();
        $('.logged-in-options').hide();
    }
}


function login() {

    showAlert('i am in login function', 'info');
    return;

    const email = $('#loginEmail').val();
    const password = $('#loginPassword').val();
    const rememberMe = $('#rememberMe').is(':checked');

    if (!email || !password) {
        showAlert('Please fill in all fields', 'error');
        return;
    }

    // Different login credentials for frontend vs admin
    const isAdminPage = window.location.href.includes('admin') || $('.page-title').text().toLowerCase().includes('dashboard');

    if (isAdminPage) {
        // Admin login
        if (email === 'admin@buildright.com' && password === 'admin123') {
            localStorage.setItem('isLoggedIn', 'true');
            localStorage.setItem('userEmail', email);
            localStorage.setItem('userName', 'Admin User');
            localStorage.setItem('userRole', 'Administrator');
            localStorage.setItem('userType', 'admin');

            updateUserInterface(true);
            $('#loginModal').modal('hide');
            showAlert('Admin login successful!', 'success');
        } else {
            showAlert('Invalid admin credentials' + email + password, 'error');
        }
    } else {
        // Client login (frontend)
        if (email === 'client@buildright.com' && password === 'client123') {
            localStorage.setItem('isLoggedIn', 'true');
            localStorage.setItem('userEmail', email);
            localStorage.setItem('userName', 'John Client');
            localStorage.setItem('userRole', 'Customer');
            localStorage.setItem('userType', 'client');

            updateUserInterface(true);
            $('#loginModal').modal('hide');
            showAlert('Client login successful!', 'success');
        } else {
            showAlert('Invalid client credentials', 'error');
        }
    }
}



$(document).ready(function () {

    // Initialize
    checkLoginStatus();


    // Open login modal
    $(document).on('click', '.login-link', function (e) {
        e.preventDefault();
        e.stopPropagation();
        $('#loginModal').modal('show');
    });



    $(document).on("click", "#btn-login", function () {
        console.log('clicked on lgoin button')
        login();
    });


    // Profile save functionality
    $('#saveProfile').on('click', function () {
        const formData = {
            firstName: $('#profileFirstName').val(),
            lastName: $('#profileLastName').val(),
            email: $('#profileEmail').val(),
            phone: $('#profilePhone').val(),
            address: $('#profileAddress').val()
        };

        // Mock save
        localStorage.setItem('userName', `${formData.firstName} ${formData.lastName}`);
        localStorage.setItem('userEmail', formData.email);

        updateUserInterface(true);
        $('#userProfileModal').modal('hide');
        showAlert('Profile updated successfully!', 'success');
    });

    // Logout functionality
    $(document).on('click', '.logout-btn', function (e) {
        e.preventDefault();

        const userType = localStorage.getItem('userType');

        localStorage.removeItem('isLoggedIn');
        localStorage.removeItem('userName');
        localStorage.removeItem('userEmail');
        localStorage.removeItem('userRole');
        localStorage.removeItem('userType');

        updateUserInterface(false);
        showAlert(`You have been logged out${userType ? ' from ' + userType + ' account' : ''}`, 'info');
    });


    // Open profile modal
    $(document).on('click', '.profile-link', function (e) {
        e.preventDefault();
        $('#userProfileModal').modal('show');
    });

 
    // Auto-focus on email field when modal opens
    $('#loginModal').on('shown.bs.modal', function () {
        $('#loginEmail').focus();
    });
});

