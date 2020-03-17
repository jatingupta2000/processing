PVector polar_cartesian(long r){
  PVector temp=new PVector();
  temp.x=r*cos(r);
  temp.y=r*sin(r);
  return temp;
}

boolean isPrime(long num){
  boolean flag = false;
  for(long i = 2; i <= num/2; ++i){
      if(num % i == 0){
          flag = true;
          break;
      }
  }
  return flag;
}

PVector temp;
ArrayList<Long> num = new ArrayList<Long>();
void setup(){
  size(400,400);
  for(long i=0;i<100000;i++){
    if(isPrime(i)){
      num.add(i);
    }
  }
}
float s=3;
void draw(){
  background(0);
  stroke(255,255,0);
  translate(width/2,height/2);
  strokeWeight(2);
  for(int i=0;i<num.size();i++){
    temp=polar_cartesian(num.get(i));
    temp.x*=s;
    temp.y*=s;
    if(temp.x<width/2 && temp.x>-width/2 && temp.y<height/2 && temp.y>-height/2){
      point(temp.x,temp.y);
    }
  }
  s-=0.005;
  if(s<=0){
    noLoop();
  }
}
