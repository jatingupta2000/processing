import peasy.*;
PeasyCam cam;
PVector[] pt = new PVector[8];
PVector[] temp = new PVector[8];
float f=0;

PVector shearingYZ(PVector temp,float factor){
  temp.x+=temp.y*factor;
  return temp;
}

PVector shearingXZ(PVector temp,float factor){
  temp.y+=temp.z*factor;
  return temp;
}

PVector shearingXY(PVector temp,float factor){
  temp.z+=temp.x*factor;
  return temp;
}

void fig(PVector[] temp){
  noStroke();
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
  vertex(temp[0].x,temp[0].y,temp[0].z);
  vertex(temp[1].x,temp[1].y,temp[1].z);
  vertex(temp[5].x,temp[5].y,temp[5].z);
  vertex(temp[4].x,temp[4].y,temp[4].z);
  endShape();
  beginShape();
  vertex(temp[0].x,temp[0].y,temp[0].z);
  vertex(temp[3].x,temp[3].y,temp[3].z);
  vertex(temp[7].x,temp[7].y,temp[7].z);
  vertex(temp[4].x,temp[4].y,temp[4].z);
  endShape();
  beginShape();
  vertex(temp[1].x,temp[1].y,temp[1].z);
  vertex(temp[2].x,temp[2].y,temp[2].z);
  vertex(temp[6].x,temp[6].y,temp[6].z);
  vertex(temp[5].x,temp[5].y,temp[5].z);
  endShape();
  beginShape();
  vertex(temp[2].x,temp[2].y,temp[2].z);
  vertex(temp[6].x,temp[6].y,temp[6].z);
  vertex(temp[7].x,temp[7].y,temp[7].z);
  vertex(temp[3].x,temp[3].y,temp[3].z);
  endShape();
}

void setup(){
  cam = new PeasyCam(this,800); 
  size(800,600,P3D);
  pt[0] = new PVector(0,0,0);
  pt[1] = new PVector(0,0,100);
  pt[2] = new PVector(0,100,100);
  pt[3] = new PVector(0,100,0);
  pt[4] = new PVector(100,0,0);
  pt[5] = new PVector(100,0,100);
  pt[6] = new PVector(100,100,100);
  pt[7] = new PVector(100,100,0);
  for(int i=0;i<8;i++){
    temp[i]=pt[i].copy();
  }
}

void draw(){
  background(0);
  scale(1,-1);
  lights();
  for(int i=0;i<8;i++){
    temp[i]=shearingYZ(temp[i],f);
    temp[i]=shearingXZ(temp[i],f);
    temp[i]=shearingXY(temp[i],f);
  }
  fig(temp);
  strokeWeight(1);
  stroke(255,0,0);
  line(0,0,0,width,0,0);
  stroke(0,255,0);
  line(0,0,0,0,width,0);
  stroke(0,0,255);
  line(0,0,0,0,0,width);
  line(width,width,width,0,0,0);
  
  if(f>0.0005){f+=0;}
  else{f+=0.000001;}
}
