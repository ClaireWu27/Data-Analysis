# Structured Stream Processing with Spark

## Objective:
This task involves implementing a data stream processing application using Spark to calculate the average temperatures for different locations each time a new temperature measurement is appended to the data stream. The measurements are provided by temperature sensors located in different places, sending location and temperature data at regular intervals.

---

## Steps:

### (1) **Simulate the Data Stream Using Netcat**:
- Use the `netcat` utility to simulate the stream of temperature data. This involves typing in location-temperature pairs such as:
    ```
    Sydney,25
    Wollongong,36
    Dapto,24
    Sydney,25
    Wollongong,34
    Dapto,26
    ```
- Each new data item (e.g., `Dapto,22`) will be added to the stream.

### (2) **Start Netcat to Simulate the Data Stream**:
- Open the first Terminal window and start the `netcat` utility. Enter location-temperature pairs in the format `location,temperature`.

### (3) **Implement Stream Processing Application in PySpark**:
- Open the second Terminal window and start **PySpark** to process the data stream.
- Your stream processing application should calculate the average temperature for each location in real-time as new data items are added to the stream.
  
### (4) **Testing the Application**:
- After the initial data stream is processed, return to the first Terminal window and type in the next data item, e.g., `Sydney,27`.
- The second Terminal window will automatically display the updated average temperature for Sydney.

- Repeat this process for different locations and different temperatures.

### (5) **Collect and Save Results**:
- Once your application is running and processing data successfully, copy the contents from both Terminal windows into a file named `solution5.txt`.
  - The file should contain the simulated data stream from `netcat` and the listing of your PySpark application along with the results of the data stream processing.

---

## Deliverables:

1. **`solution5.txt`**: A text file containing:
   - The simulated data stream from `netcat`.
   - The output of your PySpark application, showing the calculated average temperatures for each location.


---

### Example Content of `solution5.txt`:

```text
Netcat Simulation (First Terminal Window):
Sydney,25
Wollongong,36
Dapto,24
Sydney,25
Wollongong,34
Dapto,26
...

PySpark Application (Second Terminal Window):
Sydney,25
Wollongong,35
Dapto,25
...

After new data:
Dapto,22

Updated Results:
Sydney,25
Wollongong,35
Dapto,24
...
