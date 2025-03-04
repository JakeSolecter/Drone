//Is there a bette way? Probably. Am I gonna fix "includeBack"? Probably not. Would renaming be good? Definitely.
module ConnectorHoles(holeSize, width, thickness, plateSpace, backOffset, includeBack) {
    
    for (i = [0:includeBack])
    for (i1 = [0:1])
        //TODO: high roundness will cause trouble here
        translate([thickness+holeSize/2 - i * (-backOffset+2*thickness+ holeSize),thickness+holeSize/2 - i1 * (holeSize - width + thickness*2),-1])
        cylinder(h=plateSpace+2, r = holeSize/2);
    
}

module ConnectorSupport(holeSize, thickness, plateSpace) {
    
    difference() {
    translate([thickness+holeSize/2,0,0])
    rotate([0,0,90])
    scale([thickness, plateSpace, plateSpace])
    cube(1);
    
    
    
    translate([-plateSpace,0,0])
    rotate([0,-45,0])
    translate([plateSpace*2,0,0])
    rotate([0,0,90])
    translate([-1,0,0])
    scale([thickness+2, plateSpace*2, plateSpace*2])
    cube(1);
        
    }
    
}

module ConnectorPlate(length, width, height, roundness, armThickness) {
    scale([length- roundness, width, height])
    cube(1);
    translate([length-roundness,roundness,0])
    cylinder(h= height, r = roundness);
    translate([length-roundness,width-roundness,0])
    cylinder(h= height, r = roundness);
    
    translate([length-roundness-1,roundness,0])
    scale([roundness+1, width-2*roundness, height])
    cube(1);
    
    
    
    //to connect to arm
    translate([-1,0,0])
    scale([2,armThickness,height])
    cube(1);
    
    translate([-1,width-armThickness,0])
    scale([2,armThickness,height])
    cube(1);
    
    
    translate([-1,width/2-armThickness,0])
    scale([2,armThickness*2,height])
    cube(1);
}
//platSpace is the vertical space between two layers
module ArmConnector(plateSpace, width, length, holeSize, thickness, height, armHeight, roundness) {
    difference() {
        union() {
            ConnectorPlate(length, width, height, roundness, thickness);
            //names could be improved...
            translate([0,0,1])
            ConnectorHoles(holeSize+thickness*2, width, 0, plateSpace-2, length, 0);
            ConnectorSupport(holeSize, thickness, plateSpace);
            translate([0,width-thickness,0])
            ConnectorSupport(holeSize, thickness, plateSpace);
        }
        
        ConnectorHoles(holeSize, width, thickness, plateSpace, length, 1);
        
        
        
    }
    
}


