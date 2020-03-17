  import peasy.*;
  PeasyCam cam;
  
  void setup(){
    size(600,600,P3D);
    cam=new PeasyCam(this,500);
  }
  float t=0;
  float vx=50;
  float vy=120;
  float vz=50;
  float a=-9.8;
  float angle=0;
  void draw(){
     background(0);
     rotateY(angle);
     translate(-width/2,0);
     scale(1,-1);
     fill(120);
     box(20000,2,20000);
     fill(255,0,0);
     stroke(255);
     line(0,0,0,5000,0,0);
     line(0,0,0,0,5000,0);
     line(0,0,0,0,0,5000);
     pushMatrix();
     float x=vx*t;
     float z=vz*t;
     float y=vy*t+0.5*a*t*t;
     translate(x,y,z);
     stroke(255,0,0);
     sphere(40);
     popMatrix();
     stroke(255,0,0);
     line(0,5,0,x,5,z);
     stroke(0,255,0);
     line(x,5,0,x,5,z);
     stroke(0,0,255);
     line(0,5,z,x,5,z);
     stroke(255,255,0);
     line(x,y,z,x,5,z);
     t+=0.1;
     if(t>=2*vy/abs(a)){
       t=0;
     }
  }
