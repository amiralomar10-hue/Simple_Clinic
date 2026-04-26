
This project focuses on designing a robust relational database schema for a "Simple Clinic" management system. The goal is to manage clinic operations efficiently, including patient data, doctor assignments, appointment scheduling, medical records, prescriptions, and payments.
​Key Database Entities:
​Persons: Centralized entity to handle shared personal data (Name, DOB, Contact Info).
​Patients & Doctors: Specialized roles derived from the Persons entity.
​Appointments: Manages scheduling with defined status types (Pending, Confirmed, Completed, etc.).
​Medical Records: Stores diagnosis, visit descriptions, and treatment notes per appointment.
​Prescriptions: Detailed medication tracking linked to specific medical records.
​Payments: Tracks payment status and amounts per appointment.
​Design Approach:
​Applied database normalization principles.
​Maintained data integrity using Primary and Foreign key constraints.
