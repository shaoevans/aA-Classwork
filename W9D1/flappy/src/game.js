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

  registerEvents() {
    this.boundClickHandler = this.click.bind(this);
    this.ctx.canvas.addEventListener("mousedown", this.boundClickHandler);
  }

  animate() {
    this.level.animate(this.ctx)
    this.bird.animate(this.ctx)
    requestAnimationFrame(this.animate.bind(this))


  }

  click() {

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

