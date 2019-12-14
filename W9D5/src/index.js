const View = require("./view.js")

document.addEventListener('DOMContentLoaded', (e) => {
    let snakeGame = document.querySelector(".snake-game")
    new View(snakeGame);
})