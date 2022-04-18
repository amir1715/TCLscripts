proc loadpdbs {pat} {
set con [glob $pat]
foreach item $con {
mol load pdb $item
  }
}
proc savepdbs {start end} {
  #set pr aligned
  for {set i $start} {$i <= $end} {incr i 1} {
    set sel [atomselect $i "all"]
    set nam [molinfo $i get {name}] 
    $sel update
    $sel writepdb $nam
  }
}


proc ribbon {start end} {  
  for {set i $start} {$i <= $end} {incr i 1} {
  mol delrep 0 $i
  mol representation NewCartoon 0.22 6
  mol addrep $i
  mol modcolor 0 $i ResName
  }
}


