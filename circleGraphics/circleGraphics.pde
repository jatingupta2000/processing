//  Roundoff the number
int roundoff(float num){
  float dec = num-(int)num;
  if(dec>=0.5){
    return (int)num+1;
  }
  else{
    return (int)num;
  }
}

//  Circle by increasing x by one pixel
void CircleX(int cx,int cy,int r){
  noFill();
  stroke(255,255,0);
  strokeWeight(5);
  point(cx,cy);
  strokeWeight(1);
  circle(cx,cy,15);
  stroke(255);
  translate(cx,cy);
  float temp_y;
  for(int x=-r;x<=r;x++){
    temp_y=sqrt(r*r-x*x);
    point(x,roundoff(temp_y));
    point(x,-1*roundoff(temp_y));
  }
  translate(-cx,-cy);
}

//  Circle by increasing y by one pixel
void CircleY(int cx,int cy,int r){
  noFill();
  stroke(255,255,0);
  strokeWeight(5);
  point(cx,cy);
  strokeWeight(1);
  circle(cx,cy,15);
  stroke(255);
  translate(cx,cy);
  float temp_x;
  for(int y=-r;y<=r;y++){
    temp_x=sqrt(r*r-y*y);
    point(roundoff(temp_x),y);
    point(-1*roundoff(temp_x),y);
  }
  translate(-cx,-cy);
}

void setup(){
  size(800,800);
}

void draw(){
  background(0);
  translate(width/2,height/2);
  scale(1,-1);
  
  //  Axes
  strokeWeight(1);
  stroke(0,255,0);
  line(-width/2,0,width/2,0);
  stroke(0,0,255);
  line(0,-width/2,0,width/2);
  
  CircleY(100,300,50);
}
