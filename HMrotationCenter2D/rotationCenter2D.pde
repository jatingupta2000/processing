float w=0.01;

PVector vertex[]=new PVector[4]; 
PVector v1=new PVector(100,100);
PVector v2=new PVector(-100,100);
PVector v3=new PVector(-100,-100);
PVector v4=new PVector(100,-100);
PVector center=new PVector(400,400);

PVector rotateOrigin(PVector v,float angle){
  PVector temp=new PVector(0,0);
  temp.x=v.x*cos(angle)-v.y*sin(angle);
  temp.y=v.x*sin(angle)+v.y*cos(angle);
  return temp;
}

void setup(){
  size(800,800);
  vertex[0]=v1;
  vertex[1]=v2;
  vertex[2]=v3;
  vertex[3]=v4;
}

void draw(){
  background(0);
  stroke(255);
  strokeWeight(1);
  line(0,400,800,400);
  line(400,0,400,800);
  noFill();
  stroke(255,255,0);
  for(int i=0;i<4;i++){
    vertex[i]=rotateOrigin(vertex[i],w);
  }
  strokeWeight(8);
  for(int i=0;i<4;i++){
    point(center.x+vertex[i].x,center.y+vertex[i].y);
  }
  strokeWeight(1);
  beginShape();
  for(int i=0;i<4;i++){
    vertex(center.x+vertex[i].x,center.y+vertex[i].y);
  }
  endShape(CLOSE);
}
