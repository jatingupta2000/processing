import peasy.*;

Particle[] par;

int N = 50;
int rng=50;
float pre=1700;

float speed=1;
PeasyCam cam;

class Particle{
  float x,y,z,r,t;
  Particle(float r,float t){
    this.r=r;
    this.t=t;
    this.x=r*cos(t);
    this.y=0;
    this.z=r*sin(t);
  }
  void update(){
    if(this.y<-500){
       this.y=0;
       this.r=pre;
    }
    this.r-=speed;
    this.x=r*cos(t);
    this.z=r*sin(t);
  }
}

void setup(){
  cam=new PeasyCam(this,800);
  size(800,800,P3D);
  par=new Particle[N*rng];
  for(int i=0;i<N*rng;i++){
    float temp_r=map(i/N,0,rng,0,pre);
    float temp_t=map((i-(int)(i/N)*N),0,N,0,TWO_PI);
    par[i]=new Particle(temp_r,temp_t);
  }
}

void draw(){
  background(0);
  scale(1,-1);
 
  translate(0,-height/2);
  stroke(255,255,0);
  strokeWeight(5);
  
  for(int i=0;i<N*rng;i++){   
      strokeWeight(10);
      par[i].y=50*log((par[i].x/100)*(par[i].x/100)+(par[i].z/100)*(par[i].z/100));
      point(par[i].x,par[i].y,par[i].z);
      par[i].update();
  }
}
