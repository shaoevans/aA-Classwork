/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/board.js":
/*!**********************!*\
  !*** ./src/board.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Snake = __webpack_require__(/*! ./snake.js */ \"./src/snake.js\")\nconst Coord = __webpack_require__(/*! ./coord.js */ \"./src/coord.js\")\n\nclass Board {\n    constructor() {\n        this.snake = new Snake();\n        this.applePos = Coord.randomPos;\n    }\n\n    IsEatApple() {\n        return (this.snake.head()[0] === this.applePos[0]) && (this.snake.head()[1] === this.applePos[1]);\n    }\n\n    eatApple() {\n        if (this.IsEatApple()) {\n            this.snake.grow();\n            this.applePos = Coord.randomPos();\n        }\n    }\n\n    moveSnake(dir) {\n        this.snake.move(dir);\n    }\n\n    getSnakeSegs() {\n        return this.snake.segments;\n    }\n\n    move(dir) {\n        this.snake.move(dir);\n    }\n}\n\nmodule.exports = Board;\n\n//# sourceURL=webpack:///./src/board.js?");

/***/ }),

/***/ "./src/coord.js":
/*!**********************!*\
  !*** ./src/coord.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class Coord {\n    plus() {\n\n    }\n\n    equals() {\n\n    }\n\n    isOpposite(currDir, newDir) {\n        if (currDir === \"N\") {\n            return newDir === \"S\";\n        } else if (currDir === \"S\") {\n            return newDir === \"N\";\n        } else if (currDir === \"W\") {\n            return newDir === \"E\" \n        } else {\n            return newDir === \"W\"\n        }\n    }\n\n    randomPos() {\n        let x = Math.floor(Math.random() * 20);\n        let y = Math.floor(Math.random() * 20);\n        return [x,y]\n    }\n}\n\nmodule.exports = Coord\n\n//# sourceURL=webpack:///./src/coord.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const View = __webpack_require__(/*! ./view.js */ \"./src/view.js\")\n\ndocument.addEventListener('DOMContentLoaded', (e) => {\n    let snakeGame = document.querySelector(\".snake-game\")\n    new View(snakeGame);\n})\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/snake.js":
/*!**********************!*\
  !*** ./src/snake.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Coord = __webpack_require__(/*! ./coord.js */ \"./src/coord.js\");\n\nclass Snake {\n    constructor() {\n        this.segments = [[2,2], [2,1], [2,0]];\n        this.directions = [\"W\", \"W\", \"W\"];\n        // this.segments.push(this.randomPos());\n    }\n    \n    move(newDir) {\n        this.directions.pop();\n        this.directions.unshift(newDir)\n        this.directions.forEach((dir, i) => {\n            let currX = this.segments[i][0];\n            let currY = this.segments[i][1];\n            if (this.direction === 'N') {\n                currY -= 1;\n            } else if (this.direction === 'S') {\n                currY += 1;\n            } else if (this.direction === 'W') {\n                currX -= 1;\n            } else {\n                currX += 1;\n            }\n            this.segments[i] = [currX, currY];\n        })\n    }\n\n    randomPos() {\n        let x = Math.floor(Math.random() * 20);\n        let y = Math.floor(Math.random() * 20);\n        return [x,y]\n    }\n\n\n    grow() {\n\n    }\n\n    head() {\n        return this.segments[0];\n    }\n\n    turn(newDir) {\n        this.direction = newDir;\n    }\n}\n\nmodule.exports = Snake;\n\n//# sourceURL=webpack:///./src/snake.js?");

/***/ }),

/***/ "./src/view.js":
/*!*********************!*\
  !*** ./src/view.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Board = __webpack_require__(/*! ./board.js */ \"./src/board.js\")\n\nclass View {\n    constructor(el) {\n        this.webEl = el;\n        this.board = new Board();\n        this.setupBoard();\n        this.currDir= \"E\"\n        setInterval(this.step.bind(this), 400);\n        document.addEventListener('keydown', (e) => {\n            if (e.keyCode === 4 ) {\n                return\n            } else if (e.keyCode === 3 ) {\n                return\n            } else if (e.keyCode ===  2) {\n                return\n            } else if (e.keyCode === 1 ) {\n                return\n            }\n        })\n    }\n\n    \n\n    step() {\n        this.board.move(this.currDir);\n        this.addSnake();\n    }\n\n    setupBoard() {\n        for (let i = 0; i < 20; i++) {\n            console.log(\"a\")\n            this.webEl.innerHTML += '<ul></ul>'\n            let ul = this.webEl.children[i];\n            for (let j = 0; j < 20; j++) {\n                ul.innerHTML += '<li></li>'\n            }\n        }\n    }\n\n    getSnakeSegs() {\n        return this.board.getSnakeSegs();\n\n    }\n\n    addSnake() {\n        for (let i = 0; i < 20; i++) {\n            for (let j = 0; j < 20; j++) {\n                console.log(this.webEl)\n                let li = this.webEl.children[i].children[j];\n                li.setAttribute(\"class\", \"\");\n            }\n        }\n        let segments = this.getSnakeSegs();\n        console.log(segments);\n        segments.forEach((pos) => {\n            let y = pos[0];\n            let x = pos[1];\n            let li = this.webEl.children[y].children[x];\n            console.log(li)\n            li.setAttribute(\"class\", \"snake\");\n        });\n\n    }\n}\n\nmodule.exports = View;\n\n//# sourceURL=webpack:///./src/view.js?");

/***/ })

/******/ });