CREATE SCHEMA [dbo]
GO

CREATE TABLE [dbo].[Appointments] (
  [AppointmentID] int NOT NULL,
  [PatientID] int NOT NULL,
  [DoctorID] int NOT NULL,
  [AppointmentDateTime] datetime NOT NULL,
  [AppointmentStatus] tinyint NOT NULL,
  [MedicalRecordID] int,
  [PaymentID] int,
  PRIMARY KEY ([AppointmentID])
)
GO

CREATE TABLE [dbo].[Doctors] (
  [DoctorID] int NOT NULL,
  [PersonID] int NOT NULL,
  [Specialization] nvarchar(100),
  PRIMARY KEY ([DoctorID])
)
GO

CREATE TABLE [dbo].[MedicalRecords] (
  [MedicalRecordID] int NOT NULL,
  [VisitDescription] nvarchar(200),
  [Diagnosis] nvarchar(200),
  [AdditionalNotes] nvarchar(200),
  PRIMARY KEY ([MedicalRecordID])
)
GO

CREATE TABLE [dbo].[Patients] (
  [PatientID] int NOT NULL,
  [PersonID] int NOT NULL,
  PRIMARY KEY ([PatientID])
)
GO

CREATE TABLE [dbo].[Payments] (
  [PaymentID] int NOT NULL,
  [PaymentDate] date NOT NULL,
  [PaymentMethod] nvarchar(50),
  [AmountPaid] decimal(18,0) NOT NULL,
  [AdditionalNotes] nvarchar(200),
  PRIMARY KEY ([PaymentID])
)
GO

CREATE TABLE [dbo].[Persons] (
  [PersonID] int NOT NULL,
  [Name] nvarchar(100) NOT NULL,
  [DateOfBirth] date,
  [Gender] nvarchar(1) NOT NULL,
  [PhoneNumber] nvarchar(20) NOT NULL,
  [Email] nvarchar(100),
  [Address] nvarchar(200),
  PRIMARY KEY ([PersonID])
)
GO

CREATE TABLE [dbo].[Prescriptions] (
  [PrescriptionID] int NOT NULL,
  [MedicalRecordID] int NOT NULL,
  [MedicationName] nvarchar(100) NOT NULL,
  [Dosage] nvarchar(50) NOT NULL,
  [Frequency] nvarchar(50) NOT NULL,
  [StartDate] date NOT NULL,
  [EndDate] date NOT NULL,
  [SpecialInstructions] nvarchar(200),
  PRIMARY KEY ([PrescriptionID])
)
GO

ALTER TABLE [dbo].[Appointments] ADD CONSTRAINT [FK_Appointments.DoctorID] FOREIGN KEY ([DoctorID]) REFERENCES [dbo].[Doctors] ([DoctorID])
GO

ALTER TABLE [dbo].[Appointments] ADD CONSTRAINT [FK_Appointments.PatientID] FOREIGN KEY ([PatientID]) REFERENCES [dbo].[Patients] ([PatientID])
GO

ALTER TABLE [dbo].[Appointments] ADD CONSTRAINT [FK_Appointments_MedicalRecords] FOREIGN KEY ([MedicalRecordID]) REFERENCES [dbo].[MedicalRecords] ([MedicalRecordID])
GO

ALTER TABLE [dbo].[Appointments] ADD CONSTRAINT [FK_Payments.PaymentID] FOREIGN KEY ([PaymentID]) REFERENCES [dbo].[Payments] ([PaymentID])
GO

ALTER TABLE [dbo].[Doctors] ADD CONSTRAINT [FK_Doctors_Persons] FOREIGN KEY ([PersonID]) REFERENCES [dbo].[Persons] ([PersonID])
GO

ALTER TABLE [dbo].[Patients] ADD CONSTRAINT [FK_Patients_Persons] FOREIGN KEY ([PersonID]) REFERENCES [dbo].[Persons] ([PersonID])
GO

ALTER TABLE [dbo].[Prescriptions] ADD CONSTRAINT [FK_Prescriptions.MedicalRecordID] FOREIGN KEY ([MedicalRecordID]) REFERENCES [dbo].[MedicalRecords] ([MedicalRecordID])
GO
