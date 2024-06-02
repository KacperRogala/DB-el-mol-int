-- Database and tables creation 

-- Database creation 
CREATE DATABASE Electron_scattering; 
GO 

-- Creating tables 
USE Electron_scattering; 
GO 

-- Creating "study" table 
CREATE TABLE study
(
id INT IDENTITY PRIMARY KEY, 
mol_name VARCHAR(50) NOT NULL, 
mol_data_id INT, 
source_id INT 
); 
GO 

-- Creating "results" table 
CREATE TABLE results
(
id INT IDENTITY PRIMARY KEY, 
energy NUMERIC(7,2) CHECK (energy>=0), 
cross_section NUMERIC(5,2) CHECK (cross_section>=0), 
uncertainty NUMERIC(5,2) CHECK (uncertainty>=0),
study_id INT 
); 
GO 

-- Creating "mol_data" table 
CREATE TABLE mol_data
(
id INT IDENTITY PRIMARY KEY, 
mol_name varchar(50) NOT NULL,
chem_form varchar(30), 
iupac_name varchar(50), 
polarizability numeric(5,2) CHECK (polarizability>=0),
polar_id INT, 
dipol numeric(5,2) CHECK (dipol>=0),
dipol_id INT, 
ionization numeric(5,2) CHECK (ionization>=0),
ion_id INT, 
numb_atoms INT CHECK (numb_atoms>=0),
numb_electrons INT CHECK (numb_electrons>=0) 
); 
GO 

-- Creating "sources" table 
CREATE TABLE sources
(
id INT IDENTITY PRIMARY KEY, 
type VARCHAR(1), 
url VARCHAR(300), 
month_of_visit INT, 
year_of_visit INT, 
id_nr VARCHAR(100), 
name VARCHAR(300), 
authors VARCHAR(300), 
cite VARCHAR(500) 
); 
GO 

-- Setting foreign keys 

-- study.mol_data_id -> mol_data.id 
ALTER TABLE study 
ADD CONSTRAINT mol_data_id_FK 
FOREIGN KEY (mol_data_id)
REFERENCES mol_data(id); 

-- study.source_id -> sources.id 
ALTER TABLE study 
ADD CONSTRAINT source_id_FK 
FOREIGN KEY (source_id)
REFERENCES sources(id); 

-- results.study_id -> study.id 
ALTER TABLE results 
ADD CONSTRAINT study_id_FK 
FOREIGN KEY (study_id)
REFERENCES study(id); 

-- mol_data.polar_id -> sources.id 
ALTER TABLE mol_data 
ADD CONSTRAINT polar_id_FK 
FOREIGN KEY (polar_id)
REFERENCES sources(id); 

-- mol_data.dipol_id -> sources.id 
ALTER TABLE mol_data 
ADD CONSTRAINT dipol_id_FK 
FOREIGN KEY (dipol_id)
REFERENCES sources(id); 

-- mol_data.ion_id -> sources.id 
ALTER TABLE mol_data 
ADD CONSTRAINT ion_id_FK 
FOREIGN KEY (ion_id)
REFERENCES sources(id); 
