include <RaspberryPI.scad>
include <../Arms/Arm0.scad>


holeSize=2;
width= 10;
thickness = 1;
plateSpace = 10;
connectorLength = 10;

$fa = 1;
$fs = 0.01;

module RaspPlatform() {
    difference() {
        scale([90,90,1.5])
        translate([0,0,0.5])
        cube(1, center = true);
        
        union() {
            PiHoles();
            
            
            //horrible but works
            for (i=[0:3])
            translate([20*pow(-1, floor(i/2)),20*pow(-1,i),0])
rotate([0,0,45 - i * 90 * round(0.75-i/4)+ (i-1) * 90 * round(i/4)] )
translate([0,-width/2,0])
            ConnectorHoles(holeSize, width, thickness, plateSpace, connectorLength,1);
        }
    }
}






translate([20,20,0])
rotate([0,0,45])
translate([0,-width/2,0])
%ConnectedArm(70, 3.5, width , thickness, 7.5, 1.25, 25, 5, plateSpace, connectorLength, holeSize, 2.5, 2);

translate([0,0, 20])
#RaspberryPi();
RaspPlatform();




