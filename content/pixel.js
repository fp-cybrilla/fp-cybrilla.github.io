'use strict';

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Modal = function () {
  function Modal(id) {
    _classCallCheck(this, Modal);

    if (id) {
      this.elem = document.getElementById(id);
      this.elem.classList.add('hidden');
    }
  }

  _createClass(Modal, [{
    key: 'show',
    value: function show(callback) {
      if (this.elem.classList.contains('hidden')) {
        this.elem.classList.remove('hidden');
        this.elem.classList.add('block');
      }

      if (callback) callback();
    }
  }]);

  return Modal;
}();

var Collapse = function () {
  function Collapse() {
    _classCallCheck(this, Collapse);

    this.ele = document.querySelectorAll('.collapse-title');
    this.toggle();
  }

  _createClass(Collapse, [{
    key: 'toggle',
    value: function toggle() {
      this.ele.forEach(function (item, key) {
        var nextEle = item.nextElementSibling;
        var iconElement = item.querySelector('.collapse-icon');
        iconElement.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16"><g transform="translate(0 16) rotate(-90)"><g transform="translate(1.41 4.022)"><rect fill="#6F809E" width="1.667" height="9.575" rx="0.833" transform="translate(0 1.179) rotate(-45)"/><rect fill="#6F809E" width="1.667" height="9.575" rx="0.833" transform="translate(6.761 7.949) rotate(-135)"/></g><rect class="b" fill="none" width="16" height="16" transform="translate(0 0)"/></g></svg>';

        item.addEventListener('click', function () {
          if (nextEle.classList.contains('hidden')) {
            nextEle.classList.remove('hidden');
            nextEle.classList.add('block');
            iconElement.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16"><g transform="translate(0 0)"><g transform="translate(1.41 4.022)"><rect fill="#6F809E" width="1.667" height="9.575" rx="0.833" transform="translate(0 1.179) rotate(-45)"/><rect fill="#6F809E" width="1.667" height="9.575" rx="0.833" transform="translate(6.761 7.949) rotate(-135)"/></g><rect class="b" fill="none" width="16" height="16" transform="translate(0 0)"/></g></svg>';
          } else {
            nextEle.classList.remove('block');
            nextEle.classList.add('hidden');
            iconElement.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16"><g transform="translate(0 16) rotate(-90)"><g transform="translate(1.41 4.022)"><rect fill="#6F809E" width="1.667" height="9.575" rx="0.833" transform="translate(0 1.179) rotate(-45)"/><rect fill="#6F809E" width="1.667" height="9.575" rx="0.833" transform="translate(6.761 7.949) rotate(-135)"/></g><rect class="b" fill="none" width="16" height="16" transform="translate(0 0)"/></g></svg>';
          }
        });
      });
    }
  }]);

  return Collapse;
}();
