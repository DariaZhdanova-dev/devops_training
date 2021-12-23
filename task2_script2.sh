#!/bin/bash
if [[ -f ../task2.txt ]]; then
        echo ERROR: FILE EXISTS
else
        touch ../task2.txt 2>err.log && exit
        grep -q "Permission denied" err.log && echo ERROR: PERMISSION DENIED
fi                                                                         
