const CONSTANTS = {
  GRAVITY: 0.8,
  FLAP_SPEED: -8,
  TERMINAL_VEL: 12,
  BIRD_WIDTH: 40,
  BIRD_HEIGHT: 30
};

export default class Bird {
  constructor(dimensions) {
    this.velocity = 0;
    this.height = (dimensions.height / 2);
    this.width = (dimensions.width / 3);
  }

  drawBird(ctx) {
    ctx.fillStyle = "yellow";
    ctx.fillRect(this.width, this.height, CONSTANTS.BIRD_WIDTH, CONSTANTS.BIRD_HEIGHT);
  }

  move() {
    this.height += this.velocity;
    this.velocity += CONSTANTS.GRAVITY;
  }

  flap() {
    this.velocity = CONSTANTS.FLAP_SPEED;
  }
}