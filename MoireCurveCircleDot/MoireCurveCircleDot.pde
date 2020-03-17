float ang=0;
int space=10;

void setup(){
 size(400,400);
}

void draw(){
  background(255,155,90);
  stroke(255,20,20);
  strokeWeight(5);
  
  //  Back
  for(int i=space/2;i<width;i+=space){
    for(int j=space/2;j<height;j+=space){
       point(i,j);   
    }
  }
  pushMatrix();
  translate(width/2,height/2);
  rotate(ang);
  //  Transparent
  for(int i=space/2;i<width;i+=space){
    for(int j=space/2;j<height;j+=space){
       point(-width/2+i,-height/2+j);   
    }
  }
  popMatrix();
  ang+=0.001;
}
