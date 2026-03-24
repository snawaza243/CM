-- Create Database
CREATE DATABASE construction_management;
USE construction_management;

-- Users Table (for admin system)
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    role ENUM('admin', 'manager', 'contractor') DEFAULT 'admin',
    phone VARCHAR(20),
    avatar_url VARCHAR(255),
    is_active BOOLEAN DEFAULT TRUE,
    last_login DATETIME,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Clients Table (for frontend website)
CREATE TABLE clients (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    company_name VARCHAR(100),
    address TEXT,
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code VARCHAR(20),
    country VARCHAR(50) DEFAULT 'USA',
    client_type ENUM('residential', 'commercial', 'industrial') DEFAULT 'residential',
    status ENUM('active', 'inactive', 'lead') DEFAULT 'lead',
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Services Table (for both frontend and admin)
CREATE TABLE services (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    icon_class VARCHAR(50) DEFAULT 'fas fa-tools',
    category ENUM('residential', 'commercial', 'industrial', 'renovation') DEFAULT 'residential',
    base_price DECIMAL(12,2),
    duration_days INT,
    is_active BOOLEAN DEFAULT TRUE,
    features JSON,
    image_url VARCHAR(255),
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Contractors Table
CREATE TABLE contractors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    specialty ENUM('general', 'electrical', 'plumbing', 'carpentry', 'masonry', 'roofing', 'painting') DEFAULT 'general',
    experience_years INT,
    hourly_rate DECIMAL(8,2),
    is_available BOOLEAN DEFAULT TRUE,
    rating DECIMAL(3,2) DEFAULT 0.0,
    total_projects INT DEFAULT 0,
    avatar_url VARCHAR(255),
    bio TEXT,
    skills JSON,
    license_number VARCHAR(100),
    insurance_info TEXT,
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

-- Projects Table (main projects table)
CREATE TABLE projects (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    client_id INT NOT NULL,
    project_type ENUM('residential', 'commercial', 'industrial', 'renovation') DEFAULT 'residential',
    budget DECIMAL(12,2),
    actual_cost DECIMAL(12,2) DEFAULT 0,
    start_date DATE,
    deadline DATE,
    completed_date DATE,
    status ENUM('planning', 'active', 'on_hold', 'completed', 'cancelled') DEFAULT 'planning',
    priority ENUM('low', 'medium', 'high', 'urgent') DEFAULT 'medium',
    progress_percentage INT DEFAULT 0,
    address TEXT,
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code VARCHAR(20),
    project_manager_id INT,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE CASCADE,
    FOREIGN KEY (project_manager_id) REFERENCES users(id) ON DELETE SET NULL
);

-- Project Services Table (many-to-many relationship)
CREATE TABLE project_services (
    id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT NOT NULL,
    service_id INT NOT NULL,
    quantity INT DEFAULT 1,
    unit_price DECIMAL(10,2),
    total_price DECIMAL(10,2),
    status ENUM('pending', 'in_progress', 'completed') DEFAULT 'pending',
    start_date DATE,
    end_date DATE,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE,
    FOREIGN KEY (service_id) REFERENCES services(id) ON DELETE CASCADE,
    UNIQUE KEY unique_project_service (project_id, service_id)
);

-- Project Assignments Table (contractors assigned to projects)
CREATE TABLE project_assignments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT NOT NULL,
    contractor_id INT NOT NULL,
    role VARCHAR(100),
    hourly_rate DECIMAL(8,2),
    assigned_date DATE,
    estimated_hours INT,
    actual_hours INT DEFAULT 0,
    status ENUM('assigned', 'active', 'completed', 'cancelled') DEFAULT 'assigned',
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE,
    FOREIGN KEY (contractor_id) REFERENCES contractors(id) ON DELETE CASCADE,
    UNIQUE KEY unique_project_contractor (project_id, contractor_id)
);

-- Tasks Table (for project tasks)
CREATE TABLE tasks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    assigned_to INT,
    priority ENUM('low', 'medium', 'high', 'urgent') DEFAULT 'medium',
    status ENUM('todo', 'in_progress', 'review', 'completed') DEFAULT 'todo',
    due_date DATE,
    completed_date DATE,
    estimated_hours INT,
    actual_hours INT DEFAULT 0,
    progress_percentage INT DEFAULT 0,
    dependencies JSON,
    notes TEXT,
    created_by INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE,
    FOREIGN KEY (assigned_to) REFERENCES users(id) ON DELETE SET NULL,
    FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL
);

