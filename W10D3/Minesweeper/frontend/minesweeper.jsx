import React from "react";
import ReactDOM from "react-dom";
import Game from "./components/game.jsx"

function Minesweeper() {
    return (
        <Game />
    )
}

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root")
    ReactDOM.render(<Minesweeper />,root)
});


