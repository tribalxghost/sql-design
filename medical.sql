-- from the terminal run:
-- psql < medical.sql

DROP DATABASE IF EXISTS medical;

CREATE DATABASE medical;

CREATE TABLE medical_center (
    id PRIMARY KEY NOT NULL,
    name NOT NULL,
    doctor_id NOT NULL REFERENCES doctors,
    patient_id REFERENCES patients
)

CREATE TABLE doctors (
    id PRIMARY KEY NOT NULL,
    name NOT NULL,
    doctor_id NOT NULL
)