-- Tools & Equipment Table
CREATE TABLE tools (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    category ENUM('heavy_machinery', 'power_tools', 'measurement', 'safety', 'hand_tools') DEFAULT 'hand_tools',
    model VARCHAR(100),
    serial_number VARCHAR(100) UNIQUE,
    purchase_date DATE,
    purchase_price DECIMAL(10,2),
    current_value DECIMAL(10,2),
    status ENUM('available', 'in_use', 'maintenance', 'retired') DEFAULT 'available',
    location VARCHAR(100),
    maintenance_schedule ENUM('weekly', 'monthly', 'quarterly', 'yearly'),
    last_maintenance_date DATE,
    next_maintenance_date DATE,
    image_url VARCHAR(255),
    specifications JSON,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tool Assignments Table
CREATE TABLE tool_assignments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tool_id INT NOT NULL,
    project_id INT,
    assigned_to INT,
    assigned_date DATE NOT NULL,
    expected_return_date DATE,
    actual_return_date DATE,
    condition_before TEXT,
    condition_after TEXT,
    status ENUM('assigned', 'returned', 'damaged', 'lost') DEFAULT 'assigned',
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tool_id) REFERENCES tools(id) ON DELETE CASCADE,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE SET NULL,
    FOREIGN KEY (assigned_to) REFERENCES users(id) ON DELETE SET NULL
);

-- Testimonials Table (for frontend website)
CREATE TABLE testimonials (
    id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT NOT NULL,
    project_id INT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    title VARCHAR(255),
    content TEXT NOT NULL,
    is_approved BOOLEAN DEFAULT FALSE,
    is_featured BOOLEAN DEFAULT FALSE,
    featured_order INT DEFAULT 0,
    testimonial_date DATE DEFAULT CURRENT_DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE CASCADE,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE SET NULL
);

-- Quotes/Estimates Table (for frontend quote requests)
CREATE TABLE quotes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    company VARCHAR(100),
    project_type ENUM('residential', 'commercial', 'industrial', 'renovation') DEFAULT 'residential',
    project_description TEXT NOT NULL,
    desired_timeline ENUM('asap', '1-3_months', '3-6_months', '6plus_months') DEFAULT 'asap',
    budget_range ENUM('under_50k', '50k_100k', '100k_250k', '250k_500k', '500k_plus') DEFAULT 'under_50k',
    address TEXT,
    status ENUM('new', 'contacted', 'quoted', 'accepted', 'rejected') DEFAULT 'new',
    assigned_to INT,
    estimated_amount DECIMAL(12,2),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE SET NULL,
    FOREIGN KEY (assigned_to) REFERENCES users(id) ON DELETE SET NULL
);

-- Invoices Table
CREATE TABLE invoices (
    id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT NOT NULL,
    invoice_number VARCHAR(50) UNIQUE NOT NULL,
    issue_date DATE NOT NULL,
    due_date DATE NOT NULL,
    status ENUM('draft', 'sent', 'paid', 'overdue', 'cancelled') DEFAULT 'draft',
    subtotal DECIMAL(12,2) DEFAULT 0,
    tax_rate DECIMAL(5,2) DEFAULT 0,
    tax_amount DECIMAL(12,2) DEFAULT 0,
    total_amount DECIMAL(12,2) DEFAULT 0,
    amount_paid DECIMAL(12,2) DEFAULT 0,
    balance_due DECIMAL(12,2) DEFAULT 0,
    notes TEXT,
    payment_terms TEXT,
    created_by INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE,
    FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL
);

-- Invoice Items Table
CREATE TABLE invoice_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    invoice_id INT NOT NULL,
    description TEXT NOT NULL,
    quantity INT DEFAULT 1,
    unit_price DECIMAL(10,2) NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    service_id INT,
    task_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id) ON DELETE CASCADE,
    FOREIGN KEY (service_id) REFERENCES services(id) ON DELETE SET NULL,
    FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE SET NULL
);

