CREATE TABLE [Dim Citizen] (
  [citizenId] nvarchar(255) PRIMARY KEY,
  [name] nvarchar(255),
  [surname] nvarchar(255),
  [gender] nvarchar(255),
  [dateOfBirth] date,
  [weight] decimal,
  [height] decimal,
  [phoneNumber] nvarchar(255),
  [address] nvarchar(255),
  [districtId] nvarchar(255)
)
GO

CREATE TABLE [Dim HealthUnit] (
  [healthUnitId] nvarchar(255) PRIMARY KEY,
  [healthUnitName] nvarchar(255),
  [address] nvarchar(255),
  [districtId] nvarchar(255)
)
GO

CREATE TABLE [Dim PatientStatus] (
  [patientStatusId] nvarchar(255) PRIMARY KEY,
  [patientStatusName] nvarchar(255)
)
GO

CREATE TABLE [Dim DiseaseVariant] (
  [diseaseVariantId] nvarchar(255) PRIMARY KEY,
  [diseaseId] nvarchar(255),
  [variantName] nvarchar(255)
)
GO

CREATE TABLE [Dim Drug] (
  [drugId] nvarchar(255) PRIMARY KEY,
  [drugName] nvarchar(255),
  [forDisease] nvarchar(255)
)
GO

CREATE TABLE [Dim Quarantine] (
  [quarantineId] nvarchar(255) PRIMARY KEY,
  [quarantineName] nvarchar(255),
  [numberOfDays] integer
)
GO

CREATE TABLE [Dim Vaccine] (
  [vaccineId] nvarchar(255) PRIMARY KEY,
  [vaccineName] nvarchar(255)
)
GO

CREATE TABLE [Dim Time] (
  [dateId] nvarchar(255) PRIMARY KEY,
  [date] date,
  [yearId] integer,
  [MonthId] integer,
  [WeekId] integer,
  [dayOfWeekID] integer
)
GO

CREATE TABLE [Dim Venue] (
  [venueId] nvarchar(255) PRIMARY KEY,
  [venueType] nvarchar(255),
  [venueAddress] nvarchar(255)
)
GO

CREATE TABLE [Fact Citizen Health] (
  [factId] nvarchar(255) PRIMARY KEY,
  [citizenId] nvarchar(255),
  [healthUnitId] nvarchar(255),
  [patientStatusId] nvarchar(255),
  [diseaseVariantId] nvarchar(255),
  [drugId] nvarchar(255),
  [quarantineId] nvarchar(255),
  [vaccineId] nvarchar(255),
  [venueId] nvarchar(255),
  [dateId] nvarchar(255),
  [startDateId] nvarchar(255),
  [endDateId] nvarchar(255),
  [quarantineDuration] integer,
  [doseNumber] integer,
  [symptomSeverity] integer,
  [dose] decimal,
  [treatmentCost] decimal,
  [effectivenessRating] integer,
  [visitDuration] integer,
  [contactCount] integer
)
GO

ALTER TABLE [Fact Citizen Health] ADD FOREIGN KEY ([citizenId]) REFERENCES [Dim Citizen] ([citizenId])
GO

ALTER TABLE [Fact Citizen Health] ADD FOREIGN KEY ([healthUnitId]) REFERENCES [Dim HealthUnit] ([healthUnitId])
GO

ALTER TABLE [Fact Citizen Health] ADD FOREIGN KEY ([patientStatusId]) REFERENCES [Dim PatientStatus] ([patientStatusId])
GO

ALTER TABLE [Fact Citizen Health] ADD FOREIGN KEY ([diseaseVariantId]) REFERENCES [Dim DiseaseVariant] ([diseaseVariantId])
GO

ALTER TABLE [Fact Citizen Health] ADD FOREIGN KEY ([drugId]) REFERENCES [Dim Drug] ([drugId])
GO

ALTER TABLE [Fact Citizen Health] ADD FOREIGN KEY ([quarantineId]) REFERENCES [Dim Quarantine] ([quarantineId])
GO

ALTER TABLE [Fact Citizen Health] ADD FOREIGN KEY ([vaccineId]) REFERENCES [Dim Vaccine] ([vaccineId])
GO

ALTER TABLE [Fact Citizen Health] ADD FOREIGN KEY ([venueId]) REFERENCES [Dim Venue] ([venueId])
GO

ALTER TABLE [Fact Citizen Health] ADD FOREIGN KEY ([dateId]) REFERENCES [Dim Time] ([dateId])
GO

ALTER TABLE [Fact Citizen Health] ADD FOREIGN KEY ([startDateId]) REFERENCES [Dim Time] ([dateId])
GO

ALTER TABLE [Fact Citizen Health] ADD FOREIGN KEY ([endDateId]) REFERENCES [Dim Time] ([dateId])
GO
