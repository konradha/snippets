#!/bin/bash

echo "set breakpoint pending on" > gdb_breaks.txt
grep -rn "search_string" path/ | awk -F: '{print $1 ":" $2}' | xargs -I {} echo "break {}" >> gdb_breaks.txt
echo "run" >> gdb_breaks.txt
gdb -x gdb_breaks.txt -args my_program

