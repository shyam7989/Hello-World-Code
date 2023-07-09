#!/bin/bash
i=1;
while [ $i -le 5 ]
do 
   echo "value of i=" $i
   i=`expr $i + 1`
done

