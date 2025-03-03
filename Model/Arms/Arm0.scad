$fa = 1;
$fs = 0.04;


module beam(length,height, thickness) {
    scale([length,thickness,height])
    cube(1);


}



module cross(length, height, width, thickness) {
    difference() {
        translate([0,thickness,0])
        rotate([0,0,atan(width/length)])
        translate([0,-thickness,0])
        beam(sqrt(length*length+width*width), height, thickness);
        translate([0,-thickness,-0.5])
        armSides(length+width,height+1,width+2*thickness,thickness);
    }
    
    difference() {
        translate([0,width-thickness,0])
        rotate([0,0,-atan(width/length)])
        beam(sqrt(length*length+width*width), height, thickness);
        translate([0,-thickness,-0.5])
        armSides(length+width,height+1,width+2*thickness,thickness);
    }
    
}

module armSides(length,height, width, thickness) {
    beam(length, height, thickness);
    translate([0,width-thickness,0])
    beam(length, height, thickness);
    
    
    

    
}

module arm(length,height, width, thickness, numCrosses) {
    armSides(length,height, width, thickness);
    for (i = [0:numCrosses-1])
        translate([length/numCrosses*i,0,0])
        cross(length/numCrosses, height, width, thickness);
    
    
}


arm(10, 0.35, 1 , 0.1, 10);

