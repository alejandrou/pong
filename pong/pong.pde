import processing.sound.*;
import gifAnimation.*;

SoundFile sonido;
GifMaker ficherogif;

int x, y, w, h, speedX, speedY;
int paddleXL, paddleYL, paddleW, paddleH, paddleS;
int paddleXR, paddleYR;
boolean upL, downL;
boolean upR, downR;

//creo dos colores base 
color colorL = color(255,0,0);
color colorR = color(0, 255, 0, 50);

int scoreL = 0; 
int scoreR = 0;

int winScore = 10;
 

void setup() {
  size(800, 800);
  x = width/2; 
  y = height/2;
  w = 50;
  h = 50;
  
  speedX = 2;
  speedY = 2;
  
  textSize(30);
  textAlign(CENTER, CENTER); 
  rectMode(CENTER); 

  paddleXL = 40;
  paddleYL = height/2;
  paddleXR = width -40;
  paddleYR = height/2;
  paddleW = 20;
  paddleH = 100;
  paddleS = 5;
  
  sonido = new SoundFile(this, "ball_bounce.wav");
  
  ficherogif = new GifMaker(this, "pong.gif");
  ficherogif.setRepeat(0);
  ficherogif.setTransparent(0,0,0);
}
 

 
void draw() {
  background(0);
  drawCircle();
  moveCircle();
  bounceOff();
  drawPaddles();
  movePaddle();
  restrictPaddle();
  contactPaddle();
  scores();
  gameOver();
  ficherogif.setDelay(1);
  ficherogif.addFrame();
}
 

 
void drawPaddles() {
  fill(colorL);
  rect(paddleXL, paddleYL, paddleW, paddleH);
  fill(colorR);
  rect(paddleXR, paddleYR, paddleW, paddleH);
}
 

 
void movePaddle() {
  if (upL) {
    paddleYL = paddleYL - paddleS;
  }
  if (downL) {
    paddleYL = paddleYL + paddleS;
  }
  if (upR) {
    paddleYR = paddleYR - paddleS;
  }
  if (downR) {
    paddleYR = paddleYR + paddleS;
  }
}
 

 
void restrictPaddle() {
  if (paddleYL - paddleH/2 < 0) {
    paddleYL = paddleYL + paddleS;
  }
  if (paddleYL + paddleH/2 > height) {
    paddleYL = paddleYL - paddleS;
  }
  if (paddleYR - paddleH/2 < 0) {
    paddleYR = paddleYR + paddleS;
  }
  if (paddleYR + paddleH/2 > height) {
    paddleYR = paddleYR - paddleS;
  }
}
 
 
void contactPaddle() {
  if (x - w/2 < paddleXL + paddleW/2 && y - h/2 < paddleYL + paddleH/2 && y + h/2 > paddleYL - paddleH/2 ) {
    if (speedX < 0) {
      speedX = -speedX*1;
      sonido.play();
    }
  }
  else if (x + w/2 > paddleXR - paddleW/2 && y - h/2 < paddleYR + paddleH/2 && y + h/2 > paddleYR - paddleH/2 ) {
    if (speedX > 0) {
      speedX = -speedX*1;
      sonido.play();
    }
  }
}
 

void drawCircle() {
  fill(0,0,255);
  ellipse(x, y, w, h);
}

//para aumentar la dificultad incrementar el numero para que la bola vaya mas rapido
void moveCircle() {  
  x = x + speedX*3;
  y = y + speedY*3;
}
 

 
void bounceOff() {
 if ( x > width - w/2) {
    setup();
    speedX = -speedX;
    scoreL = scoreL + 1;
  } else if ( x < 0 + w/2) {
    setup();
    scoreR = scoreR + 1;
  }
  if ( y > height - h/2) {
    speedY = -speedY;
    sonido.play();
  } else if ( y < 0 + h/2) {
    speedY = -speedY;
    sonido.play();
  }
}
 

 
void scores() {
  fill(255);
  text(scoreL, 100, 50);
  text(scoreR, width-100, 50);
}
 

 
void gameOver() {
  if(scoreL == winScore) {
    gameOverPage("Red wins!", colorL);
  }
  if(scoreR == winScore) {
    gameOverPage("Green wins!", colorR);
  }
}
 

 
void gameOverPage(String text, color c) {
  speedX = 0;
  speedY = 0;
  fill(255);
  text("Game over", width/2, height/3 - 40);
  text("Click to play again", width/2, height/3 + 40);
  fill(c);
  text(text, width/2, height/3);
  if(mousePressed) {
    scoreR = 0;
    scoreL = 0;
    speedX = 2;
    speedY = 2;
  }
}
 
 
void keyPressed() {
if (key == 'w' || key == 'W') {
    upL = true;
  }
  if (key == 's' || key == 'S') {
    downL = true;
  }
  if (keyCode == UP) {
    upR = true;
  }
  if (keyCode == DOWN) {
    downR = true;
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') {
    upL = false;
  }
  if (key == 's' || key == 'S') {
    downL = false;
  }
  if (keyCode == UP) {
    upR = false;
  }
  if (keyCode == DOWN) {
    downR = false;
  }
}

void mousePressed()  {
  ficherogif.finish();

}
