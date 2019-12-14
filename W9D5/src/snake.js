const Coord = require("./coord.js");

class Snake {
    constructor() {
        this.segments = [[2,2], [2,1], [2,0]];
        this.directions = ["W", "W", "W"];
        // this.segments.push(this.randomPos());
    }
    
    move(newDir) {
        this.directions.pop();
        this.directions.unshift(newDir)
        this.directions.forEach((dir, i) => {
            let currX = this.segments[i][0];
            let currY = this.segments[i][1];
            if (this.direction === 'N') {
                currY -= 1;
            } else if (this.direction === 'S') {
                currY += 1;
            } else if (this.direction === 'W') {
                currX -= 1;
            } else {
                currX += 1;
            }
            this.segments[i] = [currX, currY];
        })
    }

    randomPos() {
        let x = Math.floor(Math.random() * 20);
        let y = Math.floor(Math.random() * 20);
        return [x,y]
    }


    grow() {

    }

    head() {
        return this.segments[0];
    }

    turn(newDir) {
        this.direction = newDir;
    }
}

module.exports = Snake;