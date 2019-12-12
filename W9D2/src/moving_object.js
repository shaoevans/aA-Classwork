function MovingObject(options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
  this.game = options.game;
}

MovingObject.prototype.draw = function(ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();
  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI,
    false
  );
  ctx.fill();
}

MovingObject.prototype.move = function(delta) {
  // console.log(Math.floor(this.vel[0] * delta))
  this.pos[0] += (this.vel[0] * delta) / 3200000000000;
  this.pos[1] += (this.vel[1] * delta) / 3200000000000;
  // this.pos[0] += (this.vel[0] * delta)/20;
  // this.pos[1] += (this.vel[1] * delta)/20;
  // this.pos = [this.pos[0] + velX, this.pos[1] + velY];
  newPos = this.game.wrap(this.pos);
  this.pos[0] = newPos[0];
  this.pos[1] = newPos[1];
}

MovingObject.prototype.isCollideWith = function(otherObject) {
  let dist = Math.sqrt(Math.pow((this.pos[0] - otherObject.pos[0]),2) + Math.pow((this.pos[1] - otherObject.pos[1]),2));
  let radSum = this.radius + otherObject.radius;
  return (dist < radSum);
}

MovingObject.prototype.collideWith = function(otherObject) {
//   // this.game.remove(this);
//   // this.game.remove(otherObject);
}

module.exports = MovingObject;


