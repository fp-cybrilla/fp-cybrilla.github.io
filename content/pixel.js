/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
(function webpackUniversalModuleDefinition(root, factory) {
	if(typeof exports === 'object' && typeof module === 'object')
		module.exports = factory();
	else if(typeof define === 'function' && define.amd)
		define([], factory);
	else if(typeof exports === 'object')
		exports["Pixel"] = factory();
	else
		root["Pixel"] = factory();
})(self, function() {
return /******/ (() => { // webpackBootstrap
/******/ 	"use strict";
/******/ 	var __webpack_modules__ = ({

/***/ "./javascript/Collapse.js":
/*!********************************!*\
  !*** ./javascript/Collapse.js ***!
  \********************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"default\": () => (__WEBPACK_DEFAULT_EXPORT__)\n/* harmony export */ });\n/* harmony import */ var _helper__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./helper */ \"./javascript/helper.js\");\n\n\nclass Collapse {\n  constructor() {\n    this.ele = document.querySelectorAll('.collapse-title');\n    this.toggle();\n  }\n\n  toggle() {\n    this.ele.forEach((item, key) => {\n      const nextEle = item.nextElementSibling;\n\n      item.addEventListener('click', (event) => {\n        this.ele.forEach((ele) => {\n          if(item !== ele) {\n            const nextEle = ele.nextElementSibling;\n            nextEle.classList.remove('block');\n\n            // add class collapsing for smooth animation\n            nextEle.classList.add('collapsing');\n            nextEle.style.height = `${nextEle.clientHeight}px`;\n            \n            \n            // remove animation\n            setTimeout(() => {\n              nextEle.classList.remove('collapsing');\n              nextEle.style = \"\";\n              nextEle.classList.add('hidden');\n            }, 200);\n            ele.classList.remove(\"collapsed\");\n          }\n        });\n\n        // toggle class for collpased state\n        item.classList.toggle(\"collapsed\");\n\n        if(nextEle.classList.contains('hidden')) {\n          nextEle.classList.remove('hidden');\n\n          // add class collapsing for smooth animation\n          nextEle.classList.add('collapsing');\n          nextEle.style.height = `${nextEle.scrollHeight}px`;          \n\n          // remove animation\n          setTimeout(() => {\n            nextEle.classList.remove('collapsing');\n            nextEle.style = \"\";\n            nextEle.classList.add('block');\n          }, 200);\n        }\n        else {\n          // remove animation\n          setTimeout(() => {\n          nextEle.classList.remove('block');\n          \n          // add class collapsing for smooth animation\n          nextEle.classList.add('collapsing');\n\n            nextEle.classList.remove('collapsing');\n            nextEle.style = \"\";\n            nextEle.classList.add('hidden');\n          }, 200);\n        }\n      });\n    });\n  }\n}\n\nnew Collapse();\n/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (Collapse);\n\n\n//# sourceURL=webpack://Pixel/./javascript/Collapse.js?");

/***/ }),

/***/ "./javascript/Modal.js":
/*!*****************************!*\
  !*** ./javascript/Modal.js ***!
  \*****************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"default\": () => (__WEBPACK_DEFAULT_EXPORT__)\n/* harmony export */ });\nclass Modal {\n  constructor(id) {\n    if (id) {\n      this.elem = document.getElementById(id);\n      this.elem.classList.add('hidden');\n    }\n  };\n\n  show (callback) {\n    if(this.elem.classList.contains('hidden')) {\n      this.elem.classList.remove('hidden');\n      this.elem.classList.add('block');\n    }\n\n    if (callback) callback();\n  };\n}\n\n/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (Modal);\n\n\n//# sourceURL=webpack://Pixel/./javascript/Modal.js?");

/***/ }),

