// guide
// keys for left paddle are w & s
// keys for right paddle are up and down  

// Set up the canvas
const canvas = document.getElementById('canvas');
const ctx = canvas.getContext('2d');

// Set up the game variables
const ball = {
  x: canvas.width / 2,
  y: canvas.height / 2,
  dx: 5,
  dy: 5,
  radius: 10,
};
const leftPaddle = {
  x: 10,
  y: canvas.height / 2 - 50,
  width: 10,
  height: 100,
  dy: 0,
};
const rightPaddle = {
  x: canvas.width - 20,
  y: canvas.height / 2 - 50,
  width: 10,
  height: 100,
  dy: 0,
};
let leftScore = 0;
let rightScore = 0;

// Draw the ball on the canvas
function drawBall() {
  ctx.beginPath();
  ctx.arc(ball.x, ball.y, ball.radius, 0, Math.PI * 2);
  ctx.fillStyle = '#000';
  ctx.fill();
  ctx.closePath();
}

// Draw the left paddle on the canvas
function drawLeftPaddle() {
  ctx.beginPath();
  ctx.rect(leftPaddle.x, leftPaddle.y, leftPaddle.width, leftPaddle.height);
  ctx.fillStyle = '#000';
  ctx.fill();
  ctx.closePath();
}

// Draw the right paddle on the canvas
function drawRightPaddle() {
  ctx.beginPath();
  ctx.rect(rightPaddle.x, rightPaddle.y, rightPaddle.width, rightPaddle.height);
  ctx.fillStyle = '#000';
  ctx.fill();
  ctx.closePath();
}

// Draw the scores on the canvas
function drawScores() {
  ctx.font = '30px Arial';
  ctx.fillStyle = '#000';
  ctx.textAlign = 'center';
  ctx.fillText(leftScore + ' - ' + rightScore, canvas.width / 2, 50);
}

// Move the left paddle
function moveLeftPaddle() {
  leftPaddle.y += leftPaddle.dy;

  if (leftPaddle.y < 0) {
    leftPaddle.y = 0;
  } else if (leftPaddle.y + leftPaddle.height > canvas.height) {
    leftPaddle.y = canvas.height - leftPaddle.height;
  }
}

// Move the right paddle
function moveRightPaddle() {
  rightPaddle.y += rightPaddle.dy;

  if (rightPaddle.y < 0) {
    rightPaddle.y = 0;
  } else if (rightPaddle.y + rightPaddle.height > canvas.height) {
    rightPaddle.y = canvas.height - rightPaddle.height;
  }
}

// Check for collisions between the ball and the paddles
function checkCollisions() {
  if (
    ball.y - ball.radius < 0 ||
    ball.y + ball.radius > canvas.height
  ) {
    ball.dy = -ball.dy;
  }

  if (
    ball.x - ball.radius < leftPaddle.x + leftPaddle.width &&
    ball.y + ball.radius > leftPaddle.y &&
    ball.y - ball.radius < leftPaddle.y + leftPaddle.height
  ) {
    ball.dx = -ball.dy;
  } else if (
        ball.x + ball.radius > rightPaddle.x &&
        ball.y + ball.radius > rightPaddle.y &&
        ball.y - ball.radius < rightPaddle.y + rightPaddle.height
      ) {
        ball.dx = -ball.dx;
      }
    
      if (ball.x - ball.radius < 0) {
        rightScore++;
        resetBall();
      } else if (ball.x + ball.radius > canvas.width) {
        leftScore++;
        resetBall();
      }
    }
    
    // Reset the ball to the center of the canvas
    function resetBall() {
      ball.x = canvas.width / 2;
      ball.y = canvas.height / 2;
      ball.dx = -ball.dx;
      ball.dy = -ball.dy;
    }
    
    // Update the canvas on each frame
    function update() {
      ctx.clearRect(0, 0, canvas.width, canvas.height);
    
      moveLeftPaddle();
      moveRightPaddle();
      checkCollisions();
    
      ball.x += ball.dx;
      ball.y += ball.dy;
    
      drawBall();
      drawLeftPaddle();
      drawRightPaddle();
      drawScores();
    }
    
    // Listen for keyboard input to move the paddles
    document.addEventListener('keydown', function (event) {
      if (event.code === 'KeyW') {
        leftPaddle.dy = -5;
      } else if (event.code === 'KeyS') {
        leftPaddle.dy = 5;
      }
    
      if (event.code === 'ArrowUp') {
        rightPaddle.dy = -5;
      } else if (event.code === 'ArrowDown') {
        rightPaddle.dy = 5;
      }
    });
    
    document.addEventListener('keyup', function (event) {
      if (event.code === 'KeyW' || event.code === 'KeyS') {
        leftPaddle.dy = 0;
      }
    
      if (event.code === 'ArrowUp' || event.code === 'ArrowDown') {
        rightPaddle.dy = 0;
      }
    });
    
    // Start the game loop
    setInterval(update, 10);
    
