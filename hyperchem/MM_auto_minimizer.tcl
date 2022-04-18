#by amirhossein sakhteman at Department of medicinal chemistry,Faculty of pharmacy, Shiraz, Iran 
set chan [open MM_conv.txt w]
set ml .ML2
set hn .hin
set sp "  "
set con [glob *.hin]
hcExec "menu-setup-molecular-mechanics"
hcExec "optim-max-cycles=32767"
    foreach item $con {
    set name [file rootname $item]
    #file rename -force $item $name$ml
    hcExec "open-file $name$hn"
    hcExec "do-optimization"
    hcExec "menu-file-save"
    set en [hcQuery total-energy]
    hcExec "view-in-hin-file=true" 
    #hcExec "write-file $name$hn"
    set co [hcQuery optim-converged]
    puts $chan $item$sp$co$sp$en
    #file rename -force $name$ml $item 
    }
close $chan


