// A program that simulates every Windows user's favourite 
// crash. 

float bx = 0; // Dialog box x co-ordinates
float by = 0; // Dialog box y co-ordinates

int bw = 355; // Dialog box width
int bh = 206; // Dialog box height

boolean cursorOver = false; // Is cursor over box?
boolean clicked = false; // Has the mouse been clicked?

float bdifx = 0.0; 
float bdify = 0.0; 

PImage bg;
PImage dialog_box;

void setup() {
  size(800, 600); 
  bx = 215;
  by = 200;
  
  rectMode(RADIUS);
  
  bg = loadImage("bliss-blur.png");
  background(bg); 
  
  dialog_box = loadImage("box-blur.png");
}

void draw() {
  // Test if cursor is over box.
  if (mouseX > bx && mouseX < bx + bw && mouseY > by && mouseY < by + 25) {
    cursorOver = true;  
  } 
  else {
    cursorOver = false;
  }
  
  image(dialog_box, bx, by);
}

void mousePressed() {
  if (cursorOver) { 
    clicked = true; 
  } 
  else {
    clicked = false;
  }
  
  bdifx = mouseX - bx; 
  bdify = mouseY - by; 
}

void mouseDragged() {
  if (clicked) {
    bx = mouseX - bdifx; 
    by = mouseY - bdify; 
  }
}

void mouseReleased() {
  clicked = false;
}

void keyPressed() {
  // Clear masterpiece when 'c' is pressed.
  if (key == 'c' || key == 'C') {
    setup();
  }
  
  // Save masterpiece if 's' is pressed.
  if (key == 's' || key  == 'S') {
    save("screenshot.png");
  } 
}