-- Payments Table
CREATE TABLE payments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    invoice_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    payment_method ENUM('cash', 'check', 'credit_card', 'bank_transfer', 'online') DEFAULT 'check',
    reference_number VARCHAR(100),
    notes TEXT,
    received_by INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id) ON DELETE CASCADE,
    FOREIGN KEY (received_by) REFERENCES users(id) ON DELETE SET NULL
);

-- Expenses Table
CREATE TABLE expenses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    category ENUM('materials', 'labor', 'equipment', 'subcontractor', 'permits', 'utilities', 'other') DEFAULT 'materials',
    description TEXT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    expense_date DATE NOT NULL,
    receipt_url VARCHAR(255),
    approved_by INT,
    status ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
    notes TEXT,
    created_by INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE,
    FOREIGN KEY (approved_by) REFERENCES users(id) ON DELETE SET NULL,
    FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL
);

-- Notifications Table
CREATE TABLE notifications (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    type ENUM('info', 'warning', 'success', 'error', 'reminder') DEFAULT 'info',
    is_read BOOLEAN DEFAULT FALSE,
    related_entity_type ENUM('project', 'task', 'invoice', 'quote', 'expense') DEFAULT 'project',
    related_entity_id INT,
    action_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Settings Table
CREATE TABLE settings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    setting_key VARCHAR(100) UNIQUE NOT NULL,
    setting_value TEXT,
    setting_type ENUM('string', 'integer', 'boolean', 'json') DEFAULT 'string',
    category VARCHAR(50) DEFAULT 'general',
    description TEXT,
    updated_by INT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (updated_by) REFERENCES users(id) ON DELETE SET NULL
);

-- Audit Log Table
CREATE TABLE audit_logs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    action VARCHAR(100) NOT NULL,
    table_name VARCHAR(50) NOT NULL,
    record_id INT,
    old_values JSON,
    new_values JSON,
    ip_address VARCHAR(45),
    user_agent TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

-- Create Indexes for Better Performance
CREATE INDEX idx_projects_status ON projects(status);
CREATE INDEX idx_projects_client ON projects(client_id);
CREATE INDEX idx_tasks_project ON tasks(project_id);
CREATE INDEX idx_tasks_status ON tasks(status);
CREATE INDEX idx_invoices_project ON invoices(project_id);
CREATE INDEX idx_invoices_status ON invoices(status);
CREATE INDEX idx_quotes_status ON quotes(status);
CREATE INDEX idx_contractors_specialty ON contractors(specialty);
CREATE INDEX idx_contractors_available ON contractors(is_available);
CREATE INDEX idx_notifications_user ON notifications(user_id, is_read);
CREATE INDEX idx_audit_logs_created ON audit_logs(created_at);

-- Insert Default Data

