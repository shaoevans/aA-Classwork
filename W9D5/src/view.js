const Board = require("./board.js")

class View {
    constructor(el) {
        this.webEl = el;
        this.board = new Board();
        this.setupBoard();
        this.currDir= "E"
        setInterval(this.step.bind(this), 400);
        document.addEventListener('keydown', (e) => {
            if (e.keyCode === 4 ) {
                return
            } else if (e.keyCode === 3 ) {
                return
            } else if (e.keyCode ===  2) {
                return
            } else if (e.keyCode === 1 ) {
                return
            }
        })
    }

    

    step() {
        this.board.move(this.currDir);
        this.addSnake();
    }

    setupBoard() {
        for (let i = 0; i < 20; i++) {
            console.log("a")
            this.webEl.innerHTML += '<ul></ul>'
            let ul = this.webEl.children[i];
            for (let j = 0; j < 20; j++) {
                ul.innerHTML += '<li></li>'
            }
        }
    }

    getSnakeSegs() {
        return this.board.getSnakeSegs();

    }

    addSnake() {
        for (let i = 0; i < 20; i++) {
            for (let j = 0; j < 20; j++) {
                console.log(this.webEl)
                let li = this.webEl.children[i].children[j];
                li.setAttribute("class", "");
            }
        }
        let segments = this.getSnakeSegs();
        console.log(segments);
        segments.forEach((pos) => {
            let y = pos[0];
            let x = pos[1];
            let li = this.webEl.children[y].children[x];
            console.log(li)
            li.setAttribute("class", "snake");
        });

    }
}

module.exports = View;