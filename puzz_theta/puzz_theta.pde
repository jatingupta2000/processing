float max_w=0.05;
float max_r=200;
float min_r=20;
int parts=15;

class Particle{
  float x;
  float y;
  float r;
  float t;
  float w;
  
  Particle(float r,float t,float w){
    this.r=r;
    this.w=w;
    this.t=t;
    this.x=r*cos(t);
    this.y=r*sin(t);
  }
  
  void update(){
    if(this.t<0 || this.w>0){
      this.w=abs(this.w);
      arc(0,0,2*this.r,2*this.r,0,abs(this.t)-(int)(abs(this.t)/TWO_PI)*TWO_PI);
    }
    if(this.w<0 || this.t>TWO_PI){
      this.w=abs(this.w)*-1;
      arc(0,0,2*this.r,2*this.r,0,abs(this.t)-(int)(abs(this.t)/TWO_PI)*TWO_PI);
    }
    this.t+=this.w;
    this.x=this.r*cos(this.t);
    this.y=this.r*sin(this.t);
  }
}
Particle[] par;

void setup(){
  size(600,600);
  par=new Particle[parts];
  for(int i=0;i<parts;i++){
    float temp_r=map(i,0,parts,min_r,max_r);
    float temp_t=map(i,0,parts,0,PI);
    par[i]=new Particle(temp_r,temp_t,max_w);
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
    line(i*20,-250+0,i*20,-250+300*par[i].w);
    //line(i*20,-250+0,i*20,-250+10*par[i].w);
  }  
}
