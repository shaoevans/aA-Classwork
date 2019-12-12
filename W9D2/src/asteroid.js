const Util = require("./util.js");
const MovingObject = require("./moving_object.js");
const Ship = require("./ship.js");
const Bullet = require("./bullet.js");

function Asteroid(options) {
  MovingObject.call(this, options);
  this.color = Asteroid.COLOR;
  this.radius = Asteroid.RADIUS;
  this.vel = Util.randomVec(5);
}

Asteroid.COLOR = "#00FF00";
Asteroid.RADIUS = 30;
Util.inherits(Asteroid, MovingObject);

Asteroid.prototype.collideWith = function(otherObject) {
  if (otherObject instanceof Ship) {
    otherObject.relocate();
  } else if (otherObject instanceof Bullet) {
    this.game.remove(this);
    this.game.remove(otherObject);
  }
}


module.exports = Asteroid;
