PVector[] pt = new PVector[4];
PVector[] temp = new PVector[4];
float f=0;

PVector shearingX(PVector temp,float factor){
  temp.x+=temp.y*factor;
  return temp;
}

PVector shearingY(PVector temp,float factor){
  temp.y+=temp.x*factor;
  return temp;
}

void setup(){
  size(800,600);
  pt[0]=new PVector(0,0);
  pt[1]=new PVector(100,0);
  pt[2]=new PVector(100,100);
  pt[3]=new PVector(0,100);
}

void draw(){
  background(0);
  translate(50,height-50);
  scale(1,-1);
  
  for(int i=0;i<4;i++){
    temp[i]=pt[i].copy();
    temp[i]=shearingX(temp[i],f);
    temp[i]=shearingY(temp[i],f);
  }
  noStroke();
  beginShape();
  vertex(temp[0].x,temp[0].y);
  vertex(temp[1].x,temp[1].y);
  vertex(temp[2].x,temp[2].y);
  vertex(temp[3].x,temp[3].y);
  endShape();
  
  strokeWeight(1);
  stroke(255,0,0);
  line(0,0,0,500);
  stroke(0,255,0);
  line(0,0,500,0);
  f+=0.001;
}
