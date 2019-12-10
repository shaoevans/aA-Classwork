Function.prototype.inherits = function (parent) {
  function Surrogate(){};
  Surrogate.prototype = parent.prototype; 
  let surrogate = new Surrogate();
  this.prototype = surrogate;
  this.prototype.constructor = this;
}

function MovingObject(speed, x, y) { 
  this.speed = speed;
  this.x = x;
  this.y = y;


}

MovingObject.prototype.makeNoise = function() {
  return "asdf";
}

function Ship(speed, x, y) {
  MovingObject.call(this, speed, x, y);
  this.name = "USS ENTERPRISE";
 }
Ship.inherits(MovingObject);

function Asteroid() { }
Asteroid.inherits(MovingObject);

enterprise = new Ship(100, 100, 50)
console.log(enterprise.speed)
console.log(enterprise.x)
console.log(enterprise.y)
console.log(enterprise.makeNoise())