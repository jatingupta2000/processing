import peasy.*;
PeasyCam cam;
float vx=5,vy=3,vz=2;
PVector pos,temp;

PVector refXY(PVector temp){
  temp.z*=-1;
  return temp;
}
PVector refYZ(PVector temp){
  temp.x*=-1;
  return temp;
}
PVector refZX(PVector temp){
  temp.y*=-1;
  return temp;
}

void setup(){
  cam=new PeasyCam(this,800);
  size(800,600,P3D);
  pos=new PVector(10,10,10);
}

void draw(){
  lights();
  background(0);
  stroke(255);
  strokeWeight(1);
  beginShape();
  vertex(0,0,0);
  vertex(0,500,0);
  vertex(0,500,500);
  vertex(0,0,500);
  endShape();
  beginShape();
  vertex(0,0,0);
  vertex(500,0,0);
  vertex(500,0,500);
  vertex(0,0,500);
  endShape();
  beginShape();
  vertex(0,0,0);
  vertex(500,0,0);
  vertex(500,500,0);
  vertex(0,500,0);
  endShape();
  
  pos.x+=vx;
  pos.y+=vy;
  pos.z+=vz;
  if(pos.x>500 || pos.x<0){vx*=-1;}
  if(pos.y>500 || pos.y<0){vy*=-1;}
  if(pos.z>500 || pos.z<0){vz*=-1;}
  
  strokeWeight(10);
  stroke(255,255,0);
  point(pos.x,pos.y,pos.z);
  stroke(255,0,0);
  temp=pos.copy();
  temp=refXY(temp);
  point(temp.x,temp.y,temp.z);
  stroke(0,255,0);
  temp=pos.copy();
  temp=refYZ(temp);
  point(temp.x,temp.y,temp.z);
  stroke(0,0,255);
  temp=pos.copy();
  temp=refZX(temp);
  point(temp.x,temp.y,temp.z);
}
