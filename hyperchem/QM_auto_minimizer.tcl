#by amirhossein sakhteman at Department of medicinal chemistry,Faculty of pharmacy, Shiraz, Iran 
set chan [open QM_conv.txt w]
set sp "  "
set ml .ML2
set mll .mol2
set con [glob *.hin]
hcExec "menu-setup-semi-empirical"
hcExec "optim-max-cycles=32767"
    foreach item $con {
    set name [file rootname $item]
    hcExec "open-file $item"
    hcExec "do-optimization"
    set en [hcQuery total-energy] 
    hcExec "menu-file-save"
    hcExec "write-file $name$ml"
    set co [hcQuery optim-converged]
    puts $chan $item$sp$co$sp$en
    file rename -force $name$ml $name$mll 
    }
close $chan


