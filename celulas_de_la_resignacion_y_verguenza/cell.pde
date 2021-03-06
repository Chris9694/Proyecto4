
class Cell {
  PVector pos;
  PVector vel;
  float r,m,posx,posy;
  color c ;

  Cell(float posx, float posy, float r_, color c_) {
    pos = new PVector(posx, posy);
    vel = PVector.random2D();
    vel.mult(1.5);
    r = r_;
    m = r*.1;
    c = c_;
  }
  
  
  void update(){
    pos.add(vel);
  }
  
  void ColisionLimites() {
    if (pos.x > width-r) {
      pos.x = width-r;
      vel.x *= -1;
      clink.trigger();
    } else if (pos.x < r) {
      pos.x = r;
      vel.x *= -1;
      clink.trigger();
    } else if (pos.y > height-r) {
      pos.y = height-r;
      vel.y *= -1;
      clink.trigger();
    } else if (pos.y < r) {
      pos.y = r;
      vel.y *= -1;
      clink.trigger();
    }
  }
  

  boolean clicked(int x, int y) {
    float d = dist(this.pos.x, this.pos.y, x, y);
    if (d < this.r) {
      return true;
    } else {
      return false;
    }
  }

  Cell mitosis1() {
    Cell cell = new Cell(this.pos.x, this.pos.y, this.r, c);
    return cell;
  }
   Cell mitosis2() {
    Cell cell1 = new Cell(this.pos.x, this.pos.y, this.r, c);
    return cell1;
  }


  void show() {
    
    ellipse(pos.x, pos.y, this.r*2, this.r*2);
    image(llora, pos.x-75, pos.y-75);
   
  }
}