const Game = require("./game.js")
function GameView(ctx, canvas) {
  this.game = new Game(ctx, canvas);
  this.ctx = ctx;
  this.canvas = canvas;
  this.lastTime = 0;

  // const img = new Image();
  // img.onload = function () {
  //   ctx.drawImage(img, xOffset, yOffset);
  // };
  // img.src = "myImage.png";
}

GameView.prototype.start = function() {
  this.game.bindEventListener(this.canvas);
  this.game.addAsteroids();

  let that = this.game;
  requestAnimationFrame(this.animate.bind(this));

  // setInterval(this.game.step.bind(that), 20);

  // setInterval(this.game.draw.bind(that, this.ctx), 20);
  
}

GameView.prototype.animate = function(currentTime) {
  let delta = (this.lastTime - currentTime);
  this.game.step(delta);
  this.game.draw(this.ctx); 
  this.lastTime = new Date();
  requestAnimationFrame(this.animate.bind(this));
}



module.exports = GameView;