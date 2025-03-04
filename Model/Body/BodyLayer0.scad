include <RaspberryPI.scad>
include <../Arms/Connector0.scad>

$fa = 1;
$fs = 0.01;

module platform() {
    difference() {
        scale([90,90,2])
        cube(1, center = true);
        PiHoles();
    }
}




translate([0,0, 20])
#RaspberryPi();
platform();
