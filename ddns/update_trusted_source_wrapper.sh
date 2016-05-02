#! /bin/bash
for line in $(grep -v '^#' ./domains);
 do
  ./update_trusted_source.sh $line
 done
exit

