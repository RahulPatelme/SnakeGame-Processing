class SnakeGame {
  int snakeSize = 3; //initial size of the snake 
  int maxLength = 20; //max length of the snake //Assign requirement
  int gridSize = 30;
  float width = 750; 
  float height = 750;
 
  PVector[] snake = new PVector[maxLength]; //array pvector for snake
  PVector speed = new PVector(); 

  //convert PVector default float to int aka typecasting
  //randomising food position with respect to grids (*gridSize = jump 30 units)
  PVector food = new PVector((int)random(width/gridSize)*gridSize, (int)random(width/gridSize)*gridSize); 
  boolean play = true;
  
  
  //create grid
  void drawGrid() { 
    for(int i=0; i < cols; i++) { 
      for(int j=0; j < rows; j++) {
      fill(21);
      rect(i*gridSize, j*gridSize, gridSize, gridSize); 
      noStroke(); 
      }
    }
  }


  //create food (red)
  void drawFood() {
    fill(255, 0, 100);
    rect(food.x, food.y, gridSize, gridSize);
  }
  
  
  void initialiseSnake() {
    for(int i = 0; i<snakeSize; i++)
     snake[i] = new PVector(0,0); //initialise snake head's starting position
  }


  //create snake's head (white)
  void drawSnake() {
   for (int i=0; i<snakeSize; i++) { 
      fill(255);
      rect(snake[i].x, snake[i].y, gridSize, gridSize); 
   } 
}


  //collision detection with the food
  void detectFood() {
    if(snake[0].x == food.x && snake[0].y == food.y) { 
      food = new PVector((int)random(width/gridSize)*gridSize, (int)random(width/gridSize)*gridSize); 
      
    snakeSize = snakeSize + 1; 
    addBody(); //add body part per food consumed
    } 
  }
  
  
  //collision detection with borders
  void detectBorders() { 
     if(snake[0].x < 0 || snake[0].x > width || snake[0].y < 0 || snake[0].y > height) { 
       play = false; //game is over
       gameOver(); //call game over screen
     }
  }


 void snakeMotion() {
   for(int i=snakeSize-1; i>0; i--) { //for body
      snake[i].x = snake[i-1].x;
      snake[i].y = snake[i-1].y;
   }
   snake[0].x = snake[0].x + speed.x;  //for head
   snake[0].y = snake[0].y + speed.y;
}
 
 
 //add body part
 void addBody(){
      if(snakeSize >= maxLength-1) {
        gameOver();
      } else {
      snake[snakeSize-1] = new PVector(snake[(snakeSize-1)-1].x, snake[(snakeSize-1)-1].y); 
      }
  }
 
 
 //Check and avoid overlap between snake's head and the food
 void checkOverlap() {
   while(food.x == snake[0].x && food.y == snake[0].y) {
   food = new PVector((int)random(width/gridSize)*gridSize, (int)random(width/gridSize)*gridSize); 
 }
}


 //Check and avoid overlap between snake's body and the food
 void checkOverlapBody() {
   for(int i=0;i<snakeSize-1;i++){
    if(food.x == snake[i].x && food.y == snake[i].y) {
       food = new PVector((int)random(width/gridSize)*gridSize, (int)random(width/gridSize)*gridSize); 
    }
  }
 }
 

void snakeKeycode() { 
if (keyPressed == true){
    if (keyCode==UP) { 
  if(!(speed.x == 0 && speed.y == gridSize)) { //To restrict snake's movement back on itself
    speed.x=0;
    speed.y=-gridSize;
      }
    }
    
  else if (keyCode==DOWN) {
    if(!(speed.x == 0 && speed.y == -gridSize)) { //To restrict snake's movement back on itself
    speed.x=0;
    speed.y=gridSize;
    }
  }
  
  else if (keyCode==LEFT) {
   if(!(speed.x == gridSize && speed.y == 0)) { //To restrict snake's movement back on itself
    speed.x=-gridSize;
    speed.y=0;
    }
  }
 
  else if (keyCode==RIGHT) {
    if(!(speed.x == -gridSize && speed.y == 0)) { //To restrict snake's movement back on itself
    speed.x=gridSize;
    speed.y=0;
    }
   }
 }
}


  //Gameover screen
  void gameOver() {
    background(0);
    fill(51);
    rect(0, 0, width, height);

    int textsize = 60;
    textSize(textsize);

    fill(255, 0, 100);
    text("GAME OVER", width/4, height/2);
    
    int textsize2 = 30;
    textSize(textsize2);
    fill(255);
    text ("Press ENTER to Play Again", width/4, height/2+25);
    reset(); 
  }
  
  
  void reset() {
      if (keyCode==ENTER) {
      snake[0] = new PVector(0,0);
      snakeSize=3;
      food = new PVector((int)random(width/gridSize)*gridSize, (int)random(width/gridSize)*gridSize); 
      play = true;
    }
  }
}
