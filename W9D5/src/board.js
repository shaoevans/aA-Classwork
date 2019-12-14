const Snake = require("./snake.js")
const Coord = require("./coord.js")

class Board {
    constructor() {
        this.snake = new Snake();
        this.applePos = Coord.randomPos;
    }

    IsEatApple() {
        return (this.snake.head()[0] === this.applePos[0]) && (this.snake.head()[1] === this.applePos[1]);
    }

    eatApple() {
        if (this.IsEatApple()) {
            this.snake.grow();
            this.applePos = Coord.randomPos();
        }
    }

    moveSnake(dir) {
        this.snake.move(dir);
    }

    getSnakeSegs() {
        return this.snake.segments;
    }

    move(dir) {
        this.snake.move(dir);
    }
}

module.exports = Board;