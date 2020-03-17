int[][] grid;
int ant_x,ant_y;
int TO_RIGHT=0;
int TO_DOWN=1;
int TO_LEFT=2;
int TO_UP=3;
int dir=0;

void move(){
  if(grid[ant_x][ant_y]==0){grid[ant_x][ant_y]=255;dir=(dir+1)%4;}
  else if(grid[ant_x][ant_y]==255){grid[ant_x][ant_y]=0;dir=(dir+3)%4;}
  if(dir==TO_RIGHT){ant_x++;if(ant_x>width-1){ant_x=0;}}
  else if(dir==TO_LEFT){ant_x--;if(ant_x<0){ant_x=width-1;}}
  else if(dir==TO_UP){ant_y--;if(ant_y<0){ant_y=height-1;}}
  else if(dir==TO_DOWN){ant_y++;if(ant_y>height-1){ant_y=0;}}
}

void setup(){
  size(400,400);
  ant_x=width/2;
  ant_y=height/2;
  grid=new int[width][height];
  for(int i=0;i<width;i++){
    for(int j=0;j<height;j++){
      grid[i][j]=255;
    }
  }
}

void draw(){
  background(255);
  
  for(int i=0;i<12000;i++){move();}
  loadPixels();
  //  Paint Background
  for(int i=0;i<width;i++){
    for(int j=0;j<height;j++){
      pixels[j*width+i]=color(grid[i][j]);
    }
  }
  
  //  Paint Ant
  pixels[ant_y*width+ant_x]=color(0,0,255);
  
  updatePixels();
  stroke(0);
  fill(2);
  ellipse(ant_x,ant_y,3,10);
  point(ant_x,ant_y);
  noLoop();
}
