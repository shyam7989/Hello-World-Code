#!/bin/bash
i=1;
until [ $i -ge 5 ]
do 
   echo "value of i=" $i
   i=`expr $i + 1`
done

