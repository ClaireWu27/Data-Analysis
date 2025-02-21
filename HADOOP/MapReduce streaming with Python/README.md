# MapReduce Streaming with Python

## Objective

Implement a **Hadoop Streaming** application in Python to compute total revenue per item, equivalent to:

```sql
SELECT item-name, SUM(price-per-unit * total-units)
FROM sales.txt
GROUP BY item-name;
```

A single line in an input data set sales.txt must have the following format. item-name price-per-unit total-units
For example:
bolt 2 25
washer 3 8
screw 7 20
nail 5 10
screw 7 2
bolt 2 20
bolt 2 30
drill 10 5
washer 3 8

## Instructions

1. **Prepare Files:**

   - Ensure `sales.txt` contains data in the specified format.
   - Implement the MapReduce logic in `mapper4.py` and `reducer4.py`.

2. **Setup in Terminal:**

   - Navigate to the directory containing `sales.txt` and verify its contents.
   - Upload `sales.txt` to HDFS at a chosen location.

3. **Configure Execution:**

   - Navigate to the directory containing `mapper4.py` and `reducer4.py`.
   - Verify the contents of both files.
   - Adjust file permissions if necessary.

4. **Run Hadoop Streaming Job:**

   - Process the data using Hadoop Streaming.

5. **View Results:**
   - Retrieve and display the output stored in HDFS.

## Deliverables

A file solution4.txt that contains a listing of operations listed above and the outcomes from the operations.
Finally, Copy into a clipboard the contents of Terminal window and Paste the contents of a clipboard. into a file solution4.txt.

```

```
