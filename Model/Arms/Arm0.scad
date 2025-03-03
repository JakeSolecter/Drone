$fa = 1;
$fs = 0.01;


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

module engineMount(radius, height, thickness, middleHoleRadius) {
    difference() {
        cylinder(h=height, r=radius);
        translate([0,0,thickness])
        cylinder(h=height, r=(radius-thickness));
        translate([0,0,-1])
        cylinder(h= height+2, r=middleHoleRadius);
    }
    
    
}

module armBeam(length,height, width, thickness, numCrosses) {
    armSides(length,height, width, thickness);
    for (i = [0:numCrosses-1])
        translate([length/numCrosses*i,0,0])
        cross(length/numCrosses, height*0.85, width, thickness);
    
    
    difference() {
        translate([0,width/2-thickness,0])
        beam(length-thickness, height, thickness*2);  
        
    }
}

module leg(length, height, thickness, legHeight, mountRadius, hOffset) {
    
   translate([-height,0,0])
   beam(height, height*1.5, 2*thickness);
    //foot
   translate([-hOffset-length,0,legHeight])
    beam(length,height,2*thickness);
    
    //outer connection
   translate([0,0,1.5*height])
    rotate([0,-atan(hOffset/(legHeight-height*1.5+height)),0])
    translate([-height,0,0])
    beam(height,sqrt(hOffset*hOffset + (legHeight-height*0.5)*(legHeight-height*0.5)),thickness*2);
    
    //inner connection
    translate([-hOffset-length*2,0,height])
    rotate([0,90-atan((legHeight)/length),0])
    beam(height, sqrt(pow(legHeight,2)+pow(length,2)) ,thickness*2);
    
}

module arm(length, height, width, thickness, engineRadius, engineHoleRadius, legHeight, legOffset) {
    armBeam(length,height,width,thickness, round(length/width+0.499));
    
    
    
    translate([length-thickness+engineRadius,width/2,0])
    engineMount(engineRadius+thickness, height*1.5, thickness, engineHoleRadius);
    
    translate([length+engineRadius*2,width/2-thickness,0])
    leg(length/5, height, thickness,legHeight, engineRadius+thickness, legOffset);
    
}


arm(7, 0.35, 1 , 0.1, 0.75, 0.125, 2.5, 0.5);

