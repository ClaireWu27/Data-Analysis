# HBase Table Design and Querying

## Objective:
This task involves designing and implementing HBase tables to represent data cubes and querying them using HBase shell commands. The task is divided into two main parts: 
1. **Design and implementation of an HBase table for a data cube of applicants, positions, employers, and applications.**
2. **Querying the HBase table for a data cube of student assignments, submissions, and related data.**

---

## Part 1: Design and Implementation of HBase Table

### Task Description:
- **Conceptual Schema**: The schema represents a data cube where applicants submit applications for positions offered by employers. The table will store information about applicants, positions, employers, and applications.
- **Objective**: Design a single HBase table to store this information, create the table using HBase shell commands, and load sample data into it.

### Steps:
1. **Design an HBase Table**: Create an HBase table to store data about applicants, positions, employers, and applications. 
2. **Create the Table**: Write the HBase shell commands in the file `solution2-1.hb` to create the table.
3. **Load Sample Data**: Load sample data about at least two applicants, two positions, two employers, and three applications.
4. **Process the Script**: Use the HBase shell to process the script file `solution2-1.hb` and save the results in `solution2-1.txt`.

### Deliverable:
- **`solution2-1.txt`**: A file containing a report from processing the `solution2-1.hb` script, which includes creating the table and loading the data.

---

## Part 2: Querying HBase Table

### Task Description:
- **Conceptual Schema**: The schema represents a data cube where students submit assignments, and each submission consists of several files related to a subject.
- **Objective**: Use HBase shell commands to create a table for student assignments, process queries, and manipulate data.

### Steps:
1. **Create the Table**: Process the `task2-2.hb` script to create the HBase table `task2-2` and load sample data.
2. **Implement Queries and Data Manipulations**: Perform the following tasks:
   - **Query (i)**: Find all information in the column family `SUBJECT` qualified by `code` and column family `FILES` qualified by `fnumber1` and `fnumber2`.
   - **Query (ii)**: Find all information about a subject with code `312`, listing two versions per cell.
   - **Query (iii)**: Find all information about a submission of assignment 1 performed by a student `007` in a subject `312`, listing one version per cell.
   - **Query (iv)**: Replace the submission date of assignment 1 by student `007` in subject `312` with a new date (`02-APR-2019`) and list the `SUBMISSION` column family to verify the change.
   - **Query (v)**: Add a column family `DEGREE` containing the degree title a student is enrolled in. Add the degree title for student `007` and list all information about the student.

3. **Process the Script**: Use the HBase shell to process the script file `solution2-2.hb` and save the results in `solution2-2.txt`.

### Deliverable:
- **`solution2-2.txt`**: A file containing a report from processing the `solution2-2.hb` script with the results of the queries and data manipulations.

---

## Deliverables Summary:
1. **`solution2-1.txt`**: Contains a report from processing the `solution2-1.hb` script, including the creation of the HBase table and the loading of sample data.
2. **`solution2-2.txt`**: Contains a report from processing the `solution2-2.hb` script, including the implementation of queries and data manipulations.
