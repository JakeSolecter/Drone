$fa = 1;
$fs = 0.04;


module beam(length,height, thickness) {
    scale([length,thickness,height])
    cube(1);


}

module cross(length, height, width, thickness) {
    rotate([0,0,atan(width/length)])
    beam(sqrt(length*length+width*width), height, thickness);
    
}

module armSides(length,height, width, thickness) {
    beam(length, height, thickness);
    translate([0,width-thickness,0])
    beam(length, height, thickness);
    
}

armSides(10, 1, 3 ,0.4);

cross(3,1,3, 0.4);