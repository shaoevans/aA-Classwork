const Util = require("./util.js");
const MovingObject = require("./moving_object.js");
const Bullet = require("./bullet.js");

function Ship(options) {
  MovingObject.call(this, options);
  this.color = Ship.COLOR;
  this.radius = Ship.RADIUS;
  this.vel = [0,0];

}


Ship.RADIUS = 20;
Ship.COLOR = "white";
Util.inherits(Ship, MovingObject);

Ship.prototype.relocate = function() {
  this.pos = this.game.randomPosition().pos;
  this.vel = [0,0];
}

Ship.prototype.power = function(impulse) {
  this.vel[0] += impulse[0];
  this.vel[1] += impulse[1];
}

Ship.prototype.fireBullet = function() {
  options = {
    game: this.game,
    vel: [],
    radius: 10,
    pos: [this.pos[0], this.pos[1]],
    color: "yellow"
  }
  if (this.vel[0] === 0) {
    options.vel[0] = 0;
  } else {
    options.vel[0] = (this.vel[0] / Math.abs(this.vel[0])) * 50;
  }
  if (this.vel[1] === 0) {
    options.vel[1] = 0;
  } else {
    options.vel[1] = (this.vel[1] / Math.abs(this.vel[1])) * 50;
  }
  if ((this.vel[0] !== 0) || (this.vel[1] !== 0)) {
    let shot = new Bullet(options);
    this.game.add(shot);
  }



}

module.exports = Ship;