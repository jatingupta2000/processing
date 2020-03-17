import peasy.*;

float t=0;
PVector[][] plane;
int N = 50;
PeasyCam cam;

void setup(){
  cam=new PeasyCam(this,800);
  size(800,800,P3D);
  plane=new PVector[N][N];
  for(int i=0;i<N;i++){
    float temp_x=map(i,0,N,-5*N,5*N);
    for(int j=0;j<N;j++){
      float temp_z=map(j,0,N,-5*N,5*N);
      plane[i][j]=new PVector(temp_x,0,temp_z);
    }
  }
  colorMode(RGB);
}

void draw(){
  background(0);
  scale(1,-1);
 
  translate(0,-height/2);
  rotateX(PI/4);
  stroke(255);
  strokeWeight(5);
  
  for(int i=0;i<N;i++){
    for(int j=0;j<N;j++){
      
      strokeWeight(10);
        plane[i][j].y=50*sin((dist(plane[i][j].x/100,plane[i][j].z/100,0,0)+t)*4);
        float hue=map(plane[i][j].y,-50,50,0,255/2);
      colorMode(HSB);
      stroke(hue,255,255);
      point(plane[i][j].x,plane[i][j].y,plane[i][j].z);

      colorMode(RGB);
      if(j<N-1){
        strokeWeight(1);
        stroke(255);
        line(plane[i][j].x,plane[i][j].y,plane[i][j].z,plane[i][j+1].x,plane[i][j+1].y,plane[i][j+1].z);
      }
      if(i<N-1){
        strokeWeight(1);
        line(plane[i][j].x,plane[i][j].y,plane[i][j].z,plane[i+1][j].x,plane[i+1][j].y,plane[i+1][j].z);
      }
    }
  }
  
  t+=0.01;
}
