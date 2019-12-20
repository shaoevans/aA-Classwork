import React from "react";
import * as Minesweeper from "../minesweeper";
import Board from "./board"

class Game extends React.Component {
    constructor(props) {
        super(props)
        this.state = {board: new Minesweeper.Board(9, 7), modalIsHidden: true}
        this.updateGame = this.updateGame.bind(this);
        this.restartGame = this.restartGame.bind(this);
        this.modalIsHidden = true; 
    }

    updateGame(tile, flagging) {
        if (flagging) { 
            tile.toggleFlag();
        } else {
            tile.explore();
        }
        this.setState({ board: this.state.board }, );
    }


    restartGame() {
        this.setState({ board: new Minesweeper.Board(9, 7)})
    }

    removeModal() {
        this.setState({modalisHidden: false}); 
    }

    

    isOver() {
        if (this.state.board.lost()) {
            return ( 
            <section id="modal" class="modal is-active">
                <article class="modal-content">
                    <span class="modal-close js-hide-modal"></span>
            
                    <h1>You Lost!</h1>
            
                    <button onClick={this.restartGame}>Play Again</button>
                </article>
                <div class="modal-screen js-hide-modal"></div>
            </section>
            )
        } else if (this.state.board.won()) {
            return ( 
                <section id="modal" class="modal is-active">
                    <article class="modal-content">
                        <span class="modal-close js-hide-modal"></span>
                
                        <h1>You Won!</h1>
                
                        <button onClick={this.restartGame}>Play Again</button>
                    </article>
                    <div class="modal-screen js-hide-modal"></div>
                </section>
                )
        }
    }

    render() {

        return (
            <div className="board-container">
                <Board board={this.state.board} updateGame={this.updateGame}/>
                {this.isOver()}
            </div>
        )
    }
}

export default Game