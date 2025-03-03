module RaspberryPi() {
    radius = 1.5;
    scale([65, 30, 5])
    cube(1, center = true);
    translate([29,11.5,0])
    cylinder(h= 10, r = radius, center = true);
    translate([29,-11.5,0])
    cylinder(h= 10, r = radius, center = true);
    translate([-29,11.5,0])
    cylinder(h= 10, r = radius, center = true);
    translate([-29,-11.5,0])
    cylinder(h= 10, r = radius, center = true);
    
}