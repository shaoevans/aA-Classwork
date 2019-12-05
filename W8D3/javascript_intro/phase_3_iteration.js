Array.prototype.bubbleSort = function () {
    let unsorted = true;
    while (unsorted) {
        unsorted = false;
        for (let i = 0; i < this.length - 1; i++) {
            if (this[i] > this[i + 1]) {
                unsorted = true;
                let temp = this[i];
                this[i] = this[i + 1];
                this[i + 1] = temp;
            }
        }
    }
    return this;
}
// console.log([5,4,3,2,1].bubbleSort());

String.prototype.substrings = function () {

    let result = []

    let l = 0
    while (l <= this.length) {

        for (let i = 0; i < this.length; i++) {
            if (l + i >= this.length) {
                break;
            }
            result.push(this.slice(i, (i + l + 1)))
        }


        l++
    }

    return result;

}

// console.log("abc".substrings())

