class Coord {
    plus() {

    }

    equals() {

    }

    isOpposite(currDir, newDir) {
        if (currDir === "N") {
            return newDir === "S";
        } else if (currDir === "S") {
            return newDir === "N";
        } else if (currDir === "W") {
            return newDir === "E" 
        } else {
            return newDir === "W"
        }
    }

    randomPos() {
        let x = Math.floor(Math.random() * 20);
        let y = Math.floor(Math.random() * 20);
        return [x,y]
    }
}

module.exports = Coord