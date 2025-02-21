# Hadoop Mini Projects Overview

This repository contains 9 different Hadoop-related tasks covering HDFS operations, MapReduce, Spark, Hive, HBase, Pig, and stream processing. Each task includes a detailed `README.md` file with step-by-step instructions.

## Project List

### **1. HDFS Operations and Python Interface**

1. **HDFS Command-Line Operations**  
   Learn how to interact with HDFS using the command line. This task covers file creation, uploading, manipulation, merging, and deletion.  
   [View Details](./Command%20Line%20Interface%20to%20HDFS/)

2. **Python Interface to HDFS (Snakebite)**  
   Use the Snakebite client library in Python to interact with HDFS. Perform operations such as listing files and folders, retrieving file contents, and managing HDFS data programmatically.  
   [View Details](./Python%20Interface%20to%20HDFS/)

---

### **2. Data Processing and Querying**

3. **Querying a Data Cube in Hive**  
   Execute SQL queries in Hive using `GROUP BY`, `CUBE`, `ROLLUP`, and window functions to analyze orders and supplier data.  
   [View Details](./Querying%20a%20Data%20Cube/)

4. **Data Processing with Pig Latin**  
   Use Pig Latin to process a one-dimensional data cube containing banking and transaction data. Perform filtering, aggregation, and extraction of meaningful insights.  
   [View Details](./Data%20processing%20with%20Pig%20Latin/)

5. **Data Processing with Spark**  
   Utilize PySpark to process and analyze a denormalized data cube of banks, accounts, and transactions. Work with DataFrames and execute queries efficiently.  
   [View Details](./Data%20processing%20with%20Spark/)

6. **0NF Table Implementation in Hive**  
   Implement a 0NF (Zero Normal Form) table in Hive to store complex employee and project data without strict normalization. Learn how to handle unstructured data within Hive.  
   [View Details](./Implementation%20of%200NF%20table%20in%20Hive/)

---

### **3. Big Data Processing with MapReduce**

7. **MapReduce Streaming with Python**  
   Implement a Hadoop streaming application using Python. Process sales transaction data using the MapReduce paradigm to compute aggregated statistics.  
   [View Details](./MapReduce%20streaming%20with%20Python/)

8. **HBase Table Design & Querying**  
   Design and implement HBase tables for handling structured data related to recruitment and student assignments. Execute queries using HBase shell commands.  
   [View Details](./HBase%20Table%20Design%20and%20Querying/)

---

### **4. Real-Time Stream Processing**

9. **Structured Stream Processing with Spark**  
   Develop a Spark Streaming application to process real-time temperature data from various locations. Compute the average temperature dynamically as new data streams in.  
   [View Details](./Structured%20stream%20processing%20with%20Spark/)

---

## How to Use

Each sub-project contains a `README.md` file with detailed instructions. Refer to the respective directories to execute the tasks.
