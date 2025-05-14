-- Clinic Booking System Database
-- Creating tables with proper constraints and relationships

-- Table: Departments
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100) NOT NULL
);

-- Table: Doctors
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialty VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL,
    hire_date DATE NOT NULL
);

-- Table: Doctor_Departments (Junction table for M-M relationship)
CREATE TABLE Doctor_Departments (
    doctor_id INT,
    department_id INT,
    PRIMARY KEY (doctor_id, department_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE CASCADE,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id) ON DELETE CASCADE
);

-- Table: Patients
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL,
    address VARCHAR(200) NOT NULL,
    registration_date DATE NOT NULL
);

-- Table: Appointments
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    reason VARCHAR(200) NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') NOT NULL DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE RESTRICT,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE RESTRICT,
    UNIQUE (doctor_id, appointment_date),
    UNIQUE (patient_id, appointment_date)
);

-- Table: MedicalRecords
CREATE TABLE MedicalRecords (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    diagnosis TEXT NOT NULL,
    treatment TEXT NOT NULL,
    prescription TEXT,
    record_date DATE NOT NULL,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id) ON DELETE CASCADE,
    UNIQUE (appointment_id)
);

-- Insert sample data for testing
INSERT INTO Departments (department_name, location) VALUES
('Cardiology', 'Building A, Floor 2'),
('Pediatrics', 'Building B, Floor 1'),
('Neurology', 'Building A, Floor 3');

INSERT INTO Doctors (first_name, last_name, specialty, email, phone, hire_date) VALUES
('John', 'Smith', 'Cardiologist', 'john.smith@clinic.com', '555-0101', '2020-01-15'),
('Emma', 'Wilson', 'Pediatrician', 'emma.wilson@clinic.com', '555-0102', '2019-06-20');

INSERT INTO Doctor_Departments (doctor_id, department_id) VALUES
(1, 1),
(2, 2);

INSERT INTO Patients (first_name, last_name, date_of_birth, email, phone, address, registration_date) VALUES
('Alice', 'Brown', '1990-05-10', 'alice.brown@email.com', '555-0201', '123 Main St', '2023-01-10'),
('Bob', 'Davis', '1985-08-22', 'bob.davis@email.com', '555-0202', '456 Oak Ave', '2023-02-15');

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, reason, status) VALUES
(1, 1, '2025-05-20 10:00:00', 'Chest pain', 'Scheduled'),
(2, 2, '2025-05-21 14:00:00', 'Child checkup', 'Scheduled');

INSERT INTO MedicalRecords (appointment_id, diagnosis, treatment, prescription, record_date) VALUES
(1, 'Mild hypertension', 'Lifestyle changes', 'Lisinopril 10mg', '2025-05-20');
