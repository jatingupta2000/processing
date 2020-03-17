PImage img;
float factor;

void setup(){
  img=loadImage("image.jpeg");
  size(500,331);
}

void draw(){
  loadPixels();
  background(0);
  //image(img,0,0);
  
  for(int x=0;x<width;x++){
    for(int y=0;y<height;y++){
      float d = dist(x,y,mouseX,mouseY); 
      
      int loc = x + y * width;
      
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      
      factor = map(d,0,200,1,0);
      
      pixels[loc]=color(r*factor,g*factor,b*factor);
    }
  }
  updatePixels();
}
