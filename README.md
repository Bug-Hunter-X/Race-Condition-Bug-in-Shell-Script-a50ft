# Race Condition Bug in Shell Script

This repository demonstrates a race condition bug in a shell script. The script creates two files and launches two processes that concurrently attempt to append their process IDs to both files.  Due to the asynchronous nature of file I/O, this can lead to data loss or inconsistency in the file contents.

The `bug.sh` file contains the buggy code. The `bugSolution.sh` file provides a corrected version that uses appropriate locking mechanisms to prevent race conditions.

## How to Reproduce the Bug
1. Clone this repository.
2. Run `./bug.sh`.
3. Observe the output.  The contents of `file1` and `file2` will likely be incomplete or inconsistent.

## Understanding the Solution
The solution addresses the race condition by using a locking mechanism (file locking) to ensure that only one process can access and modify the files at a time. This prevents data corruption and ensures data integrity.