-- Insert default admin user
INSERT INTO users (username, email, password_hash, first_name, last_name, role, phone, is_active) 
VALUES ('admin', 'admin@buildright.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'System', 'Administrator', 'admin', '(555) 123-4567', TRUE);

-- Insert default services
INSERT INTO services (name, description, icon_class, category, base_price, duration_days, features) VALUES
('Architectural Design', 'Custom home designs and 3D modeling', 'fas fa-drafting-compass', 'residential', 5000.00, 30, '["Custom home designs", "3D modeling and visualization", "Space planning and optimization"]'),
('Construction Management', 'End-to-end project oversight', 'fas fa-tools', 'commercial', 15000.00, 90, '["Project planning and scheduling", "Budget management", "Quality control and assurance"]'),
('Renovation & Remodeling', 'Transform your existing space', 'fas fa-hammer', 'renovation', 25000.00, 60, '["Kitchen and bathroom remodels", "Room additions and expansions", "Historic restoration"]'),
('Site Preparation', 'Land clearing and foundation work', 'fas fa-truck-pickup', 'industrial', 10000.00, 14, '["Land clearing and grading", "Excavation and foundation work", "Utility installation"]');

-- Insert sample contractors
INSERT INTO contractors (first_name, last_name, email, phone, specialty, experience_years, hourly_rate, is_available, rating, total_projects, bio) VALUES
('Michael', 'Johnson', 'michael@buildright.com', '(555) 111-2222', 'general', 15, 85.00, TRUE, 4.8, 45, 'With over 15 years of experience, Michael specializes in residential construction and renovation projects.'),
('Sarah', 'Williams', 'sarah@buildright.com', '(555) 222-3333', 'general', 12, 90.00, TRUE, 4.9, 38, 'Sarah excels in commercial construction management with a focus on sustainable building practices.'),
('Robert', 'Chen', 'robert@buildright.com', '(555) 333-4444', 'general', 8, 75.00, TRUE, 4.7, 22, 'Robert brings technical expertise to complex structural challenges in industrial construction.');

-- Insert default settings
INSERT INTO settings (setting_key, setting_value, setting_type, category, description) VALUES
('company_name', 'BuildRight Construction', 'string', 'general', 'Company name displayed throughout the system'),
('company_email', 'info@buildright.com', 'string', 'general', 'Primary company email address'),
('company_phone', '(555) 123-4567', 'string', 'general', 'Primary company phone number'),
('company_address', '123 Construction Ave, Building City, BC 12345', 'string', 'general', 'Company physical address'),
('business_hours', '{"weekdays": "8:00 AM - 6:00 PM", "saturday": "9:00 AM - 2:00 PM", "sunday": "Closed"}', 'json', 'general', 'Company business hours'),
('default_theme', 'default', 'string', 'ui', 'Default theme for the application'),
('invoice_prefix', 'INV-', 'string', 'billing', 'Prefix for invoice numbers'),
('tax_rate', '7.5', 'decimal', 'billing', 'Default tax rate for invoices');

-- Create Views for Reporting

-- Project Summary View
CREATE VIEW project_summary AS
SELECT 
    p.id,
    p.name,
    p.status,
    p.progress_percentage,
    p.budget,
    p.actual_cost,
    p.start_date,
    p.deadline,
    c.first_name AS client_first_name,
    c.last_name AS client_last_name,
    COUNT(t.id) AS total_tasks,
    SUM(CASE WHEN t.status = 'completed' THEN 1 ELSE 0 END) AS completed_tasks,
    COUNT(pa.id) AS assigned_contractors
FROM projects p
LEFT JOIN clients c ON p.client_id = c.id
LEFT JOIN tasks t ON p.id = t.project_id
LEFT JOIN project_assignments pa ON p.id = pa.project_id
GROUP BY p.id;

-- Financial Summary View
CREATE VIEW financial_summary AS
SELECT 
    p.id AS project_id,
    p.name AS project_name,
    p.budget,
    COALESCE(SUM(i.total_amount), 0) AS total_invoiced,
    COALESCE(SUM(pm.amount), 0) AS total_received,
    COALESCE(SUM(e.amount), 0) AS total_expenses,
    (COALESCE(SUM(i.total_amount), 0) - COALESCE(SUM(e.amount), 0)) AS net_profit
FROM projects p
LEFT JOIN invoices i ON p.id = i.project_id AND i.status != 'cancelled'
LEFT JOIN payments pm ON i.id = pm.invoice_id
LEFT JOIN expenses e ON p.id = e.project_id AND e.status = 'approved'
GROUP BY p.id;

-- Contractor Performance View
CREATE VIEW contractor_performance AS
SELECT 
    c.id,
    c.first_name,
    c.last_name,
    c.specialty,
    c.rating,
    COUNT(pa.id) AS total_assignments,
    SUM(pa.actual_hours) AS total_hours,
    AVG(pa.actual_hours) AS avg_hours_per_project,
    COUNT(DISTINCT pa.project_id) AS unique_projects
FROM contractors c
LEFT JOIN project_assignments pa ON c.id = pa.contractor_id
GROUP BY c.id;



/*
Key Features of This Database Schema:
Complete User Management - Admin, managers, and contractors

Client & Project Tracking - Full project lifecycle management

Service Catalog - Construction services with pricing

Contractor Management - Skills, availability, and assignments

Financial Tracking - Invoices, payments, and expenses

Tool & Equipment Management - Inventory and assignments

Testimonials & Quotes - Frontend website functionality

Reporting Views - Pre-built summaries for dashboards

Audit Logging - Track all system changes

Settings Management - Configurable system settings

This schema supports all the functionality shown in both templates and provides a solid foundation for a complete construction management system.
*/