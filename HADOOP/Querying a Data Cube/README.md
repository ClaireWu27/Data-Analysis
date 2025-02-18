# Task 1: Querying a Data Cube

## Objective:
This task involves implementing several SQL queries using the GROUP BY clause with different operators and window partitioning techniques on a two-dimensional data cube. The data cube consists of a fact entity representing parts in orders, along with two dimensions: orders and parts supplied by suppliers.


## File Setup:
1. **task1.zip** contains the following files:
   - `dbcreate.hql`: Script for creating the internal relational tables.
   - `dbdrop.hql`: Script for dropping the tables.
   - `partsupp.tbl`: Contains information about parts and suppliers.
   - `lineitem.tbl`: Contains information about the parts included in the orders.
   - `orders.tbl`: Contains information about customer orders.

2. Unzip the file and navigate to the folder `task1` containing the files.

3. Start **Hive Server 2** in the terminal window (ensure Hadoop and Metastore are started first), then start the **Beeline client**.

4. Process the `dbcreate.hql` script to create the internal relational tables and load data into the tables.

5. The `dbdrop.hql` script can be used to drop the tables.

---

## Task Breakdown:

### (1) Using GROUP BY Clause with CUBE Operator:
For the order clerks (O_CLERK) Clerk#000000988, Clerk#000000992, find the total number of ordered parts per customer (O_CUSTKEY), per supplier (L_SUPPKEY), per customer and supplier (O_CUSTKEY, L_SUPPKEY), and the total number of ordered parts.

### (2) Using GROUP BY Clause with ROLLUP Operator:
For the parts with the keys (L_PARTKEY) 18, 19, 20, find the largest discount applied (L_DISCOUNT) per part key (L_PARTKEY), per part key and supplier key (L_PARTKEY, L_SUPPKEY), and the largest discount applied at all.

### (3) Using GROUP BY Clause with GROUPING SETS Operator:
Find the smallest price (L_EXTENDEDPRICE) per order year (O_ORDERDATE), and order clerk (O_CLERK).

### (4) Using Window Partitioning:
For each part, list its key (PS_PARTKEY), all its available quantities (PS_AVAILQTY), the smallest available quantity, and the average available quantity. Consider only the parts with the keys 18, 19, and 20.

### (5) Using Window Partitioning:
For each part, list its key (PS_PARTKEY) and all its available quantities (PS_AVAILQTY) sorted in descending order and a rank (position number in an ascending order) of each quantity. Consider only the parts with the keys 18, 19, and 20. Use an analytic function ROW_NUMBER().


### (6) Using Window Partitioning:
For each part, list its key (PS_PARTKEY), its available quantity, and an average available quantity (PS_AVAILQTY) of the current quantity and all previous quantities in the ascending order of available quantities. Consider only the parts with the keys 18, 19, and 20. Use ROWS UNBOUNDED PRECEDING sub-clause within PARTITION BY clause.

## Deliverables:
solution1.txt: A text file containing the report with the results of the SQL queries, including the processed SELECT statements.
