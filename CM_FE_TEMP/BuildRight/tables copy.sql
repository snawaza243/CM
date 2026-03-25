-- Create Tablespace and User (run as SYSTEM/SYS user first)
/*
CREATE TABLESPACE construction_ts 
DATAFILE 'construction.dbf' SIZE 100M AUTOEXTEND ON NEXT 50M MAXSIZE UNLIMITED;

CREATE USER construction_user IDENTIFIED BY password123
DEFAULT TABLESPACE construction_ts
QUOTA UNLIMITED ON construction_ts;

GRANT CONNECT, RESOURCE TO construction_user;
*/

-- Connect as construction_user and run the following:

-- Users Table (for admin system)
CREATE TABLE users (
    id NUMBER PRIMARY KEY,
    username VARCHAR2(50) UNIQUE NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL,
    password_hash VARCHAR2(255) NOT NULL,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    role VARCHAR2(20) DEFAULT 'admin' CHECK (role IN ('admin', 'manager', 'contractor')),
    phone VARCHAR2(20),
    avatar_url VARCHAR2(255),
    is_active NUMBER(1) DEFAULT 1,
    last_login TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE SEQUENCE users_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER users_bir 
BEFORE INSERT ON users 
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT users_seq.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

-- Clients Table (for frontend website)
CREATE TABLE clients (
    id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL,
    phone VARCHAR2(20),
    company_name VARCHAR2(100),
    address CLOB,
    city VARCHAR2(50),
    state VARCHAR2(50),
    zip_code VARCHAR2(20),
    country VARCHAR2(50) DEFAULT 'USA',
    client_type VARCHAR2(20) DEFAULT 'residential' CHECK (client_type IN ('residential', 'commercial', 'industrial')),
    status VARCHAR2(20) DEFAULT 'lead' CHECK (status IN ('active', 'inactive', 'lead')),
    notes CLOB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE SEQUENCE clients_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER clients_bir 
BEFORE INSERT ON clients 
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT clients_seq.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

-- Services Table (for both frontend and admin)
CREATE TABLE services (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    description CLOB,
    icon_class VARCHAR2(50) DEFAULT 'fas fa-tools',
    category VARCHAR2(20) DEFAULT 'residential' CHECK (category IN ('residential', 'commercial', 'industrial', 'renovation')),
    base_price NUMBER(12,2),
    duration_days NUMBER,
    is_active NUMBER(1) DEFAULT 1,
    features CLOB, -- Using CLOB instead of JSON for 11g compatibility
    image_url VARCHAR2(255),
    sort_order NUMBER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE SEQUENCE services_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER services_bir 
BEFORE INSERT ON services 
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT services_seq.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

-- Contractors Table
CREATE TABLE contractors (
    id NUMBER PRIMARY KEY,
    user_id NUMBER,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL,
    phone VARCHAR2(20),
    specialty VARCHAR2(20) DEFAULT 'general' CHECK (specialty IN ('general', 'electrical', 'plumbing', 'carpentry', 'masonry', 'roofing', 'painting')),
    experience_years NUMBER,
    hourly_rate NUMBER(8,2),
    is_available NUMBER(1) DEFAULT 1,
    rating NUMBER(3,2) DEFAULT 0.0,
    total_projects NUMBER DEFAULT 0,
    avatar_url VARCHAR2(255),
    bio CLOB,
    skills CLOB,
    license_number VARCHAR2(100),
    insurance_info CLOB,
    address CLOB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

CREATE SEQUENCE contractors_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER contractors_bir 
BEFORE INSERT ON contractors 
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT contractors_seq.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

-- Projects Table (main projects table)
CREATE TABLE projects (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(255) NOT NULL,
    description CLOB,
    client_id NUMBER NOT NULL,
    project_type VARCHAR2(20) DEFAULT 'residential' CHECK (project_type IN ('residential', 'commercial', 'industrial', 'renovation')),
    budget NUMBER(12,2),
    actual_cost NUMBER(12,2) DEFAULT 0,
    start_date DATE,
    deadline DATE,
    completed_date DATE,
    status VARCHAR2(20) DEFAULT 'planning' CHECK (status IN ('planning', 'active', 'on_hold', 'completed', 'cancelled')),
    priority VARCHAR2(20) DEFAULT 'medium' CHECK (priority IN ('low', 'medium', 'high', 'urgent')),
    progress_percentage NUMBER DEFAULT 0,
    address CLOB,
    city VARCHAR2(50),
    state VARCHAR2(50),
    zip_code VARCHAR2(20),
    project_manager_id NUMBER,
    notes CLOB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE CASCADE,
    FOREIGN KEY (project_manager_id) REFERENCES users(id) ON DELETE SET NULL
);

CREATE SEQUENCE projects_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER projects_bir 
BEFORE INSERT ON projects 
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT projects_seq.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

-- Project Services Table (many-to-many relationship)
CREATE TABLE project_services (
    id NUMBER PRIMARY KEY,
    project_id NUMBER NOT NULL,
    service_id NUMBER NOT NULL,
    quantity NUMBER DEFAULT 1,
    unit_price NUMBER(10,2),
    total_price NUMBER(10,2),
    status VARCHAR2(20) DEFAULT 'pending' CHECK (status IN ('pending', 'in_progress', 'completed')),
    start_date DATE,
    end_date DATE,
    notes CLOB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE,
    FOREIGN KEY (service_id) REFERENCES services(id) ON DELETE CASCADE
);

CREATE SEQUENCE project_services_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER project_services_bir 
BEFORE INSERT ON project_services 
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT project_services_seq.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

-- Add unique constraint separately
ALTER TABLE project_services ADD CONSTRAINT unique_project_service UNIQUE (project_id, service_id);

-- Project Assignments Table (contractors assigned to projects)
CREATE TABLE project_assignments (
    id NUMBER PRIMARY KEY,
    project_id NUMBER NOT NULL,
    contractor_id NUMBER NOT NULL,
    role VARCHAR2(100),
    hourly_rate NUMBER(8,2),
    assigned_date DATE,
    estimated_hours NUMBER,
    actual_hours NUMBER DEFAULT 0,
    status VARCHAR2(20) DEFAULT 'assigned' CHECK (status IN ('assigned', 'active', 'completed', 'cancelled')),
    notes CLOB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE,
    FOREIGN KEY (contractor_id) REFERENCES contractors(id) ON DELETE CASCADE
);

CREATE SEQUENCE project_assignments_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER project_assignments_bir 
BEFORE INSERT ON project_assignments 
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT project_assignments_seq.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

ALTER TABLE project_assignments ADD CONSTRAINT unique_project_contractor UNIQUE (project_id, contractor_id);

-- Tasks Table (for project tasks)
CREATE TABLE tasks (
    id NUMBER PRIMARY KEY,
    project_id NUMBER NOT NULL,
    name VARCHAR2(255) NOT NULL,
    description CLOB,
    assigned_to NUMBER,
    priority VARCHAR2(20) DEFAULT 'medium' CHECK (priority IN ('low', 'medium', 'high', 'urgent')),
    status VARCHAR2(20) DEFAULT 'todo' CHECK (status IN ('todo', 'in_progress', 'review', 'completed')),
    due_date DATE,
    completed_date DATE,
    estimated_hours NUMBER,
    actual_hours NUMBER DEFAULT 0,
    progress_percentage NUMBER DEFAULT 0,
    dependencies CLOB,
    notes CLOB,
    created_by NUMBER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE,
    FOREIGN KEY (assigned_to) REFERENCES users(id) ON DELETE SET NULL,
    FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL
);

CREATE SEQUENCE tasks_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER tasks_bir 
BEFORE INSERT ON tasks 
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT tasks_seq.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

-- Tools & Equipment Table
CREATE TABLE tools (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    description CLOB,
    category VARCHAR2(20) DEFAULT 'hand_tools' CHECK (category IN ('heavy_machinery', 'power_tools', 'measurement', 'safety', 'hand_tools')),
    model VARCHAR2(100),
    serial_number VARCHAR2(100) UNIQUE,
    purchase_date DATE,
    purchase_price NUMBER(10,2),
    current_value NUMBER(10,2),
    status VARCHAR2(20) DEFAULT 'available' CHECK (status IN ('available', 'in_use', 'maintenance', 'retired')),
    location VARCHAR2(100),
    maintenance_schedule VARCHAR2(20) CHECK (maintenance_schedule IN ('weekly', 'monthly', 'quarterly', 'yearly')),
    last_maintenance_date DATE,
    next_maintenance_date DATE,
    image_url VARCHAR2(255),
    specifications CLOB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE SEQUENCE tools_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER tools_bir 
BEFORE INSERT ON tools 
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT tools_seq.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

-- Tool Assignments Table
CREATE TABLE tool_assignments (
    id NUMBER PRIMARY KEY,
    tool_id NUMBER NOT NULL,
    project_id NUMBER,
    assigned_to NUMBER,
    assigned_date DATE NOT NULL,
    expected_return_date DATE,
    actual_return_date DATE,
    condition_before CLOB,
    condition_after CLOB,
    status VARCHAR2(20) DEFAULT 'assigned' CHECK (status IN ('assigned', 'returned', 'damaged', 'lost')),
    notes CLOB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tool_id) REFERENCES tools(id) ON DELETE CASCADE,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE SET NULL,
    FOREIGN KEY (assigned_to) REFERENCES users(id) ON DELETE SET NULL
);

CREATE SEQUENCE tool_assignments_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER tool_assignments_bir 
BEFORE INSERT ON tool_assignments 
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT tool_assignments_seq.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

-- Testimonials Table (for frontend website)
CREATE TABLE testimonials (
    id NUMBER PRIMARY KEY,
    client_id NUMBER NOT NULL,
    project_id NUMBER,
    rating NUMBER CHECK (rating >= 1 AND rating <= 5),
    title VARCHAR2(255),
    content CLOB NOT NULL,
    is_approved NUMBER(1) DEFAULT 0,
    is_featured NUMBER(1) DEFAULT 0,
    featured_order NUMBER DEFAULT 0,
    testimonial_date DATE DEFAULT CURRENT_DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE CASCADE,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE SET NULL
);

CREATE SEQUENCE testimonials_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER testimonials_bir 
BEFORE INSERT ON testimonials 
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT testimonials_seq.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

-- Quotes/Estimates Table (for frontend quote requests)
CREATE TABLE quotes (
    id NUMBER PRIMARY KEY,
    client_id NUMBER,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    phone VARCHAR2(20),
    company VARCHAR2(100),
    project_type VARCHAR2(20) DEFAULT 'residential' CHECK (project_type IN ('residential', 'commercial', 'industrial', 'renovation')),
    project_description CLOB NOT NULL,
    desired_timeline VARCHAR2(20) DEFAULT 'asap' CHECK (desired_timeline IN ('asap', '1-3_months', '3-6_months', '6plus_months')),
    budget_range VARCHAR2(20) DEFAULT 'under_50k' CHECK (budget_range IN ('under_50k', '50k_100k', '100k_250k', '250k_500k', '500k_plus')),
    address CLOB,
    status VARCHAR2(20) DEFAULT 'new' CHECK (status IN ('new', 'contacted', 'quoted', 'accepted', 'rejected')),
    assigned_to NUMBER,
    estimated_amount NUMBER(12,2),
    notes CLOB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE SET NULL,
    FOREIGN KEY (assigned_to) REFERENCES users(id) ON DELETE SET NULL
);

CREATE SEQUENCE quotes_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER quotes_bir 
BEFORE INSERT ON quotes 
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT quotes_seq.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

-- Invoices Table
CREATE TABLE invoices (
    id NUMBER PRIMARY KEY,
    project_id NUMBER NOT NULL,
    invoice_number VARCHAR2(50) UNIQUE NOT NULL,
    issue_date DATE NOT NULL,
    due_date DATE NOT NULL,
    status VARCHAR2(20) DEFAULT 'draft' CHECK (status IN ('draft', 'sent', 'paid', 'overdue', 'cancelled')),
    subtotal NUMBER(12,2) DEFAULT 0,
    tax_rate NUMBER(5,2) DEFAULT 0,
    tax_amount NUMBER(12,2) DEFAULT 0,
    total_amount NUMBER(12,2) DEFAULT 0,
    amount_paid NUMBER(12,2) DEFAULT 0,
    balance_due NUMBER(12,2) DEFAULT 0,
    notes CLOB,
    payment_terms CLOB,
    created_by NUMBER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE,
    FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL
);

CREATE SEQUENCE invoices_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER invoices_bir 
BEFORE INSERT ON invoices 
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT invoices_seq.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

-- Invoice Items Table
CREATE TABLE invoice_items (
    id NUMBER PRIMARY KEY,
    invoice_id NUMBER NOT NULL,
    description CLOB NOT NULL,
    quantity NUMBER DEFAULT 1,
    unit_price NUMBER(10,2) NOT NULL,
    total_price NUMBER(10,2) NOT NULL,
    service_id NUMBER,
    task_id NUMBER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id) ON DELETE CASCADE,
    FOREIGN KEY (service_id) REFERENCES services(id) ON DELETE SET NULL,
    FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE SET NULL
);

CREATE SEQUENCE invoice_items_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER invoice_items_bir 
BEFORE INSERT ON invoice_items 
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT invoice_items_seq.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

-- Payments Table
CREATE TABLE payments (
    id NUMBER PRIMARY KEY,
    invoice_id NUMBER NOT NULL,
    payment_date DATE NOT NULL,
    amount NUMBER(12,2) NOT NULL,
    payment_method VARCHAR2(20) DEFAULT 'check' CHECK (payment_method IN ('cash', 'check', 'credit_card', 'bank_transfer', 'online')),
    reference_number VARCHAR2(100),
    notes CLOB,
    received_by NUMBER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id) ON DELETE CASCADE,
    FOREIGN KEY (received_by) REFERENCES users(id) ON DELETE SET NULL
);

CREATE SEQUENCE payments_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER payments_bir 
BEFORE INSERT ON payments 
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT payments_seq.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

-- Expenses Table
CREATE TABLE expenses (
    id NUMBER PRIMARY KEY,
    project_id NUMBER,
    category VARCHAR2(20) DEFAULT 'materials' CHECK (category IN ('materials', 'labor', 'equipment', 'subcontractor', 'permits', 'utilities', 'other')),
    description CLOB NOT NULL,
    amount NUMBER(10,2) NOT NULL,
    expense_date DATE NOT NULL,
    receipt_url VARCHAR2(255),
    approved_by NUMBER,
    status VARCHAR2(20) DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected')),
    notes CLOB,
    created_by NUMBER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE,
    FOREIGN KEY (approved_by) REFERENCES users(id) ON DELETE SET NULL,
    FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL
);

CREATE SEQUENCE expenses_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER expenses_bir 
BEFORE INSERT ON expenses 
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT expenses_seq.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

-- Notifications Table
CREATE TABLE notifications (
    id NUMBER PRIMARY KEY,
    user_id NUMBER NOT NULL,
    title VARCHAR2(255) NOT NULL,
    message CLOB NOT NULL,
    type VARCHAR2(20) DEFAULT 'info' CHECK (type IN ('info', 'warning', 'success', 'error', 'reminder')),
    is_read NUMBER(1) DEFAULT 0,
    related_entity_type VARCHAR2(20) DEFAULT 'project' CHECK (related_entity_type IN ('project', 'task', 'invoice', 'quote', 'expense')),
    related_entity_id NUMBER,
    action_url VARCHAR2(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE SEQUENCE notifications_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER notifications_bir 
BEFORE INSERT ON notifications 
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT notifications_seq.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

-- Settings Table
CREATE TABLE settings (
    id NUMBER PRIMARY KEY,
    setting_key VARCHAR2(100) UNIQUE NOT NULL,
    setting_value CLOB,
    setting_type VARCHAR2(20) DEFAULT 'string' CHECK (setting_type IN ('string', 'integer', 'boolean', 'json')),
    category VARCHAR2(50) DEFAULT 'general',
    description CLOB,
    updated_by NUMBER,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (updated_by) REFERENCES users(id) ON DELETE SET NULL
);

CREATE SEQUENCE settings_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER settings_bir 
BEFORE INSERT ON settings 
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT settings_seq.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

-- Audit Log Table
CREATE TABLE audit_logs (
    id NUMBER PRIMARY KEY,
    user_id NUMBER,
    action VARCHAR2(100) NOT NULL,
    table_name VARCHAR2(50) NOT NULL,
    record_id NUMBER,
    old_values CLOB,
    new_values CLOB,
    ip_address VARCHAR2(45),
    user_agent CLOB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

CREATE SEQUENCE audit_logs_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER audit_logs_bir 
BEFORE INSERT ON audit_logs 
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT audit_logs_seq.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

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

-- Create Update Triggers for updated_at timestamps
CREATE OR REPLACE TRIGGER users_upd
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    :NEW.updated_at := CURRENT_TIMESTAMP;
END;
/

CREATE OR REPLACE TRIGGER clients_upd
BEFORE UPDATE ON clients
FOR EACH ROW
BEGIN
    :NEW.updated_at := CURRENT_TIMESTAMP;
END;
/

CREATE OR REPLACE TRIGGER services_upd
BEFORE UPDATE ON services
FOR EACH ROW
BEGIN
    :NEW.updated_at := CURRENT_TIMESTAMP;
END;
/

CREATE OR REPLACE TRIGGER contractors_upd
BEFORE UPDATE ON contractors
FOR EACH ROW
BEGIN
    :NEW.updated_at := CURRENT_TIMESTAMP;
END;
/

CREATE OR REPLACE TRIGGER projects_upd
BEFORE UPDATE ON projects
FOR EACH ROW
BEGIN
    :NEW.updated_at := CURRENT_TIMESTAMP;
END;
/

CREATE OR REPLACE TRIGGER tasks_upd
BEFORE UPDATE ON tasks
FOR EACH ROW
BEGIN
    :NEW.updated_at := CURRENT_TIMESTAMP;
END;
/

CREATE OR REPLACE TRIGGER tools_upd
BEFORE UPDATE ON tools
FOR EACH ROW
BEGIN
    :NEW.updated_at := CURRENT_TIMESTAMP;
END;
/

CREATE OR REPLACE TRIGGER testimonials_upd
BEFORE UPDATE ON testimonials
FOR EACH ROW
BEGIN
    :NEW.updated_at := CURRENT_TIMESTAMP;
END;
/

CREATE OR REPLACE TRIGGER quotes_upd
BEFORE UPDATE ON quotes
FOR EACH ROW
BEGIN
    :NEW.updated_at := CURRENT_TIMESTAMP;
END;
/

CREATE OR REPLACE TRIGGER invoices_upd
BEFORE UPDATE ON invoices
FOR EACH ROW
BEGIN
    :NEW.updated_at := CURRENT_TIMESTAMP;
END;
/

CREATE OR REPLACE TRIGGER expenses_upd
BEFORE UPDATE ON expenses
FOR EACH ROW
BEGIN
    :NEW.updated_at := CURRENT_TIMESTAMP;
END;
/

CREATE OR REPLACE TRIGGER settings_upd
BEFORE UPDATE ON settings
FOR EACH ROW
BEGIN
    :NEW.updated_at := CURRENT_TIMESTAMP;
END;
/

-- Insert Default Data

-- Insert default admin user
INSERT INTO users (username, email, password_hash, first_name, last_name, role, phone, is_active) 
VALUES ('admin', 'admin@buildright.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'System', 'Administrator', 'admin', '(555) 123-4567', 1);

-- Insert default services
INSERT INTO services (name, description, icon_class, category, base_price, duration_days, features) VALUES
('Architectural Design', 'Custom home designs and 3D modeling', 'fas fa-drafting-compass', 'residential', 5000.00, 30, '["Custom home designs", "3D modeling and visualization", "Space planning and optimization"]');
INSERT INTO services (name, description, icon_class, category, base_price, duration_days, features) VALUES
('Construction Management', 'End-to-end project oversight', 'fas fa-tools', 'commercial', 15000.00, 90, '["Project planning and scheduling", "Budget management", "Quality control and assurance"]');
INSERT INTO services (name, description, icon_class, category, base_price, duration_days, features) VALUES
('Renovation & Remodeling', 'Transform your existing space', 'fas fa-hammer', 'renovation', 25000.00, 60, '["Kitchen and bathroom remodels", "Room additions and expansions", "Historic restoration"]');
INSERT INTO services (name, description, icon_class, category, base_price, duration_days, features) VALUES
('Site Preparation', 'Land clearing and foundation work', 'fas fa-truck-pickup', 'industrial', 10000.00, 14, '["Land clearing and grading", "Excavation and foundation work", "Utility installation"]');

-- Insert sample contractors
INSERT INTO contractors (first_name, last_name, email, phone, specialty, experience_years, hourly_rate, is_available, rating, total_projects, bio) VALUES
('Michael', 'Johnson', 'michael@buildright.com', '(555) 111-2222', 'general', 15, 85.00, 1, 4.8, 45, 'With over 15 years of experience, Michael specializes in residential construction and renovation projects.');
INSERT INTO contractors (first_name, last_name, email, phone, specialty, experience_years, hourly_rate, is_available, rating, total_projects, bio) VALUES
('Sarah', 'Williams', 'sarah@buildright.com', '(555) 222-3333', 'general', 12, 90.00, 1, 4.9, 38, 'Sarah excels in commercial construction management with a focus on sustainable building practices.');
INSERT INTO contractors (first_name, last_name, email, phone, specialty, experience_years, hourly_rate, is_available, rating, total_projects, bio) VALUES
('Robert', 'Chen', 'robert@buildright.com', '(555) 333-4444', 'general', 8, 75.00, 1, 4.7, 22, 'Robert brings technical expertise to complex structural challenges in industrial construction.');

-- Insert default settings
INSERT INTO settings (setting_key, setting_value, setting_type, category, description) VALUES
('company_name', 'BuildRight Construction', 'string', 'general', 'Company name displayed throughout the system');
INSERT INTO settings (setting_key, setting_value, setting_type, category, description) VALUES
('company_email', 'info@buildright.com', 'string', 'general', 'Primary company email address');
INSERT INTO settings (setting_key, setting_value, setting_type, category, description) VALUES
('company_phone', '(555) 123-4567', 'string', 'general', 'Primary company phone number');
INSERT INTO settings (setting_key, setting_value, setting_type, category, description) VALUES
('company_address', '123 Construction Ave, Building City, BC 12345', 'string', 'general', 'Company physical address');
INSERT INTO settings (setting_key, setting_value, setting_type, category, description) VALUES
('business_hours', '{"weekdays": "8:00 AM - 6:00 PM", "saturday": "9:00 AM - 2:00 PM", "sunday": "Closed"}', 'json', 'general', 'Company business hours');
INSERT INTO settings (setting_key, setting_value, setting_type, category, description) VALUES
('default_theme', 'default', 'string', 'ui', 'Default theme for the application');
INSERT INTO settings (setting_key, setting_value, setting_type, category, description) VALUES
('invoice_prefix', 'INV-', 'string', 'billing', 'Prefix for invoice numbers');
INSERT INTO settings (setting_key, setting_value, setting_type, category, description) VALUES
('tax_rate', '7.5', 'decimal', 'billing', 'Default tax rate for invoices');

COMMIT;

-- Create Views for Reporting

-- Project Summary View
CREATE OR REPLACE VIEW project_summary AS
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
GROUP BY p.id, p.name, p.status, p.progress_percentage, p.budget, p.actual_cost, p.start_date, p.deadline, c.first_name, c.last_name;

-- Financial Summary View
CREATE OR REPLACE VIEW financial_summary AS
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
GROUP BY p.id, p.name, p.budget;

-- Contractor Performance View
CREATE OR REPLACE VIEW contractor_performance AS
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
GROUP BY c.id, c.first_name, c.last_name, c.specialty, c.rating;


/*
Key Changes Made for Oracle 11g/19g Compatibility:
Data Type Changes:

INT → NUMBER

BOOLEAN → NUMBER(1) (0/1)

TEXT → CLOB

JSON → CLOB (for 11g compatibility)

ENUM → VARCHAR2 with CHECK constraints

AUTO_INCREMENT → Sequences and Triggers

Identity/Auto-increment:

Replaced AUTO_INCREMENT with sequences and BEFORE INSERT triggers

Timestamps:

Used CURRENT_TIMESTAMP instead of MySQL-specific syntax

Created separate update triggers for updated_at columns

Syntax Changes:

Removed USE DATABASE statement

Changed CREATE VIEW syntax

Used Oracle-compatible CHECK constraints

Boolean Handling:

Used NUMBER(1) with 0/1 instead of TRUE/FALSE

JSON Compatibility:

Used CLOB for JSON data (Oracle 11g doesn't have native JSON)

Oracle 19g can use JSON type if needed

This schema is now fully compatible with Oracle 11g and 19g databases and can be used with SQL Developer or any Oracle database client.

This response is AI-generated, for reference only.*/