function checkLoginStatus() {
    const isLoggedIn = localStorage.getItem('isLoggedIn') === 'true';
    updateUserInterface(isLoggedIn);
}

// Update UI based on login status

function updateUserInterface(isLoggedIn) {
    if (isLoggedIn) {
        const userName = localStorage.getItem('userName') || 'User';
        const userRole = localStorage.getItem('userRole') || 'user';

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



$('#loginForm').on('submit', function (e) {
    e.preventDefault();

    const email = $('#loginEmail').val();
    const password = $('#loginPassword').val();
    const rememberMe = $('#rememberMe').is(':checked');

    // Simple validation
    if (!email || !password) {
        showAlert('Please fill in all fields', 'error');
        return;
    }

    // Mock login - replace with actual API call
    if (email === 'admin@buildright.com' && password === 'password') {
        // Store login state
        localStorage.setItem('isLoggedIn', 'true');
        localStorage.setItem('userEmail', email);
        localStorage.setItem('userName', 'John Doe');
        localStorage.setItem('userRole', 'admin');

        // Update UI
        updateUserInterface(true);

        // Close modal
        $('#loginModal').modal('hide');

        showAlert('Login successful!', 'success');
    } else {
        showAlert('Invalid email or password', 'error');
    }
});

// Profile save functionality
$('#saveProfile').on('click', function () {
    const formData = {
        firstName: $('#profileFirstName').val(),
        lastName: $('#profileLastName').val(),
        email: $('#profileEmail').val(),
        phone: $('#profilePhone').val(),
        address: $('#profileAddress').val(),
        department: $('#profileDepartment').val(),
        role: $('#profileRole').val()
    };

    // Validate password change if any password field is filled
    const currentPassword = $('#currentPassword').val();
    const newPassword = $('#newPassword').val();
    const confirmPassword = $('#confirmPassword').val();

    if (newPassword || confirmPassword || currentPassword) {
        if (!currentPassword) {
            showAlert('Please enter current password', 'error');
            return;
        }
        if (newPassword !== confirmPassword) {
            showAlert('New passwords do not match', 'error');
            return;
        }
        if (newPassword.length < 6) {
            showAlert('New password must be at least 6 characters', 'error');
            return;
        }
    }

    // Mock save - replace with actual API call
    localStorage.setItem('userName', `${formData.firstName} ${formData.lastName}`);
    localStorage.setItem('userEmail', formData.email);

    // Update UI
    updateUserInterface(true);

    $('#userProfileModal').modal('hide');
    showAlert('Profile updated successfully!', 'success');

    // Clear password fields
    $('#currentPassword, #newPassword, #confirmPassword').val('');
});

// Logout functionality
$(document).on('click', '.logout-btn', function (e) {
    e.preventDefault();

    // Clear login data
    localStorage.removeItem('isLoggedIn');
    localStorage.removeItem('userName');
    localStorage.removeItem('userEmail');
    localStorage.removeItem('userRole');

    // Update UI
    updateUserInterface(false);

    showAlert('You have been logged out', 'info');
});

// Open login modal when clicking login link - FIXED
$(document).on('click', '.login-link', function (e) {
    e.preventDefault();
    e.stopPropagation(); // Important: prevent event bubbling
    console.log('Login link clicked'); // Debug log
    $('#loginModal').modal('show');
});

// Open profile modal
$(document).on('click', '.profile-link', function (e) {
    e.preventDefault();
    $('#userProfileModal').modal('show');
});

 

$(document).ready(function () {

    $('.btn').click(function (e) {
        e.preventDefault();
    });

    checkLoginStatus();



    // Debug: Check if elements exist
    console.log('Login links found:', $('.login-link').length);
    console.log('Login modal exists:', $('#loginModal').length);
});