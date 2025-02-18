Describing MapReduce implementation
Assume, that a folder crime-stories in local file system contains the text files with a large number of crime stories. Assume, that each text file is formatted such that one statement is located in one line of a text file. A folder crime-stories is very large.
Assume, that a small text file patterns.txt is located in a local file system as well. A file contains the text patterns, for example regular expressions. Assume, that the file is formatted, such that one pattern is located in one line of the text file. A file patterns.txt is small enough to be stored in a transient memory of each system in a cluster.
To simplify the problem, assume that all text patterns in a file patterns.txt are different.
Finally, assume that a function match(text-line, text-pattern) returns true when text-line matches a pattern text-pattern. Otherwise, the function returns false.
Your task is to explain how to implement a MapReduce application that for each text pattern in a file patterns.txt finds the total number of statements in the files located in a folder crime-stories that match the pattern.
Make sure that you answer the following questions in your explanations. Please underline the answers.
(1) Whataretheparametersofyourapplication?
(2) Whatinformationisfilteredoutbyamapper?
(3) Whatkey-valuepairsarecreatedbyamapper? (4) Howkey-valuepairsarecreatedbyamapper? (5) Whatkey-valuepairsareprocessedbyareducer? (6) Howkey-valuepairsareprocessedbyareducer? (7) Whatistheformatofthefinalresults?
(8) HowtouploaddatatoHDFS?
(9) Howtoprepareyourapplicationforprocessing? (10) How to list the final results ?
 
Save your explanations in a file solution5.pdf.
This task does not require you to write any code in Python. However, the comprehensive explanations related to all stages of data processing are expected. Try to be as specific as it is possible.
Deliverables
A file solution5.pdf with the comprehensive explanations how would you implement a MapReduce application that for each text pattern in a file patterns.txt finds the total number of statements in crime stories included in a file crime- stories that match the pattern.