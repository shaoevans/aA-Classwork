function range(start, end) {
    if (start + 1 === end) {
        return start;
    }
    return [start].concat(range(start + 1, end))
}

// console.log(range(1,5))

function sumRec(arr) {
    if (arr.length === 1) {
        return arr[0];
    }
    return arr[0] += sumRec(arr.slice(1));

}

// console.log(sumRec([1,2,3,4,5]))

function exponent(base, exp) {
    if (exp === 0) {
        return 1;
    }
    if (exp > 0) {
        return base * exponent(base, exp - 1)
    } else {

        return 1 / (base * exponent(base, -exp - 1))
    }


}

// console.log(exponent(5, -3))

function exponent2(base, exp) {
    if (exp === 0) {
        return 1
    }
    if (exp === 1) {
        return base
    }

    if (exp % 2 === 0) {
        return exponent2(base, exp / 2) * exponent2(base, exp / 2)
    } else {
        return base * (exponent2(base, (exp - 1) / 2) * exponent2(base, (exp - 1) / 2))
    }
}

function fibonacci(n) {
    if (n === 1) {
        return [0]
    } else if (n === 2) {
        return [0, 1]
    }
    let fibs = fibonacci(n - 1)
    fibs.push(fibs[fibs.length - 1] + fibs[fibs.length - 2])
    return fibs
}


// console.log(fibonacci(10))

function deep_dup(arr) {
    return arr.map(el => Array.isArray(el) ? deep_dup(el) : el)
}

// console.log(deep_dup([1,2,3,[4,5,[1,2]]]))

function bsearch(arr, target) {
    let mid = Math.floor(arr.length / 2);

    if (!arr.length) {
        return -1
    }
    if (arr[mid] === target) {
        return mid
    }

    if (arr[mid] < target) {
        let result = bsearch(arr.slice(mid + 1), target)
        return result === -1 ? -1 : result + mid + 1
    } else {
        return bsearch(arr.slice(0, mid), target)
    }



}


// console.log(bsearch([1,2,3,4,5,6,7], 28))

function mergesort(arr) {
    if (arr.length <= 1) {
        return arr
    }
    let mid = Math.floor(arr.length / 2)
    return mergeHelper(mergesort(arr.slice(0, mid)), mergesort(arr.slice(mid)))
}

function mergeHelper(arr1, arr2) {

    let result = []
    while (arr1.length && arr2.length) {
        if (arr1[0] < arr2[0]) {
            result.push(arr1.shift());
        } else {
            result.push(arr2.shift());
        }
    }
    return [...result, ...arr1, ...arr2]
}

// console.log(mergesort([6,5,4,3,2,1]))

// [a,b,c] 
// [[], [a], [b], [a,b], [c], [a,c], [b,c], [a,b,c]]

function subsets(arr) {

    if (!arr.length) {
        return [[]]
    }

    arr.forEach(function (el, i) {
        subsets(arr.slice(0, i).concat(subsets(arr.slice(i))))
    })
    return result

}

// function subsets(arr) {
//     let result = [[]]
//     let resultTemp = result.slice();
//     arr.forEach(function(el) {
//       result.forEach(function(el2) {
//         resultTemp.push(el2.concat(el))
//       })
//       result = resultTemp;  
//     })
//     return result;
// }

console.log(subsets([1, 2, 3]))