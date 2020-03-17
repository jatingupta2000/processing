class Blob{
  float x,y,r;
  float speedx = random(10);
  float speedy = random(10);
  Blob(float x,float y){
    this.x=x;
    this.y=y;
    this.r=random(1);
  }
  void update(){
   this.x+=speedx;
   this.y+=speedy;
   if(x<0+this.r || x>width-this.r){
     speedx*=-1;
   }
   if(y<0+this.r || y>height-this.r){
     speedy*=-1;
   }
  }
  void show(){
    noFill();
    noStroke();
    ellipse(this.x,this.y,2*this.r,2*this.r);
  }
}

int size = 5;
Blob[] blobs = new Blob[size];

void setup(){
  size(400,400);
  background(255);
  for(int i=0;i<size;i++){
    blobs[i]=new Blob(random(width),random(height));
  }
  colorMode(HSB);
}

void draw(){
  loadPixels();
  for(int x=0;x<width;x++){
    for(int y=0;y<height;y++){
      int loc = x + y * width;
      float sum=0;
      for(int i=0;i<blobs.length;i++){
        float distance = dist(blobs[i].x,blobs[i].y,x,y);
        sum+=10000*blobs[i].r/distance;
        pixels[loc]=color(sum,255,255);
      }
    }
  } 
  updatePixels();
  for(int i=0;i<blobs.length;i++){
    blobs[i].update();
  }
}
