import peasy.*;
PeasyCam cam;
int nP=4,parts=50;;
PVector pt[][] =new PVector[nP][nP];
PVector curve[][] =new PVector[parts+1][parts+1];

int factorial(int num){
  int fact=1,i=1;
  while(i<=num){
    fact*=i;
    i++;
  }
  return fact;
}

int comb(int n,int r){
  try{
  return factorial(n)/(factorial(r)*factorial(n-r));
  }
  catch(Exception e){
    return 1;
  }
}

void setup(){
  size(800,600,P3D);
  cam=new PeasyCam(this,800);
  for(int i=0;i<nP;i++){
    for(int j=0;j<nP;j++){
      pt[i][j]=new PVector((i+1)*100,(j+1)*100,random(500));
    }
  }
}

void draw(){
  
  background(0);
  stroke(255);
  strokeWeight(10);
  for(int i=0;i<nP;i++){
    for(int j=0;j<nP;j++){
      point(pt[i][j].x,pt[i][j].y,pt[i][j].z);
    }
  }
  stroke(255,255,0);
  strokeWeight(5);
  float coeff,coeff1,u,v;int n=nP-1;
  PVector temp=new PVector();
  for(int ui=0;ui<parts+1;ui++){
    u=ui/(float)parts;
    for(int vi=0;vi<parts+1;vi++){
      v=vi/(float)parts;
      temp.x=0;temp.y=0;temp.z=0;
      for(int i=0;i<nP;i++){
        coeff=comb(n,i)*pow(v,i)*pow(1-v,n-i);
        for(int j=0;j<nP;j++){
          coeff1=comb(n,j)*pow(u,j)*pow(1-u,n-j);
          temp.x+=pt[i][j].x*coeff*coeff1;
          temp.y+=pt[i][j].y*coeff*coeff1;
          temp.z+=pt[i][j].z*coeff*coeff1;
        }
      }
      point(temp.x,temp.y,temp.z);
      curve[ui][vi]=temp.copy();
    }
  }
  strokeWeight(1);
  noFill();
  for(int i=0;i<parts;i++){
    for(int j=0;j<parts;j++){
      beginShape();
      vertex(curve[i][j].x,curve[i][j].y,curve[i][j].z);
      vertex(curve[i][j+1].x,curve[i][j+1].y,curve[i][j+1].z);
      vertex(curve[i+1][j+1].x,curve[i+1][j+1].y,curve[i+1][j+1].z);
      vertex(curve[i+1][j].x,curve[i+1][j].y,curve[i+1][j].z);
      endShape(CLOSE);
    }
  } 
}
