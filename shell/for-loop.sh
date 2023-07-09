#!/bin/bash
for i in 1 2 3 4 5
do 
  echo "value of i=" $i
  i=`expr $i + 1`
done
