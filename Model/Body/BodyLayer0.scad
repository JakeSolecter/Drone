module RaspberryPi() {
    scale([65, 30, 5])
    cube(1, center = true);
    translate([29,11.5,0])
    cylinder(h= 10, r = 2, center = true);
    translate([29,-11.5,0])
    cylinder(h= 10, r = 2, center = true);
    translate([-29,11.5,0])
    cylinder(h= 10, r = 2, center = true);
    translate([-29,-11.5,0])
    cylinder(h= 10, r = 2, center = true);
    
}

RaspberryPi();