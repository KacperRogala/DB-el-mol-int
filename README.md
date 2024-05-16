# Database-for-electron-molecule-interaction-studies
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

### List of Tables:
- study - a table storing data about specific studies
- mol_data - table storing information about molecules '
- results - a table storing the results of experimental or theoretical research
- sources - table storing information about data sources

### Normalization 
The database is planned to meet the conditions for normalization to at least the first two normal forms. 
