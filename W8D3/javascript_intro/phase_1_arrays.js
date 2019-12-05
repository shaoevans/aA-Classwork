Array.prototype.uniq = function () {
    return Array.from(new Set(this));
}

// console.log([1,2,2,3,3,3].uniq())

Array.prototype.twoSum = function () {
    let result = [];
    this.forEach(function (el, i, arr) {
        let j = i + 1;
        while (j < arr.length) {
            if (arr[j] + el === 0) {
                result.push([i, j])
            }
            j++;
        }
    });
    return result;
}

// console.log([1,2,3,-1].twoSum())

Array.prototype.transpose = function () {
    let result = [];
    this[0].forEach(el => result.push([]));
    for (let i = 0; i < this.length; i++) {
        for (let j = 0; j < this[i].length; j++) {
            result[j][i] = this[i][j];
        }
    }
    return result;
}

// console.log([[1,2],[3,4],[5,6]].transpose())


// console.log([[1,3,5],[2,4,6]].transpose())

