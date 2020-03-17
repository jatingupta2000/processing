import peasy.*;
float a=1;
PeasyCam cam;
PVector[] pt=new PVector[8];
PVector[] t=new PVector[8];
PVector r=new PVector(a,0,-800);

void conn(PVector[] temp,int a,int b){
  line(temp[a].x,temp[a].y,temp[a].z,temp[b].x,temp[b].y,temp[b].z);
}

void connect(PVector[] temp){
  strokeWeight(1);
  stroke(100,0,0);
  conn(temp,0,1);conn(temp,1,2);conn(temp,2,3);conn(temp,3,0);
  conn(temp,4,5);conn(temp,5,6);conn(temp,6,7);conn(temp,7,4);
  conn(temp,0,4);conn(temp,1,5);conn(temp,2,6);conn(temp,3,7);
}

PVector persp(PVector temp){
  float f=(r.x-temp.x)/(r.z-temp.z);
  temp.x=temp.x-f*temp.z;
  f=(r.y-temp.y)/(r.z-temp.z);
  temp.y=temp.y-f*temp.z;
  temp.z=0;
  return temp;
}

void cube(PVector[] temp){
  stroke(0);
  strokeWeight(1);
  beginShape();
  vertex(temp[0].x,temp[0].y,temp[0].z);
  vertex(temp[1].x,temp[1].y,temp[1].z);
  vertex(temp[2].x,temp[2].y,temp[2].z);
  vertex(temp[3].x,temp[3].y,temp[3].z);
  endShape();
  beginShape();
  vertex(temp[4].x,temp[4].y,temp[4].z);
  vertex(temp[5].x,temp[5].y,temp[5].z);
  vertex(temp[6].x,temp[6].y,temp[6].z);
  vertex(temp[7].x,temp[7].y,temp[7].z);
  endShape();
  beginShape();
  vertex(temp[2].x,temp[2].y,temp[2].z);
  vertex(temp[3].x,temp[3].y,temp[3].z);
  vertex(temp[7].x,temp[7].y,temp[7].z);
  vertex(temp[6].x,temp[6].y,temp[6].z);
  endShape();
  beginShape();
  vertex(temp[0].x,temp[0].y,temp[0].z);
  vertex(temp[1].x,temp[1].y,temp[1].z);
  vertex(temp[5].x,temp[5].y,temp[5].z);
  vertex(temp[4].x,temp[4].y,temp[4].z);
  endShape();
  beginShape();
  vertex(temp[0].x,temp[0].y,temp[0].z);
  vertex(temp[4].x,temp[4].y,temp[4].z);
  vertex(temp[7].x,temp[7].y,temp[7].z);
  vertex(temp[3].x,temp[3].y,temp[3].z);
  endShape();
  beginShape();
  vertex(temp[1].x,temp[1].y,temp[1].z);
  vertex(temp[5].x,temp[5].y,temp[5].z);
  vertex(temp[6].x,temp[6].y,temp[6].z);
  vertex(temp[2].x,temp[2].y,temp[2].z);
  endShape();
}

void setup(){
  cam=new PeasyCam(this,1800);
  size(800,600,P3D);
  pt[0]=new PVector(-100,100,500);
  pt[1]=new PVector(-100,-100,500);
  pt[2]=new PVector(100,-100,500);
  pt[3]=new PVector(100,100,500);
  pt[4]=new PVector(-100,100,700);
  pt[5]=new PVector(-100,-100,700);
  pt[6]=new PVector(100,-100,700);
  pt[7]=new PVector(100,100,700);
}

void draw(){
  r.x=a;
  r.y=a;
  lights();
  background(0);
  strokeWeight(5);
  stroke(255,255,0);
  point(r.x,r.y,r.z);
  cube(pt);
  
  PVector temp;
  strokeWeight(5);
  for(int i=0;i<8;i++){
    temp=pt[i].copy();
    temp=persp(temp);
    t[i]=temp.copy();
    stroke(0,0,0);
    strokeWeight(1);
    line(pt[i].x,pt[i].y,pt[i].z,r.x,r.y,r.z);
    point(temp.x,temp.y,temp.z);
  }
  connect(t);
  
  noStroke();
  beginShape();
  vertex(-1000,-1000,0);
  vertex(-1000,1000,0);
  vertex(1000,1000,0);
  vertex(1000,-1000,0);
  endShape();
  strokeWeight(1);
  stroke(255,0,0);
  line(-1000,0,0,1000,0,0);
  stroke(0,255,0);
  line(0,-1000,0,0,1000,0);
  a-=1;
}
