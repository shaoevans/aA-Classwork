const Util = require("./util.js");
const MovingObject = require("./moving_object.js");
// const Asteroid = require("./asteroid.js");

function Bullet(options) {
  MovingObject.call(this, options);
}

Util.inherits(Bullet, MovingObject)

Bullet.prototype.move = function () {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
  if (this.game.isOutOfBounds(this.pos)) {
    this.game.remove(this);
  }
}

// Bullet.prototype.collideWith = function (otherObject) {
//   if (otherObject instanceof Asteroid) {
//     this.game.remove(otherObject);
//     this.game.remove(this);
//   }
// }

module.exports = Bullet;