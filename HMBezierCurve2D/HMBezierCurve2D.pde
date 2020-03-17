int nP=4,parts=1000;
PVector pt[] =new PVector[nP];
PVector curve[] =new PVector[parts+1];

int factorial(int num){
  int fact=1;
  int i=1;
  while(i<=num){
    fact*=i;
    i++;
  }
  return fact;
}

int comb(int n,int r){
  return factorial(n)/(factorial(r)*factorial(n-r));
}

void setup(){
  size(800,600);
  pt[0]=new PVector(20,20);
  pt[1]=new PVector(mouseX,mouseY);
  pt[2]=new PVector(10,350);
  pt[3]=new PVector(580,580);
}

void draw(){
  pt[1].x=mouseX;
  pt[1].y=mouseY;
  background(0);
  stroke(50);
  strokeWeight(1);
  line(pt[0].x,pt[0].y,pt[nP-1].x,pt[nP-1].y);
  stroke(255);
  strokeWeight(5);
  for(int k=0;k<nP;k++){
    point(pt[k].x,pt[k].y);
  }
  stroke(255,255,0);
  strokeWeight(5);
  float coeff,u;int n=nP-1;
  PVector temp=new PVector();
  PVector temp1=new PVector();
  for(int i=0;i<parts+1;i++){
    u=i/(float)parts;
    temp.x=0;temp.y=0;
    for(int k=0;k<nP;k++){
      coeff=comb(n,k)*pow(u,k)*pow(1-u,n-k);
      temp.x+=pt[k].x*coeff;
      temp.y+=pt[k].y*coeff;
    }
    curve[i]=temp.copy();
  }
  for(int i=0;i<parts;i++){
    temp=curve[i].copy();
    temp1=curve[i+1].copy();
    stroke(255,255,0);
    strokeWeight(1);
    line(temp.x,temp.y,temp1.x,temp1.y);
  }
}
