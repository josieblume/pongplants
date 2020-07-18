class lemons {

  int nPics = 300;
  PImage[] lemface = new PImage[nPics];
  int imageIndex1 = 0;
  
  int xpos;
  int ypos;
  int size;

  lemons(int x, int y, int s) {
       
        for (int i = 0; i < 10; i++) {
          lemface[i]= loadImage("face000"+(i)+".png");
          frameRate(30);
        }
        for (int i = 10; i < 100; i++) {
          lemface[i]= loadImage("face00"+(i)+".png");
          frameRate(30);
        }
        for (int i = 100; i < 300; i++) {
          lemface[i]= loadImage("face0"+(i)+".png");
          frameRate(30);
        }
    xpos = x;
    ypos =  y;
    size = s;
  }
 
  void displaylemface() {
    image(lemface[imageIndex1], xpos, ypos, size, size);
    imageIndex1 = (imageIndex1 + 1) % lemface.length;
  }
}