/***/ "./javascript/Video.js":
/*!*****************************!*\
  !*** ./javascript/Video.js ***!
  \*****************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"default\": () => (__WEBPACK_DEFAULT_EXPORT__)\n/* harmony export */ });\nclass Video {\n  constructor() {\n    this.player = document.querySelectorAll('.video-player');\n    this.init();\n  };\n\n  init() {\n    this.player.forEach(item => {\n      if(item.querySelector(\".video-player__play-btn\")) {\n        item.querySelector(\".video-player__play-btn\").addEventListener(\"click\", (event) => {\n          const video = item.querySelector(\"video\");\n          event.currentTarget.remove();\n          video.play();\n          video.setAttribute(\"controls\", true);\n        });\n      }\n    });\n  }\n}\n\nnew Video();\n/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (Video);\n\n//# sourceURL=webpack://Pixel/./javascript/Video.js?");

/***/ }),

/***/ "./javascript/helper.js":
/*!******************************!*\
  !*** ./javascript/helper.js ***!
  \******************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"show\": () => (/* binding */ show),\n/* harmony export */   \"hide\": () => (/* binding */ hide),\n/* harmony export */   \"getSelectorID\": () => (/* binding */ getSelectorID)\n/* harmony export */ });\n/**\n * show element via html element\n * @param {HTML Element} el\n */\nconst show = (el) => {\n  if(el.classList.contains('hidden')) {\n    el.classList.remove('hidden');\n    el.classList.add('block');\n  }\n};\n\n/**\n * hide element via html element\n * @param {HTML Element} el\n */\nconst hide = (el) => {\n  if(el.classList.contains('block')) {\n    el.classList.remove('block');\n    el.classList.add('hidden');\n  }\n};\n\n/**\n * get element id by tag name\n * @param {HTML Element} el\n */\nconst getSelectorID = (el) => {\n  let ids;\n  document.querySelectorAll(el).forEach((item) => {\n    return item.getAttribute(\"id\");\n  });\n}\n\n\n\n\n//# sourceURL=webpack://Pixel/./javascript/helper.js?");

/***/ }),

/***/ "./javascript/pixel.js":
/*!*****************************!*\
  !*** ./javascript/pixel.js ***!
  \*****************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"Modal\": () => (/* reexport safe */ _Modal__WEBPACK_IMPORTED_MODULE_0__.default),\n/* harmony export */   \"Collapse\": () => (/* reexport safe */ _Collapse__WEBPACK_IMPORTED_MODULE_1__.default),\n/* harmony export */   \"Video\": () => (/* reexport safe */ _Video__WEBPACK_IMPORTED_MODULE_2__.default)\n/* harmony export */ });\n/* harmony import */ var _Modal__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./Modal */ \"./javascript/Modal.js\");\n/* harmony import */ var _Collapse__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./Collapse */ \"./javascript/Collapse.js\");\n/* harmony import */ var _Video__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./Video */ \"./javascript/Video.js\");\n\n\n\n\n\n\n\n//# sourceURL=webpack://Pixel/./javascript/pixel.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	/* webpack/runtime/define property getters */
/******/ 	(() => {
/******/ 		// define getter functions for harmony exports
/******/ 		__webpack_require__.d = (exports, definition) => {
/******/ 			for(var key in definition) {
/******/ 				if(__webpack_require__.o(definition, key) && !__webpack_require__.o(exports, key)) {
/******/ 					Object.defineProperty(exports, key, { enumerable: true, get: definition[key] });
/******/ 				}
/******/ 			}
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/hasOwnProperty shorthand */
/******/ 	(() => {
/******/ 		__webpack_require__.o = (obj, prop) => (Object.prototype.hasOwnProperty.call(obj, prop))
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/make namespace object */
/******/ 	(() => {
/******/ 		// define __esModule on exports
/******/ 		__webpack_require__.r = (exports) => {
/******/ 			if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 				Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 			}
/******/ 			Object.defineProperty(exports, '__esModule', { value: true });
/******/ 		};
/******/ 	})();
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./javascript/pixel.js");
/******/ 	
/******/ 	return __webpack_exports__;
/******/ })()
;
});