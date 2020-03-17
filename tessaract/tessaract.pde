PVector[] hC;

float t=0;

void connect(int a,int b){
  line(hC[a].x,hC[a].y,hC[a].z,hC[b].x,hC[b].y,hC[b].z);
}

void setup(){
  size(1080,500,P3D);
  hC=new PVector[16];
  float sz = min(width,height);
  hC[0]=new PVector(sz/8,sz/8,sz/8);hC[1]=new PVector(-sz/8,sz/8,sz/8);
  hC[2]=new PVector(-sz/8,-sz/8,sz/8);hC[3]=new PVector(sz/8,-sz/8,sz/8);
  hC[4]=new PVector(sz/8,sz/8,-sz/8);hC[5]=new PVector(-sz/8,sz/8,-sz/8);
  hC[6]=new PVector(-sz/8,-sz/8,-sz/8);hC[7]=new PVector(sz/8,-sz/8,-sz/8);
  hC[8]=new PVector(2*sz/8,2*sz/8,2*sz/8);hC[9]=new PVector(-2*sz/8,2*sz/8,2*sz/8);
  hC[10]=new PVector(-2*sz/8,-2*sz/8,2*sz/8);hC[11]=new PVector(2*sz/8,-2*sz/8,2*sz/8);
  hC[12]=new PVector(2*sz/8,2*sz/8,-2*sz/8);hC[13]=new PVector(-2*sz/8,2*sz/8,-2*sz/8);
  hC[14]=new PVector(-2*sz/8,-2*sz/8,-2*sz/8);hC[15]=new PVector(2*sz/8,-2*sz/8,-2*sz/8);
}

void draw(){
  background(0);
  translate(width/2,height/2);
  
  rotateY(t);
  
  stroke(255);
  strokeWeight(10);
  for(int i=0;i<16;i++){
    point(hC[i].x,hC[i].y,hC[i].z);
  }
  
  strokeWeight(2);
  connect(0,1);
  connect(1,2);
  connect(2,3);
  connect(0,3);
  
  connect(4,5);
  connect(5,6);
  connect(6,7);
  connect(4,7);
  
  connect(0,4);
  connect(1,5);
  connect(2,6);
  connect(3,7);
  
  connect(8,9);
  connect(9,10);
  connect(10,11);
  connect(11,8);
  
  connect(12,13);
  connect(13,14);
  connect(14,15);
  connect(15,12);
  
  connect(8,12);
  connect(9,13);
  connect(10,14);
  connect(11,15);
  
  connect(0,8);
  connect(1,9);
  connect(2,10);
  connect(3,11);
  
  connect(4,12);
  connect(5,13);
  connect(6,14);
  connect(7,15);

  t+=0.01;
}
