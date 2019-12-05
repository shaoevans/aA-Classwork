const board = require("./board.js");

function Aiplayer(board, game) {
    this.name = "Skynet"
    this.board = board;
    this.game = game;

}

Aiplayer.prototype.getAction(board) = function () {
    validMoves = board.validMoves(color);
    return validMoves[getRandomInt(validMoves.length)];
}

function getRandomInt(max) {
    return Math.floor(Math.random() * Math.floor(max));
}

// validMap = {}
// validMoves.forEach((move) => {
    
// validMap[move] = _positionsToFlip(board, move, game.turn, dir, []])
// })