Array.prototype.myEach = function (cb) {

    for (let i = 0; i < this.length; i++) {
        cb(this[i], i, this);
    }
}

Array.prototype.myMap = function (cb) {
    let result = []

    this.myEach(function (el) {
        result.push(cb(el));
    })
    return result;
}

Array.prototype.myReduce = function (cb, acc) {

    let start = 0;
    if (!acc) {
        acc = this[0];
        start = 1;
    }

    for (let i = start; i < this.length; i++) {

        acc = cb(acc, this[i]);
    }
    return acc;
}

// let a = [1, 2, 3].myReduce(function(acc, el) {
//   return acc + el;
// },25);
// console.log(a)

