import Level from "./level";
import Bird from "./bird";
import { request } from "http";

export default class FlappyBird {
  constructor(canvas){
    this.ctx = canvas.getContext("2d");
    this.dimensions = { width: canvas.width, height: canvas.height };
    this.restart();
    // this.level = new Level(this.dimensions);
    // this.bird = new Bird(this.dimensions);
  }

  animate() {
    while (this.running) {
      this.level.drawBackground(this.ctx);
      this.bird.move();
      this.bird.drawBird(this.ctx);
      if (this.running) {
        requestAnimationFrame(animate())
      }

    }

    
  }

  click() {
    this.ctx.addEventListener(mousedown, this)
    this.bird.flap();
  }

  restart() {
    this.running = false;
    this.bird = new Bird(this.dimensions)
    this.level = new Level(this.dimensions);
    this.animate();
  }

  play() {
    this.running = true;
    this.bird = new Bird(this.dimensions)
    this.level = new Level(this.dimensions);
    this.animate()
  }
}

