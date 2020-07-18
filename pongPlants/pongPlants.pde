/*CREATED MAY 18th

I decided to recreate the time-honoured game, Pong; but instead of the recognizable
black and white Atari aesthetic, I wanted to create an experience away from this realm.

During quarantine, a method I would use to help alleviate some stress, was I would go on long walks
along Kelly drive Schuykill river park, and listen to my favorite soothing album and synthesis of sound, 
'Mother Earth's Plantasia' by Mort Garson. This early Analog synth, matched with laying down and gazing
up at the trees whilst sipping a glass of lemonade, made me forget about the pandemic for a moment.
*/

import processing.sound.*;
import processing.video.*;
static final int movieCount = 5;
String[] movieNames = { "IMG_3776.MOV", "IMG_3778.MOV", "IMG_3779.MOV", "IMG_3780.MOV", "IMG_3784.MOV"};
final Movie[] backvids = new Movie[movieCount];
SoundFile file;
int index = 0;
Ball ball;
Paddle paddle;
lemons lemon;
lemons lemon1;
lemons lemon2;
Score score;
int xvid = 0;
int yvid = 0;

void setup() {
  size(800, 800);
  paddle = new Paddle();
  ball = new Ball();
  score = new Score();
  lemon = new lemons(0, 0, 150);
  lemon1 = new lemons(50, 50, 300);
  lemon2 = new lemons(50, 50, 600);
  file = new SoundFile(this, "Swingin' Spathiphyllums.mp3");
  file.play();

  //  backvids = new Movie[6];
  backvids[0] = new Movie(this, "IMG_3776.MOV");
  backvids[1] = new Movie(this, "IMG_3778.MOV");
  backvids[2] = new Movie(this, "IMG_3779.MOV");
  backvids[3] = new Movie(this, "IMG_3780.MOV");
  backvids[4] = new Movie(this, "IMG_3784.MOV");

  backvids[0].loop();
  backvids[1].pause();
  backvids[2].pause();
  backvids[3].pause();
  backvids[4].pause();

  noCursor();
}

void draw() {

  image(backvids[index], 0, 0);
  score.display();

  if (score.getScore() >2 && score.getScore() <4) {
    lemon.displaylemface();
  }
  else if (score.getScore() > 3 && score.getScore() <5) {
      lemon1.displaylemface();
  }
  else if (score.getScore() > 4  && score.getScore() <11) {
      lemon2.displaylemface();
  }
  
  paddle.update();  // Update paddle
  paddle.display();  // Draw paddle

  ball.update();  // Update ball
  ball.display();  // Draw ball

  //should add more functions i think

  // Set variable to true if shapes are overlapping, false if not
  boolean collision = hitPaddle(paddle, ball);

  if (collision == true) {
    ball.hit(paddle);
    score.update();

    if (index == 0) {
      index = 1;
      backvids[0].stop();
      backvids[1].loop();
    } else if (index == 1) {
      index = 2;
      backvids[1].stop();
      backvids[2].loop();
    } else if (index == 2) {
      index = 3;
      backvids[2].stop();
      backvids[3].loop();
    } else if (index == 3) {
      index = 4;
      backvids[3].stop();
      backvids[4].loop();
    } else if (index == 4) {
      index = 0;
      backvids[4].stop();
      backvids[0].loop();
    }
  }
}

@Override void exit() {
  for (final Movie mov : backvids)  mov.stop();
  super.exit();
}

boolean hitPaddle(Paddle p, Ball b) {

  float circleDistanceX = abs(b.x - p.x - p.w/2);
  float circleDistanceY = abs(b.y - p.y - p.h/2);

  if (circleDistanceX > (p.w/2 + b.radius)) {
    return false;
  }
  if (circleDistanceY > (p.h/2 + b.radius)) {
    return false;
  }
  if (circleDistanceX <= p.w/2) {
    return true;
  }
  if (circleDistanceY <= p.h/2) {
    return true;
  }

  float cornerDistance = pow(circleDistanceX - p.w/2, 2) + pow(circleDistanceY - p.h/2, 2);
  if (cornerDistance <= pow(b.radius, 2)) {
    return true;
  } else {
    return false;
  }
}

void movieEvent(Movie m) {
  m.read();
}
