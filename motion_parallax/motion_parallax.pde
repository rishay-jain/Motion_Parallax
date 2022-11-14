
color sky = color(140,200,random(230,255));

class Field{

  color field_color; 
  float vertical_scalar = 0.2; 
  float field_height;
  
  Field(){
    field_color = color(50,random(100,255),50);
  }
 
 void update_field_height(){
   field_height = mouseY * vertical_scalar;
 }
 
 void draw_field(){
   
   fill(field_color);
   rect(0,(height-field_height),width, (height-field_height));
 } 
}

class Bird{
  
  int xpos;
  int ypos; 
  boolean right = true; 
  
  Bird(int x, int y){
    xpos = x;
    ypos = y;
  }
  
  void draw_bird(){
    
    stroke(50);
    strokeWeight(6);
    line(xpos,ypos,xpos-20,ypos-10);
    line(xpos,ypos,xpos+20,ypos-10);
    noStroke();
    
  }
  
  
  
}

class Flock{
  
  int posx;
  int posy;
  int numbirds; 
  Bird[] birds;
  
  Flock(int num, int x, int y){
    posx = x;
    posy = y;
    numbirds = num;
    birds = new Bird[numbirds];
  }
  
  void create(){
    
    for(int i = 0; i <= (numbirds - 1); i++){
      birds[i] = new Bird(posx + (75 * i), posy+(15*i));
      println(birds[i].xpos);
    }
  }
   
  void draw_flock(){
    for(int i = 0; i <= (numbirds - 1); i++){
      birds[i].draw_bird();
      
    }
  }
  
  void move(){
    posx += 1;
    //posy ++;
    for(int i = 0; i <= (numbirds - 1); i++){
      if(birds[i].xpos >= (width-200)){
        birds[i].right = false;
      }
      if(birds[i].xpos <= (200)){
        birds[i].right = true;
      }
      if(birds[i].right){        
        birds[i].xpos += 1;
      }
      else{
        birds[i].xpos -= 1;
      }
        
    }
  }
  
}

class Sun{
  int xpos;
  int ypos;
  
  Sun(int x, int y){
    xpos = x;
    ypos = y;
  }
  
  void draw_sun(){
    
    stroke(150);
    fill(230,230,0);
    strokeWeight(2);
    ellipse(xpos,ypos,100,100);
    noStroke();
  }
  
  void update_sun(){
    xpos = (int) (width - 300 + (mouseX * 0.01));
    ypos = (int) (200 - (mouseY * 0.03));
    //xpos = xpos + (int)((500 - mouseX) * 0.01);
    //ypos = ypos + (int)((500 - mouseY) * 0.01);
  }
  
}

class Tree{
  int xpos;
  int ypos;
  
  Tree(int x, int y){
    xpos = x;
    ypos = y;
  }
  
  void draw_tree(){
    
    fill(101,67,33);
    rect(xpos,ypos-50,25, 150);
    fill(50,200,100);
    ellipse(xpos+5,ypos-150,300,300);
  }
  
  void update_tree(){
    xpos = (int) (900 + ((mouseX - 500)* 0.25));
    ypos = (int) (750 - ((mouseY - 500)* 0.1));

  }
  
}

class Mountain{
  int xpos1;
  int ypos1;
  int xpos2;
  int ypos2;
  int xpos3;
  int ypos3;
  
  int base;
  double scalar;
  
  Mountain(int b, double s){
    base = b;
    scalar = s;
  }
  
  color mt = color(random(0,105),random(0,25),random(0,105));
  
  void update_mountain(){
    xpos1 = (int) (250+ base + ((mouseX - 500) * scalar)); // top
    ypos1 = 100 + (int)(0.2 * base);
    xpos2 = (int) ((base*0.5) + ((mouseX - 500) * scalar)); // bottom left
    ypos2 = height - (int)(mouseY*0.2);
    xpos3 = (int) ((mouseX - 500) * scalar)+ base + 700; // bottom right
    ypos3 = height - (int)(mouseY*0.2);
    
    
    //xpos1 = (int) (base + ((mouseX - 500) * scalar));
    //ypos1 = (int) (250 +((mouseY - 500)* (scalar - 0.02)));
    //xpos2 = (int) (xpos1 + 300 + ((mouseX - 500)* scalar));
    //ypos2 = height - (int)(mouseY*0.2);
    //xpos3 = (int) base + 500;
    //ypos3 = height - (int)(mouseY*0.2);
  }
  
  void draw_mountain(){
    fill(mt);
    triangle(xpos1,ypos1,xpos2,ypos2,xpos3,ypos3);
    
  }
  
}





Field field = new Field();

Sun sun = new Sun(1100,300);
Tree tree = new Tree(width/2, 750);
Mountain mt1 = new Mountain(800,0.03);
Mountain mt2 = new Mountain(100,0.04);
Mountain mt3 = new Mountain(500,0.05);

int num_birds = 5;
int flock_x = 100;
int flock_y = 400;
Flock flock = new Flock(num_birds, 100,400);


void setup(){
  fullScreen();
  noStroke();
  
  background(sky);
  
  
  flock.create();
  flock.draw_flock();
  sun.draw_sun();
  tree.draw_tree();
  mt1.draw_mountain();
  mt2.draw_mountain();
  mt3.draw_mountain();

  
}


void draw(){  
  background(sky);
  
  mt1.update_mountain();
  mt1.draw_mountain();
  mt2.update_mountain();
  mt2.draw_mountain();
  mt3.update_mountain();
  mt3.draw_mountain();
  
  
  field.update_field_height();
  field.draw_field();
  
  sun.update_sun();
  sun.draw_sun();

  tree.update_tree();
  tree.draw_tree();
  flock.move();
  flock.draw_flock();
  
}
