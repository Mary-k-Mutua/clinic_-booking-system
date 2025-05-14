Clinic Booking System Database
Overview
This project is a MySQL-based relational database designed for a Clinic Booking System. It manages patients, doctors, appointments, medical records, and departments, with proper relationships and constraints to ensure data integrity and efficient operations.
Features

Tables: Patients, Doctors, Appointments, MedicalRecords, Departments, and Doctor_Departments (junction table).
Relationships:
One-to-Many: Doctor to Appointments, Patient to Appointments.
Many-to-Many: Doctors to Departments (via Doctor_Departments).
One-to-One: Appointment to MedicalRecord.


Constraints: Primary Keys, Foreign Keys, NOT NULL, UNIQUE, and ENUM for data consistency.
Sample Data: Included for testing and demonstration.

Requirements

MySQL 5.7 or later (or compatible database like MariaDB).
MySQL client (e.g., MySQL Workbench, command-line client, or phpMyAdmin).

Setup Instructions

Clone or Download:

Download the clinic_booking_system.sql file from the repository.


Create Database:

Open your MySQL client and create a new database:CREATE DATABASE clinic_booking;
USE clinic_booking;




Execute SQL Script:

Run the clinic_booking_system.sql file to create tables and insert sample data:mysql -u your_username -p clinic_booking < clinic_booking_system.sql

Alternatively, import the file via MySQL Workbench or phpMyAdmin.


Verify Setup:

Check that all tables (Departments, Doctors, Doctor_Departments, Patients, Appointments, MedicalRecords) are created.
Query the sample data to confirm:SELECT * FROM Patients;
SELECT * FROM Appointments;





Database Structure
Tables and Relationships

Departments: Stores department details (e.g., Cardiology, Pediatrics).
Doctors: Stores doctor information with unique email.
Doctor_Departments: Junction table for the many-to-many relationship between Doctors and Departments.
Patients: Stores patient details with unique email.
Appointments: Links Patients and Doctors, with constraints to prevent double-booking.
MedicalRecords: Stores diagnosis and treatment details for each appointment (one-to-one).

Key Constraints

Primary Keys: Unique identifiers for each table.
Foreign Keys: Enforce referential integrity (e.g., CASCADE for deletions in Doctor_Departments).
UNIQUE: Prevents duplicate emails and overlapping appointment times.
NOT NULL: Ensures essential fields are populated.
ENUM: Limits appointment status to Scheduled, Completed, or Cancelled.

Usage
Example Queries

List all appointments for a specific doctor:
SELECT a.appointment_id, p.first_name, p.last_name, a.appointment_date, a.reason
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
WHERE a.doctor_id = 1;


Find a patient's medical records:
SELECT m.record_id, m.diagnosis, m.treatment, m.prescription
FROM MedicalRecords m
JOIN Appointments a ON m.appointment_id = a.appointment_id
WHERE a.patient_id = 1;


List doctors in a specific department:
SELECT d.first_name, d.last_name, d.specialty
FROM Doctors d
JOIN Doctor_Departments dd ON d.doctor_id = dd.doctor_id
WHERE dd.department_id = 1;



Extending the System

Add more tables (e.g., Billing, Insurance) for additional functionality.
Create stored procedures for common operations (e.g., booking an appointment).
Implement triggers to log changes (e.g., appointment status updates).

Notes

The sample data is minimal for demonstration. Expand it as needed for real-world use.
Ensure proper indexing for performance in large datasets (e.g., index on appointment_date).
Back up the database regularly to prevent data loss.

Contributing
Feel free to suggest improvements or additional features by submitting a pull request or opening an issue.
License
This project is licensed under the MIT License.
