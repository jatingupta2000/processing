import peasy.*;
PeasyCam cam;
PVector[] pt = new PVector[4];
PVector[] temp = new PVector[4];
float s=0;

PVector scaling(PVector temp,float sx,float sy,float sz){
  temp.x*=sx;
  temp.y*=sy;
  temp.z*=sz;
  return temp;
}

void fig(PVector[] temp){
  noStroke();
  beginShape();
  vertex(temp[0].x,temp[0].y,temp[0].z);
  vertex(temp[1].x,temp[1].y,temp[1].z);
  vertex(temp[2].x,temp[2].y,temp[2].z);
  endShape();
  beginShape();
  vertex(temp[1].x,temp[1].y,temp[1].z);
  vertex(temp[2].x,temp[2].y,temp[2].z);
  vertex(temp[3].x,temp[3].y,temp[3].z);
  endShape();
  beginShape();
  vertex(temp[1].x,temp[1].y,temp[1].z);
  vertex(temp[0].x,temp[0].y,temp[0].z);
  vertex(temp[3].x,temp[3].y,temp[3].z);
  endShape();
  beginShape();
  vertex(temp[2].x,temp[2].y,temp[2].z);
  vertex(temp[0].x,temp[0].y,temp[0].z);
  vertex(temp[3].x,temp[3].y,temp[3].z);
  endShape();
}

void setup(){
  s=0;
  //cam=new PeasyCam(this,800);
  size(1000,600,P3D);
  pt[0]=new PVector(50,50,50);
  pt[1]=new PVector(100,50,50);
  pt[2]=new PVector(75,50,75);
  pt[3]=new PVector(50+100/3,100,50+100/3);
}

void draw(){
  for(int i=0;i<4;i++){
    temp[i]=pt[i].copy();
  }
  lights();
  background(0);
  translate(width/4,height);
  scale(1,-1);
  for(int i=0;i<4;i++){
    temp[i]=scaling(temp[i],s,s,s);
  }
  fig(temp);
  strokeWeight(1);
  for(int i=0;i<4;i++){
    for(int j=i+1;j<4;j++){
      line(temp[i].x,temp[i].y,temp[i].z,temp[j].x,temp[j].y,temp[j].z);
    }
  }
  s=(s+0.01)%4;
}
