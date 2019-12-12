const MovingObject = require("./moving_object.js");
const GameView = require("./game_view.js")
window.addEventListener('DOMContentLoaded', (event) => {
  let canvas = document.getElementById('game-canvas')
  let ctx = canvas.getContext("2d");
  const view = new GameView(ctx, canvas);
  view.start();
  window.addEventListener('keydown', (event) => {
    console.log(event)
    if (event.keyCode === 68) {
      view.game.ship.power([1, 0]);
      //d
    } else if (event.keyCode === 83) {
      view.game.ship.power([0, 1]);
      //s
    } else if (event.keyCode === 87) {
      view.game.ship.power([0, -1]);
      //w 
    } else if (event.keyCode === 65) {
      view.game.ship.power([-1, 0]);
      //a
    } else if (event.keyCode === 32) {
      view.game.ship.fireBullet();
    }
  })
  // mo.draw(ctx);
});

window.MovingObject = MovingObject;

const mo = new MovingObject({
  pos: [80, 80],
  vel: [10, 20],
  radius: 10,
  color: "#00FF00"
});



