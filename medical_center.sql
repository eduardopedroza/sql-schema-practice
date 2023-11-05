CREATE TABLE MedicalCenter (
    MedicalCenterID INT PRIMARY KEY,
    Name VARCHAR(20)
);

CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    MedicalCenterID INT,
    Name VARCHAR(20),
    FOREIGN KEY (MedicalCenterID) REFERENCES MedicalCenter(MedicalCenterID)
);

CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(20)
);

CREATE TABLE Disease (
    DiseaseID INT PRIMARY KEY,
    Name VARCHAR(20),
);

CREATE TABLE Visit (
    VisitID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    ReasonForVisit TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

CREATE TABLE Diagnosis (
    DiagnosisID INT PRIMARY KEY,
    VisitID INT,
    DiseaseID INT,
    Notes TEXT,
    FOREIGN KEY (VisitID) REFERENCES Visit(VisitID),
    FOREIGN KEY (DiseaseID) REFERENCES Disease(DiseaseID)
);
