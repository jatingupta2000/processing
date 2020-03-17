float max_w=1.5;
float max_r=200;
float min_r=20;
float t=0;
int parts=15;

class Particle{
  float x;
  float y;
  float r;
  float w;
  
  Particle(float r,float w){
    this.r=r;
    this.w=w;
    this.x=r*cos(w*t);
    this.y=r*sin(w*t);
  }
  
  void update(){
    if((int)(this.w*t/TWO_PI)%2==0){
      this.w=abs(this.w);
      arc(0,0,2*this.r,2*this.r,0,abs(this.w*t)-(int)(abs(this.w*t)/TWO_PI)*TWO_PI);
    }
    else{
      this.w=abs(this.w)*-1;
      arc(0,0,2*this.r,2*this.r,0,TWO_PI-abs(this.w*t)+(int)(abs(this.w*t)/TWO_PI)*TWO_PI);
    }
    this.x=this.r*cos(this.w*t);
    this.y=this.r*sin(this.w*t);
  }
}
Particle[] par;

void setup(){
  size(600,600);
  par=new Particle[parts];
  for(int i=0;i<parts;i++){
    float temp_r=map(i,0,parts,min_r,max_r);
    float temp_w=map(i,0,parts,max_w,TWO_PI+max_w);
    par[i]=new Particle(temp_r,temp_w);
  }
}

void draw(){
  background(0);
  translate(width/2,height/2);
  scale(1,-1);
  
  for(int i=0;i<parts;i++){
    stroke(255);
    strokeWeight(10);
    point(par[i].x,par[i].y);
    strokeWeight(1);
    noFill();
    par[i].update();
    stroke(255,255,0);
    strokeWeight(2);
    line(0,-250,300,-250);
    line(i*20,-250+0,i*20,-250+10*par[i].w);
    line(i*20,-250+0,i*20,-250+10*par[i].w);
  }
  t+=0.02;  
}
