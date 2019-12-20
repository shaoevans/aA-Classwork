import React from "react";

class Tile extends React.Component {
    constructor(props) {
        super(props);
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(e) {
        if (e.altKey) {
            this.props.updateGame(this.props.tile, true)
        } else {
            this.props.updateGame(this.props.tile, false)
        }
    } 

    render() {

        let {tile} = this.props;
        if (tile.bombed && tile.explored) {
            return (
                <div className="tile bombed" onClick={this.handleClick}>
                    💣
                </div>
            )

        } else if (tile.flagged) {
            return (
                <div className="tile flagged" onClick={this.handleClick}>
                    ⚑
                </div>
            )
        } else if (tile.explored) {
            return (
                <div className="tile explored" onClick={this.handleClick}>
                    {tile.adjacentBombCount()}
                </div>
            )
        } else {
            return (
                <div className="tile unexplored" onClick={this.handleClick}>

                </div>
            )
        }
    }
}

export default Tile;