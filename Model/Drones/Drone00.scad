include <../Body/BodyLayer0.scad>

bodyThickness = 4;

RaspPlatform(70,bodyThickness);
translate([0,0,bodyThickness+plateSpace])
RaspPlatform(70,bodyThickness);



for (i=[0:3])
translate([20*pow(-1,floor(i/2+0.5)),20*pow(-1,floor(i/2)),bodyThickness+ plateSpace])
rotate([0,0,45+90*i])
rotate([180,0,0])
translate([0,-width/2,0])
ConnectedArm(70, 3.5, width , thickness, 7.5, 1.25, 25, 5, plateSpace, connectorLength, holeSize, 2.5, 2);

translate([0,0,bodyThickness])
#RaspberryPi();