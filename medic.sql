-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

-- from the terminal run:
-- psql < medical.sql

DROP DATABASE IF EXISTS medical;

CREATE DATABASE medical;

CREATE TABLE "Patient" (
    "PatientID" int   NOT NULL,
    "Name" string   NOT NULL,
    "DoctorID" int   NOT NULL,
    "CENTERID" int   NOT NULL,
    CONSTRAINT "pk_Patient" PRIMARY KEY (
        "PatientID"
     )
);

CREATE TABLE "Doctor" (
    "DoctorID" int   NOT NULL,
    "PatientID" int   NOT NULL,
    "CENTERID" int   NOT NULL,
    CONSTRAINT "pk_Doctor" PRIMARY KEY (
        "DoctorID"
     )
);

-- Table documentation comment 1 (try the PDF/RTF export)
-- Table documentation comment 2
CREATE TABLE "Medical_Center" (
    "CENTERID" int   NOT NULL,
    -- Field documentation comment 1
    -- Field documentation comment 2
    -- Field documentation comment 3
    "Name" varchar(200)   NOT NULL,
    "DoctorID" int   NOT NULL,
    "PatientID" int   NOT NULL,
    CONSTRAINT "pk_Medical_Center" PRIMARY KEY (
        "CENTERID"
     ),
    CONSTRAINT "uc_Medical_Center_Name" UNIQUE (
        "Name"
    )
);

ALTER TABLE "Patient" ADD CONSTRAINT "fk_Patient_DoctorID" FOREIGN KEY("DoctorID")
REFERENCES "Doctor" ("DoctorID");

ALTER TABLE "Patient" ADD CONSTRAINT "fk_Patient_CENTERID" FOREIGN KEY("CENTERID")
REFERENCES "Medical_Center" ("CENTERID");

ALTER TABLE "Doctor" ADD CONSTRAINT "fk_Doctor_PatientID" FOREIGN KEY("PatientID")
REFERENCES "Patient" ("PatientID");

ALTER TABLE "Doctor" ADD CONSTRAINT "fk_Doctor_CENTERID" FOREIGN KEY("CENTERID")
REFERENCES "Medical_Center" ("CENTERID");

ALTER TABLE "Medical_Center" ADD CONSTRAINT "fk_Medical_Center_DoctorID" FOREIGN KEY("DoctorID")
REFERENCES "Doctor" ("DoctorID");

ALTER TABLE "Medical_Center" ADD CONSTRAINT "fk_Medical_Center_PatientID" FOREIGN KEY("PatientID")
REFERENCES "Patient" ("PatientID");

