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

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\");\nconst Bullet = __webpack_require__(/*! ./bullet.js */ \"./src/bullet.js\");\n\nfunction Asteroid(options) {\n  MovingObject.call(this, options);\n  this.color = Asteroid.COLOR;\n  this.radius = Asteroid.RADIUS;\n  this.vel = Util.randomVec(5);\n}\n\nAsteroid.COLOR = \"#00FF00\";\nAsteroid.RADIUS = 30;\nUtil.inherits(Asteroid, MovingObject);\n\nAsteroid.prototype.collideWith = function(otherObject) {\n  if (otherObject instanceof Ship) {\n    otherObject.relocate();\n  } else if (otherObject instanceof Bullet) {\n    this.game.remove(this);\n    this.game.remove(otherObject);\n  }\n}\n\n\nmodule.exports = Asteroid;\n\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/bullet.js":
/*!***********************!*\
  !*** ./src/bullet.js ***!
  \***********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\n// const Asteroid = require(\"./asteroid.js\");\n\nfunction Bullet(options) {\n  MovingObject.call(this, options);\n}\n\nUtil.inherits(Bullet, MovingObject)\n\nBullet.prototype.move = function () {\n  this.pos[0] += this.vel[0];\n  this.pos[1] += this.vel[1];\n  if (this.game.isOutOfBounds(this.pos)) {\n    this.game.remove(this);\n  }\n}\n\n// Bullet.prototype.collideWith = function (otherObject) {\n//   if (otherObject instanceof Asteroid) {\n//     this.game.remove(otherObject);\n//     this.game.remove(this);\n//   }\n// }\n\nmodule.exports = Bullet;\n\n//# sourceURL=webpack:///./src/bullet.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\");\nconst Bullet = __webpack_require__(/*! ./bullet.js */ \"./src/bullet.js\");\n\nfunction Game(ctx, canvas) {\n  this.ctx = ctx;\n  this.asteroids = [];\n  this.bullets = [];\n  this.ship = new Ship(this.randomPosition());\n}\n\nGame.prototype.addAsteroids = function() {\n  for(let i = 0; i < Game.NUM_ASTEROIDS; i++) {\n    this.asteroids.push(new Asteroid(this.randomPosition()));\n  }\n};\n\nGame.prototype.randomPosition = function() {\n  let randomPos = {};\n  randomPos.pos = [];\n  randomPos.game = this;\n  randomPos.pos.push(Math.floor(Math.random() * Game.DIM_X));\n  randomPos.pos.push(Math.floor(Math.random() * Game.DIM_Y));\n  return randomPos;\n};\n\nGame.prototype.draw = function(ctx) {\n  ctx.clearRect(0,0,Game.DIM_X, Game.DIM_Y);\n  this.allObjects().forEach((object) => {\n    object.draw(ctx);\n  });\n};\n\nGame.prototype.moveObjects = function(delta) {\n  delta = delta || 1\n  this.allObjects().forEach((object) => {\n    object.move(delta);\n  });\n};\n\nGame.prototype.wrap = function(pos) {\n  newWidth = pos[0] % Game.DIM_X;\n  newHeight = pos[1] % Game.DIM_Y;\n  if (newWidth < 0) {\n    newWidth = Game.DIM_X;\n  }\n  if (newHeight < 0) {\n    newHeight = Game.DIM_Y;\n  }\n  return [newWidth,newHeight];\n};\n\nGame.prototype.bindEventListener = function(canvas) {\n  canvas.addEventListener(\"keydown\", (event) => {\n \n    if (event.keyCode === 68) {\n      this.ship.power([1, 0]);\n      //d\n    } else if (event.keyCode === 83) {\n      this.ship.power([0, 1]);\n      //s\n    } else if (event.keyCode === 87) {\n      this.ship.power([0, -1]);\n      //w \n    } else if (event.keyCode === 65) {\n      this.ship.power([-1, 0]);\n      //a\n    }\n  });\n};\n\n\n\nGame.prototype.checkCollisions = function() {\n  for (let i = 0; i < this.allObjects().length; i++) {\n    for (let j = 0; j < this.allObjects().length; j++) {\n      if (i !== j) {\n        if (this.allObjects()[i].isCollideWith(this.allObjects()[j])) {\n          this.allObjects()[i].collideWith(this.allObjects()[j]);\n          // if (this.ship === this.allObjects()[i] || this.ship === this.allObjects()[j]) {\n          //   this.ship.relocate();\n          // }\n          \n        }\n      }\n    }\n  }\n};\n\nGame.prototype.remove = function(object) {\n  if (object instanceof Asteroid) {\n    this.asteroids = this.asteroids.filter((el) => {\n      return (el !== object);\n    });\n  } else if (object instanceof Bullet) {\n    this.bullets = this.bullets.filter((el) => {\n      return (el !== object);\n    });\n  }\n};\n\nGame.prototype.add = function(object) {\n  if (object instanceof Asteroid) {\n    this.asteroids.push(object);\n  } else if (object instanceof Bullet) {\n    this.bullets.push(object);\n  }\n}\n\nGame.prototype.step = function(delta) {\n  this.moveObjects(delta);\n  this.checkCollisions();\n};\n\nGame.prototype.allObjects = function() {\n  return this.asteroids.concat([this.ship]).concat(this.bullets);\n}\n\nGame.prototype.isOutOfBounds = function(pos) {\n  return ((pos[0] > Game.DIM_X) || (pos[0] < 0) || (pos[1] > Game.DIM_Y) || (pos[1] < 0));\n}\n\nGame.DIM_X = 1000;\nGame.DIM_Y = 800;\nGame.NUM_ASTEROIDS = 15;\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\")\nfunction GameView(ctx, canvas) {\n  this.game = new Game(ctx, canvas);\n  this.ctx = ctx;\n  this.canvas = canvas;\n  this.lastTime = 0;\n\n  // const img = new Image();\n  // img.onload = function () {\n  //   ctx.drawImage(img, xOffset, yOffset);\n  // };\n  // img.src = \"myImage.png\";\n}\n\nGameView.prototype.start = function() {\n  this.game.bindEventListener(this.canvas);\n  this.game.addAsteroids();\n\n  let that = this.game;\n  requestAnimationFrame(this.animate.bind(this));\n\n  // setInterval(this.game.step.bind(that), 20);\n\n  // setInterval(this.game.draw.bind(that, this.ctx), 20);\n  \n}\n\nGameView.prototype.animate = function(currentTime) {\n  let delta = (this.lastTime - currentTime);\n  this.game.step(delta);\n  this.game.draw(this.ctx); \n  this.lastTime = new Date();\n  requestAnimationFrame(this.animate.bind(this));\n}\n\n\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\")\nwindow.addEventListener('DOMContentLoaded', (event) => {\n  let canvas = document.getElementById('game-canvas')\n  let ctx = canvas.getContext(\"2d\");\n  const view = new GameView(ctx, canvas);\n  view.start();\n  window.addEventListener('keydown', (event) => {\n    console.log(event)\n    if (event.keyCode === 68) {\n      view.game.ship.power([1, 0]);\n      //d\n    } else if (event.keyCode === 83) {\n      view.game.ship.power([0, 1]);\n      //s\n    } else if (event.keyCode === 87) {\n      view.game.ship.power([0, -1]);\n      //w \n    } else if (event.keyCode === 65) {\n      view.game.ship.power([-1, 0]);\n      //a\n    } else if (event.keyCode === 32) {\n      view.game.ship.fireBullet();\n    }\n  })\n  // mo.draw(ctx);\n});\n\nwindow.MovingObject = MovingObject;\n\nconst mo = new MovingObject({\n  pos: [80, 80],\n  vel: [10, 20],\n  radius: 10,\n  color: \"#00FF00\"\n});\n\n\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function MovingObject(options) {\n  this.pos = options.pos;\n  this.vel = options.vel;\n  this.radius = options.radius;\n  this.color = options.color;\n  this.game = options.game;\n}\n\nMovingObject.prototype.draw = function(ctx) {\n  ctx.fillStyle = this.color;\n  ctx.beginPath();\n  ctx.arc(\n    this.pos[0],\n    this.pos[1],\n    this.radius,\n    0,\n    2 * Math.PI,\n    false\n  );\n  ctx.fill();\n}\n\nMovingObject.prototype.move = function(delta) {\n  // console.log(Math.floor(this.vel[0] * delta))\n  this.pos[0] += (this.vel[0] * delta) / 3200000000000;\n  this.pos[1] += (this.vel[1] * delta) / 3200000000000;\n  // this.pos[0] += (this.vel[0] * delta)/20;\n  // this.pos[1] += (this.vel[1] * delta)/20;\n  // this.pos = [this.pos[0] + velX, this.pos[1] + velY];\n  newPos = this.game.wrap(this.pos);\n  this.pos[0] = newPos[0];\n  this.pos[1] = newPos[1];\n}\n\nMovingObject.prototype.isCollideWith = function(otherObject) {\n  let dist = Math.sqrt(Math.pow((this.pos[0] - otherObject.pos[0]),2) + Math.pow((this.pos[1] - otherObject.pos[1]),2));\n  let radSum = this.radius + otherObject.radius;\n  return (dist < radSum);\n}\n\nMovingObject.prototype.collideWith = function(otherObject) {\n//   // this.game.remove(this);\n//   // this.game.remove(otherObject);\n}\n\nmodule.exports = MovingObject;\n\n\n\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Bullet = __webpack_require__(/*! ./bullet.js */ \"./src/bullet.js\");\n\nfunction Ship(options) {\n  MovingObject.call(this, options);\n  this.color = Ship.COLOR;\n  this.radius = Ship.RADIUS;\n  this.vel = [0,0];\n\n}\n\n\nShip.RADIUS = 20;\nShip.COLOR = \"white\";\nUtil.inherits(Ship, MovingObject);\n\nShip.prototype.relocate = function() {\n  this.pos = this.game.randomPosition().pos;\n  this.vel = [0,0];\n}\n\nShip.prototype.power = function(impulse) {\n  this.vel[0] += impulse[0];\n  this.vel[1] += impulse[1];\n}\n\nShip.prototype.fireBullet = function() {\n  options = {\n    game: this.game,\n    vel: [],\n    radius: 10,\n    pos: [this.pos[0], this.pos[1]],\n    color: \"yellow\"\n  }\n  if (this.vel[0] === 0) {\n    options.vel[0] = 0;\n  } else {\n    options.vel[0] = (this.vel[0] / Math.abs(this.vel[0])) * 50;\n  }\n  if (this.vel[1] === 0) {\n    options.vel[1] = 0;\n  } else {\n    options.vel[1] = (this.vel[1] / Math.abs(this.vel[1])) * 50;\n  }\n  if ((this.vel[0] !== 0) || (this.vel[1] !== 0)) {\n    let shot = new Bullet(options);\n    this.game.add(shot);\n  }\n\n\n\n}\n\nmodule.exports = Ship;\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("\n\nconst Util = {\n  inherits(childClass, parentClass) {\n    let Surrogate = function() {};\n    Surrogate.prototype = parentClass.prototype;\n    childClass.prototype = new Surrogate();\n    childClass.prototype.constructor = childClass;\n  },\n  randomVec(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n  // Scale the length of a vector by the given amount.\n  scale(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n  }\n}\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ });