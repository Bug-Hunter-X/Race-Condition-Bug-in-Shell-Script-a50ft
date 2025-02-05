#!/bin/bash

# This script demonstrates a race condition bug.

# Create two files, file1 and file2.
touch file1 file2

# Start two processes concurrently.  Each process attempts to append its PID to both files.
(while true; do echo """>file1; echo """>file2; done) & 
(while true; do echo """>file1; echo """>file2; done) &

# Wait for a few seconds to allow race condition to occur.
sleep 5

# Check the contents of file1 and file2.  They might be incomplete or inconsistent due to the race condition. 
cat file1
cat file2

# Kill the background processes.
kill %1 %2