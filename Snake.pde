float cols;
float rows;

SnakeGame snakegame = new SnakeGame(); //initialise object snakegame

void setup() {
  cols= 25;
  rows= 25;
  
  size(750, 750); //25*30, rows, cols * gridSize
  frameRate(8); //movement of the whole game 
  
  snakegame.initialiseSnake(); //initialise snake's starting position 
}

void draw() {
      snakegame.drawGrid(); //call methods on the object
      snakegame.drawFood();
      snakegame.drawSnake(); 
      snakegame.detectBorders(); 
      snakegame.snakeKeycode(); 
      snakegame.snakeMotion();
      snakegame.detectFood(); 
      snakegame.checkOverlapBody();
}
