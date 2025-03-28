#!/bin/bash

#Format: Number Firstname Other Names Total_time Offset Lap (Place) Lap (Place) ...
#Format: Club Split (Place) Split (Place) ... 
#

cat $1 |awk  '
  function pad(s)
  {
    if (length(s)==1) return "0:00:0" s;
    if (length(s)==2) return "0:00:" s;
    if (length(s)==4) return "0:0" s;
    if (length(s)==5) return "0:" s;
      return s;
  }
  $1~/^[0-9]+$/{
  firstline=NR
  printf("\n\"" $1" "$2" "$3"\"\t");
  col=4;
  while ($col !~ /^([0-9]+:)?[0-9]+:[0-9]+$/)
    ++col;
  for (i=col+2; i<=NF; i+=2) {
    printf(pad($i) "\t");
  }
  nextline
}
  END{printf("\n")}' 

