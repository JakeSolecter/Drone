module GY521Holes() {
    height = 20.4;
    width = 15.6;
    
    cylinder(h = 6, r = 1.5, center = true);
    
    
    
}

module GY521() {
    height = 20.4;
    width = 15.6;
    
    translate([0,0,1.5])
    union() {
        cube([width, height, 3],center = true);
        for (i=[1,-1])
        translate([13.05-width/2,15.24/2*i,0])
        GY521Holes();
    }
    
    
}

//GY521();