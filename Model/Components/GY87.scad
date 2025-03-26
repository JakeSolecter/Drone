module GY87_holes() {
    translate([8,-5.5,0])
    cylinder(h=12,r = 2, center = true);
    
}


module GY87() {
    cube([22,17,5], center = true);
    GY87_holes();
}

//GY87();