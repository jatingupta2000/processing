import peasy.*;
PeasyCam cam;

PVector pt[]=new PVector[5];
float ang=PI/6;
ArrayList a[]=new ArrayList[5];
PVector Origin=new PVector(0,0,0);
PVector X=new PVector(300,0,0);
PVector Y=new PVector(0,300,0);
PVector Z=new PVector(0,0,300);

PVector project(PVector temp,float ang){
  temp.x=temp.x+temp.z*cos(0)/tan(ang);
  temp.y=temp.y+temp.z*sin(0)/tan(ang);
  return temp;
}

void setup(){
  size(800,600,P3D);
  cam=new PeasyCam(this,800);
   pt[0]=new PVector(50,50,150);
   pt[1]=new PVector(150,50,150);
   pt[2]=new PVector(150,50,250);
   pt[3]=new PVector(50,50,250);
   pt[4]=new PVector(100,200,200);
   for(int i=0;i<5;i++){
     a[i]=new ArrayList();
   }
   a[0].add(1);a[0].add(1);a[0].add(0);a[0].add(1);a[0].add(1);
   a[1].add(0);a[1].add(1);a[1].add(1);a[1].add(0);a[1].add(1);
   a[2].add(0);a[2].add(0);a[2].add(1);a[2].add(1);a[2].add(1);
   a[3].add(0);a[3].add(0);a[3].add(0);a[3].add(1);a[3].add(1);
   a[4].add(0);a[4].add(0);a[4].add(0);a[4].add(0);a[4].add(1);
}

void draw(){
  lights();
  translate(width/2,height/2);
  scale(1,-1);
  background(0);
  noStroke();
  beginShape();
  vertex(pt[0].x,pt[0].y,pt[0].z);
  vertex(pt[1].x,pt[1].y,pt[1].z);
  vertex(pt[2].x,pt[2].y,pt[2].z);
  vertex(pt[3].x,pt[3].y,pt[3].z);
  endShape();
  beginShape();
  vertex(pt[0].x,pt[0].y,pt[0].z);
  vertex(pt[1].x,pt[1].y,pt[1].z);
  vertex(pt[4].x,pt[4].y,pt[4].z);
  endShape();
  beginShape();
  vertex(pt[1].x,pt[1].y,pt[1].z);
  vertex(pt[2].x,pt[2].y,pt[2].z);
  vertex(pt[4].x,pt[4].y,pt[4].z);
  endShape();
  beginShape();
  vertex(pt[2].x,pt[2].y,pt[2].z);
  vertex(pt[3].x,pt[3].y,pt[3].z);
  vertex(pt[4].x,pt[4].y,pt[4].z);
  endShape();
  beginShape();
  vertex(pt[0].x,pt[0].y,pt[0].z);
  vertex(pt[3].x,pt[3].y,pt[3].z);
  vertex(pt[4].x,pt[4].y,pt[4].z);
  endShape();
  beginShape();
  vertex(-1000,0,0);
  vertex(1000,0,0);
  vertex(1000,1000,0);
  vertex(-1000,1000,0);
  endShape();
  stroke(100);
  PVector temp = new PVector();
  PVector temp2 = new PVector();
  for(int i=0;i<5;i++){
    strokeWeight(5);
    temp=pt[i].copy();
    temp=project(temp,ang);
    point(temp.x,temp.y,0);
    strokeWeight(1);
    line(temp.x,temp.y,0,pt[i].x,pt[i].y,pt[i].z);
    for(int j=i;j<5;j++){
      if((int)a[i].get(j)==1){
        temp2=pt[j].copy();
        temp2=project(temp2,ang);
        strokeWeight(1);
        line(temp.x,temp.y,0,temp2.x,temp2.y,0);
      }
    }
  }
  temp=Origin.copy();
  temp=project(temp,ang);
  temp2=X.copy();
  temp2=project(temp2,ang);
  stroke(255,0,0);
  line(temp.x,temp.y,temp2.x,temp2.y);
  temp2=Y.copy();
  temp2=project(temp2,ang);
  stroke(0,255,0);
  line(temp.x,temp.y,temp2.x,temp2.y);
  ang+=0.01;
}
