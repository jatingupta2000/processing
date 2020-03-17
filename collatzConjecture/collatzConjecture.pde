import java.util.Collections;

long collatz(long num){
  if(num%2==0){return num/2;}
  else{return (3*num+1)/2;}
}

int len=25;
float angle=PI/30;
ArrayList<Long> n=new ArrayList<Long>();

void setup(){
  size(1200,600);
  background(0);
  stroke(255);
  strokeWeight(5);
  long num;
  for(long j = 1;j<20000;j++){
    float m=map(j%10,0,9,50,200);
    stroke(255,m,m);
    n.removeAll(n);
    resetMatrix();
    translate(4*width/9,8*height/9);
    scale(0.15,-0.15);
    num=j;
    do{
      n.add(num);
      num=collatz(num);
    }while(num!=1);
    n.add((long)1);
    Collections.reverse(n);
    for(int i=0;i<n.size();i++){
      if((long)n.get(i)%2==0){rotate(-angle);}
      else{rotate(angle);}
      line(0,0,0,len);
      translate(0,len);
    }  
  }
}
