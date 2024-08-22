# Database for electron-molecule interaction studies
## 1. Introduction 
The aim of the project is to design a simple relational database, which will primarily store data regarding the results of the absolute *grand*-total cross section (TCS) measurements for electron scattering on molecules. It is very possible and highly desirable to expand the database with other types of data, e.g. cross sections for individual scattering processes or results that are not converted into cross sections. 

Designing the database has been divided into three stages, which will be implemented gradually. These stages are: 
- physical database design (creating a database schema) and its implementation using SQL Server. At this stage, the database will be built and pre-populated with some data. This will allow to consider optimizing the database, test some database queries, etc. (**in progress**) 
- moving the database to the Azure. Ultimately, I want the database to be available in the cloud.
- building a kind of front-end to the database. Flask will probably be used for this purpose. However, it is possible that the Power BI dashboard will be sufficient. 

We live in times when machine learning algorithms can be successfully implemented in many fields of science and technology. Electron-molecule interaction studies are no exception. I hope that by building this database it will be possible to collect data that can be used in some neural networks or decision trees and support the analysis of scattering processes. 

## 2. Database schema 
The main table will contain the name of the studied molecule and foreign keys to subsequent tables with more detailed data. The remaining tables will contain data about:
- the most important properties of the molecule
- test results
- sources from which particular data comes (articles, books, etc.)
The sources table will be linked to all the others and will provide information about where the data comes from. As the sources may be different, the table will store data in a universal way (an article is cited in a different way than a book is cited).

### List of Tables 
- study - a table storing data about specific studies
- mol_data - table storing information about molecules '
- results - a table storing the results of experimental or theoretical research
- sources - table storing information about data sources

### Normalization 
The database is planned to meet the conditions for normalization to at least the first two normal forms. 
- first normal form - grouping related columns into separate tables, reducing redundancy, creating keys connecting databases 
- second normal form - there are no partial dependencies of primary keys and columns

### Database columns/features 
As mentioned above, the database consists of four tables. The columns store the following data: 

#### study table:
- id - primary key
- mol_name - name of the molecule being tested
- mol_data_id - foreign key to the mol_data table storing detailed data about molecules
- source_id - foreign key to the sources table, which contains information about the source where one can find details of a specific study (related to the cross section values in this case) 

#### results table:
- id - primary key
- energy - energy value for which a specific value of the scattering cross section was measured
- cross_section - value of the measured scattering cross section
- uncertainty - the value of uncertainty related to a specific value of the scattering cross section
- study_id - foreign key to the study table

#### mol_data table:
- id - primary key
- mol_name - name of the molecule being tested 
- chem_form - formula of the molecule
- iupac_name - official IUPAC name of the molecule
- polarizability - polarizability value of the molecule
- polar_id - foreign key to the sources table, which contains information about the source where one can find details of a specific study (related to the polarizability values in this case)
- dipol - dipole moment value of the molecule
- dipol_id - foreign key to the sources table, which contains information about the source where one can find details of a specific study (related to the dipol moment values in this case)
- ionization - ionization threshold value of the molecule
- ion_id - foreign key to the sources table, which contains information about the source where one can find details of a specific study (related to the ionization threshold values in this case)
- numb_atoms - the number of atomic nuclei that a molecule contains
- numb_electrons - the number of electrons that a molecule contains

#### sources table: 
- id - primary key
- type - type of the source - A is for scientific article, B is for book, W is for website, D is for database, O is for other
- url - url address where one can find the source
- month_of_visit - month of source url visit
- year_of_visit - year of source url visit
- id_nr - doi, ISBN, or other identifying number, if any
- name - title of the article, book, name of the website, etc.
- authors - people responsible for the data contained in the source
- cite - source citation  

### Graphical representation of the database schema 
An illustration of the database schema is in the file "db_schema.jpeg". The picture was made using the dbdiagram.io editor (https://dbdiagram.io/home/ - access on 05/24). 

