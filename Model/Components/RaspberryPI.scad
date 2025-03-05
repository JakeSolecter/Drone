module PiHoles() {
    radius = 1.5;
    translate([29,11.5,0])
    cylinder(h= 10, r = radius, center = true);
    translate([29,-11.5,0])
    cylinder(h= 10, r = radius, center = true);
    translate([-29,11.5,0])
    cylinder(h= 10, r = radius, center = true);
    translate([-29,-11.5,0])
    cylinder(h= 10, r = radius, center = true);
    
}


module RaspberryPi() {
    translate([0,0,2.5])
    union() {
    scale([65, 30, 5])
    cube(1, center = true);
    PiHoles();
        
    }
    
}