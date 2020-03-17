PVector pt[]=new PVector[5];
ArrayList tr[] = new ArrayList[4];
ArrayList a[]=new ArrayList[5];

PVector translation(PVector temp,float tx,float ty,float tz){
  temp.x+=tx;
  temp.y+=ty;
  temp.z+=tz;
  return temp;
}

void setup(){
  size(800,800);
   pt[0]=new PVector(50,90,50);
   pt[1]=new PVector(150,50,50);
   pt[2]=new PVector(150,50,150);
   pt[3]=new PVector(50,50,150);
   pt[4]=new PVector(100,200,100);
   
   for(int i=0;i<5;i++){
     a[i]=new ArrayList();
   }
   a[0].add(1);a[0].add(1);a[0].add(0);a[0].add(1);a[0].add(1);
   a[1].add(0);a[1].add(1);a[1].add(1);a[1].add(0);a[1].add(1);
   a[2].add(0);a[2].add(0);a[2].add(1);a[2].add(1);a[2].add(1);
   a[3].add(0);a[3].add(0);a[3].add(0);a[3].add(1);a[3].add(1);
   a[4].add(0);a[4].add(0);a[4].add(0);a[4].add(0);a[4].add(1);
}

float x=0;

void draw(){
  background(0);
  stroke(255);
  PVector temp = new PVector();
  PVector temp2 = new PVector();
  for(int i=0;i<5;i++){
    strokeWeight(5);
    temp=pt[i].copy();
    temp=translation(temp,x,0,0);
    point(temp.x,temp.y);
    for(int j=i;j<5;j++){
      temp2=pt[j].copy();
      temp2=translation(temp2,x,0,0);
      if((int)a[i].get(j)==1){
        strokeWeight(1);
        line(temp.x,temp.y,temp2.x,temp2.y);
      }
    }
  }
  x+=1;
}
