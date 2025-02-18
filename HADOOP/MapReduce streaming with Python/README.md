# MapReduce Streaming with Python

## Objective
This task involves implementing a Hadoop streaming application in Python that performs the equivalent of the following SQL query:
  SELECT item-name, SUM(price-per-unit * total-units)
  FROM sales.txt
  GROUP BY item-name

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
The contents of a file sales.txt is up to you as long as it is consistent with a format explained above.
Save your solution in the files mapper4.py and reducer4.py.
When ready perform the following actions.

(1) Open Terminal window and navigate to a folder where a file sales.txt is stored.
(2) Usecatcommandtolistthecontentsofafilesales.txtinTerminalwindow.
(3) Uploadafilesales.txttoHDFS.LocationofthefileinHDFSisuptoyou.
(4) Navigatetoafolderwherethefilesmapper4.pyandreducer4.pyarestored.
(5) Use cat command to list the contents of the files mapper4.py and reducer4.py in Terminal window.
(6) Usechmodcommandtochangeuser'saccesspermissiontothefilesmapper4.py and reducer4.py.
(7) ProcessyourapplicationwithHadoopstreamingfeature. (8) DisplaytheresultsstoredinHDFSbyyourapplication.

## Deliverables
A file solution4.txt that contains a listing of operations listed above and the outcomes from the operations.
Finally, Copy into a clipboard the contents of Terminal window and Paste the contents of a clipboard. into a file solution4.txt.

 