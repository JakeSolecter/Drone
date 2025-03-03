$fa = 1;
$fs = 0.04;


module armPart(Isize,thickness=0.5,loss=0.1,ratio) {

width=1.0*Isize;
height=ratio*Isize;


//upper beam
rotate([90,0,0]) 
cylinder(h=width,r=thickness, center = true);
    


//lower beam
translate([0,0,-height+height*loss/2])
rotate([90+atan((height*loss)/width),0,0])
    
    cylinder(h=sqrt(width*width+height*loss*height*loss),r=thickness, center = true);

//small vertical beam
translate([0,width/2-thickness,-height/2+(height/2)*loss])
cylinder(h=height*(1-loss),r=thickness,center=true);
    
//large vertical beam
translate([0,-width/2+thickness,-height/2])
cylinder(h=height,r=thickness,center=true);


translate([0,0,-height/2])
rotate([90+atan(height/width),0,0])
cylinder(h=sqrt(width*width+height*height),r=thickness, center = true);

   
}






module armSide(numIntersections,loss=0.1,Isize=1,thickness=0.5,ratio) {
    
    translate([0,Isize/2,0]) {
    

    for(i=[0:numIntersections-1]) {
        
        translate([0,
        
        
        
        (Isize/2)*(1-pow(1-loss,i))/(1-(1-loss))
        +(Isize/2)*(1-pow(1-loss,i+1))/(1-(1-loss))
        -Isize/2-thickness*i*2
        
        ,0])
        
        
        
        
        armPart(Isize*pow(1-loss,i),thickness,loss,ratio);
    }
    
}
    
}


module armPlatUp(numIntersections, width, loss, Isize, thickness) {
    
    
    for(i=[0:numIntersections]) {
        
        translate([0,
        
        
        
        (Isize)*(1-pow(1-loss,i))/(1-(1-loss))
        //+(Isize/2)*(1-pow(1-loss,i+1))/(1-(1-loss))
        //-Isize/2-thickness*i*2
        -thickness*i*2
        
        ,0])
        
        
        translate([0,thickness,0            ])
        rotate([0,90,0])
        cylinder(h=width,r=thickness, center = true);
    }
}

module armPlatDown(numIntersections, width, loss, Isize, thickness, ratio) {
    
    
    for(i=[0:numIntersections]) {
        
        translate([0,
        
        
        
        (Isize)*(1-pow(1-loss,i))/(1-(1-loss))
        //+(Isize/2)*(1-pow(1-loss,i+1))/(1-(1-loss))
        //-Isize/2-thickness*i*2
        -thickness*i*2
        
        ,-ratio*Isize*pow(1-loss,i)])
        
        
        translate([0,thickness,0            ])
        rotate([0,90,0])
        cylinder(h=width,r=thickness, center = true);
    }
}

module arm(numIntersections,width,loss,Isize,thickness,ratio=0.4) {
    
    translate([width/2,0,0])
    armSide(numIntersections,loss,Isize,thickness,ratio);
    translate([-width/2,0,0])
    armSide(numIntersections,loss,Isize,thickness,ratio);
    armPlatUp(numIntersections,width,loss,Isize,thickness);
    armPlatDown(numIntersections,width,loss,Isize,thickness,ratio);

    
    
    
}
    
arm(10,0.75,0.1,1.5,0.1,0.8);

    

    
