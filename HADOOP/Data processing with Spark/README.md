# Data Processing with Spark

## Objective:

This task involves using Spark to process a one-dimensional data cube with denormalized schemas. The schema consists of information about banks, accounts, and transactions. It involves using PySpark to manipulate and query the data.

## Files:

1. **`task4.zip`**: Contains the following files:
   - `bank.csv`: Information about banks.
   - `account.csv`: Information about accounts.
   - `transaction.csv`: Information about transactions.

---

## Steps:

### (1) **Create Schemas for the CSV Files**:

- Define the schemas for the files `bank.csv`, `account.csv`, and `transaction.csv`.

### (2) **Create DataFrames for the CSV Files**:

- Create the data frames with the contents of the files `bank.csv`, `account.csv`, and `transaction.csv` using the schemas created in the previous step.
- Count the total number of rows in each data frame and list the contents of each data frame.

### (3) **Query the Transaction Data**:

- Find the total amount of money involved in the deposit transactions per each bank. Skip the banks with no deposit transactions and sort the results in ascending order of the total amount of money found.

### (4) **Create a Temporary View for the Transaction Data**:

- Create a temporary view over the data frame containing transaction information.

### (5) **Query the Temporary View**:

- Implement the same query as in step (3) but using the temporary view created in step (4).

---

## Deliverables:

1. **`solution4.txt`**: A text file containing:
   - A listing of the operations performed in PySpark, including the creation of schemas, data frames, and temporary views.
   - The results of the operations processed in PySpark, including queries and data manipulations.
