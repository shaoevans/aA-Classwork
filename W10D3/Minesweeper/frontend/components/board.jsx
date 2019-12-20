import React from "react";
import Tile from "./tile";

class Board extends React.Component {
    constructor(props) {
        super(props)

    }

    render() {
        let grid = this.props.board.grid;
        return (

            <div>
                <h1>Minesweeper!</h1>
                <p className="instructions">
                    Click to explore a tile!
                    <br/>
                    Hold ALT to flag tile
                </p>
                <div className="board">
                    { grid.map((row, i) => {
                        return (
                            <div key={i} className="row">   
                            {row.map((tile, j) => {
                                return <Tile key={i, j} tile={tile} updateGame={this.props.updateGame} />
                            })}
                            </div>
                        )
                    }) } 
                </div>

            </div>
 
        )
    }

}

export default Board;