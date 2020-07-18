class Paddle {
  PImage paddle1;
  int x;  // X-coordinate of the paddle
  int y;  // Y-coordinate of the paddle
  int w = 20;  // Width of the paddle
  int h = 100;  // Height of the paddle


  Paddle() {
    x = (width-w*2);
    y = height/2;
    paddle1 = loadImage("paddle1.png");
  }

  // Change paddle position with cursor
  void update() {
    y = mouseY - h/2;
    y = constrain(y, 0, height-h);
  }

  // Draw paddle to the display window
  void display() {
    fill(102);
    noStroke();
    //rect(x, y, w, h);
    image(paddle1, x-50, y, 100, 150);
  }
  
}
