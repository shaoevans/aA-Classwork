// function sum() {
//     let arr = Array.from(arguments);
//     return arr.reduce((acc, ele) => acc + ele);
// }

// function sum(...args) {
//     return args.reduce((acc, ele) => acc + ele);
// }

// // console.log(sum(1, 2, 3, 4) === 10);
// // console.log(sum(1, 2, 3, 4, 5) === 15);

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}


// Function.prototype.myBind = function (item) {
//   let args = Array.from(arguments).slice(1);
//   let func = () => {
//     let args2 = Array.from(arguments)
//     let args3 = args.concat(args2);
//     return this.apply(item, args3);
//   }
//   return func;
// }

Function.prototype.myBind = function (item, ...args1) {
  return (...args2) => {
    let args3 = args1.concat(args2);
    return this.apply(item, args3)
  }
}

// const markov = new Cat("Markov");
// const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true

// // bind time args are "meow" and "Kush", no call time args
// console.log(markov.says.myBind(pavlov, "meow", "Kush")())
// markov.says.myBind(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// // Pavlov says meow to me!
// // true

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

Function.prototype.curry = function (num) {
  let arr = []
  let that = this;
  let func = function (num2) {
    arr.push(num2);
    if (arr.length === num) {
      return that.apply(that, arr);
    } else {
      return func;
    }
  }
  return func;
}

sumThree(4, 20, 6); // == 30

// you'll write `Function#curry`!
let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
f1 = f1(6); // = 30

// or more briefly:
console.log(sumThree.curry(3)(4)(20)(6)) // == 30

function curriedSum(numArgs) {
  let numbers = []
  let _curriedSum = function(n) {
    numbers.push(n);
    if (numbers.length === numArgs) {
      return numbers.reduce((acc, el) => acc + el);
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum; 
}
const sum = curriedSum(4);
console.log(sum(5)(30)(20)(1)) // => 56