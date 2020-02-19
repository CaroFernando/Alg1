
class coor {
  int x, y; 
  coor(int a, int b) {
    this.x = a;
    this.y = b;
  }

  public String toString() {
    return "("+this.x+","+this.y+")";
  }
}

ArrayList<coor> res;

void setup() {
  res = new ArrayList();
  thread("finit");
  size(800, 800);
}

void draw() {
  background(255);
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      fill((j+i)%2==0?255:0);
      rect(i*100, j*100, 100, 100);
    }
  }
  try {
    for (coor temp : res) {
      noStroke();
      fill(255, 0, 0);
      if(res.size() == 8) fill(0,255,0);
      ellipse(temp.x*100+50, temp.y*100+50, 50, 50);
    }
  }
  catch(Exception e) {
  }
}

void finit() {
  f(0, 0, 0, 0);
}

void f(int r, int d1, int d2, int ac) {
  delay(120);
  
  if (ac == 8) {
    print("Solucion: ");
    for (coor tem : res) print(tem);
    println("");
    delay(3000);
    return;
  }

  for (int y = 0; y < 8; y++) { 
    if ( (r & (1 << y))==0 && (d1 & (1<<(ac+y)))==0 && (d2 & (1 << (ac-y+7))) == 0) {
      res.add(new coor(ac, y));
      f(r | (1 << y), d1 | (1 << (ac+y)), d2 | (1 << (ac-y+7)), ac+1);
      res.remove(res.size()-1);
    }
  }
}
