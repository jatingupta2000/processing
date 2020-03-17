float ang=0;
int space=10;
int N=1000;
PVector[] points;

void setup(){
 size(400,400);
 points=new PVector[N];
 for(int i=0;i<N;i++){
   points[i]=new PVector(random(width),random(height));
 }
}

void draw(){
  background(255,155,90);
  stroke(255,20,20);
  strokeWeight(5);
  
  //  Back
  for(int i=0;i<N;i++){
   point(points[i].x,points[i].y);
  }
  pushMatrix();
  translate(width/2,height/2);
  rotate(ang);
  //  Transparent
  for(int i=0;i<N;i++){
   point(-width/2+points[i].x,-height/2+points[i].y);
  }
  popMatrix();
  ang+=0.001;
}
