#!/bin/bash

grep -rn "search_string" path/ | awk -F: '{print $1 ":" $2}' | xargs -I {} echo "break {}" > gdb_breaks.txt
gdb -x gdb_breaks.txt -args my_program
