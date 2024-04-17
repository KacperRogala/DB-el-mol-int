# Database-for-electron-molecule-interaction-studies
## 1. Introduction 
The aim of the project is to design a simple relational database, which will primarily store data regarding the results of the absolute *grand*-total cross section (TCS) measurements for electron scattering on molecules. It is very possible and highly desirable to expand the database with other types of data, e.g. cross sections for individual scattering processes or results that are not converted into cross sections. 

Designing the database has been divided into three stages, which will be implemented gradually. These stages are: 
- physical database design (creating a database schema) and its implementation using SQL Server. At this stage, the database will be built and pre-populated with some data. This will allow to consider optimizing the database, test some database queries, etc. (**in progress**) 
- moving the database to the Azure. Ultimately, I want the database to be available in the cloud.
- building a kind of front-end to the database. Flask will probably be used for this purpose. However, it is possible that the Power BI dashboard will be sufficient. 
