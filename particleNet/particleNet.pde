int N = 25;
float dtn=200;
Particle[] points;

class Particle{
  float x,y;
  float velX=random(2);
  float velY=random(2);
  
  Particle(float x,float y){
    this.x=x;
    this.y=y;
  }
  
  void update(){
    this.x+=velX;
    this.y+=velY;
    if(this.x>width || this.x<0){
      velX*=-1;
    }
    if(this.y>height || this.y<0){
      velY*=-1;
    }
    this.x+=velX;
    this.y+=velY;
  }
  void upPos(){
    this.x=mouseX;
    this.y=mouseY;
  }
}

void setup(){
  size(1080,500);
  points=new Particle[N];
  for(int i=0;i<N-1;i++){
    points[i]=new Particle(random(width),random(height));
  }
  points[N-1]=new Particle(mouseX,mouseY);
}

void draw(){
  background(0);
  stroke(255);
  strokeWeight(8);
  for(int i=0;i<N-1;i++){
    point(points[i].x,points[i].y);
    points[i].update();
  }
  point(points[N-1].x,points[N-1].y);
  points[N-1].upPos();
  
  strokeWeight(1);
  for(int i=0;i<N;i++){
    for(int j=0;j<N;j++){
       if(dist(points[i].x,points[i].y,points[j].x,points[j].y)<dtn){
         line(points[i].x,points[i].y,points[j].x,points[j].y);
       }   
    }
  }
}
