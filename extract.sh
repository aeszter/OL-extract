#!/bin/bash

#Format: Number Firstname Other Names Class Total_time Split Split ...
#Format: Lap Lap ... 
#(Optionally two further lines with the format: 
#Split Split ...
#Lap Lap ...
#
#Extra controls are appended 

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
  printf("\n\"" $1" "$2" "$3" "$4 "\"\t");
  col=5;
  while ($col !~ /^([0-9]+:)?[0-9]+:[0-9]+$/)
    ++col;
  for (i=col+1; i<=NF; ++i) {
    printf(pad($i) "\t");
  }
  nextline
}
  $1~/[0-9]+:[0-9]/ && (NR-firstline)%2==0{
  for (i=1; i<=NF; ++i)printf(pad($i) "\t"); nextline
  }   
  END{printf("\n")}' 

