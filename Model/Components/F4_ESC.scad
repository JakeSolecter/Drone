module F4_ESC_holes() {
    for (i = [0:3])
        rotate([0,0,90*i])
    translate([36/2-1.5-2.5/2,36/2-1.5-2.5/2,0])
    cylinder(h = 15, r = 2.5/2, center = true);
    
}

module F4_ESC() {
    F4_ESC_holes();
    cube([36,36,10],center = true);
    
    

}

//F4_ESC();