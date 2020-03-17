import peasy.*;
PeasyCam cam;
float vx=5,vy=3,vz=2;
PVector pos,temp;

void axes(int len){
  strokeWeight(1);
  stroke(255,0,0);
  line(0,0,0,len,0,0);
  stroke(0,255,0);
  line(0,0,0,0,len,0);
  stroke(0,0,255);
  line(0,0,0,0,0,len);
}

void plane(int len,int a,int b,int c){
  strokeWeight(1);
  //noStroke();
  //beginShape();
  //vertex(len,len,0);
  //vertex(-len,len,0);
  //vertex(-len,-len,0);
  //vertex(len,-len,0);
  //endShape();
  line(0,0,0,a,b,c);
  stroke(255,255,0);
  rotateX(atan(b/c));
  rotateY(-atan(a/sqrt(b*b+c*c)));
  line(0,0,0,a,b,c);
  rotateY(atan(a/sqrt(b*b+c*c)));
  rotateX(-atan(b/c));
}

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
  scale(1,-1);
  background(0);
  stroke(255);
  strokeWeight(1);

  plane(300,100,100,100);  
  axes(500);
  
  //pos.x+=vx;
  //pos.y+=vy;
  //pos.z+=vz;
  //if(pos.x>500 || pos.x<0){vx*=-1;}
  //if(pos.y>500 || pos.y<0){vy*=-1;}
  //if(pos.z>500 || pos.z<0){vz*=-1;}
  
  //strokeWeight(10);
  //stroke(255,255,0);
  //point(pos.x,pos.y,pos.z);
}
