# Lab 03 Report
Name: Gulam Rasool | Roll no: 23-NTU-CS-FL-1159 | Date: 2026-10-09

## Object hashes (Section 4.4)
- commit: 2eac0fd7b0754238b9d79c930a9e31db4ceff8ea
- tree:   d7efbf7606f46bdfd0b4d4f81b6695246fe65a2f
- blob (Makefile): 36e63de514b6dcb8dbefb98e3ae6ae6afdc7a284
- commit = snapshot pointer + author + message; tree = directory listing; blob = file contents.

## git log --oneline --graph (main)
```
*   446abc5 Merge feature/docs
|\  
| * e8db6f1 Document the Makefile targets inline
|/  
* 072bcf8 Add a README
*   52013e7 Merge feature/word-count
|\  
| * 5570f35 Add a count target reporting built words
* | 5b12b17 Add a count target for source files
|/  
* ad669a7 Correct the contents of report.txt
* 4f942f9 Add report.txt to the build inputs
* 2eac0fd Add Lab 02 build pipeline
```

## Why the hash changed in 7.3
the parent is part of the hashed content, and the commit’s parent changed to the new tip of main. A different parent means a different object, even though the files are identical

## The conflict in Task 3
main wanted to count source files and the feature branch wanted to count built words, both in a target called count. Git refused to guess. My resolution is one target that does both, so it is neither side as written.

## Task 5
First bad commit: 2d389cb ("Speed up the transform step"). 
each test halves the remaining candidates, so 16 commits take about log₂16 = 4 tests.

## Fallback
I used  fallback/.
