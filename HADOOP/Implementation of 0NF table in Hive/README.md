# Implementation of 0NF Table in Hive

## Objective
This task involves implementing a 0NF (Zero Normal Form) relational table in Hive to store information about employees, their assigned projects, programming skills, and employment records. The table will store data that does not adhere to normalization rules but allows for flexible data storage in this specific context.

## Task Description
Consider the following description of a sample database domain.
We would like to store information about the employees, the projects they are assigned to, their programming skills and their employment record. An employee is described by an employee number and full name. An employee can be assigned to many projects. Some employees are not assigned to any projects. A project is identified by its name. If an employee is assigned to some projects then we need to keep information about a percentage contribution of an employee to each project. We also would like to record information about the programming languages that can be used by the employees. An employee can use none or many programming languages. An employment record consists
of hire date, salary and employee number of a supervisor.
(1) Implement HQL script solution4.hql that creates an internal 0NF relational
table to store information about the employees, the projects they are assigned to and
their programming skills.
(2) Include into the script INSERT statements that load sample data into the table.
Insert at least 5 rows into the relational table created in the previous step. Two employees must participate in few projects and must know few programming languages. One employee must participate in few projects and must not know any programming languages. One employee must know few programming languages and must not participate in any projects. One employee must not know programming languages and must not participate in the projects. Each employee must have a
nonempty employment record.
(3) IncludeintothescriptSELECTstatementsthatliststhecontentsofthetable.
When ready, use a command line interface beeline to process a script
solution4.hql and to save a report from processing in a file solution4.txt.
If the processing of the file returns the errors then you must eliminate the errors! Processing of your script must return NO ERRORS! A solution with errors is worth no marks!
## Deliverables
A file solution4.txt with a report from processing of HQL script solution4.hql. The report MUST NOT include any errors, and the report must list all SQL statements processed.