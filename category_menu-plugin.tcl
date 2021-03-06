# This plug generates a menu tree for selecting objects from a single
# structured textfile.  The format of the textfile is nested Tcl lists
# defined using {} brackets.

package require pd_menus

namespace eval category_menu {
}

proc category_menu::load_menutree {} {
    # load object -> tags mapping from file in Pd's path
    set testfile [file join $::current_plugin_loadpath menutree.tcl]
    set f [open $testfile]
    # filter out commented out lines from the data file
    set menutree [regsub -all {\n\s*#[^\n]*} [read $f] "\n"]
    close $f
    unset f        
    return $menutree
}

proc category_menu::create {mymenu} {
    set menutree [load_menutree]
    $mymenu add separator
    foreach categorylist $menutree {
        set category [lindex $categorylist 0]
        set categorymenu $mymenu.[string tolower $category]
        menu $categorymenu
        $mymenu add cascade -label $category -menu $mymenu.$category
        foreach subcategorylist [lrange $categorylist 1 end] {
            set subcategory [lindex $subcategorylist 0]
            set subcategorymenu $categorymenu.[string tolower $subcategory]
            menu $subcategorymenu
            $categorymenu add cascade -label $subcategory -menu $subcategorymenu
            foreach item [lindex $subcategorylist end] {
                # replace the normal dash with a Unicode minus so that Tcl doesn't
                # interpret the dash in the -label to make it a separator
                $subcategorymenu add command \
                    -label [regsub -all {^\-$} $item {−}] \
                    -command \
                    "pdsend \"\$::focused_window obj \$::popup_xcanvas \$::popup_ycanvas $item\""
            }
        }
    }
}

category_menu::create .popup
