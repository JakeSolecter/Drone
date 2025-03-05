include <../Components/RaspberryPI.scad>
include <../Components/GY521.scad>
include <../Arms/Arm0.scad>


holeSize=2;
width= 10;
thickness = 1;
plateSpace = 10;
connectorLength = 10;

$fa = 1;
$fs = 0.01;


module RaspPlatformCornerCut(distance) {
    translate([sqrt(distance*distance/2),sqrt(distance*distance/2),0])
    translate([distance*(sqrt(2)/4),distance*(sqrt(2)/4),0])
    rotate([0,0,45])
    scale([distance,distance,distance])
    cube(1,center = true);
    
    
}

module RaspPlatformEdgeCut(size, offset) {
    translate([0,offset, -1])
    cylinder(h=offset, r = size);
    
}



module RaspPlatform(size, height) {
    difference() {
        scale([size,size,height])
        translate([0,0,0.5])
        cube(1, center = true);
        
        union() {
            PiHoles();
            for (i=[0:1])
                rotate([0,0,180*i])
            RaspPlatformEdgeCut(37, sqrt(40*40*2)+3);
            for (i=[0:3])
                rotate([0,0,90*i])
                RaspPlatformCornerCut(40);
            
            
            //horrible but works
            for (i=[0:3])
            translate([20*pow(-1, floor(i/2)),20*pow(-1,i),0])
rotate([0,0,45 - i * 90 * round(0.75-i/4)+ (i-1) * 90 * round(i/4)] )
translate([0,-width/2,0])
            ConnectorHoles(holeSize, width, thickness, plateSpace, connectorLength,1);
        }
    }
}




/*

translate([20,20,0])
rotate([0,0,45])
translate([0,-width/2,0])
#ConnectedArm(70, 3.5, width , thickness, 7.5, 1.25, 25, 5, plateSpace, connectorLength, holeSize, 2.5, 2);

translate([0,0, 20])
#RaspberryPi();
RaspPlatform(70,1.5);




*/


