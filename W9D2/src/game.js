const Asteroid = require("./asteroid.js");
const Ship = require("./ship.js");
const Bullet = require("./bullet.js");

function Game(ctx, canvas) {
  this.ctx = ctx;
  this.asteroids = [];
  this.bullets = [];
  this.ship = new Ship(this.randomPosition());
}

Game.prototype.addAsteroids = function() {
  for(let i = 0; i < Game.NUM_ASTEROIDS; i++) {
    this.asteroids.push(new Asteroid(this.randomPosition()));
  }
};

Game.prototype.randomPosition = function() {
  let randomPos = {};
  randomPos.pos = [];
  randomPos.game = this;
  randomPos.pos.push(Math.floor(Math.random() * Game.DIM_X));
  randomPos.pos.push(Math.floor(Math.random() * Game.DIM_Y));
  return randomPos;
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0,0,Game.DIM_X, Game.DIM_Y);
  this.allObjects().forEach((object) => {
    object.draw(ctx);
  });
};

Game.prototype.moveObjects = function(delta) {
  delta = delta || 1
  this.allObjects().forEach((object) => {
    object.move(delta);
  });
};

Game.prototype.wrap = function(pos) {
  newWidth = pos[0] % Game.DIM_X;
  newHeight = pos[1] % Game.DIM_Y;
  if (newWidth < 0) {
    newWidth = Game.DIM_X;
  }
  if (newHeight < 0) {
    newHeight = Game.DIM_Y;
  }
  return [newWidth,newHeight];
};

Game.prototype.bindEventListener = function(canvas) {
  canvas.addEventListener("keydown", (event) => {
 
    if (event.keyCode === 68) {
      this.ship.power([1, 0]);
      //d
    } else if (event.keyCode === 83) {
      this.ship.power([0, 1]);
      //s
    } else if (event.keyCode === 87) {
      this.ship.power([0, -1]);
      //w 
    } else if (event.keyCode === 65) {
      this.ship.power([-1, 0]);
      //a
    }
  });
};



Game.prototype.checkCollisions = function() {
  for (let i = 0; i < this.allObjects().length; i++) {
    for (let j = 0; j < this.allObjects().length; j++) {
      if (i !== j) {
        if (this.allObjects()[i].isCollideWith(this.allObjects()[j])) {
          this.allObjects()[i].collideWith(this.allObjects()[j]);
          // if (this.ship === this.allObjects()[i] || this.ship === this.allObjects()[j]) {
          //   this.ship.relocate();
          // }
          
        }
      }
    }
  }
};

Game.prototype.remove = function(object) {
  if (object instanceof Asteroid) {
    this.asteroids = this.asteroids.filter((el) => {
      return (el !== object);
    });
  } else if (object instanceof Bullet) {
    this.bullets = this.bullets.filter((el) => {
      return (el !== object);
    });
  }
};

Game.prototype.add = function(object) {
  if (object instanceof Asteroid) {
    this.asteroids.push(object);
  } else if (object instanceof Bullet) {
    this.bullets.push(object);
  }
}

Game.prototype.step = function(delta) {
  this.moveObjects(delta);
  this.checkCollisions();
};

Game.prototype.allObjects = function() {
  return this.asteroids.concat([this.ship]).concat(this.bullets);
}

Game.prototype.isOutOfBounds = function(pos) {
  return ((pos[0] > Game.DIM_X) || (pos[0] < 0) || (pos[1] > Game.DIM_Y) || (pos[1] < 0));
}

Game.DIM_X = 1000;
Game.DIM_Y = 800;
Game.NUM_ASTEROIDS = 15;

module.exports = Game;