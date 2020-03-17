import peasy.*;

int number = 50;
int time=0;
float wide = 20;
float amp =200;
float dist;
float high;
float clr;
PeasyCam cam;

class box{
  float w,h,d,x,y,z;
  box(float x,float y,float z){
    this.x=x;
    this.y=y;
    this.z=z;
  }
  void show(float w,float h,float d){
    this.w=w;
    this.h=h;
    this.d=d;
    pushMatrix();
    translate(this.x,this.y,this.z);
    box(w,h,d);
    popMatrix();
  }
}

void setup(){
  cam = new PeasyCam(this,600);
  size(600,600,P3D);
  colorMode(HSB);
}

void draw(){
  background(0);
  translate(0,height/4);
  stroke(0);
  for(int x=0;x<number;x++){
    for(int y=0;y<number;y++){
      box b1 = new box((x-number/2)*1.05*wide,0,(y-number/2)*1.05*wide);
      dist = dist(x,y,number/2,number/2);
      high = amp*sin((dist+time)*TWO_PI/number);
      clr = map(high,-amp,amp,128,0);
      fill(clr,255,255);
      b1.show(wide,-250+high,wide);
    }
  }
  frameRate(1);
  time++;
}
