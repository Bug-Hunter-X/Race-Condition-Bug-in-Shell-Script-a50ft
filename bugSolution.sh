#!/bin/bash

# This script demonstrates a solution to the race condition bug using file locking.

# Create two files, file1 and file2.
touch file1 file2

# Function to append PID to a file with locking.
append_pid() {
  local file=$1
  local pid=$2
  flock -n 200 </$file || exit 1  # acquire a lock on the file, if it's locked exit
  echo "PID: $pid" >> "$file"
  flock -u 200 </$file
}

# Start two processes concurrently.
(append_pid file1 $$; append_pid file2 $$) &
(append_pid file1 $$; append_pid file2 $$) &

# Wait for a few seconds to allow processes to run.
sleep 5

# Kill the background processes.
kill %1 %2

# Check the contents of file1 and file2. The contents should be consistent now.
cat file1
cat file2