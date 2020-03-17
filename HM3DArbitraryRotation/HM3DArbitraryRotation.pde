import peasy.*;
PVector l,u;
PVector[] pt = new PVector[8];
PVector[] tpt = new PVector[8];
ArrayList[] conn = new ArrayList[8];
float ang=0;
PeasyCam cam;

void con(PVector[] p,int a,int b){
  line(p[a].x,p[a].y,p[a].z,p[b].x,p[b].y,p[b].z);
}

PVector trans(PVector temp,float tx,float ty,float tz){
  temp.x+=tx;
  temp.y+=ty;
  temp.z+=tz;
  return temp;
}

PVector rotX(PVector temp,float ang){
  PVector t=new PVector();
  t.x=temp.x;
  t.y=temp.y*cos(ang)-temp.z*sin(ang);
  t.z=temp.y*sin(ang)+temp.z*cos(ang);
  return t;
}

PVector rotY(PVector temp,float ang){
  PVector t=new PVector();
  t.x=temp.x*cos(ang)+temp.z*sin(ang);
  t.y=temp.y;
  t.z=-temp.x*sin(ang)+temp.z*cos(ang);
  return t;
}

PVector rotZ(PVector temp,float ang){
  PVector t=new PVector();
  t.x=temp.x*cos(ang)-temp.y*sin(ang);
  t.y=temp.x*sin(ang)+temp.y*cos(ang);
  t.z=temp.z;
  return t;
}

void plotCube(PVector[] p,int clr){
  //  Cube Plot
  stroke(clr);
 strokeWeight(1);
 con(p,0,1);con(p,0,3);con(p,0,4);
 con(p,1,2);con(p,1,5);
 con(p,2,3);con(p,2,6);
 con(p,3,0);con(p,3,7);
 con(p,4,5);con(p,6,5);con(p,6,7);con(p,4,7);
}

void setup(){
  cam=new PeasyCam(this,800);
  size(800,600,P3D);
  l=new PVector(100,100,100);
  u=new PVector(200,200,200);
  pt[0]=new PVector(100,100,100);
  pt[1]=new PVector(200,100,100);
  pt[2]=new PVector(200,200,100);
  pt[3]=new PVector(100,200,100);
  pt[4]=new PVector(100,100,200);
  pt[5]=new PVector(200,100,200);
  pt[6]=new PVector(200,200,200);
  pt[7]=new PVector(100,200,200);
  for(int i=0;i<8;i++){
    conn[i]=new ArrayList();
  }
}

void draw(){
  background(0);
  scale(1,-1,1);
 for(int i=0;i<8;i++){
    tpt[i]=pt[i].copy();
  }
  
 for(int i=0;i<8;i++){
    tpt[i]=trans(tpt[i],-l.x,-l.y,-l.z);                         //  Negative Translation
    tpt[i]=rotX(tpt[i],atan(u.y/u.z));                           //  Positive X  Rotation
    tpt[i]=rotY(tpt[i],-atan(u.x/sqrt(u.y*u.y+u.z*u.z)));        //  Negative Y Rotation
    tpt[i]=rotZ(tpt[i],ang);                                     //  Z Rotation
    tpt[i]=rotY(tpt[i],atan(u.x/sqrt(u.y*u.y+u.z*u.z)));         //  Positive Y Rotation
    tpt[i]=rotX(tpt[i],-atan(u.y/u.z));                          //  Negative X  Rotation
    tpt[i]=trans(tpt[i],l.x,l.y,l.z);                            //  Positive Translation
  }
  plotCube(tpt,255);
  lights();
  beginShape();
  for(int i=0;i<4;i++){
    vertex(tpt[i].x,tpt[i].y,tpt[i].z);
  }
  endShape();
  beginShape();
  for(int i=0;i<4;i++){
    vertex(tpt[i+4].x,tpt[i+4].y,tpt[i+4].z);
  }
  endShape();
 beginShape();
 vertex(tpt[0].x,tpt[0].y,tpt[0].z);
 vertex(tpt[1].x,tpt[1].y,tpt[1].z);
 vertex(tpt[5].x,tpt[5].y,tpt[5].z);
 vertex(tpt[4].x,tpt[4].y,tpt[4].z);
 endShape();
 beginShape();
 vertex(tpt[2].x,tpt[2].y,tpt[2].z);
 vertex(tpt[3].x,tpt[3].y,tpt[3].z);
 vertex(tpt[7].x,tpt[7].y,tpt[7].z);
 vertex(tpt[6].x,tpt[6].y,tpt[6].z);
 endShape();
 beginShape();
 vertex(tpt[3].x,tpt[3].y,tpt[3].z);
 vertex(tpt[7].x,tpt[7].y,tpt[7].z);
 vertex(tpt[4].x,tpt[4].y,tpt[4].z);
 vertex(tpt[0].x,tpt[0].y,tpt[0].z);
 endShape();
 beginShape();
 vertex(tpt[5].x,tpt[5].y,tpt[5].z);
 vertex(tpt[6].x,tpt[6].y,tpt[6].z);
 vertex(tpt[2].x,tpt[2].y,tpt[2].z);
 vertex(tpt[1].x,tpt[1].y,tpt[1].z);
 endShape();
 
 stroke(255,0,0);
 line(-width/2,0,0,width/2,0,0);
 stroke(0,255,0);
 line(0,-width/2,0,0,width/2,0);
 stroke(0,0,255);
 line(0,0,-width/2,0,0,width/2);
 stroke(255,255,0);
 line(0,0,0,400,400,400);
 ang+=0.1;
}
