float vx=5,vy=8;
PVector axis=new PVector(200,200);
PVector center=new PVector(400,400);
PVector pos;

PVector translation(PVector v){
  PVector temp=new PVector(0,0);
  if(v.x>=800 || v.x<=0){
    vx*=-1;
  }
  if(v.y>=800 || v.y<=0){
    vy*=-1;
  }
  temp.x=v.x+vx;
  temp.y=v.y+vy;
  return temp;
}

void setup(){
  size(800,800);
  pos=new PVector(100,100);
}

void draw(){
  background(0);
  stroke(255);
  strokeWeight(1);
  line(0,400,800,400);
  line(400,0,400,800);
  strokeWeight(10);
  stroke(0,255,255);
  pos=translation(pos);
  point(pos.x,pos.y);
}
