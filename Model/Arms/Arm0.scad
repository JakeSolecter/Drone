$fa = 1;
$fs = 0.01;

include <Connector0.scad>


module Beam(length,height, thickness) {
    scale([length,thickness,height])
    cube(1);


}



module Cross(length, height, width, thickness) {
    difference() {
        translate([0,thickness,0])
        rotate([0,0,atan(width/length)])
        translate([0,-thickness,0])
        Beam(sqrt(length*length+width*width), height, thickness);
        translate([0,-thickness,-0.5])
        ArmSides(length+width,height+1,width+2*thickness,thickness);
    }
    
    difference() {
        translate([0,width-thickness,0])
        rotate([0,0,-atan(width/length)])
        Beam(sqrt(length*length+width*width), height, thickness);
        translate([0,-thickness,-0.5])
        ArmSides(length+width,height+1,width+2*thickness,thickness);
    }
    
}

module ArmSides(length,height, width, thickness) {
    Beam(length, height, thickness);
    translate([0,width-thickness,0])
    Beam(length, height, thickness);
}

module EngineMount(radius, height, thickness, middleHoleRadius) {
    difference() {
        cylinder(h=height, r=radius);
        translate([0,0,thickness])
        cylinder(h=height, r=(radius-thickness));
        translate([0,0,-1])
        cylinder(h= height+2, r=middleHoleRadius);
    }
    
    
}

module ArmBeam(length,height, width, thickness, numCrosses) {
    ArmSides(length,height, width, thickness);
    for (i = [0:numCrosses-1])
        translate([length/numCrosses*i,0,0])
        Cross(length/numCrosses, height*0.85, width, thickness);
    
    
    difference() {
        translate([0,width/2-thickness,0])
        Beam(length-thickness, height, thickness*2);  
        
    }
}

module Leg(length, height, thickness, legHeight, mountRadius, hOffset) {
    
   translate([-height,0,0])
   Beam(height, height*1.5, 2*thickness);
    //foot
   translate([-hOffset-length,0,legHeight])
    Beam(length,height,2*thickness);
    
    //outer connection
   translate([0,0,1.5*height])
    rotate([0,-atan(hOffset/(legHeight-height*1.5+height)),0])
    translate([-height,0,0])
    Beam(height,sqrt(hOffset*hOffset + (legHeight-height*0.5)*(legHeight-height*0.5)),thickness*2);
    
    //inner connection
    translate([-hOffset-length*2,0,height])
    rotate([0,90-atan((legHeight)/length),0])
    Beam(height, sqrt(pow(legHeight,2)+pow(length,2)) ,thickness*2);
    
}

module Arm(length, height, width, thickness, engineRadius, engineHoleRadius, legHeight, legOffset) {
    ArmBeam(length,height,width,thickness, ceil(length/width));
    
    
    
    translate([length-thickness+engineRadius,width/2,0])
    EngineMount(engineRadius+thickness, height*1.5, thickness, engineHoleRadius);
    
    translate([length+engineRadius*2,width/2-thickness,0])
    Leg(length/5, height, thickness,legHeight, engineRadius+thickness, legOffset);
    
}

module ConnectedArm(length, height, width, thickness, 
    engineRadius, engineHoleRadius, legHeight, legOffset, plateSpace, connectorLength, holeSize, connectorHeight, connectorRoundness) {
    
        
    translate([connectorLength,0,0])
    union() {
    Arm(length, height, width, thickness, engineRadius, engineHoleRadius, legHeight, legOffset);
    
    
    translate([0,10,0])
    rotate([0,0,180])
    ArmConnector(plateSpace, width, connectorLength, holeSize, thickness, connectorHeight, height, connectorRoundness);
        
    
    }
    
}


//ConnectedArm(70, 3.5, 10 , 1, 7.5, 1.25, 25, 5, 10, 10, 2, 2.5, 2);


