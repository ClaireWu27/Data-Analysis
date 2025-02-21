# Implementation of 0NF Table in Hive

## Objective

This task involves implementing a 0NF (Zero Normal Form) relational table in Hive to store information about employees, their assigned
projects, programming skills, and employment records. The table will store data that does not adhere to normalization rules but allows for flexible data storage in this specific context.

## Task Description

1. **Create a table** to store:

   - Employee details (ID, name)
   - Assigned projects (name, contribution %)
   - Programming skills (languages known)
   - Employment record (hire date, salary, supervisor ID)

2. **Insert at least 5 sample records**, ensuring:

   - Two employees work on multiple projects and know multiple programming languages.
   - One employee works on multiple projects but knows no programming languages.
   - One employee knows multiple programming languages but is not assigned to any projects.
   - One employee neither knows programming languages nor participates in projects.
   - Each employee has a valid employment record.

3. **Include `SELECT` statements** to display the table content.

4. **Execute the script using Beeline**, saving the output as `solution4.txt`.
   - Ensure the script runs **without errors**—solutions with errors will not be accepted.

## Deliverables

A file solution4.txt with a report from processing of HQL script solution4.hql. The report MUST NOT include any errors, and the report must list all SQL statements processed.
