# Data Processing with Pig Latin

## Objective:
This task involves using Pig Latin to process a one-dimensional data cube. The schema consists of information about banks, accounts, and transactions. You will implement and process several queries using Pig to extract specific information from the data.

## Files:
1. **`task3.zip`**: Contains the following files:
   - `bank.tbl`: Information about banks.
   - `account.tbl`: Information about accounts.
   - `transaction.tbl`: Information about transactions.

## Steps:

### (1) **Load the Data into Pig Storage**:
- Use the `LOAD` command to load the files `bank.tbl`, `account.tbl`, and `transaction.tbl` from HDFS into Pig storage.

### (2) **Find the Names of Banks Located in Japan**:
- Find the names (`name`) of banks that have their headquarters located in Japan (`hq-country`).

### (3) **Find Account Numbers for Construction Banks**:
- Find the account numbers (`account-number`) opened in any construction (`bank-type`) bank.

### (4) **Find Banks with No Accounts Opened**:
- Find the names of banks (`bank-name`) that have no accounts opened in them.

### (5) **Find the Total Number of Accounts in Banks Located in Japan**:
- Find the total number of accounts opened in each bank located in Japan (`hq-country`).


## Deliverables:

**`solution3.txt`**: A text file containing:
   - Data loadings and queries performed above.
   - The messages and results of the operations processed in Pig.
   - The file should be created by copying and pasting the content from the Terminal window after running the commands.

