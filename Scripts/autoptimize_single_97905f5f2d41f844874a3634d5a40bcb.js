(function (modules) {
    var installedModules = {}; function __webpack_require__(moduleId) {
        if (installedModules[moduleId]) { return installedModules[moduleId].exports; }
        var module = installedModules[moduleId] = { i: moduleId, l: false, exports: {} }; modules[moduleId].call(module.exports, module, module.exports, __webpack_require__); module.l = true; return module.exports;
    }
    __webpack_require__.m = modules; __webpack_require__.c = installedModules; __webpack_require__.d = function (exports, name, getter) { if (!__webpack_require__.o(exports, name)) { Object.defineProperty(exports, name, { enumerable: true, get: getter }); } }; __webpack_require__.r = function (exports) {
        if (typeof Symbol !== 'undefined' && Symbol.toStringTag) { Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' }); }
        Object.defineProperty(exports, '__esModule', { value: true });
    }; __webpack_require__.t = function (value, mode) { if (mode & 1) value = __webpack_require__(value); if (mode & 8) return value; if ((mode & 4) && typeof value === 'object' && value && value.__esModule) return value; var ns = Object.create(null); __webpack_require__.r(ns); Object.defineProperty(ns, 'default', { enumerable: true, value: value }); if (mode & 2 && typeof value != 'string') for (var key in value) __webpack_require__.d(ns, key, function (key) { return value[key]; }.bind(null, key)); return ns; }; __webpack_require__.n = function (module) { var getter = module && module.__esModule ? function getDefault() { return module['default']; } : function getModuleExports() { return module; }; __webpack_require__.d(getter, 'a', getter); return getter; }; __webpack_require__.o = function (object, property) { return Object.prototype.hasOwnProperty.call(object, property); }; __webpack_require__.p = ""; return __webpack_require__(__webpack_require__.s = 0);
})
    ({
        "./node_modules/foundation-sites/dist/js/foundation.esm.js":
            /*!*****************************************************************!*\
              !*** ./node_modules/foundation-sites/dist/js/foundation.esm.js ***!
              \*****************************************************************/
            /*! exports provided: default, Abide, Accordion, AccordionMenu, Box, Core, CoreUtils, Drilldown, Dropdown, DropdownMenu, Equalizer, Foundation, Interchange, Keyboard, Magellan, MediaQuery, Motion, Move, Nest, OffCanvas, Orbit, ResponsiveAccordionTabs, ResponsiveMenu, ResponsiveToggle, Reveal, Slider, SmoothScroll, Sticky, Tabs, Timer, Toggler, Tooltip, Touch, Triggers, onImagesLoaded */
            (function (module, __webpack_exports__, __webpack_require__) {
                "use strict"; __webpack_require__.r(__webpack_exports__); __webpack_require__.d(__webpack_exports__, "Abide", function () { return Abide; }); __webpack_require__.d(__webpack_exports__, "Accordion", function () { return Accordion; }); __webpack_require__.d(__webpack_exports__, "AccordionMenu", function () { return AccordionMenu; }); __webpack_require__.d(__webpack_exports__, "Box", function () { return Box; }); __webpack_require__.d(__webpack_exports__, "Core", function () { return Foundation; }); __webpack_require__.d(__webpack_exports__, "CoreUtils", function () { return foundation_core_utils; }); __webpack_require__.d(__webpack_exports__, "Drilldown", function () { return Drilldown; }); __webpack_require__.d(__webpack_exports__, "Dropdown", function () { return Dropdown; }); __webpack_require__.d(__webpack_exports__, "DropdownMenu", function () { return DropdownMenu; }); __webpack_require__.d(__webpack_exports__, "Equalizer", function () { return Equalizer; }); __webpack_require__.d(__webpack_exports__, "Foundation", function () { return Foundation; }); __webpack_require__.d(__webpack_exports__, "Interchange", function () { return Interchange; }); __webpack_require__.d(__webpack_exports__, "Keyboard", function () { return Keyboard; }); __webpack_require__.d(__webpack_exports__, "Magellan", function () { return Magellan; }); __webpack_require__.d(__webpack_exports__, "MediaQuery", function () { return MediaQuery; }); __webpack_require__.d(__webpack_exports__, "Motion", function () { return Motion; }); __webpack_require__.d(__webpack_exports__, "Move", function () { return Move; }); __webpack_require__.d(__webpack_exports__, "Nest", function () { return Nest; }); __webpack_require__.d(__webpack_exports__, "OffCanvas", function () { return OffCanvas; }); __webpack_require__.d(__webpack_exports__, "Orbit", function () { return Orbit; }); __webpack_require__.d(__webpack_exports__, "ResponsiveAccordionTabs", function () { return ResponsiveAccordionTabs; }); __webpack_require__.d(__webpack_exports__, "ResponsiveMenu", function () { return ResponsiveMenu; }); __webpack_require__.d(__webpack_exports__, "ResponsiveToggle", function () { return ResponsiveToggle; }); __webpack_require__.d(__webpack_exports__, "Reveal", function () { return Reveal; }); __webpack_require__.d(__webpack_exports__, "Slider", function () { return Slider; }); __webpack_require__.d(__webpack_exports__, "SmoothScroll", function () { return SmoothScroll; }); __webpack_require__.d(__webpack_exports__, "Sticky", function () { return Sticky; }); __webpack_require__.d(__webpack_exports__, "Tabs", function () { return Tabs; }); __webpack_require__.d(__webpack_exports__, "Timer", function () { return Timer; }); __webpack_require__.d(__webpack_exports__, "Toggler", function () { return Toggler; }); __webpack_require__.d(__webpack_exports__, "Tooltip", function () { return Tooltip; }); __webpack_require__.d(__webpack_exports__, "Touch", function () { return Touch; }); __webpack_require__.d(__webpack_exports__, "Triggers", function () { return Triggers; }); __webpack_require__.d(__webpack_exports__, "onImagesLoaded", function () { return onImagesLoaded; }); var jquery__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(
                    /*! jquery */
                    "./node_modules/jquery/dist/jquery.js"); var jquery__WEBPACK_IMPORTED_MODULE_0___default = __webpack_require__.n(jquery__WEBPACK_IMPORTED_MODULE_0__); function _typeof2(obj) { if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof2 = function _typeof2(obj) { return typeof obj; }; } else { _typeof2 = function _typeof2(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof2(obj); }
                function _typeof(obj) {
                    if (typeof Symbol === "function" && _typeof2(Symbol.iterator) === "symbol") { _typeof = function _typeof(obj) { return _typeof2(obj); }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : _typeof2(obj); }; }
                    return _typeof(obj);
                }
                function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }
                function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }
                function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }
                function _inherits(subClass, superClass) {
                    if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function"); }
                    subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, writable: true, configurable: true } }); if (superClass) _setPrototypeOf(subClass, superClass);
                }
                function _getPrototypeOf(o) { _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function _getPrototypeOf(o) { return o.__proto__ || Object.getPrototypeOf(o); }; return _getPrototypeOf(o); }
                function _setPrototypeOf(o, p) { _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf(o, p) { o.__proto__ = p; return o; }; return _setPrototypeOf(o, p); }
                function _assertThisInitialized(self) {
                    if (self === void 0) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); }
                    return self;
                }
                function _possibleConstructorReturn(self, call) {
                    if (call && (_typeof2(call) === "object" || typeof call === "function")) { return call; }
                    return _assertThisInitialized(self);
                }
                function _superPropBase(object, property) {
                    while (!Object.prototype.hasOwnProperty.call(object, property)) { object = _getPrototypeOf(object); if (object === null) break; }
                    return object;
                }
                function _get(target, property, receiver) {
                    if (typeof Reflect !== "undefined" && Reflect.get) { _get = Reflect.get; } else {
                        _get = function _get(target, property, receiver) {
                            var base = _superPropBase(target, property); if (!base) return; var desc = Object.getOwnPropertyDescriptor(base, property); if (desc.get) { return desc.get.call(receiver); }
                            return desc.value;
                        };
                    }
                    return _get(target, property, receiver || target);
                }
                function _slicedToArray(arr, i) { return _arrayWithHoles(arr) || _iterableToArrayLimit(arr, i) || _nonIterableRest(); }
                function _arrayWithHoles(arr) { if (Array.isArray(arr)) return arr; }
                function _iterableToArrayLimit(arr, i) {
                    var _arr = []; var _n = true; var _d = false; var _e = undefined; try { for (var _i = arr[Symbol.iterator](), _s; !(_n = (_s = _i.next()).done); _n = true) { _arr.push(_s.value); if (i && _arr.length === i) break; } } catch (err) { _d = true; _e = err; } finally { try { if (!_n && _i["return"] != null) _i["return"](); } finally { if (_d) throw _e; } }
                    return _arr;
                }
                function _nonIterableRest() { throw new TypeError("Invalid attempt to destructure non-iterable instance"); }
                function rtl() { return jquery__WEBPACK_IMPORTED_MODULE_0___default()('html').attr('dir') === 'rtl'; }
                function GetYoDigits() {
                    var length = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : 6; var namespace = arguments.length > 1 ? arguments[1] : undefined; var str = ''; var chars = '0123456789abcdefghijklmnopqrstuvwxyz'; var charsLength = chars.length; for (var i = 0; i < length; i++) { str += chars[Math.floor(Math.random() * charsLength)]; }
                    return namespace ? "".concat(str, "-").concat(namespace) : str;
                }
                function RegExpEscape(str) { return str.replace(/[-[\]{}()*+?.,\\^$|#\s]/g, '\\$&'); }
                function transitionend($elem) {
                    var transitions = { 'transition': 'transitionend', 'WebkitTransition': 'webkitTransitionEnd', 'MozTransition': 'transitionend', 'OTransition': 'otransitionend' }; var elem = document.createElement('div'), end; for (var transition in transitions) { if (typeof elem.style[transition] !== 'undefined') { end = transitions[transition]; } }
                    if (end) { return end; } else { setTimeout(function () { $elem.triggerHandler('transitionend', [$elem]); }, 1); return 'transitionend'; }
                }
                function onLoad($elem, handler) {
                    var didLoad = document.readyState === 'complete'; var eventType = (didLoad ? '_didLoad' : 'load') + '.zf.util.onLoad'; var cb = function cb() { return $elem.triggerHandler(eventType); }; if ($elem) { if (handler) $elem.one(eventType, handler); if (didLoad) setTimeout(cb); else jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).one('load', cb); }
                    return eventType;
                }
                function ignoreMousedisappear(handler) {
                    var _ref = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {}, _ref$ignoreLeaveWindo = _ref.ignoreLeaveWindow, ignoreLeaveWindow = _ref$ignoreLeaveWindo === void 0 ? false : _ref$ignoreLeaveWindo, _ref$ignoreReappear = _ref.ignoreReappear, ignoreReappear = _ref$ignoreReappear === void 0 ? false : _ref$ignoreReappear; return function leaveEventHandler(eLeave) {
                        for (var _len = arguments.length, rest = new Array(_len > 1 ? _len - 1 : 0), _key = 1; _key < _len; _key++) { rest[_key - 1] = arguments[_key]; }
                        var callback = handler.bind.apply(handler, [this, eLeave].concat(rest)); if (eLeave.relatedTarget !== null) { return callback(); }
                        setTimeout(function leaveEventDebouncer() {
                            if (!ignoreLeaveWindow && document.hasFocus && !document.hasFocus()) { return callback(); }
                            if (!ignoreReappear) { jquery__WEBPACK_IMPORTED_MODULE_0___default()(document).one('mouseenter', function reenterEventHandler(eReenter) { if (!jquery__WEBPACK_IMPORTED_MODULE_0___default()(eLeave.currentTarget).has(eReenter.target).length) { eLeave.relatedTarget = eReenter.target; callback(); } }); }
                        }, 0);
                    };
                }
                var foundation_core_utils = Object.freeze({ rtl: rtl, GetYoDigits: GetYoDigits, RegExpEscape: RegExpEscape, transitionend: transitionend, onLoad: onLoad, ignoreMousedisappear: ignoreMousedisappear }); window.matchMedia || (window.matchMedia = function () {
                    var styleMedia = window.styleMedia || window.media; if (!styleMedia) {
                        var style = document.createElement('style'), script = document.getElementsByTagName('script')[0], info = null; style.type = 'text/css'; style.id = 'matchmediajs-test'; if (!script) { document.head.appendChild(style); } else { script.parentNode.insertBefore(style, script); }
                        info = 'getComputedStyle' in window && window.getComputedStyle(style, null) || style.currentStyle; styleMedia = {
                            matchMedium: function matchMedium(media) {
                                var text = '@media ' + media + '{ #matchmediajs-test { width: 1px; } }'; if (style.styleSheet) { style.styleSheet.cssText = text; } else { style.textContent = text; }
                                return info.width === '1px';
                            }
                        };
                    }
                    return function (media) { return { matches: styleMedia.matchMedium(media || 'all'), media: media || 'all' }; };
                }()); var MediaQuery = {
                    queries: [], current: '', _init: function _init() {
                        if (this.isInitialized === true) { return; } else { this.isInitialized = true; }
                        var self = this; var $meta = jquery__WEBPACK_IMPORTED_MODULE_0___default()('meta.foundation-mq'); if (!$meta.length) { jquery__WEBPACK_IMPORTED_MODULE_0___default()('<meta class="foundation-mq">').appendTo(document.head); }
                        var extractedStyles = jquery__WEBPACK_IMPORTED_MODULE_0___default()('.foundation-mq').css('font-family'); var namedQueries; namedQueries = parseStyleToObject(extractedStyles); self.queries = []; for (var key in namedQueries) { if (namedQueries.hasOwnProperty(key)) { self.queries.push({ name: key, value: "only screen and (min-width: ".concat(namedQueries[key], ")") }); } }
                        this.current = this._getCurrentSize(); this._watcher();
                    }, _reInit: function _reInit() { this.isInitialized = false; this._init(); }, atLeast: function atLeast(size) {
                        var query = this.get(size); if (query) { return window.matchMedia(query).matches; }
                        return false;
                    }, only: function only(size) { return size === this._getCurrentSize(); }, upTo: function upTo(size) {
                        var nextSize = this.next(size); if (nextSize) { return !this.atLeast(nextSize); }
                        return true;
                    }, is: function is(size) {
                        var parts = size.trim().split(' ').filter(function (p) { return !!p.length; }); var _parts = _slicedToArray(parts, 2), bpSize = _parts[0], _parts$ = _parts[1], bpModifier = _parts$ === void 0 ? '' : _parts$; if (bpModifier === 'only') { return this.only(bpSize); }
                        if (!bpModifier || bpModifier === 'up') { return this.atLeast(bpSize); }
                        if (bpModifier === 'down') { return this.upTo(bpSize); }
                        throw new Error("\n      Invalid breakpoint passed to MediaQuery.is().\n      Expected a breakpoint name formatted like \"<size> <modifier>\", got \"".concat(size, "\".\n    "));
                    }, get: function get(size) {
                        for (var i in this.queries) { if (this.queries.hasOwnProperty(i)) { var query = this.queries[i]; if (size === query.name) return query.value; } }
                        return null;
                    }, next: function next(size) {
                        var _this = this; var queryIndex = this.queries.findIndex(function (q) { return _this._getQueryName(q) === size; }); if (queryIndex === -1) { throw new Error("\n        Unknown breakpoint \"".concat(size, "\" passed to MediaQuery.next().\n        Ensure it is present in your Sass \"$breakpoints\" setting.\n      ")); }
                        var nextQuery = this.queries[queryIndex + 1]; return nextQuery ? nextQuery.name : null;
                    }, _getQueryName: function _getQueryName(value) { if (typeof value === 'string') return value; if (_typeof(value) === 'object') return value.name; throw new TypeError("\n      Invalid value passed to MediaQuery._getQueryName().\n      Expected a breakpoint name (String) or a breakpoint query (Object), got \"".concat(value, "\" (").concat(_typeof(value), ")\n    ")); }, _getCurrentSize: function _getCurrentSize() {
                        var matched; for (var i = 0; i < this.queries.length; i++) { var query = this.queries[i]; if (window.matchMedia(query.value).matches) { matched = query; } }
                        return matched && this._getQueryName(matched);
                    }, _watcher: function _watcher() { var _this2 = this; jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).off('resize.zf.mediaquery').on('resize.zf.mediaquery', function () { var newSize = _this2._getCurrentSize(), currentSize = _this2.current; if (newSize !== currentSize) { _this2.current = newSize; jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).trigger('changed.zf.mediaquery', [newSize, currentSize]); } }); }
                }; function parseStyleToObject(str) {
                    var styleObject = {}; if (typeof str !== 'string') { return styleObject; }
                    str = str.trim().slice(1, -1); if (!str) { return styleObject; }
                    styleObject = str.split('&').reduce(function (ret, param) {
                        var parts = param.replace(/\+/g, ' ').split('='); var key = parts[0]; var val = parts[1]; key = decodeURIComponent(key); val = typeof val === 'undefined' ? null : decodeURIComponent(val); if (!ret.hasOwnProperty(key)) { ret[key] = val; } else if (Array.isArray(ret[key])) { ret[key].push(val); } else { ret[key] = [ret[key], val]; }
                        return ret;
                    }, {}); return styleObject;
                }
                var FOUNDATION_VERSION = '6.6.3'; var Foundation = {
                    version: FOUNDATION_VERSION, _plugins: {}, _uuids: [], plugin: function plugin(_plugin, name) { var className = name || functionName(_plugin); var attrName = hyphenate(className); this._plugins[attrName] = this[className] = _plugin; }, registerPlugin: function registerPlugin(plugin, name) {
                        var pluginName = name ? hyphenate(name) : functionName(plugin.constructor).toLowerCase(); plugin.uuid = GetYoDigits(6, pluginName); if (!plugin.$element.attr("data-".concat(pluginName))) { plugin.$element.attr("data-".concat(pluginName), plugin.uuid); }
                        if (!plugin.$element.data('zfPlugin')) { plugin.$element.data('zfPlugin', plugin); }
                        plugin.$element.trigger("init.zf.".concat(pluginName)); this._uuids.push(plugin.uuid); return;
                    }, unregisterPlugin: function unregisterPlugin(plugin) {
                        var pluginName = hyphenate(functionName(plugin.$element.data('zfPlugin').constructor)); this._uuids.splice(this._uuids.indexOf(plugin.uuid), 1); plugin.$element.removeAttr("data-".concat(pluginName)).removeData('zfPlugin').trigger("destroyed.zf.".concat(pluginName)); for (var prop in plugin) { plugin[prop] = null; }
                        return;
                    }, reInit: function reInit(plugins) { var isJQ = plugins instanceof jquery__WEBPACK_IMPORTED_MODULE_0___default.a; try { if (isJQ) { plugins.each(function () { jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).data('zfPlugin')._init(); }); } else { var type = _typeof(plugins), _this = this, fns = { 'object': function object(plgs) { plgs.forEach(function (p) { p = hyphenate(p); jquery__WEBPACK_IMPORTED_MODULE_0___default()('[data-' + p + ']').foundation('_init'); }); }, 'string': function string() { plugins = hyphenate(plugins); jquery__WEBPACK_IMPORTED_MODULE_0___default()('[data-' + plugins + ']').foundation('_init'); }, 'undefined': function undefined$1() { this['object'](Object.keys(_this._plugins)); } }; fns[type](plugins); } } catch (err) { console.error(err); } finally { return plugins; } }, reflow: function reflow(elem, plugins) {
                        if (typeof plugins === 'undefined') { plugins = Object.keys(this._plugins); }
                        else if (typeof plugins === 'string') { plugins = [plugins]; }
                        var _this = this; jquery__WEBPACK_IMPORTED_MODULE_0___default.a.each(plugins, function (i, name) {
                            var plugin = _this._plugins[name]; var $elem = jquery__WEBPACK_IMPORTED_MODULE_0___default()(elem).find('[data-' + name + ']').addBack('[data-' + name + ']').filter(function () { return typeof jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).data("zfPlugin") === 'undefined'; }); $elem.each(function () {
                                var $el = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this), opts = { reflow: true }; if ($el.attr('data-options')) { $el.attr('data-options').split(';').forEach(function (option, _index) { var opt = option.split(':').map(function (el) { return el.trim(); }); if (opt[0]) opts[opt[0]] = parseValue(opt[1]); }); }
                                try { $el.data('zfPlugin', new plugin(jquery__WEBPACK_IMPORTED_MODULE_0___default()(this), opts)); } catch (er) { console.error(er); } finally { return; }
                            });
                        });
                    }, getFnName: functionName, addToJquery: function addToJquery($) {
                        var foundation = function foundation(method) {
                            var type = _typeof(method), $noJS = $('.no-js'); if ($noJS.length) { $noJS.removeClass('no-js'); }
                            if (type === 'undefined') { MediaQuery._init(); Foundation.reflow(this); } else if (type === 'string') { var args = Array.prototype.slice.call(arguments, 1); var plugClass = this.data('zfPlugin'); if (typeof plugClass !== 'undefined' && typeof plugClass[method] !== 'undefined') { if (this.length === 1) { plugClass[method].apply(plugClass, args); } else { this.each(function (i, el) { plugClass[method].apply($(el).data('zfPlugin'), args); }); } } else { throw new ReferenceError("We're sorry, '" + method + "' is not an available method for " + (plugClass ? functionName(plugClass) : 'this element') + '.'); } } else { throw new TypeError("We're sorry, ".concat(type, " is not a valid parameter. You must use a string representing the method you wish to invoke.")); }
                            return this;
                        }; $.fn.foundation = foundation; return $;
                    }
                }; Foundation.util = { throttle: function throttle(func, delay) { var timer = null; return function () { var context = this, args = arguments; if (timer === null) { timer = setTimeout(function () { func.apply(context, args); timer = null; }, delay); } }; } }; window.Foundation = Foundation; (function () {
                    if (!Date.now || !window.Date.now) window.Date.now = Date.now = function () { return new Date().getTime(); }; var vendors = ['webkit', 'moz']; for (var i = 0; i < vendors.length && !window.requestAnimationFrame; ++i) { var vp = vendors[i]; window.requestAnimationFrame = window[vp + 'RequestAnimationFrame']; window.cancelAnimationFrame = window[vp + 'CancelAnimationFrame'] || window[vp + 'CancelRequestAnimationFrame']; }
                    if (/iP(ad|hone|od).*OS 6/.test(window.navigator.userAgent) || !window.requestAnimationFrame || !window.cancelAnimationFrame) { var lastTime = 0; window.requestAnimationFrame = function (callback) { var now = Date.now(); var nextTime = Math.max(lastTime + 16, now); return setTimeout(function () { callback(lastTime = nextTime); }, nextTime - now); }; window.cancelAnimationFrame = clearTimeout; }
                    if (!window.performance || !window.performance.now) { window.performance = { start: Date.now(), now: function now() { return Date.now() - this.start; } }; }
                })(); if (!Function.prototype.bind) {
                    Function.prototype.bind = function (oThis) {
                        if (typeof this !== 'function') { throw new TypeError('Function.prototype.bind - what is trying to be bound is not callable'); }
                        var aArgs = Array.prototype.slice.call(arguments, 1), fToBind = this, fNOP = function fNOP() { }, fBound = function fBound() { return fToBind.apply(this instanceof fNOP ? this : oThis, aArgs.concat(Array.prototype.slice.call(arguments))); }; if (this.prototype) { fNOP.prototype = this.prototype; }
                        fBound.prototype = new fNOP(); return fBound;
                    };
                }
                function functionName(fn) { if (typeof Function.prototype.name === 'undefined') { var funcNameRegex = /function\s([^(]{1,})\(/; var results = funcNameRegex.exec(fn.toString()); return results && results.length > 1 ? results[1].trim() : ""; } else if (typeof fn.prototype === 'undefined') { return fn.constructor.name; } else { return fn.prototype.constructor.name; } }
                function parseValue(str) { if ('true' === str) return true; else if ('false' === str) return false; else if (!isNaN(str * 1)) return parseFloat(str); return str; }
                function hyphenate(str) { return str.replace(/([a-z])([A-Z])/g, '$1-$2').toLowerCase(); }
                var Box = { ImNotTouchingYou: ImNotTouchingYou, OverlapArea: OverlapArea, GetDimensions: GetDimensions, GetExplicitOffsets: GetExplicitOffsets }; function ImNotTouchingYou(element, parent, lrOnly, tbOnly, ignoreBottom) { return OverlapArea(element, parent, lrOnly, tbOnly, ignoreBottom) === 0; }
                function OverlapArea(element, parent, lrOnly, tbOnly, ignoreBottom) {
                    var eleDims = GetDimensions(element), topOver, bottomOver, leftOver, rightOver; if (parent) { var parDims = GetDimensions(parent); bottomOver = parDims.height + parDims.offset.top - (eleDims.offset.top + eleDims.height); topOver = eleDims.offset.top - parDims.offset.top; leftOver = eleDims.offset.left - parDims.offset.left; rightOver = parDims.width + parDims.offset.left - (eleDims.offset.left + eleDims.width); } else { bottomOver = eleDims.windowDims.height + eleDims.windowDims.offset.top - (eleDims.offset.top + eleDims.height); topOver = eleDims.offset.top - eleDims.windowDims.offset.top; leftOver = eleDims.offset.left - eleDims.windowDims.offset.left; rightOver = eleDims.windowDims.width - (eleDims.offset.left + eleDims.width); }
                    bottomOver = ignoreBottom ? 0 : Math.min(bottomOver, 0); topOver = Math.min(topOver, 0); leftOver = Math.min(leftOver, 0); rightOver = Math.min(rightOver, 0); if (lrOnly) { return leftOver + rightOver; }
                    if (tbOnly) { return topOver + bottomOver; }
                    return Math.sqrt(topOver * topOver + bottomOver * bottomOver + leftOver * leftOver + rightOver * rightOver);
                }
                function GetDimensions(elem) {
                    elem = elem.length ? elem[0] : elem; if (elem === window || elem === document) { throw new Error("I'm sorry, Dave. I'm afraid I can't do that."); }
                    var rect = elem.getBoundingClientRect(), parRect = elem.parentNode.getBoundingClientRect(), winRect = document.body.getBoundingClientRect(), winY = window.pageYOffset, winX = window.pageXOffset; return { width: rect.width, height: rect.height, offset: { top: rect.top + winY, left: rect.left + winX }, parentDims: { width: parRect.width, height: parRect.height, offset: { top: parRect.top + winY, left: parRect.left + winX } }, windowDims: { width: winRect.width, height: winRect.height, offset: { top: winY, left: winX } } };
                }
                function GetExplicitOffsets(element, anchor, position, alignment, vOffset, hOffset, isOverflow) {
                    var $eleDims = GetDimensions(element), $anchorDims = anchor ? GetDimensions(anchor) : null; var topVal, leftVal; if ($anchorDims !== null) {
                        switch (position) { case 'top': topVal = $anchorDims.offset.top - ($eleDims.height + vOffset); break; case 'bottom': topVal = $anchorDims.offset.top + $anchorDims.height + vOffset; break; case 'left': leftVal = $anchorDims.offset.left - ($eleDims.width + hOffset); break; case 'right': leftVal = $anchorDims.offset.left + $anchorDims.width + hOffset; break; }
                        switch (position) {
                            case 'top': case 'bottom': switch (alignment) { case 'left': leftVal = $anchorDims.offset.left + hOffset; break; case 'right': leftVal = $anchorDims.offset.left - $eleDims.width + $anchorDims.width - hOffset; break; case 'center': leftVal = isOverflow ? hOffset : $anchorDims.offset.left + $anchorDims.width / 2 - $eleDims.width / 2 + hOffset; break; }
                                break; case 'right': case 'left': switch (alignment) { case 'bottom': topVal = $anchorDims.offset.top - vOffset + $anchorDims.height - $eleDims.height; break; case 'top': topVal = $anchorDims.offset.top + vOffset; break; case 'center': topVal = $anchorDims.offset.top + vOffset + $anchorDims.height / 2 - $eleDims.height / 2; break; }
                                break;
                        }
                    }
                    return { top: topVal, left: leftVal };
                }
                function onImagesLoaded(images, callback) {
                    var unloaded = images.length; if (unloaded === 0) { callback(); }
                    images.each(function () { if (this.complete && typeof this.naturalWidth !== 'undefined') { singleImageLoaded(); } else { var image = new Image(); var events = "load.zf.images error.zf.images"; jquery__WEBPACK_IMPORTED_MODULE_0___default()(image).one(events, function me(event) { jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).off(events, me); singleImageLoaded(); }); image.src = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).attr('src'); } }); function singleImageLoaded() { unloaded--; if (unloaded === 0) { callback(); } }
                }
                var keyCodes = { 9: 'TAB', 13: 'ENTER', 27: 'ESCAPE', 32: 'SPACE', 35: 'END', 36: 'HOME', 37: 'ARROW_LEFT', 38: 'ARROW_UP', 39: 'ARROW_RIGHT', 40: 'ARROW_DOWN' }; var commands = {}; function findFocusable($element) {
                    if (!$element) { return false; }
                    return $element.find('a[href], area[href], input:not([disabled]), select:not([disabled]), textarea:not([disabled]), button:not([disabled]), iframe, object, embed, *[tabindex], *[contenteditable]').filter(function () {
                        if (!jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).is(':visible') || jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).attr('tabindex') < 0) { return false; }
                        return true;
                    });
                }
                function parseKey(event) { var key = keyCodes[event.which || event.keyCode] || String.fromCharCode(event.which).toUpperCase(); key = key.replace(/\W+/, ''); if (event.shiftKey) key = "SHIFT_".concat(key); if (event.ctrlKey) key = "CTRL_".concat(key); if (event.altKey) key = "ALT_".concat(key); key = key.replace(/_$/, ''); return key; }
                var Keyboard = {
                    keys: getKeyCodes(keyCodes), parseKey: parseKey, handleKey: function handleKey(event, component, functions) {
                        var commandList = commands[component], keyCode = this.parseKey(event), cmds, command, fn; if (!commandList) return console.warn('Component not defined!'); if (event.zfIsKeyHandled === true) return; if (typeof commandList.ltr === 'undefined') { cmds = commandList; } else { if (rtl()) cmds = jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend({}, commandList.ltr, commandList.rtl); else cmds = jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend({}, commandList.rtl, commandList.ltr); }
                        command = cmds[keyCode]; fn = functions[command]; if (fn && typeof fn === 'function') { var returnValue = fn.apply(); event.zfIsKeyHandled = true; if (functions.handled || typeof functions.handled === 'function') { functions.handled(returnValue); } } else { if (functions.unhandled || typeof functions.unhandled === 'function') { functions.unhandled(); } }
                    }, findFocusable: findFocusable, register: function register(componentName, cmds) { commands[componentName] = cmds; }, trapFocus: function trapFocus($element) { var $focusable = findFocusable($element), $firstFocusable = $focusable.eq(0), $lastFocusable = $focusable.eq(-1); $element.on('keydown.zf.trapfocus', function (event) { if (event.target === $lastFocusable[0] && parseKey(event) === 'TAB') { event.preventDefault(); $firstFocusable.focus(); } else if (event.target === $firstFocusable[0] && parseKey(event) === 'SHIFT_TAB') { event.preventDefault(); $lastFocusable.focus(); } }); }, releaseFocus: function releaseFocus($element) { $element.off('keydown.zf.trapfocus'); }
                }; function getKeyCodes(kcs) {
                    var k = {}; for (var kc in kcs) { k[kcs[kc]] = kcs[kc]; }
                    return k;
                }
                var initClasses = ['mui-enter', 'mui-leave']; var activeClasses = ['mui-enter-active', 'mui-leave-active']; var Motion = { animateIn: function animateIn(element, animation, cb) { animate(true, element, animation, cb); }, animateOut: function animateOut(element, animation, cb) { animate(false, element, animation, cb); } }; function Move(duration, elem, fn) {
                    var anim, prog, start = null; if (duration === 0) { fn.apply(elem); elem.trigger('finished.zf.animate', [elem]).triggerHandler('finished.zf.animate', [elem]); return; }
                    function move(ts) { if (!start) start = ts; prog = ts - start; fn.apply(elem); if (prog < duration) { anim = window.requestAnimationFrame(move, elem); } else { window.cancelAnimationFrame(anim); elem.trigger('finished.zf.animate', [elem]).triggerHandler('finished.zf.animate', [elem]); } }
                    anim = window.requestAnimationFrame(move);
                }
                function animate(isIn, element, animation, cb) {
                    element = jquery__WEBPACK_IMPORTED_MODULE_0___default()(element).eq(0); if (!element.length) return; var initClass = isIn ? initClasses[0] : initClasses[1]; var activeClass = isIn ? activeClasses[0] : activeClasses[1]; reset(); element.addClass(animation).css('transition', 'none'); requestAnimationFrame(function () { element.addClass(initClass); if (isIn) element.show(); }); requestAnimationFrame(function () { element[0].offsetWidth; element.css('transition', '').addClass(activeClass); }); element.one(transitionend(element), finish); function finish() { if (!isIn) element.hide(); reset(); if (cb) cb.apply(element); }
                    function reset() { element[0].style.transitionDuration = 0; element.removeClass("".concat(initClass, " ").concat(activeClass, " ").concat(animation)); }
                }
                var Nest = {
                    Feather: function Feather(menu) {
                        var type = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 'zf'; menu.attr('role', 'menubar'); menu.find('a').attr({ 'role': 'menuitem' }); var items = menu.find('li').attr({ 'role': 'none' }), subMenuClass = "is-".concat(type, "-submenu"), subItemClass = "".concat(subMenuClass, "-item"), hasSubClass = "is-".concat(type, "-submenu-parent"), applyAria = type !== 'accordion'; items.each(function () {
                            var $item = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this), $sub = $item.children('ul'); if ($sub.length) {
                                $item.addClass(hasSubClass); if (applyAria) { $item.attr({ 'aria-haspopup': true, 'aria-label': $item.children('a:first').text() }); if (type === 'drilldown') { $item.attr({ 'aria-expanded': false }); } }
                                $sub.addClass("submenu ".concat(subMenuClass)).attr({ 'data-submenu': '', 'role': 'menubar' }); if (type === 'drilldown') { $sub.attr({ 'aria-hidden': true }); }
                            }
                            if ($item.parent('[data-submenu]').length) { $item.addClass("is-submenu-item ".concat(subItemClass)); }
                        }); return;
                    }, Burn: function Burn(menu, type) {
                        var
                        subMenuClass = "is-".concat(type, "-submenu"), subItemClass = "".concat(subMenuClass, "-item"), hasSubClass = "is-".concat(type, "-submenu-parent"); menu.find('>li, > li > ul, .menu, .menu > li, [data-submenu] > li').removeClass("".concat(subMenuClass, " ").concat(subItemClass, " ").concat(hasSubClass, " is-submenu-item submenu is-active")).removeAttr('data-submenu').css('display', '');
                    }
                }; function Timer(elem, options, cb) {
                    var _this = this, duration = options.duration, nameSpace = Object.keys(elem.data())[0] || 'timer', remain = -1, start, timer; this.isPaused = false; this.restart = function () { remain = -1; clearTimeout(timer); this.start(); }; this.start = function () {
                        this.isPaused = false; clearTimeout(timer); remain = remain <= 0 ? duration : remain; elem.data('paused', false); start = Date.now(); timer = setTimeout(function () {
                            if (options.infinite) { _this.restart(); }
                            if (cb && typeof cb === 'function') { cb(); }
                        }, remain); elem.trigger("timerstart.zf.".concat(nameSpace));
                    }; this.pause = function () { this.isPaused = true; clearTimeout(timer); elem.data('paused', true); var end = Date.now(); remain = remain - (end - start); elem.trigger("timerpaused.zf.".concat(nameSpace)); };
                }
                var Touch = {}; var startPosX, startPosY, startTime, elapsedTime, startEvent, isMoving = false, didMoved = false; function onTouchEnd(e) {
                    this.removeEventListener('touchmove', onTouchMove); this.removeEventListener('touchend', onTouchEnd); if (!didMoved) { var tapEvent = jquery__WEBPACK_IMPORTED_MODULE_0___default.a.Event('tap', startEvent || e); jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).trigger(tapEvent); }
                    startEvent = null; isMoving = false; didMoved = false;
                }
                function onTouchMove(e) {
                    if (jquery__WEBPACK_IMPORTED_MODULE_0___default.a.spotSwipe.preventDefault) { e.preventDefault(); }
                    if (isMoving) {
                        var x = e.touches[0].pageX; var y = e.touches[0].pageY; var dx = startPosX - x; var dir; didMoved = true; elapsedTime = new Date().getTime() - startTime; if (Math.abs(dx) >= jquery__WEBPACK_IMPORTED_MODULE_0___default.a.spotSwipe.moveThreshold && elapsedTime <= jquery__WEBPACK_IMPORTED_MODULE_0___default.a.spotSwipe.timeThreshold) { dir = dx > 0 ? 'left' : 'right'; }
                        if (dir) { e.preventDefault(); onTouchEnd.apply(this, arguments); jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).trigger(jquery__WEBPACK_IMPORTED_MODULE_0___default.a.Event('swipe', Object.assign({}, e)), dir).trigger(jquery__WEBPACK_IMPORTED_MODULE_0___default.a.Event("swipe".concat(dir), Object.assign({}, e))); }
                    }
                }
                function onTouchStart(e) { if (e.touches.length == 1) { startPosX = e.touches[0].pageX; startPosY = e.touches[0].pageY; startEvent = e; isMoving = true; didMoved = false; startTime = new Date().getTime(); this.addEventListener('touchmove', onTouchMove, false); this.addEventListener('touchend', onTouchEnd, false); } }
                function init() { this.addEventListener && this.addEventListener('touchstart', onTouchStart, false); }
                var SpotSwipe = function () {
                    function SpotSwipe($) { _classCallCheck(this, SpotSwipe); this.version = '1.0.0'; this.enabled = 'ontouchstart' in document.documentElement; this.preventDefault = false; this.moveThreshold = 75; this.timeThreshold = 200; this.$ = $; this._init(); }
                    _createClass(SpotSwipe, [{ key: "_init", value: function _init() { var $ = this.$; $.event.special.swipe = { setup: init }; $.event.special.tap = { setup: init }; $.each(['left', 'up', 'down', 'right'], function () { $.event.special["swipe".concat(this)] = { setup: function setup() { $(this).on('swipe', $.noop); } }; }); } }]); return SpotSwipe;
                }(); Touch.setupSpotSwipe = function ($) { $.spotSwipe = new SpotSwipe($); }; Touch.setupTouchHandler = function ($) {
                    $.fn.addTouch = function () {
                        this.each(function (i, el) { $(el).bind('touchstart touchmove touchend touchcancel', function (event) { handleTouch(event); }); }); var handleTouch = function handleTouch(event) {
                            var touches = event.changedTouches, first = touches[0], eventTypes = { touchstart: 'mousedown', touchmove: 'mousemove', touchend: 'mouseup' }, type = eventTypes[event.type], simulatedEvent; if ('MouseEvent' in window && typeof window.MouseEvent === 'function') { simulatedEvent = new window.MouseEvent(type, { 'bubbles': true, 'cancelable': true, 'screenX': first.screenX, 'screenY': first.screenY, 'clientX': first.clientX, 'clientY': first.clientY }); } else { simulatedEvent = document.createEvent('MouseEvent'); simulatedEvent.initMouseEvent(type, true, true, window, 1, first.screenX, first.screenY, first.clientX, first.clientY, false, false, false, false, 0, null); }
                            first.target.dispatchEvent(simulatedEvent);
                        };
                    };
                }; Touch.init = function ($) { if (typeof $.spotSwipe === 'undefined') { Touch.setupSpotSwipe($); Touch.setupTouchHandler($); } }; var MutationObserver = function () {
                    var prefixes = ['WebKit', 'Moz', 'O', 'Ms', '']; for (var i = 0; i < prefixes.length; i++) { if ("".concat(prefixes[i], "MutationObserver") in window) { return window["".concat(prefixes[i], "MutationObserver")]; } }
                    return false;
                }(); var triggers = function triggers(el, type) { el.data(type).split(' ').forEach(function (id) { jquery__WEBPACK_IMPORTED_MODULE_0___default()("#".concat(id))[type === 'close' ? 'trigger' : 'triggerHandler']("".concat(type, ".zf.trigger"), [el]); }); }; var Triggers = { Listeners: { Basic: {}, Global: {} }, Initializers: {} }; Triggers.Listeners.Basic = { openListener: function openListener() { triggers(jquery__WEBPACK_IMPORTED_MODULE_0___default()(this), 'open'); }, closeListener: function closeListener() { var id = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).data('close'); if (id) { triggers(jquery__WEBPACK_IMPORTED_MODULE_0___default()(this), 'close'); } else { jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).trigger('close.zf.trigger'); } }, toggleListener: function toggleListener() { var id = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).data('toggle'); if (id) { triggers(jquery__WEBPACK_IMPORTED_MODULE_0___default()(this), 'toggle'); } else { jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).trigger('toggle.zf.trigger'); } }, closeableListener: function closeableListener(e) { var animation = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).data('closable'); e.stopPropagation(); if (animation !== '') { Motion.animateOut(jquery__WEBPACK_IMPORTED_MODULE_0___default()(this), animation, function () { jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).trigger('closed.zf'); }); } else { jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).fadeOut().trigger('closed.zf'); } }, toggleFocusListener: function toggleFocusListener() { var id = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).data('toggle-focus'); jquery__WEBPACK_IMPORTED_MODULE_0___default()("#".concat(id)).triggerHandler('toggle.zf.trigger', [jquery__WEBPACK_IMPORTED_MODULE_0___default()(this)]); } }; Triggers.Initializers.addOpenListener = function ($elem) { $elem.off('click.zf.trigger', Triggers.Listeners.Basic.openListener); $elem.on('click.zf.trigger', '[data-open]', Triggers.Listeners.Basic.openListener); }; Triggers.Initializers.addCloseListener = function ($elem) { $elem.off('click.zf.trigger', Triggers.Listeners.Basic.closeListener); $elem.on('click.zf.trigger', '[data-close]', Triggers.Listeners.Basic.closeListener); }; Triggers.Initializers.addToggleListener = function ($elem) { $elem.off('click.zf.trigger', Triggers.Listeners.Basic.toggleListener); $elem.on('click.zf.trigger', '[data-toggle]', Triggers.Listeners.Basic.toggleListener); }; Triggers.Initializers.addCloseableListener = function ($elem) { $elem.off('close.zf.trigger', Triggers.Listeners.Basic.closeableListener); $elem.on('close.zf.trigger', '[data-closeable], [data-closable]', Triggers.Listeners.Basic.closeableListener); }; Triggers.Initializers.addToggleFocusListener = function ($elem) { $elem.off('focus.zf.trigger blur.zf.trigger', Triggers.Listeners.Basic.toggleFocusListener); $elem.on('focus.zf.trigger blur.zf.trigger', '[data-toggle-focus]', Triggers.Listeners.Basic.toggleFocusListener); }; Triggers.Listeners.Global = {
                    resizeListener: function resizeListener($nodes) {
                        if (!MutationObserver) { $nodes.each(function () { jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).triggerHandler('resizeme.zf.trigger'); }); }
                        $nodes.attr('data-events', "resize");
                    }, scrollListener: function scrollListener($nodes) {
                        if (!MutationObserver) { $nodes.each(function () { jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).triggerHandler('scrollme.zf.trigger'); }); }
                        $nodes.attr('data-events', "scroll");
                    }, closeMeListener: function closeMeListener(e, pluginId) { var plugin = e.namespace.split('.')[0]; var plugins = jquery__WEBPACK_IMPORTED_MODULE_0___default()("[data-".concat(plugin, "]")).not("[data-yeti-box=\"".concat(pluginId, "\"]")); plugins.each(function () { var _this = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this); _this.triggerHandler('close.zf.trigger', [_this]); }); }
                }; Triggers.Initializers.addClosemeListener = function (pluginName) {
                    var yetiBoxes = jquery__WEBPACK_IMPORTED_MODULE_0___default()('[data-yeti-box]'), plugNames = ['dropdown', 'tooltip', 'reveal']; if (pluginName) { if (typeof pluginName === 'string') { plugNames.push(pluginName); } else if (_typeof(pluginName) === 'object' && typeof pluginName[0] === 'string') { plugNames = plugNames.concat(pluginName); } else { console.error('Plugin names must be strings'); } }
                    if (yetiBoxes.length) { var listeners = plugNames.map(function (name) { return "closeme.zf.".concat(name); }).join(' '); jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).off(listeners).on(listeners, Triggers.Listeners.Global.closeMeListener); }
                }; function debounceGlobalListener(debounce, trigger, listener) {
                    var timer, args = Array.prototype.slice.call(arguments, 3); jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).off(trigger).on(trigger, function (e) {
                        if (timer) { clearTimeout(timer); }
                        timer = setTimeout(function () { listener.apply(null, args); }, debounce || 10);
                    });
                }
                Triggers.Initializers.addResizeListener = function (debounce) { var $nodes = jquery__WEBPACK_IMPORTED_MODULE_0___default()('[data-resize]'); if ($nodes.length) { debounceGlobalListener(debounce, 'resize.zf.trigger', Triggers.Listeners.Global.resizeListener, $nodes); } }; Triggers.Initializers.addScrollListener = function (debounce) { var $nodes = jquery__WEBPACK_IMPORTED_MODULE_0___default()('[data-scroll]'); if ($nodes.length) { debounceGlobalListener(debounce, 'scroll.zf.trigger', Triggers.Listeners.Global.scrollListener, $nodes); } }; Triggers.Initializers.addMutationEventsListener = function ($elem) {
                    if (!MutationObserver) { return false; }
                    var $nodes = $elem.find('[data-resize], [data-scroll], [data-mutate]'); var listeningElementsMutation = function listeningElementsMutation(mutationRecordsList) {
                        var $target = jquery__WEBPACK_IMPORTED_MODULE_0___default()(mutationRecordsList[0].target); switch (mutationRecordsList[0].type) {
                            case "attributes": if ($target.attr("data-events") === "scroll" && mutationRecordsList[0].attributeName === "data-events") { $target.triggerHandler('scrollme.zf.trigger', [$target, window.pageYOffset]); }
                                if ($target.attr("data-events") === "resize" && mutationRecordsList[0].attributeName === "data-events") { $target.triggerHandler('resizeme.zf.trigger', [$target]); }
                                if (mutationRecordsList[0].attributeName === "style") { $target.closest("[data-mutate]").attr("data-events", "mutate"); $target.closest("[data-mutate]").triggerHandler('mutateme.zf.trigger', [$target.closest("[data-mutate]")]); }
                                break; case "childList": $target.closest("[data-mutate]").attr("data-events", "mutate"); $target.closest("[data-mutate]").triggerHandler('mutateme.zf.trigger', [$target.closest("[data-mutate]")]); break; default: return false;
                        }
                    }; if ($nodes.length) { for (var i = 0; i <= $nodes.length - 1; i++) { var elementObserver = new MutationObserver(listeningElementsMutation); elementObserver.observe($nodes[i], { attributes: true, childList: true, characterData: false, subtree: true, attributeFilter: ["data-events", "style"] }); } }
                }; Triggers.Initializers.addSimpleListeners = function () { var $document = jquery__WEBPACK_IMPORTED_MODULE_0___default()(document); Triggers.Initializers.addOpenListener($document); Triggers.Initializers.addCloseListener($document); Triggers.Initializers.addToggleListener($document); Triggers.Initializers.addCloseableListener($document); Triggers.Initializers.addToggleFocusListener($document); }; Triggers.Initializers.addGlobalListeners = function () { var $document = jquery__WEBPACK_IMPORTED_MODULE_0___default()(document); Triggers.Initializers.addMutationEventsListener($document); Triggers.Initializers.addResizeListener(); Triggers.Initializers.addScrollListener(); Triggers.Initializers.addClosemeListener(); }; Triggers.init = function ($, Foundation) { onLoad($(window), function () { if ($.triggersInitialized !== true) { Triggers.Initializers.addSimpleListeners(); Triggers.Initializers.addGlobalListeners(); $.triggersInitialized = true; } }); if (Foundation) { Foundation.Triggers = Triggers; Foundation.IHearYou = Triggers.Initializers.addGlobalListeners; } }; var Plugin = function () {
                    function Plugin(element, options) {
                        _classCallCheck(this, Plugin); this._setup(element, options); var pluginName = getPluginName(this); this.uuid = GetYoDigits(6, pluginName); if (!this.$element.attr("data-".concat(pluginName))) { this.$element.attr("data-".concat(pluginName), this.uuid); }
                        if (!this.$element.data('zfPlugin')) { this.$element.data('zfPlugin', this); }
                        this.$element.trigger("init.zf.".concat(pluginName));
                    }
                    _createClass(Plugin, [{ key: "destroy", value: function destroy() { this._destroy(); var pluginName = getPluginName(this); this.$element.removeAttr("data-".concat(pluginName)).removeData('zfPlugin').trigger("destroyed.zf.".concat(pluginName)); for (var prop in this) { this[prop] = null; } } }]); return Plugin;
                }(); function hyphenate$1(str) { return str.replace(/([a-z])([A-Z])/g, '$1-$2').toLowerCase(); }
                function getPluginName(obj) { return hyphenate$1(obj.className); }
                var Abide = function (_Plugin) {
                    _inherits(Abide, _Plugin); function Abide() { _classCallCheck(this, Abide); return _possibleConstructorReturn(this, _getPrototypeOf(Abide).apply(this, arguments)); }
                    _createClass(Abide, [{ key: "_setup", value: function _setup(element) { var options = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {}; this.$element = element; this.options = jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend(true, {}, Abide.defaults, this.$element.data(), options); this.isEnabled = true; this.formnovalidate = null; this.className = 'Abide'; this._init(); } }, {
                        key: "_init", value: function _init() {
                            var _this2 = this; this.$inputs = jquery__WEBPACK_IMPORTED_MODULE_0___default.a.merge(this.$element.find('input').not('[type="submit"]'), this.$element.find('textarea, select')); this.$submits = this.$element.find('[type="submit"]'); var $globalErrors = this.$element.find('[data-abide-error]'); if (this.options.a11yAttributes) { this.$inputs.each(function (i, input) { return _this2.addA11yAttributes(jquery__WEBPACK_IMPORTED_MODULE_0___default()(input)); }); $globalErrors.each(function (i, error) { return _this2.addGlobalErrorA11yAttributes(jquery__WEBPACK_IMPORTED_MODULE_0___default()(error)); }); }
                            this._events();
                        }
                    }, {
                        key: "_events", value: function _events() {
                            var _this3 = this; this.$element.off('.abide').on('reset.zf.abide', function () { _this3.resetForm(); }).on('submit.zf.abide', function () { return _this3.validateForm(); }); this.$submits.off('click.zf.abide keydown.zf.abide').on('click.zf.abide keydown.zf.abide', function (e) { if (!e.key || e.key === ' ' || e.key === 'Enter') { e.preventDefault(); _this3.formnovalidate = e.target.getAttribute('formnovalidate') !== null; _this3.$element.submit(); } }); if (this.options.validateOn === 'fieldChange') { this.$inputs.off('change.zf.abide').on('change.zf.abide', function (e) { _this3.validateInput(jquery__WEBPACK_IMPORTED_MODULE_0___default()(e.target)); }); }
                            if (this.options.liveValidate) { this.$inputs.off('input.zf.abide').on('input.zf.abide', function (e) { _this3.validateInput(jquery__WEBPACK_IMPORTED_MODULE_0___default()(e.target)); }); }
                            if (this.options.validateOnBlur) { this.$inputs.off('blur.zf.abide').on('blur.zf.abide', function (e) { _this3.validateInput(jquery__WEBPACK_IMPORTED_MODULE_0___default()(e.target)); }); }
                        }
                    }, { key: "_reflow", value: function _reflow() { this._init(); } }, {
                        key: "_validationIsDisabled", value: function _validationIsDisabled() {
                            if (this.isEnabled === false) { return true; } else if (typeof this.formnovalidate === 'boolean') { return this.formnovalidate; }
                            return this.$submits.length ? this.$submits[0].getAttribute('formnovalidate') !== null : false;
                        }
                    }, { key: "enableValidation", value: function enableValidation() { this.isEnabled = true; } }, { key: "disableValidation", value: function disableValidation() { this.isEnabled = false; } }, {
                        key: "requiredCheck", value: function requiredCheck($el) {
                            if (!$el.attr('required')) return true; var isGood = true; switch ($el[0].type) { case 'checkbox': isGood = $el[0].checked; break; case 'select': case 'select-one': case 'select-multiple': var opt = $el.find('option:selected'); if (!opt.length || !opt.val()) isGood = false; break; default: if (!$el.val() || !$el.val().length) isGood = false; }
                            return isGood;
                        }
                    }, {
                        key: "findFormError", value: function findFormError($el, failedValidators) {
                            var _this4 = this; var id = $el.length ? $el[0].id : ''; var $error = $el.siblings(this.options.formErrorSelector); if (!$error.length) { $error = $el.parent().find(this.options.formErrorSelector); }
                            if (id) { $error = $error.add(this.$element.find("[data-form-error-for=\"".concat(id, "\"]"))); }
                            if (!!failedValidators) { $error = $error.not('[data-form-error-on]'); failedValidators.forEach(function (v) { $error = $error.add($el.siblings("[data-form-error-on=\"".concat(v, "\"]"))); $error = $error.add(_this4.$element.find("[data-form-error-for=\"".concat(id, "\"][data-form-error-on=\"").concat(v, "\"]"))); }); }
                            return $error;
                        }
                    }, {
                        key: "findLabel", value: function findLabel($el) {
                            var id = $el[0].id; var $label = this.$element.find("label[for=\"".concat(id, "\"]")); if (!$label.length) { return $el.closest('label'); }
                            return $label;
                        }
                    }, {
                        key: "findRadioLabels", value: function findRadioLabels($els) {
                            var _this5 = this; var labels = $els.map(function (i, el) {
                                var id = el.id; var $label = _this5.$element.find("label[for=\"".concat(id, "\"]")); if (!$label.length) { $label = jquery__WEBPACK_IMPORTED_MODULE_0___default()(el).closest('label'); }
                                return $label[0];
                            }); return jquery__WEBPACK_IMPORTED_MODULE_0___default()(labels);
                        }
                    }, {
                        key: "findCheckboxLabels", value: function findCheckboxLabels($els) {
                            var _this6 = this; var labels = $els.map(function (i, el) {
                                var id = el.id; var $label = _this6.$element.find("label[for=\"".concat(id, "\"]")); if (!$label.length) { $label = jquery__WEBPACK_IMPORTED_MODULE_0___default()(el).closest('label'); }
                                return $label[0];
                            }); return jquery__WEBPACK_IMPORTED_MODULE_0___default()(labels);
                        }
                    }, {
                        key: "addErrorClasses", value: function addErrorClasses($el, failedValidators) {
                            var $label = this.findLabel($el); var $formError = this.findFormError($el, failedValidators); if ($label.length) { $label.addClass(this.options.labelErrorClass); }
                            if ($formError.length) { $formError.addClass(this.options.formErrorClass); }
                            $el.addClass(this.options.inputErrorClass).attr({ 'data-invalid': '', 'aria-invalid': true });
                        }
                    }, {
                        key: "addA11yAttributes", value: function addA11yAttributes($el) {
                            var $errors = this.findFormError($el); var $labels = $errors.filter('label'); var $error = $errors.first(); if (!$errors.length) return; if (typeof $el.attr('aria-describedby') === 'undefined') {
                                var errorId = $error.attr('id'); if (typeof errorId === 'undefined') { errorId = GetYoDigits(6, 'abide-error'); $error.attr('id', errorId); }
                                $el.attr('aria-describedby', errorId);
                            }
                            if ($labels.filter('[for]').length < $labels.length) {
                                var elemId = $el.attr('id'); if (typeof elemId === 'undefined') { elemId = GetYoDigits(6, 'abide-input'); $el.attr('id', elemId); }
                                $labels.each(function (i, label) { var $label = jquery__WEBPACK_IMPORTED_MODULE_0___default()(label); if (typeof $label.attr('for') === 'undefined') $label.attr('for', elemId); });
                            }
                            $errors.each(function (i, label) { var $label = jquery__WEBPACK_IMPORTED_MODULE_0___default()(label); if (typeof $label.attr('role') === 'undefined') $label.attr('role', 'alert'); }).end();
                        }
                    }, { key: "addGlobalErrorA11yAttributes", value: function addGlobalErrorA11yAttributes($el) { if (typeof $el.attr('aria-live') === 'undefined') $el.attr('aria-live', this.options.a11yErrorLevel); } }, {
                        key: "removeRadioErrorClasses", value: function removeRadioErrorClasses(groupName) {
                            var $els = this.$element.find(":radio[name=\"".concat(groupName, "\"]")); var $labels = this.findRadioLabels($els); var $formErrors = this.findFormError($els); if ($labels.length) { $labels.removeClass(this.options.labelErrorClass); }
                            if ($formErrors.length) { $formErrors.removeClass(this.options.formErrorClass); }
                            $els.removeClass(this.options.inputErrorClass).attr({ 'data-invalid': null, 'aria-invalid': null });
                        }
                    }, {
                        key: "removeCheckboxErrorClasses", value: function removeCheckboxErrorClasses(groupName) {
                            var $els = this.$element.find(":checkbox[name=\"".concat(groupName, "\"]")); var $labels = this.findCheckboxLabels($els); var $formErrors = this.findFormError($els); if ($labels.length) { $labels.removeClass(this.options.labelErrorClass); }
                            if ($formErrors.length) { $formErrors.removeClass(this.options.formErrorClass); }
                            $els.removeClass(this.options.inputErrorClass).attr({ 'data-invalid': null, 'aria-invalid': null });
                        }
                    }, {
                        key: "removeErrorClasses", value: function removeErrorClasses($el) {
                            if ($el[0].type == 'radio') { return this.removeRadioErrorClasses($el.attr('name')); }
                            else if ($el[0].type == 'checkbox') { return this.removeCheckboxErrorClasses($el.attr('name')); }
                            var $label = this.findLabel($el); var $formError = this.findFormError($el); if ($label.length) { $label.removeClass(this.options.labelErrorClass); }
                            if ($formError.length) { $formError.removeClass(this.options.formErrorClass); }
                            $el.removeClass(this.options.inputErrorClass).attr({ 'data-invalid': null, 'aria-invalid': null });
                        }
                    }, {
                        key: "validateInput", value: function validateInput($el) {
                            var _this7 = this; var clearRequire = this.requiredCheck($el), validator = $el.attr('data-validator'), failedValidators = [], manageErrorClasses = true; if (this._validationIsDisabled()) { return true; }
                            if ($el.is('[data-abide-ignore]') || $el.is('[type="hidden"]') || $el.is('[disabled]')) { return true; }
                            switch ($el[0].type) { case 'radio': this.validateRadio($el.attr('name')) || failedValidators.push('required'); break; case 'checkbox': this.validateCheckbox($el.attr('name')) || failedValidators.push('required'); manageErrorClasses = false; break; case 'select': case 'select-one': case 'select-multiple': clearRequire || failedValidators.push('required'); break; default: clearRequire || failedValidators.push('required'); this.validateText($el) || failedValidators.push('pattern'); }
                            if (validator) { var required = $el.attr('required') ? true : false; validator.split(' ').forEach(function (v) { _this7.options.validators[v]($el, required, $el.parent()) || failedValidators.push(v); }); }
                            if ($el.attr('data-equalto')) { this.options.validators.equalTo($el) || failedValidators.push('equalTo'); }
                            var goodToGo = failedValidators.length === 0; var message = (goodToGo ? 'valid' : 'invalid') + '.zf.abide'; if (goodToGo) { var dependentElements = this.$element.find("[data-equalto=\"".concat($el.attr('id'), "\"]")); if (dependentElements.length) { var _this = this; dependentElements.each(function () { if (jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).val()) { _this.validateInput(jquery__WEBPACK_IMPORTED_MODULE_0___default()(this)); } }); } }
                            if (manageErrorClasses) { this.removeErrorClasses($el); if (!goodToGo) { this.addErrorClasses($el, failedValidators); } }
                            $el.trigger(message, [$el]); return goodToGo;
                        }
                    }, {
                        key: "validateForm", value: function validateForm() {
                            var _this8 = this; var acc = []; var _this = this; var checkboxGroupName; if (!this.initialized) { this.initialized = true; }
                            if (this._validationIsDisabled()) { this.formnovalidate = null; return true; }
                            this.$inputs.each(function () {
                                if (jquery__WEBPACK_IMPORTED_MODULE_0___default()(this)[0].type === 'checkbox') { if (jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).attr('name') === checkboxGroupName) return true; checkboxGroupName = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).attr('name'); }
                                acc.push(_this.validateInput(jquery__WEBPACK_IMPORTED_MODULE_0___default()(this)));
                            }); var noError = acc.indexOf(false) === -1; this.$element.find('[data-abide-error]').each(function (i, elem) { var $elem = jquery__WEBPACK_IMPORTED_MODULE_0___default()(elem); if (_this8.options.a11yAttributes) _this8.addGlobalErrorA11yAttributes($elem); $elem.css('display', noError ? 'none' : 'block'); }); this.$element.trigger((noError ? 'formvalid' : 'forminvalid') + '.zf.abide', [this.$element]); return noError;
                        }
                    }, {
                        key: "validateText", value: function validateText($el, pattern) {
                            pattern = pattern || $el.attr('data-pattern') || $el.attr('pattern') || $el.attr('type'); var inputText = $el.val(); var valid = true; if (inputText.length) {
                                if (this.options.patterns.hasOwnProperty(pattern)) { valid = this.options.patterns[pattern].test(inputText); }
                                else if (pattern !== $el.attr('type')) { valid = new RegExp(pattern).test(inputText); }
                            }
                            return valid;
                        }
                    }, {
                        key: "validateRadio", value: function validateRadio(groupName) {
                            var $group = this.$element.find(":radio[name=\"".concat(groupName, "\"]")); var valid = false, required = false; $group.each(function (i, e) { if (jquery__WEBPACK_IMPORTED_MODULE_0___default()(e).attr('required')) { required = true; } }); if (!required) valid = true; if (!valid) { $group.each(function (i, e) { if (jquery__WEBPACK_IMPORTED_MODULE_0___default()(e).prop('checked')) { valid = true; } }); }
                            return valid;
                        }
                    }, {
                        key: "validateCheckbox", value: function validateCheckbox(groupName) {
                            var _this9 = this; var $group = this.$element.find(":checkbox[name=\"".concat(groupName, "\"]")); var valid = false, required = false, minRequired = 1, checked = 0; $group.each(function (i, e) { if (jquery__WEBPACK_IMPORTED_MODULE_0___default()(e).attr('required')) { required = true; } }); if (!required) valid = true; if (!valid) {
                                $group.each(function (i, e) {
                                    if (jquery__WEBPACK_IMPORTED_MODULE_0___default()(e).prop('checked')) { checked++; }
                                    if (typeof jquery__WEBPACK_IMPORTED_MODULE_0___default()(e).attr('data-min-required') !== 'undefined') { minRequired = parseInt(jquery__WEBPACK_IMPORTED_MODULE_0___default()(e).attr('data-min-required')); }
                                }); if (checked >= minRequired) { valid = true; }
                            }
                            if (this.initialized !== true && minRequired > 1) { return true; }
                            $group.each(function (i, e) { if (!valid) { _this9.addErrorClasses(jquery__WEBPACK_IMPORTED_MODULE_0___default()(e), ['required']); } else { _this9.removeErrorClasses(jquery__WEBPACK_IMPORTED_MODULE_0___default()(e)); } }); return valid;
                        }
                    }, { key: "matchValidation", value: function matchValidation($el, validators, required) { var _this10 = this; required = required ? true : false; var clear = validators.split(' ').map(function (v) { return _this10.options.validators[v]($el, required, $el.parent()); }); return clear.indexOf(false) === -1; } }, { key: "resetForm", value: function resetForm() { var $form = this.$element, opts = this.options; jquery__WEBPACK_IMPORTED_MODULE_0___default()(".".concat(opts.labelErrorClass), $form).not('small').removeClass(opts.labelErrorClass); jquery__WEBPACK_IMPORTED_MODULE_0___default()(".".concat(opts.inputErrorClass), $form).not('small').removeClass(opts.inputErrorClass); jquery__WEBPACK_IMPORTED_MODULE_0___default()("".concat(opts.formErrorSelector, ".").concat(opts.formErrorClass)).removeClass(opts.formErrorClass); $form.find('[data-abide-error]').css('display', 'none'); jquery__WEBPACK_IMPORTED_MODULE_0___default()(':input', $form).not(':button, :submit, :reset, :hidden, :radio, :checkbox, [data-abide-ignore]').val('').attr({ 'data-invalid': null, 'aria-invalid': null }); jquery__WEBPACK_IMPORTED_MODULE_0___default()(':input:radio', $form).not('[data-abide-ignore]').prop('checked', false).attr({ 'data-invalid': null, 'aria-invalid': null }); jquery__WEBPACK_IMPORTED_MODULE_0___default()(':input:checkbox', $form).not('[data-abide-ignore]').prop('checked', false).attr({ 'data-invalid': null, 'aria-invalid': null }); $form.trigger('formreset.zf.abide', [$form]); } }, { key: "_destroy", value: function _destroy() { var _this = this; this.$element.off('.abide').find('[data-abide-error]').css('display', 'none'); this.$inputs.off('.abide').each(function () { _this.removeErrorClasses(jquery__WEBPACK_IMPORTED_MODULE_0___default()(this)); }); this.$submits.off('.abide'); } }]); return Abide;
                }(Plugin); Abide.defaults = { validateOn: 'fieldChange', labelErrorClass: 'is-invalid-label', inputErrorClass: 'is-invalid-input', formErrorSelector: '.form-error', formErrorClass: 'is-visible', a11yAttributes: true, a11yErrorLevel: 'assertive', liveValidate: false, validateOnBlur: false, patterns: { alpha: /^[a-zA-Z]+$/, alpha_numeric: /^[a-zA-Z0-9]+$/, integer: /^[-+]?\d+$/, number: /^[-+]?\d*(?:[\.\,]\d+)?$/, card: /^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|(?:222[1-9]|2[3-6][0-9]{2}|27[0-1][0-9]|2720)[0-9]{12}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$/, cvv: /^([0-9]){3,4}$/, email: /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)+$/, url: /^((?:(https?|ftps?|file|ssh|sftp):\/\/|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/)(?:[^\s()<>]+|\((?:[^\s()<>]+|(?:\([^\s()<>]+\)))*\))+(?:\((?:[^\s()<>]+|(?:\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:\'".,<>?\xab\xbb\u201c\u201d\u2018\u2019]))$/, domain: /^([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,8}$/, datetime: /^([0-2][0-9]{3})\-([0-1][0-9])\-([0-3][0-9])T([0-5][0-9])\:([0-5][0-9])\:([0-5][0-9])(Z|([\-\+]([0-1][0-9])\:00))$/, date: /(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))$/, time: /^(0[0-9]|1[0-9]|2[0-3])(:[0-5][0-9]){2}$/, dateISO: /^\d{4}[\/\-]\d{1,2}[\/\-]\d{1,2}$/, month_day_year: /^(0[1-9]|1[012])[- \/.](0[1-9]|[12][0-9]|3[01])[- \/.]\d{4}$/, day_month_year: /^(0[1-9]|[12][0-9]|3[01])[- \/.](0[1-9]|1[012])[- \/.]\d{4}$/, color: /^#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3})$/, website: { test: function test(text) { return Abide.defaults.patterns['domain'].test(text) || Abide.defaults.patterns['url'].test(text); } } }, validators: { equalTo: function equalTo(el, required, parent) { return jquery__WEBPACK_IMPORTED_MODULE_0___default()("#".concat(el.attr('data-equalto'))).val() === el.val(); } } }; var Accordion = function (_Plugin) {
                    _inherits(Accordion, _Plugin); function Accordion() { _classCallCheck(this, Accordion); return _possibleConstructorReturn(this, _getPrototypeOf(Accordion).apply(this, arguments)); }
                    _createClass(Accordion, [{ key: "_setup", value: function _setup(element, options) { this.$element = element; this.options = jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend({}, Accordion.defaults, this.$element.data(), options); this.className = 'Accordion'; this._init(); Keyboard.register('Accordion', { 'ENTER': 'toggle', 'SPACE': 'toggle', 'ARROW_DOWN': 'next', 'ARROW_UP': 'previous' }); } }, {
                        key: "_init", value: function _init() {
                            var _this2 = this; this._isInitializing = true; this.$element.attr('role', 'tablist'); this.$tabs = this.$element.children('[data-accordion-item]'); this.$tabs.attr({ 'role': 'presentation' }); this.$tabs.each(function (idx, el) { var $el = jquery__WEBPACK_IMPORTED_MODULE_0___default()(el), $content = $el.children('[data-tab-content]'), id = $content[0].id || GetYoDigits(6, 'accordion'), linkId = el.id ? "".concat(el.id, "-label") : "".concat(id, "-label"); $el.find('a:first').attr({ 'aria-controls': id, 'role': 'tab', 'id': linkId, 'aria-expanded': false, 'aria-selected': false }); $content.attr({ 'role': 'tabpanel', 'aria-labelledby': linkId, 'aria-hidden': true, 'id': id }); }); var $initActive = this.$element.find('.is-active').children('[data-tab-content]'); if ($initActive.length) { this._initialAnchor = $initActive.prev('a').attr('href'); this._openSingleTab($initActive); }
                            this._checkDeepLink = function () {
                                var anchor = window.location.hash; if (!anchor.length) { if (_this2._isInitializing) return; if (_this2._initialAnchor) anchor = _this2._initialAnchor; }
                                var $anchor = anchor && jquery__WEBPACK_IMPORTED_MODULE_0___default()(anchor); var $link = anchor && _this2.$element.find("[href$=\"".concat(anchor, "\"]")); var isOwnAnchor = !!($anchor.length && $link.length); if (isOwnAnchor) {
                                    if ($anchor && $link && $link.length) { if (!$link.parent('[data-accordion-item]').hasClass('is-active')) { _this2._openSingleTab($anchor); } }
                                    else { _this2._closeAllTabs(); }
                                    if (_this2.options.deepLinkSmudge) { onLoad(jquery__WEBPACK_IMPORTED_MODULE_0___default()(window), function () { var offset = _this2.$element.offset(); jquery__WEBPACK_IMPORTED_MODULE_0___default()('html, body').animate({ scrollTop: offset.top - _this2.options.deepLinkSmudgeOffset }, _this2.options.deepLinkSmudgeDelay); }); }
                                    _this2.$element.trigger('deeplink.zf.accordion', [$link, $anchor]);
                                }
                            }; if (this.options.deepLink) { this._checkDeepLink(); }
                            this._events(); this._isInitializing = false;
                        }
                    }, { key: "_events", value: function _events() { var _this = this; this.$tabs.each(function () { var $elem = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this); var $tabContent = $elem.children('[data-tab-content]'); if ($tabContent.length) { $elem.children('a').off('click.zf.accordion keydown.zf.accordion').on('click.zf.accordion', function (e) { e.preventDefault(); _this.toggle($tabContent); }).on('keydown.zf.accordion', function (e) { Keyboard.handleKey(e, 'Accordion', { toggle: function toggle() { _this.toggle($tabContent); }, next: function next() { var $a = $elem.next().find('a').focus(); if (!_this.options.multiExpand) { $a.trigger('click.zf.accordion'); } }, previous: function previous() { var $a = $elem.prev().find('a').focus(); if (!_this.options.multiExpand) { $a.trigger('click.zf.accordion'); } }, handled: function handled() { e.preventDefault(); } }); }); } }); if (this.options.deepLink) { jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).on('hashchange', this._checkDeepLink); } } }, {
                        key: "toggle", value: function toggle($target) {
                            if ($target.closest('[data-accordion]').is('[disabled]')) { console.info('Cannot toggle an accordion that is disabled.'); return; }
                            if ($target.parent().hasClass('is-active')) { this.up($target); } else { this.down($target); }
                            if (this.options.deepLink) { var anchor = $target.prev('a').attr('href'); if (this.options.updateHistory) { history.pushState({}, '', anchor); } else { history.replaceState({}, '', anchor); } }
                        }
                    }, {
                        key: "down", value: function down($target) {
                            if ($target.closest('[data-accordion]').is('[disabled]')) { console.info('Cannot call down on an accordion that is disabled.'); return; }
                            if (this.options.multiExpand) this._openTab($target); else this._openSingleTab($target);
                        }
                    }, {
                        key: "up", value: function up($target) {
                            if (this.$element.is('[disabled]')) { console.info('Cannot call up on an accordion that is disabled.'); return; }
                            var $targetItem = $target.parent(); if (!$targetItem.hasClass('is-active')) return; var $othersItems = $targetItem.siblings(); if (!this.options.allowAllClosed && !$othersItems.hasClass('is-active')) return; this._closeTab($target);
                        }
                    }, {
                        key: "_openSingleTab", value: function _openSingleTab($target) {
                            var $activeContents = this.$element.children('.is-active').children('[data-tab-content]'); if ($activeContents.length) { this._closeTab($activeContents.not($target)); }
                            this._openTab($target);
                        }
                    }, { key: "_openTab", value: function _openTab($target) { var _this3 = this; var $targetItem = $target.parent(); var targetContentId = $target.attr('aria-labelledby'); $target.attr('aria-hidden', false); $targetItem.addClass('is-active'); jquery__WEBPACK_IMPORTED_MODULE_0___default()("#".concat(targetContentId)).attr({ 'aria-expanded': true, 'aria-selected': true }); $target.finish().slideDown(this.options.slideSpeed, function () { _this3.$element.trigger('down.zf.accordion', [$target]); }); } }, { key: "_closeTab", value: function _closeTab($target) { var _this4 = this; var $targetItem = $target.parent(); var targetContentId = $target.attr('aria-labelledby'); $target.attr('aria-hidden', true); $targetItem.removeClass('is-active'); jquery__WEBPACK_IMPORTED_MODULE_0___default()("#".concat(targetContentId)).attr({ 'aria-expanded': false, 'aria-selected': false }); $target.finish().slideUp(this.options.slideSpeed, function () { _this4.$element.trigger('up.zf.accordion', [$target]); }); } }, { key: "_closeAllTabs", value: function _closeAllTabs() { var $activeTabs = this.$element.children('.is-active').children('[data-tab-content]'); if ($activeTabs.length) { this._closeTab($activeTabs); } } }, { key: "_destroy", value: function _destroy() { this.$element.find('[data-tab-content]').stop(true).slideUp(0).css('display', ''); this.$element.find('a').off('.zf.accordion'); if (this.options.deepLink) { jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).off('hashchange', this._checkDeepLink); } } }]); return Accordion;
                }(Plugin); Accordion.defaults = { slideSpeed: 250, multiExpand: false, allowAllClosed: false, deepLink: false, deepLinkSmudge: false, deepLinkSmudgeDelay: 300, deepLinkSmudgeOffset: 0, updateHistory: false }; var AccordionMenu = function (_Plugin) {
                    _inherits(AccordionMenu, _Plugin); function AccordionMenu() { _classCallCheck(this, AccordionMenu); return _possibleConstructorReturn(this, _getPrototypeOf(AccordionMenu).apply(this, arguments)); }
                    _createClass(AccordionMenu, [{ key: "_setup", value: function _setup(element, options) { this.$element = element; this.options = jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend({}, AccordionMenu.defaults, this.$element.data(), options); this.className = 'AccordionMenu'; this._init(); Keyboard.register('AccordionMenu', { 'ENTER': 'toggle', 'SPACE': 'toggle', 'ARROW_RIGHT': 'open', 'ARROW_UP': 'up', 'ARROW_DOWN': 'down', 'ARROW_LEFT': 'close', 'ESCAPE': 'closeAll' }); } }, {
                        key: "_init", value: function _init() {
                            Nest.Feather(this.$element, 'accordion'); var _this = this; this.$element.find('[data-submenu]').not('.is-active').slideUp(0); this.$element.attr({ 'role': 'tree', 'aria-multiselectable': this.options.multiOpen }); this.$menuLinks = this.$element.find('.is-accordion-submenu-parent'); this.$menuLinks.each(function () {
                                var linkId = this.id || GetYoDigits(6, 'acc-menu-link'), $elem = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this), $sub = $elem.children('[data-submenu]'), subId = $sub[0].id || GetYoDigits(6, 'acc-menu'), isActive = $sub.hasClass('is-active'); if (_this.options.parentLink) { var $anchor = $elem.children('a'); $anchor.clone().prependTo($sub).wrap('<li data-is-parent-link class="is-submenu-parent-item is-submenu-item is-accordion-submenu-item"></li>'); }
                                if (_this.options.submenuToggle) { $elem.addClass('has-submenu-toggle'); $elem.children('a').after('<button id="' + linkId + '" class="submenu-toggle" aria-controls="' + subId + '" aria-expanded="' + isActive + '" title="' + _this.options.submenuToggleText + '"><span class="submenu-toggle-text">' + _this.options.submenuToggleText + '</span></button>'); } else { $elem.attr({ 'aria-controls': subId, 'aria-expanded': isActive, 'id': linkId }); }
                                $sub.attr({ 'aria-labelledby': linkId, 'aria-hidden': !isActive, 'role': 'group', 'id': subId });
                            }); this.$element.find('li').attr({ 'role': 'treeitem' }); var initPanes = this.$element.find('.is-active'); if (initPanes.length) { initPanes.each(function () { _this.down(jquery__WEBPACK_IMPORTED_MODULE_0___default()(this)); }); }
                            this._events();
                        }
                    }, {
                        key: "_events", value: function _events() {
                            var _this = this; this.$element.find('li').each(function () { var $submenu = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).children('[data-submenu]'); if ($submenu.length) { if (_this.options.submenuToggle) { jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).children('.submenu-toggle').off('click.zf.accordionMenu').on('click.zf.accordionMenu', function (e) { _this.toggle($submenu); }); } else { jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).children('a').off('click.zf.accordionMenu').on('click.zf.accordionMenu', function (e) { e.preventDefault(); _this.toggle($submenu); }); } } }).on('keydown.zf.accordionMenu', function (e) {
                                var $element = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this), $elements = $element.parent('ul').children('li'), $prevElement, $nextElement, $target = $element.children('[data-submenu]'); $elements.each(function (i) {
                                    if (jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).is($element)) {
                                        $prevElement = $elements.eq(Math.max(0, i - 1)).find('a').first(); $nextElement = $elements.eq(Math.min(i + 1, $elements.length - 1)).find('a').first(); if (jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).children('[data-submenu]:visible').length) { $nextElement = $element.find('li:first-child').find('a').first(); }
                                        if (jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).is(':first-child')) { $prevElement = $element.parents('li').first().find('a').first(); } else if ($prevElement.parents('li').first().children('[data-submenu]:visible').length) { $prevElement = $prevElement.parents('li').find('li:last-child').find('a').first(); }
                                        if (jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).is(':last-child')) { $nextElement = $element.parents('li').first().next('li').find('a').first(); }
                                        return;
                                    }
                                }); Keyboard.handleKey(e, 'AccordionMenu', {
                                    open: function open() { if ($target.is(':hidden')) { _this.down($target); $target.find('li').first().find('a').first().focus(); } }, close: function close() { if ($target.length && !$target.is(':hidden')) { _this.up($target); } else if ($element.parent('[data-submenu]').length) { _this.up($element.parent('[data-submenu]')); $element.parents('li').first().find('a').first().focus(); } }, up: function up() { $prevElement.focus(); return true; }, down: function down() { $nextElement.focus(); return true; }, toggle: function toggle() {
                                        if (_this.options.submenuToggle) { return false; }
                                        if ($element.children('[data-submenu]').length) { _this.toggle($element.children('[data-submenu]')); return true; }
                                    }, closeAll: function closeAll() { _this.hideAll(); }, handled: function handled(preventDefault) { if (preventDefault) { e.preventDefault(); } }
                                });
                            });
                        }
                    }, { key: "hideAll", value: function hideAll() { this.up(this.$element.find('[data-submenu]')); } }, { key: "showAll", value: function showAll() { this.down(this.$element.find('[data-submenu]')); } }, { key: "toggle", value: function toggle($target) { if (!$target.is(':animated')) { if (!$target.is(':hidden')) { this.up($target); } else { this.down($target); } } } }, {
                        key: "down", value: function down($target) {
                            var _this2 = this; if (!this.options.multiOpen) { var $targetBranch = $target.parentsUntil(this.$element).add($target).add($target.find('.is-active')); var $othersActiveSubmenus = this.$element.find('.is-active').not($targetBranch); this.up($othersActiveSubmenus); }
                            $target.addClass('is-active').attr({ 'aria-hidden': false }); if (this.options.submenuToggle) { $target.prev('.submenu-toggle').attr({ 'aria-expanded': true }); } else { $target.parent('.is-accordion-submenu-parent').attr({ 'aria-expanded': true }); }
                            $target.slideDown(this.options.slideSpeed, function () { _this2.$element.trigger('down.zf.accordionMenu', [$target]); });
                        }
                    }, {
                        key: "up", value: function up($target) {
                            var _this3 = this; var $submenus = $target.find('[data-submenu]'); var $allmenus = $target.add($submenus); $submenus.slideUp(0); $allmenus.removeClass('is-active').attr('aria-hidden', true); if (this.options.submenuToggle) { $allmenus.prev('.submenu-toggle').attr('aria-expanded', false); } else { $allmenus.parent('.is-accordion-submenu-parent').attr('aria-expanded', false); }
                            $target.slideUp(this.options.slideSpeed, function () { _this3.$element.trigger('up.zf.accordionMenu', [$target]); });
                        }
                    }, {
                        key: "_destroy", value: function _destroy() {
                            this.$element.find('[data-submenu]').slideDown(0).css('display', ''); this.$element.find('a').off('click.zf.accordionMenu'); this.$element.find('[data-is-parent-link]').detach(); if (this.options.submenuToggle) { this.$element.find('.has-submenu-toggle').removeClass('has-submenu-toggle'); this.$element.find('.submenu-toggle').remove(); }
                            Nest.Burn(this.$element, 'accordion');
                        }
                    }]); return AccordionMenu;
                }(Plugin); AccordionMenu.defaults = { parentLink: false, slideSpeed: 250, submenuToggle: false, submenuToggleText: 'Toggle menu', multiOpen: true }; var Drilldown = function (_Plugin) {
                    _inherits(Drilldown, _Plugin); function Drilldown() { _classCallCheck(this, Drilldown); return _possibleConstructorReturn(this, _getPrototypeOf(Drilldown).apply(this, arguments)); }
                    _createClass(Drilldown, [{ key: "_setup", value: function _setup(element, options) { this.$element = element; this.options = jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend({}, Drilldown.defaults, this.$element.data(), options); this.className = 'Drilldown'; this._init(); Keyboard.register('Drilldown', { 'ENTER': 'open', 'SPACE': 'open', 'ARROW_RIGHT': 'next', 'ARROW_UP': 'up', 'ARROW_DOWN': 'down', 'ARROW_LEFT': 'previous', 'ESCAPE': 'close', 'TAB': 'down', 'SHIFT_TAB': 'up' }); } }, {
                        key: "_init", value: function _init() {
                            Nest.Feather(this.$element, 'drilldown'); if (this.options.autoApplyClass) { this.$element.addClass('drilldown'); }
                            this.$element.attr({ 'role': 'tree', 'aria-multiselectable': false }); this.$submenuAnchors = this.$element.find('li.is-drilldown-submenu-parent').children('a'); this.$submenus = this.$submenuAnchors.parent('li').children('[data-submenu]').attr('role', 'group'); this.$menuItems = this.$element.find('li').not('.js-drilldown-back').attr('role', 'treeitem').find('a'); this.$currentMenu = this.$element; this.$element.attr('data-mutate', this.$element.attr('data-drilldown') || GetYoDigits(6, 'drilldown')); this._prepareMenu(); this._registerEvents(); this._keyboardEvents();
                        }
                    }, {
                        key: "_prepareMenu", value: function _prepareMenu() {
                            var _this = this; this.$submenuAnchors.each(function () {
                                var $link = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this); var $sub = $link.parent(); if (_this.options.parentLink) { $link.clone().prependTo($sub.children('[data-submenu]')).wrap('<li data-is-parent-link class="is-submenu-parent-item is-submenu-item is-drilldown-submenu-item" role="none"></li>'); }
                                $link.data('savedHref', $link.attr('href')).removeAttr('href').attr('tabindex', 0); $link.children('[data-submenu]').attr({ 'aria-hidden': true, 'tabindex': 0, 'role': 'group' }); _this._events($link);
                            }); this.$submenus.each(function () {
                                var $menu = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this), $back = $menu.find('.js-drilldown-back'); if (!$back.length) { switch (_this.options.backButtonPosition) { case "bottom": $menu.append(_this.options.backButton); break; case "top": $menu.prepend(_this.options.backButton); break; default: console.error("Unsupported backButtonPosition value '" + _this.options.backButtonPosition + "'"); } }
                                _this._back($menu);
                            }); this.$submenus.addClass('invisible'); if (!this.options.autoHeight) { this.$submenus.addClass('drilldown-submenu-cover-previous'); }
                            if (!this.$element.parent().hasClass('is-drilldown')) { this.$wrapper = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this.options.wrapper).addClass('is-drilldown'); if (this.options.animateHeight) this.$wrapper.addClass('animate-height'); this.$element.wrap(this.$wrapper); }
                            this.$wrapper = this.$element.parent(); this.$wrapper.css(this._getMaxDims());
                        }
                    }, { key: "_resize", value: function _resize() { this.$wrapper.css({ 'max-width': 'none', 'min-height': 'none' }); this.$wrapper.css(this._getMaxDims()); } }, {
                        key: "_events", value: function _events($elem) {
                            var _this = this; $elem.off('click.zf.drilldown').on('click.zf.drilldown', function (e) {
                                if (jquery__WEBPACK_IMPORTED_MODULE_0___default()(e.target).parentsUntil('ul', 'li').hasClass('is-drilldown-submenu-parent')) { e.preventDefault(); }
                                _this._show($elem.parent('li')); if (_this.options.closeOnClick) {
                                    var $body = jquery__WEBPACK_IMPORTED_MODULE_0___default()('body'); $body.off('.zf.drilldown').on('click.zf.drilldown', function (e) {
                                        if (e.target === _this.$element[0] || jquery__WEBPACK_IMPORTED_MODULE_0___default.a.contains(_this.$element[0], e.target)) { return; }
                                        e.preventDefault(); _this._hideAll(); $body.off('.zf.drilldown');
                                    });
                                }
                            });
                        }
                    }, {
                        key: "_registerEvents", value: function _registerEvents() {
                            if (this.options.scrollTop) { this._bindHandler = this._scrollTop.bind(this); this.$element.on('open.zf.drilldown hide.zf.drilldown close.zf.drilldown closed.zf.drilldown', this._bindHandler); }
                            this.$element.on('mutateme.zf.trigger', this._resize.bind(this));
                        }
                    }, { key: "_scrollTop", value: function _scrollTop() { var _this = this; var $scrollTopElement = _this.options.scrollTopElement != '' ? jquery__WEBPACK_IMPORTED_MODULE_0___default()(_this.options.scrollTopElement) : _this.$element, scrollPos = parseInt($scrollTopElement.offset().top + _this.options.scrollTopOffset, 10); jquery__WEBPACK_IMPORTED_MODULE_0___default()('html, body').stop(true).animate({ scrollTop: scrollPos }, _this.options.animationDuration, _this.options.animationEasing, function () { if (this === jquery__WEBPACK_IMPORTED_MODULE_0___default()('html')[0]) _this.$element.trigger('scrollme.zf.drilldown'); }); } }, { key: "_keyboardEvents", value: function _keyboardEvents() { var _this = this; this.$menuItems.add(this.$element.find('.js-drilldown-back > a, .is-submenu-parent-item > a')).on('keydown.zf.drilldown', function (e) { var $element = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this), $elements = $element.parent('li').parent('ul').children('li').children('a'), $prevElement, $nextElement; $elements.each(function (i) { if (jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).is($element)) { $prevElement = $elements.eq(Math.max(0, i - 1)); $nextElement = $elements.eq(Math.min(i + 1, $elements.length - 1)); return; } }); Keyboard.handleKey(e, 'Drilldown', { next: function next() { if ($element.is(_this.$submenuAnchors)) { _this._show($element.parent('li')); $element.parent('li').one(transitionend($element), function () { $element.parent('li').find('ul li a').not('.js-drilldown-back a').first().focus(); }); return true; } }, previous: function previous() { _this._hide($element.parent('li').parent('ul')); $element.parent('li').parent('ul').one(transitionend($element), function () { setTimeout(function () { $element.parent('li').parent('ul').parent('li').children('a').first().focus(); }, 1); }); return true; }, up: function up() { $prevElement.focus(); return !$element.is(_this.$element.find('> li:first-child > a')); }, down: function down() { $nextElement.focus(); return !$element.is(_this.$element.find('> li:last-child > a')); }, close: function close() { if (!$element.is(_this.$element.find('> li > a'))) { _this._hide($element.parent().parent()); $element.parent().parent().siblings('a').focus(); } }, open: function open() { if (_this.options.parentLink && $element.attr('href')) { return false; } else if (!$element.is(_this.$menuItems)) { _this._hide($element.parent('li').parent('ul')); $element.parent('li').parent('ul').one(transitionend($element), function () { setTimeout(function () { $element.parent('li').parent('ul').parent('li').children('a').first().focus(); }, 1); }); return true; } else if ($element.is(_this.$submenuAnchors)) { _this._show($element.parent('li')); $element.parent('li').one(transitionend($element), function () { $element.parent('li').find('ul li a').not('.js-drilldown-back a').first().focus(); }); return true; } }, handled: function handled(preventDefault) { if (preventDefault) { e.preventDefault(); } } }); }); } }, {
                        key: "_hideAll", value: function _hideAll() {
                            var _this2 = this; var $elem = this.$element.find('.is-drilldown-submenu.is-active'); $elem.addClass('is-closing'); if (this.options.autoHeight) { var calcHeight = $elem.parent().closest('ul').data('calcHeight'); this.$wrapper.css({ height: calcHeight }); }
                            this.$element.trigger('close.zf.drilldown'); $elem.one(transitionend($elem), function () { $elem.removeClass('is-active is-closing'); _this2.$element.trigger('closed.zf.drilldown'); });
                        }
                    }, { key: "_back", value: function _back($elem) { var _this = this; $elem.off('click.zf.drilldown'); $elem.children('.js-drilldown-back').on('click.zf.drilldown', function (e) { _this._hide($elem); var parentSubMenu = $elem.parent('li').parent('ul').parent('li'); if (parentSubMenu.length) { _this._show(parentSubMenu); } }); } }, { key: "_menuLinkEvents", value: function _menuLinkEvents() { var _this = this; this.$menuItems.not('.is-drilldown-submenu-parent').off('click.zf.drilldown').on('click.zf.drilldown', function (e) { setTimeout(function () { _this._hideAll(); }, 0); }); } }, { key: "_setShowSubMenuClasses", value: function _setShowSubMenuClasses($elem, trigger) { $elem.addClass('is-active').removeClass('invisible').attr('aria-hidden', false); $elem.parent('li').attr('aria-expanded', true); if (trigger === true) { this.$element.trigger('open.zf.drilldown', [$elem]); } } }, { key: "_setHideSubMenuClasses", value: function _setHideSubMenuClasses($elem, trigger) { $elem.removeClass('is-active').addClass('invisible').attr('aria-hidden', true); $elem.parent('li').attr('aria-expanded', false); if (trigger === true) { $elem.trigger('hide.zf.drilldown', [$elem]); } } }, {
                        key: "_showMenu", value: function _showMenu($elem, autoFocus) {
                            var _this = this; var $expandedSubmenus = this.$element.find('li[aria-expanded="true"] > ul[data-submenu]'); $expandedSubmenus.each(function (index) { _this._setHideSubMenuClasses(jquery__WEBPACK_IMPORTED_MODULE_0___default()(this)); }); this.$currentMenu = $elem; if ($elem.is('[data-drilldown]')) { if (autoFocus === true) $elem.find('li[role="treeitem"] > a').first().focus(); if (this.options.autoHeight) this.$wrapper.css('height', $elem.data('calcHeight')); return; }
                            var $submenus = $elem.children().first().parentsUntil('[data-drilldown]', '[data-submenu]'); $submenus.each(function (index) {
                                if (index === 0 && _this.options.autoHeight) { _this.$wrapper.css('height', jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).data('calcHeight')); }
                                var isLastChild = index == $submenus.length - 1; if (isLastChild === true) { jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).one(transitionend(jquery__WEBPACK_IMPORTED_MODULE_0___default()(this)), function () { if (autoFocus === true) { $elem.find('li[role="treeitem"] > a').first().focus(); } }); }
                                _this._setShowSubMenuClasses(jquery__WEBPACK_IMPORTED_MODULE_0___default()(this), isLastChild);
                            });
                        }
                    }, {
                        key: "_show", value: function _show($elem) {
                            var $submenu = $elem.children('[data-submenu]'); $elem.attr('aria-expanded', true); this.$currentMenu = $submenu; $submenu.addClass('is-active').removeClass('invisible').attr('aria-hidden', false); if (this.options.autoHeight) { this.$wrapper.css({ height: $submenu.data('calcHeight') }); }
                            this.$element.trigger('open.zf.drilldown', [$elem]);
                        }
                    }, { key: "_hide", value: function _hide($elem) { if (this.options.autoHeight) this.$wrapper.css({ height: $elem.parent().closest('ul').data('calcHeight') }); $elem.parent('li').attr('aria-expanded', false); $elem.attr('aria-hidden', true); $elem.addClass('is-closing').one(transitionend($elem), function () { $elem.removeClass('is-active is-closing'); $elem.blur().addClass('invisible'); }); $elem.trigger('hide.zf.drilldown', [$elem]); } }, { key: "_getMaxDims", value: function _getMaxDims() { var maxHeight = 0, result = {}, _this = this; this.$submenus.add(this.$element).each(function () { var numOfElems = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).children('li').length; var height = Box.GetDimensions(this).height; maxHeight = height > maxHeight ? height : maxHeight; if (_this.options.autoHeight) { jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).data('calcHeight', height); } }); if (this.options.autoHeight) result['height'] = this.$currentMenu.data('calcHeight'); else result['min-height'] = "".concat(maxHeight, "px"); result['max-width'] = "".concat(this.$element[0].getBoundingClientRect().width, "px"); return result; } }, { key: "_destroy", value: function _destroy() { if (this.options.scrollTop) this.$element.off('.zf.drilldown', this._bindHandler); this._hideAll(); this.$element.off('mutateme.zf.trigger'); Nest.Burn(this.$element, 'drilldown'); this.$element.unwrap().find('.js-drilldown-back, .is-submenu-parent-item').remove().end().find('.is-active, .is-closing, .is-drilldown-submenu').removeClass('is-active is-closing is-drilldown-submenu').end().find('[data-submenu]').removeAttr('aria-hidden tabindex role'); this.$submenuAnchors.each(function () { jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).off('.zf.drilldown'); }); this.$element.find('[data-is-parent-link]').detach(); this.$submenus.removeClass('drilldown-submenu-cover-previous invisible'); this.$element.find('a').each(function () { var $link = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this); $link.removeAttr('tabindex'); if ($link.data('savedHref')) { $link.attr('href', $link.data('savedHref')).removeData('savedHref'); } else { return; } }); } }]); return Drilldown;
                }(Plugin); Drilldown.defaults = { autoApplyClass: true, backButton: '<li class="js-drilldown-back"><a tabindex="0">Back</a></li>', backButtonPosition: 'top', wrapper: '<div></div>', parentLink: false, closeOnClick: false, autoHeight: false, animateHeight: false, scrollTop: false, scrollTopElement: '', scrollTopOffset: 0, animationDuration: 500, animationEasing: 'swing' }; var POSITIONS = ['left', 'right', 'top', 'bottom']; var VERTICAL_ALIGNMENTS = ['top', 'bottom', 'center']; var HORIZONTAL_ALIGNMENTS = ['left', 'right', 'center']; var ALIGNMENTS = { 'left': VERTICAL_ALIGNMENTS, 'right': VERTICAL_ALIGNMENTS, 'top': HORIZONTAL_ALIGNMENTS, 'bottom': HORIZONTAL_ALIGNMENTS }; function nextItem(item, array) { var currentIdx = array.indexOf(item); if (currentIdx === array.length - 1) { return array[0]; } else { return array[currentIdx + 1]; } }
                var Positionable = function (_Plugin) {
                    _inherits(Positionable, _Plugin); function Positionable() { _classCallCheck(this, Positionable); return _possibleConstructorReturn(this, _getPrototypeOf(Positionable).apply(this, arguments)); }
                    _createClass(Positionable, [{ key: "_init", value: function _init() { this.triedPositions = {}; this.position = this.options.position === 'auto' ? this._getDefaultPosition() : this.options.position; this.alignment = this.options.alignment === 'auto' ? this._getDefaultAlignment() : this.options.alignment; this.originalPosition = this.position; this.originalAlignment = this.alignment; } }, { key: "_getDefaultPosition", value: function _getDefaultPosition() { return 'bottom'; } }, { key: "_getDefaultAlignment", value: function _getDefaultAlignment() { switch (this.position) { case 'bottom': case 'top': return rtl() ? 'right' : 'left'; case 'left': case 'right': return 'bottom'; } } }, { key: "_reposition", value: function _reposition() { if (this._alignmentsExhausted(this.position)) { this.position = nextItem(this.position, POSITIONS); this.alignment = ALIGNMENTS[this.position][0]; } else { this._realign(); } } }, { key: "_realign", value: function _realign() { this._addTriedPosition(this.position, this.alignment); this.alignment = nextItem(this.alignment, ALIGNMENTS[this.position]); } }, { key: "_addTriedPosition", value: function _addTriedPosition(position, alignment) { this.triedPositions[position] = this.triedPositions[position] || []; this.triedPositions[position].push(alignment); } }, {
                        key: "_positionsExhausted", value: function _positionsExhausted() {
                            var isExhausted = true; for (var i = 0; i < POSITIONS.length; i++) { isExhausted = isExhausted && this._alignmentsExhausted(POSITIONS[i]); }
                            return isExhausted;
                        }
                    }, { key: "_alignmentsExhausted", value: function _alignmentsExhausted(position) { return this.triedPositions[position] && this.triedPositions[position].length == ALIGNMENTS[position].length; } }, { key: "_getVOffset", value: function _getVOffset() { return this.options.vOffset; } }, { key: "_getHOffset", value: function _getHOffset() { return this.options.hOffset; } }, {
                        key: "_setPosition", value: function _setPosition($anchor, $element, $parent) {
                            if ($anchor.attr('aria-expanded') === 'false') { return false; }
                            if (!this.options.allowOverlap) { this.position = this.originalPosition; this.alignment = this.originalAlignment; }
                            $element.offset(Box.GetExplicitOffsets($element, $anchor, this.position, this.alignment, this._getVOffset(), this._getHOffset())); if (!this.options.allowOverlap) {
                                var minOverlap = 100000000; var minCoordinates = { position: this.position, alignment: this.alignment }; while (!this._positionsExhausted()) {
                                    var overlap = Box.OverlapArea($element, $parent, false, false, this.options.allowBottomOverlap); if (overlap === 0) { return; }
                                    if (overlap < minOverlap) { minOverlap = overlap; minCoordinates = { position: this.position, alignment: this.alignment }; }
                                    this._reposition(); $element.offset(Box.GetExplicitOffsets($element, $anchor, this.position, this.alignment, this._getVOffset(), this._getHOffset()));
                                }
                                this.position = minCoordinates.position; this.alignment = minCoordinates.alignment; $element.offset(Box.GetExplicitOffsets($element, $anchor, this.position, this.alignment, this._getVOffset(), this._getHOffset()));
                            }
                        }
                    }]); return Positionable;
                }(Plugin); Positionable.defaults = { position: 'auto', alignment: 'auto', allowOverlap: false, allowBottomOverlap: true, vOffset: 0, hOffset: 0 }; var Dropdown = function (_Positionable) {
                    _inherits(Dropdown, _Positionable); function Dropdown() { _classCallCheck(this, Dropdown); return _possibleConstructorReturn(this, _getPrototypeOf(Dropdown).apply(this, arguments)); }
                    _createClass(Dropdown, [{ key: "_setup", value: function _setup(element, options) { this.$element = element; this.options = jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend({}, Dropdown.defaults, this.$element.data(), options); this.className = 'Dropdown'; Touch.init(jquery__WEBPACK_IMPORTED_MODULE_0___default.a); Triggers.init(jquery__WEBPACK_IMPORTED_MODULE_0___default.a); this._init(); Keyboard.register('Dropdown', { 'ENTER': 'toggle', 'SPACE': 'toggle', 'ESCAPE': 'close' }); } }, {
                        key: "_init", value: function _init() {
                            var $id = this.$element.attr('id'); this.$anchors = jquery__WEBPACK_IMPORTED_MODULE_0___default()("[data-toggle=\"".concat($id, "\"]")).length ? jquery__WEBPACK_IMPORTED_MODULE_0___default()("[data-toggle=\"".concat($id, "\"]")) : jquery__WEBPACK_IMPORTED_MODULE_0___default()("[data-open=\"".concat($id, "\"]")); this.$anchors.attr({ 'aria-controls': $id, 'data-is-focus': false, 'data-yeti-box': $id, 'aria-haspopup': true, 'aria-expanded': false }); this._setCurrentAnchor(this.$anchors.first()); if (this.options.parentClass) { this.$parent = this.$element.parents('.' + this.options.parentClass); } else { this.$parent = null; }
                            if (typeof this.$element.attr('aria-labelledby') === 'undefined') {
                                if (typeof this.$currentAnchor.attr('id') === 'undefined') { this.$currentAnchor.attr('id', GetYoDigits(6, 'dd-anchor')); }
                                this.$element.attr('aria-labelledby', this.$currentAnchor.attr('id'));
                            }
                            this.$element.attr({ 'aria-hidden': 'true', 'data-yeti-box': $id, 'data-resize': $id }); _get(_getPrototypeOf(Dropdown.prototype), "_init", this).call(this); this._events();
                        }
                    }, { key: "_getDefaultPosition", value: function _getDefaultPosition() { var position = this.$element[0].className.match(/(top|left|right|bottom)/g); if (position) { return position[0]; } else { return 'bottom'; } } }, {
                        key: "_getDefaultAlignment", value: function _getDefaultAlignment() {
                            var horizontalPosition = /float-(\S+)/.exec(this.$currentAnchor.attr('class')); if (horizontalPosition) { return horizontalPosition[1]; }
                            return _get(_getPrototypeOf(Dropdown.prototype), "_getDefaultAlignment", this).call(this);
                        }
                    }, { key: "_setPosition", value: function _setPosition() { this.$element.removeClass("has-position-".concat(this.position, " has-alignment-").concat(this.alignment)); _get(_getPrototypeOf(Dropdown.prototype), "_setPosition", this).call(this, this.$currentAnchor, this.$element, this.$parent); this.$element.addClass("has-position-".concat(this.position, " has-alignment-").concat(this.alignment)); } }, { key: "_setCurrentAnchor", value: function _setCurrentAnchor(el) { this.$currentAnchor = jquery__WEBPACK_IMPORTED_MODULE_0___default()(el); } }, {
                        key: "_events", value: function _events() {
                            var _this = this, hasTouch = 'ontouchstart' in window || typeof window.ontouchstart !== 'undefined'; this.$element.on({ 'open.zf.trigger': this.open.bind(this), 'close.zf.trigger': this.close.bind(this), 'toggle.zf.trigger': this.toggle.bind(this), 'resizeme.zf.trigger': this._setPosition.bind(this) }); this.$anchors.off('click.zf.trigger').on('click.zf.trigger', function (e) { _this._setCurrentAnchor(this); if (_this.options.forceFollow === false || hasTouch && _this.options.hover && _this.$element.hasClass('is-open') === false) { e.preventDefault(); } }); if (this.options.hover) { this.$anchors.off('mouseenter.zf.dropdown mouseleave.zf.dropdown').on('mouseenter.zf.dropdown', function () { _this._setCurrentAnchor(this); var bodyData = jquery__WEBPACK_IMPORTED_MODULE_0___default()('body').data(); if (typeof bodyData.whatinput === 'undefined' || bodyData.whatinput === 'mouse') { clearTimeout(_this.timeout); _this.timeout = setTimeout(function () { _this.open(); _this.$anchors.data('hover', true); }, _this.options.hoverDelay); } }).on('mouseleave.zf.dropdown', ignoreMousedisappear(function () { clearTimeout(_this.timeout); _this.timeout = setTimeout(function () { _this.close(); _this.$anchors.data('hover', false); }, _this.options.hoverDelay); })); if (this.options.hoverPane) { this.$element.off('mouseenter.zf.dropdown mouseleave.zf.dropdown').on('mouseenter.zf.dropdown', function () { clearTimeout(_this.timeout); }).on('mouseleave.zf.dropdown', ignoreMousedisappear(function () { clearTimeout(_this.timeout); _this.timeout = setTimeout(function () { _this.close(); _this.$anchors.data('hover', false); }, _this.options.hoverDelay); })); } }
                            this.$anchors.add(this.$element).on('keydown.zf.dropdown', function (e) { var $target = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this), visibleFocusableElements = Keyboard.findFocusable(_this.$element); Keyboard.handleKey(e, 'Dropdown', { open: function open() { if ($target.is(_this.$anchors) && !$target.is('input, textarea')) { _this.open(); _this.$element.attr('tabindex', -1).focus(); e.preventDefault(); } }, close: function close() { _this.close(); _this.$anchors.focus(); } }); });
                        }
                    }, {
                        key: "_addBodyHandler", value: function _addBodyHandler() {
                            var $body = jquery__WEBPACK_IMPORTED_MODULE_0___default()(document.body).not(this.$element), _this = this; $body.off('click.zf.dropdown tap.zf.dropdown').on('click.zf.dropdown tap.zf.dropdown', function (e) {
                                if (_this.$anchors.is(e.target) || _this.$anchors.find(e.target).length) { return; }
                                if (_this.$element.is(e.target) || _this.$element.find(e.target).length) { return; }
                                _this.close(); $body.off('click.zf.dropdown tap.zf.dropdown');
                            });
                        }
                    }, {
                        key: "open", value: function open() {
                            this.$element.trigger('closeme.zf.dropdown', this.$element.attr('id')); this.$anchors.addClass('hover').attr({ 'aria-expanded': true }); this.$element.addClass('is-opening'); this._setPosition(); this.$element.removeClass('is-opening').addClass('is-open').attr({ 'aria-hidden': false }); if (this.options.autoFocus) { var $focusable = Keyboard.findFocusable(this.$element); if ($focusable.length) { $focusable.eq(0).focus(); } }
                            if (this.options.closeOnClick) { this._addBodyHandler(); }
                            if (this.options.trapFocus) { Keyboard.trapFocus(this.$element); }
                            this.$element.trigger('show.zf.dropdown', [this.$element]);
                        }
                    }, {
                        key: "close", value: function close() {
                            if (!this.$element.hasClass('is-open')) { return false; }
                            this.$element.removeClass('is-open').attr({ 'aria-hidden': true }); this.$anchors.removeClass('hover').attr('aria-expanded', false); this.$element.trigger('hide.zf.dropdown', [this.$element]); if (this.options.trapFocus) { Keyboard.releaseFocus(this.$element); }
                        }
                    }, { key: "toggle", value: function toggle() { if (this.$element.hasClass('is-open')) { if (this.$anchors.data('hover')) return; this.close(); } else { this.open(); } } }, { key: "_destroy", value: function _destroy() { this.$element.off('.zf.trigger').hide(); this.$anchors.off('.zf.dropdown'); jquery__WEBPACK_IMPORTED_MODULE_0___default()(document.body).off('click.zf.dropdown tap.zf.dropdown'); } }]); return Dropdown;
                }(Positionable); Dropdown.defaults = { parentClass: null, hoverDelay: 250, hover: false, hoverPane: false, vOffset: 0, hOffset: 0, position: 'auto', alignment: 'auto', allowOverlap: false, allowBottomOverlap: true, trapFocus: false, autoFocus: false, closeOnClick: false, forceFollow: true }; var DropdownMenu = function (_Plugin) {
                    _inherits(DropdownMenu, _Plugin); function DropdownMenu() { _classCallCheck(this, DropdownMenu); return _possibleConstructorReturn(this, _getPrototypeOf(DropdownMenu).apply(this, arguments)); }
                    _createClass(DropdownMenu, [{ key: "_setup", value: function _setup(element, options) { this.$element = element; this.options = jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend({}, DropdownMenu.defaults, this.$element.data(), options); this.className = 'DropdownMenu'; Touch.init(jquery__WEBPACK_IMPORTED_MODULE_0___default.a); this._init(); Keyboard.register('DropdownMenu', { 'ENTER': 'open', 'SPACE': 'open', 'ARROW_RIGHT': 'next', 'ARROW_UP': 'up', 'ARROW_DOWN': 'down', 'ARROW_LEFT': 'previous', 'ESCAPE': 'close' }); } }, {
                        key: "_init", value: function _init() {
                            Nest.Feather(this.$element, 'dropdown'); var subs = this.$element.find('li.is-dropdown-submenu-parent'); this.$element.children('.is-dropdown-submenu-parent').children('.is-dropdown-submenu').addClass('first-sub'); this.$menuItems = this.$element.find('li[role="none"]'); this.$tabs = this.$element.children('li[role="none"]'); this.$tabs.find('ul.is-dropdown-submenu').addClass(this.options.verticalClass); if (this.options.alignment === 'auto') { if (this.$element.hasClass(this.options.rightClass) || rtl() || this.$element.parents('.top-bar-right').is('*')) { this.options.alignment = 'right'; subs.addClass('opens-left'); } else { this.options.alignment = 'left'; subs.addClass('opens-right'); } } else { if (this.options.alignment === 'right') { subs.addClass('opens-left'); } else { subs.addClass('opens-right'); } }
                            this.changed = false; this._events();
                        }
                    }, { key: "_isVertical", value: function _isVertical() { return this.$tabs.css('display') === 'block' || this.$element.css('flex-direction') === 'column'; } }, { key: "_isRtl", value: function _isRtl() { return this.$element.hasClass('align-right') || rtl() && !this.$element.hasClass('align-left'); } }, {
                        key: "_events", value: function _events() {
                            var _this = this, hasTouch = 'ontouchstart' in window || typeof window.ontouchstart !== 'undefined', parClass = 'is-dropdown-submenu-parent'; var handleClickFn = function handleClickFn(e) {
                                var $elem = jquery__WEBPACK_IMPORTED_MODULE_0___default()(e.target).parentsUntil('ul', ".".concat(parClass)), hasSub = $elem.hasClass(parClass), hasClicked = $elem.attr('data-is-click') === 'true', $sub = $elem.children('.is-dropdown-submenu'); if (hasSub) {
                                    if (hasClicked) {
                                        if (!_this.options.closeOnClick || !_this.options.clickOpen && !hasTouch || _this.options.forceFollow && hasTouch) { return; }
                                        e.stopImmediatePropagation(); e.preventDefault(); _this._hide($elem);
                                    } else { e.stopImmediatePropagation(); e.preventDefault(); _this._show($sub); $elem.add($elem.parentsUntil(_this.$element, ".".concat(parClass))).attr('data-is-click', true); }
                                }
                            }; if (this.options.clickOpen || hasTouch) { this.$menuItems.on('click.zf.dropdownMenu touchstart.zf.dropdownMenu', handleClickFn); }
                            if (_this.options.closeOnClickInside) { this.$menuItems.on('click.zf.dropdownMenu', function (e) { var $elem = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this), hasSub = $elem.hasClass(parClass); if (!hasSub) { _this._hide(); } }); }
                            if (!this.options.disableHover) {
                                this.$menuItems.on('mouseenter.zf.dropdownMenu', function (e) { var $elem = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this), hasSub = $elem.hasClass(parClass); if (hasSub) { clearTimeout($elem.data('_delay')); $elem.data('_delay', setTimeout(function () { _this._show($elem.children('.is-dropdown-submenu')); }, _this.options.hoverDelay)); } }).on('mouseleave.zf.dropdownMenu', ignoreMousedisappear(function (e) {
                                    var $elem = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this), hasSub = $elem.hasClass(parClass); if (hasSub && _this.options.autoclose) {
                                        if ($elem.attr('data-is-click') === 'true' && _this.options.clickOpen) { return false; }
                                        clearTimeout($elem.data('_delay')); $elem.data('_delay', setTimeout(function () { _this._hide($elem); }, _this.options.closingTime));
                                    }
                                }));
                            }
                            this.$menuItems.on('keydown.zf.dropdownMenu', function (e) {
                                var $element = jquery__WEBPACK_IMPORTED_MODULE_0___default()(e.target).parentsUntil('ul', '[role="none"]'), isTab = _this.$tabs.index($element) > -1, $elements = isTab ? _this.$tabs : $element.siblings('li').add($element), $prevElement, $nextElement; $elements.each(function (i) { if (jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).is($element)) { $prevElement = $elements.eq(i - 1); $nextElement = $elements.eq(i + 1); return; } }); var nextSibling = function nextSibling() { $nextElement.children('a:first').focus(); e.preventDefault(); }, prevSibling = function prevSibling() { $prevElement.children('a:first').focus(); e.preventDefault(); }, openSub = function openSub() { var $sub = $element.children('ul.is-dropdown-submenu'); if ($sub.length) { _this._show($sub); $element.find('li > a:first').focus(); e.preventDefault(); } else { return; } }, closeSub = function closeSub() { var close = $element.parent('ul').parent('li'); close.children('a:first').focus(); _this._hide(close); e.preventDefault(); }; var functions = { open: openSub, close: function close() { _this._hide(_this.$element); _this.$menuItems.eq(0).children('a').focus(); e.preventDefault(); } }; if (isTab) { if (_this._isVertical()) { if (_this._isRtl()) { jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend(functions, { down: nextSibling, up: prevSibling, next: closeSub, previous: openSub }); } else { jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend(functions, { down: nextSibling, up: prevSibling, next: openSub, previous: closeSub }); } } else { if (_this._isRtl()) { jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend(functions, { next: prevSibling, previous: nextSibling, down: openSub, up: closeSub }); } else { jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend(functions, { next: nextSibling, previous: prevSibling, down: openSub, up: closeSub }); } } } else { if (_this._isRtl()) { jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend(functions, { next: closeSub, previous: openSub, down: nextSibling, up: prevSibling }); } else { jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend(functions, { next: openSub, previous: closeSub, down: nextSibling, up: prevSibling }); } }
                                Keyboard.handleKey(e, 'DropdownMenu', functions);
                            });
                        }
                    }, { key: "_addBodyHandler", value: function _addBodyHandler() { var _this2 = this; var $body = jquery__WEBPACK_IMPORTED_MODULE_0___default()(document.body); this._removeBodyHandler(); $body.on('click.zf.dropdownMenu tap.zf.dropdownMenu', function (e) { var isItself = !!jquery__WEBPACK_IMPORTED_MODULE_0___default()(e.target).closest(_this2.$element).length; if (isItself) return; _this2._hide(); _this2._removeBodyHandler(); }); } }, { key: "_removeBodyHandler", value: function _removeBodyHandler() { jquery__WEBPACK_IMPORTED_MODULE_0___default()(document.body).off('click.zf.dropdownMenu tap.zf.dropdownMenu'); } }, {
                        key: "_show", value: function _show($sub) {
                            var idx = this.$tabs.index(this.$tabs.filter(function (i, el) { return jquery__WEBPACK_IMPORTED_MODULE_0___default()(el).find($sub).length > 0; })); var $sibs = $sub.parent('li.is-dropdown-submenu-parent').siblings('li.is-dropdown-submenu-parent'); this._hide($sibs, idx); $sub.css('visibility', 'hidden').addClass('js-dropdown-active').parent('li.is-dropdown-submenu-parent').addClass('is-active'); var clear = Box.ImNotTouchingYou($sub, null, true); if (!clear) {
                                var oldClass = this.options.alignment === 'left' ? '-right' : '-left', $parentLi = $sub.parent('.is-dropdown-submenu-parent'); $parentLi.removeClass("opens".concat(oldClass)).addClass("opens-".concat(this.options.alignment)); clear = Box.ImNotTouchingYou($sub, null, true); if (!clear) { $parentLi.removeClass("opens-".concat(this.options.alignment)).addClass('opens-inner'); }
                                this.changed = true;
                            }
                            $sub.css('visibility', ''); if (this.options.closeOnClick) { this._addBodyHandler(); }
                            this.$element.trigger('show.zf.dropdownMenu', [$sub]);
                        }
                    }, {
                        key: "_hide", value: function _hide($elem, idx) {
                            var $toClose; if ($elem && $elem.length) { $toClose = $elem; } else if (typeof idx !== 'undefined') { $toClose = this.$tabs.not(function (i, el) { return i === idx; }); } else { $toClose = this.$element; }
                            var somethingToClose = $toClose.hasClass('is-active') || $toClose.find('.is-active').length > 0; if (somethingToClose) {
                                var $activeItem = $toClose.find('li.is-active'); $activeItem.add($toClose).attr({ 'data-is-click': false }).removeClass('is-active'); $toClose.find('ul.js-dropdown-active').removeClass('js-dropdown-active'); if (this.changed || $toClose.find('opens-inner').length) { var oldClass = this.options.alignment === 'left' ? 'right' : 'left'; $toClose.find('li.is-dropdown-submenu-parent').add($toClose).removeClass("opens-inner opens-".concat(this.options.alignment)).addClass("opens-".concat(oldClass)); this.changed = false; }
                                clearTimeout($activeItem.data('_delay')); this._removeBodyHandler(); this.$element.trigger('hide.zf.dropdownMenu', [$toClose]);
                            }
                        }
                    }, { key: "_destroy", value: function _destroy() { this.$menuItems.off('.zf.dropdownMenu').removeAttr('data-is-click').removeClass('is-right-arrow is-left-arrow is-down-arrow opens-right opens-left opens-inner'); jquery__WEBPACK_IMPORTED_MODULE_0___default()(document.body).off('.zf.dropdownMenu'); Nest.Burn(this.$element, 'dropdown'); } }]); return DropdownMenu;
                }(Plugin); DropdownMenu.defaults = { disableHover: false, autoclose: true, hoverDelay: 50, clickOpen: false, closingTime: 500, alignment: 'auto', closeOnClick: true, closeOnClickInside: true, verticalClass: 'vertical', rightClass: 'align-right', forceFollow: true }; var Equalizer = function (_Plugin) {
                    _inherits(Equalizer, _Plugin); function Equalizer() { _classCallCheck(this, Equalizer); return _possibleConstructorReturn(this, _getPrototypeOf(Equalizer).apply(this, arguments)); }
                    _createClass(Equalizer, [{ key: "_setup", value: function _setup(element, options) { this.$element = element; this.options = jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend({}, Equalizer.defaults, this.$element.data(), options); this.className = 'Equalizer'; this._init(); } }, {
                        key: "_init", value: function _init() {
                            var eqId = this.$element.attr('data-equalizer') || ''; var $watched = this.$element.find("[data-equalizer-watch=\"".concat(eqId, "\"]")); MediaQuery._init(); this.$watched = $watched.length ? $watched : this.$element.find('[data-equalizer-watch]'); this.$element.attr('data-resize', eqId || GetYoDigits(6, 'eq')); this.$element.attr('data-mutate', eqId || GetYoDigits(6, 'eq')); this.hasNested = this.$element.find('[data-equalizer]').length > 0; this.isNested = this.$element.parentsUntil(document.body, '[data-equalizer]').length > 0; this.isOn = false; this._bindHandler = { onResizeMeBound: this._onResizeMe.bind(this), onPostEqualizedBound: this._onPostEqualized.bind(this) }; var imgs = this.$element.find('img'); var tooSmall; if (this.options.equalizeOn) { tooSmall = this._checkMQ(); jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).on('changed.zf.mediaquery', this._checkMQ.bind(this)); } else { this._events(); }
                            if (typeof tooSmall !== 'undefined' && tooSmall === false || typeof tooSmall === 'undefined') { if (imgs.length) { onImagesLoaded(imgs, this._reflow.bind(this)); } else { this._reflow(); } }
                        }
                    }, { key: "_pauseEvents", value: function _pauseEvents() { this.isOn = false; this.$element.off({ '.zf.equalizer': this._bindHandler.onPostEqualizedBound, 'resizeme.zf.trigger': this._bindHandler.onResizeMeBound, 'mutateme.zf.trigger': this._bindHandler.onResizeMeBound }); } }, { key: "_onResizeMe", value: function _onResizeMe(e) { this._reflow(); } }, { key: "_onPostEqualized", value: function _onPostEqualized(e) { if (e.target !== this.$element[0]) { this._reflow(); } } }, {
                        key: "_events", value: function _events() {
                            this._pauseEvents(); if (this.hasNested) { this.$element.on('postequalized.zf.equalizer', this._bindHandler.onPostEqualizedBound); } else { this.$element.on('resizeme.zf.trigger', this._bindHandler.onResizeMeBound); this.$element.on('mutateme.zf.trigger', this._bindHandler.onResizeMeBound); }
                            this.isOn = true;
                        }
                    }, {
                        key: "_checkMQ", value: function _checkMQ() {
                            var tooSmall = !MediaQuery.is(this.options.equalizeOn); if (tooSmall) { if (this.isOn) { this._pauseEvents(); this.$watched.css('height', 'auto'); } } else { if (!this.isOn) { this._events(); } }
                            return tooSmall;
                        }
                    }, { key: "_killswitch", value: function _killswitch() { return; } }, {
                        key: "_reflow", value: function _reflow() {
                            if (!this.options.equalizeOnStack) { if (this._isStacked()) { this.$watched.css('height', 'auto'); return false; } }
                            if (this.options.equalizeByRow) { this.getHeightsByRow(this.applyHeightByRow.bind(this)); } else { this.getHeights(this.applyHeight.bind(this)); }
                        }
                    }, {
                        key: "_isStacked", value: function _isStacked() {
                            if (!this.$watched[0] || !this.$watched[1]) { return true; }
                            return this.$watched[0].getBoundingClientRect().top !== this.$watched[1].getBoundingClientRect().top;
                        }
                    }, {
                        key: "getHeights", value: function getHeights(cb) {
                            var heights = []; for (var i = 0, len = this.$watched.length; i < len; i++) { this.$watched[i].style.height = 'auto'; heights.push(this.$watched[i].offsetHeight); }
                            cb(heights);
                        }
                    }, {
                        key: "getHeightsByRow", value: function getHeightsByRow(cb) {
                            var lastElTopOffset = this.$watched.length ? this.$watched.first().offset().top : 0, groups = [], group = 0; groups[group] = []; for (var i = 0, len = this.$watched.length; i < len; i++) {
                                this.$watched[i].style.height = 'auto'; var elOffsetTop = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this.$watched[i]).offset().top; if (elOffsetTop != lastElTopOffset) { group++; groups[group] = []; lastElTopOffset = elOffsetTop; }
                                groups[group].push([this.$watched[i], this.$watched[i].offsetHeight]);
                            }
                            for (var j = 0, ln = groups.length; j < ln; j++) { var heights = jquery__WEBPACK_IMPORTED_MODULE_0___default()(groups[j]).map(function () { return this[1]; }).get(); var max = Math.max.apply(null, heights); groups[j].push(max); }
                            cb(groups);
                        }
                    }, { key: "applyHeight", value: function applyHeight(heights) { var max = Math.max.apply(null, heights); this.$element.trigger('preequalized.zf.equalizer'); this.$watched.css('height', max); this.$element.trigger('postequalized.zf.equalizer'); } }, {
                        key: "applyHeightByRow", value: function applyHeightByRow(groups) {
                            this.$element.trigger('preequalized.zf.equalizer'); for (var i = 0, len = groups.length; i < len; i++) {
                                var groupsILength = groups[i].length, max = groups[i][groupsILength - 1]; if (groupsILength <= 2) { jquery__WEBPACK_IMPORTED_MODULE_0___default()(groups[i][0][0]).css({ 'height': 'auto' }); continue; }
                                this.$element.trigger('preequalizedrow.zf.equalizer'); for (var j = 0, lenJ = groupsILength - 1; j < lenJ; j++) { jquery__WEBPACK_IMPORTED_MODULE_0___default()(groups[i][j][0]).css({ 'height': max }); }
                                this.$element.trigger('postequalizedrow.zf.equalizer');
                            }
                            this.$element.trigger('postequalized.zf.equalizer');
                        }
                    }, { key: "_destroy", value: function _destroy() { this._pauseEvents(); this.$watched.css('height', 'auto'); } }]); return Equalizer;
                }(Plugin); Equalizer.defaults = { equalizeOnStack: false, equalizeByRow: false, equalizeOn: '' }; var Interchange = function (_Plugin) {
                    _inherits(Interchange, _Plugin); function Interchange() { _classCallCheck(this, Interchange); return _possibleConstructorReturn(this, _getPrototypeOf(Interchange).apply(this, arguments)); }
                    _createClass(Interchange, [{ key: "_setup", value: function _setup(element, options) { this.$element = element; this.options = jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend({}, Interchange.defaults, this.$element.data(), options); this.rules = []; this.currentPath = ''; this.className = 'Interchange'; Triggers.init(jquery__WEBPACK_IMPORTED_MODULE_0___default.a); this._init(); this._events(); } }, { key: "_init", value: function _init() { MediaQuery._init(); var id = this.$element[0].id || GetYoDigits(6, 'interchange'); this.$element.attr({ 'data-resize': id, 'id': id }); this._parseOptions(); this._addBreakpoints(); this._generateRules(); this._reflow(); } }, { key: "_events", value: function _events() { var _this = this; this.$element.off('resizeme.zf.trigger').on('resizeme.zf.trigger', function () { return _this._reflow(); }); } }, {
                        key: "_reflow", value: function _reflow() {
                            var match; for (var i in this.rules) { if (this.rules.hasOwnProperty(i)) { var rule = this.rules[i]; if (window.matchMedia(rule.query).matches) { match = rule; } } }
                            if (match) { this.replace(match.path); }
                        }
                    }, { key: "_parseOptions", value: function _parseOptions() { var types = ['auto', 'src', 'background', 'html']; if (typeof this.options.type === 'undefined') this.options.type = 'auto'; else if (types.indexOf(this.options.type) === -1) { console.log("Warning: invalid value \"".concat(this.options.type, "\" for Interchange option \"type\"")); this.options.type = 'auto'; } } }, { key: "_addBreakpoints", value: function _addBreakpoints() { for (var i in MediaQuery.queries) { if (MediaQuery.queries.hasOwnProperty(i)) { var query = MediaQuery.queries[i]; Interchange.SPECIAL_QUERIES[query.name] = query.value; } } } }, {
                        key: "_generateRules", value: function _generateRules(element) {
                            var rulesList = []; var rules; if (this.options.rules) { rules = this.options.rules; } else { rules = this.$element.data('interchange'); }
                            rules = typeof rules === 'string' ? rules.match(/\[.*?, .*?\]/g) : rules; for (var i in rules) {
                                if (rules.hasOwnProperty(i)) {
                                    var rule = rules[i].slice(1, -1).split(', '); var path = rule.slice(0, -1).join(''); var query = rule[rule.length - 1]; if (Interchange.SPECIAL_QUERIES[query]) { query = Interchange.SPECIAL_QUERIES[query]; }
                                    rulesList.push({ path: path, query: query });
                                }
                            }
                            this.rules = rulesList;
                        }
                    }, {
                        key: "replace", value: function replace(path) {
                            var _this2 = this; if (this.currentPath === path) return; var trigger = 'replaced.zf.interchange'; var type = this.options.type; if (type === 'auto') { if (this.$element[0].nodeName === 'IMG') type = 'src'; else if (path.match(/\.(gif|jpe?g|png|svg|tiff)([?#].*)?/i)) type = 'background'; else type = 'html'; }
                            if (type === 'src') { this.$element.attr('src', path).on('load', function () { _this2.currentPath = path; }).trigger(trigger); }
                            else if (type === 'background') { path = path.replace(/\(/g, '%28').replace(/\)/g, '%29'); this.$element.css({ 'background-image': 'url(' + path + ')' }).trigger(trigger); }
                            else if (type === 'html') { jquery__WEBPACK_IMPORTED_MODULE_0___default.a.get(path, function (response) { _this2.$element.html(response).trigger(trigger); jquery__WEBPACK_IMPORTED_MODULE_0___default()(response).foundation(); _this2.currentPath = path; }); }
                        }
                    }, { key: "_destroy", value: function _destroy() { this.$element.off('resizeme.zf.trigger'); } }]); return Interchange;
                }(Plugin); Interchange.defaults = { rules: null, type: 'auto' }; Interchange.SPECIAL_QUERIES = { 'landscape': 'screen and (orientation: landscape)', 'portrait': 'screen and (orientation: portrait)', 'retina': 'only screen and (-webkit-min-device-pixel-ratio: 2), only screen and (min--moz-device-pixel-ratio: 2), only screen and (-o-min-device-pixel-ratio: 2/1), only screen and (min-device-pixel-ratio: 2), only screen and (min-resolution: 192dpi), only screen and (min-resolution: 2dppx)' }; var SmoothScroll = function (_Plugin) {
                    _inherits(SmoothScroll, _Plugin); function SmoothScroll() { _classCallCheck(this, SmoothScroll); return _possibleConstructorReturn(this, _getPrototypeOf(SmoothScroll).apply(this, arguments)); }
                    _createClass(SmoothScroll, [{ key: "_setup", value: function _setup(element, options) { this.$element = element; this.options = jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend({}, SmoothScroll.defaults, this.$element.data(), options); this.className = 'SmoothScroll'; this._init(); } }, { key: "_init", value: function _init() { var id = this.$element[0].id || GetYoDigits(6, 'smooth-scroll'); this.$element.attr({ id: id }); this._events(); } }, { key: "_events", value: function _events() { this._linkClickListener = this._handleLinkClick.bind(this); this.$element.on('click.zf.smoothScroll', this._linkClickListener); this.$element.on('click.zf.smoothScroll', 'a[href^="#"]', this._linkClickListener); } }, { key: "_handleLinkClick", value: function _handleLinkClick(e) { var _this = this; if (!jquery__WEBPACK_IMPORTED_MODULE_0___default()(e.currentTarget).is('a[href^="#"]')) return; var arrival = e.currentTarget.getAttribute('href'); this._inTransition = true; SmoothScroll.scrollToLoc(arrival, this.options, function () { _this._inTransition = false; }); e.preventDefault(); } }, { key: "_destroy", value: function _destroy() { this.$element.off('click.zf.smoothScroll', this._linkClickListener); this.$element.off('click.zf.smoothScroll', 'a[href^="#"]', this._linkClickListener); } }], [{ key: "scrollToLoc", value: function scrollToLoc(loc) { var options = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : SmoothScroll.defaults; var callback = arguments.length > 2 ? arguments[2] : undefined; var $loc = jquery__WEBPACK_IMPORTED_MODULE_0___default()(loc); if (!$loc.length) return false; var scrollPos = Math.round($loc.offset().top - options.threshold / 2 - options.offset); jquery__WEBPACK_IMPORTED_MODULE_0___default()('html, body').stop(true).animate({ scrollTop: scrollPos }, options.animationDuration, options.animationEasing, function () { if (typeof callback === 'function') { callback(); } }); } }]); return SmoothScroll;
                }(Plugin); SmoothScroll.defaults = { animationDuration: 500, animationEasing: 'linear', threshold: 50, offset: 0 }; var Magellan = function (_Plugin) {
                    _inherits(Magellan, _Plugin); function Magellan() { _classCallCheck(this, Magellan); return _possibleConstructorReturn(this, _getPrototypeOf(Magellan).apply(this, arguments)); }
                    _createClass(Magellan, [{ key: "_setup", value: function _setup(element, options) { this.$element = element; this.options = jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend({}, Magellan.defaults, this.$element.data(), options); this.className = 'Magellan'; Triggers.init(jquery__WEBPACK_IMPORTED_MODULE_0___default.a); this._init(); this.calcPoints(); } }, { key: "_init", value: function _init() { var id = this.$element[0].id || GetYoDigits(6, 'magellan'); this.$targets = jquery__WEBPACK_IMPORTED_MODULE_0___default()('[data-magellan-target]'); this.$links = this.$element.find('a'); this.$element.attr({ 'data-resize': id, 'data-scroll': id, 'id': id }); this.$active = jquery__WEBPACK_IMPORTED_MODULE_0___default()(); this.scrollPos = parseInt(window.pageYOffset, 10); this._events(); } }, { key: "calcPoints", value: function calcPoints() { var _this = this, body = document.body, html = document.documentElement; this.points = []; this.winHeight = Math.round(Math.max(window.innerHeight, html.clientHeight)); this.docHeight = Math.round(Math.max(body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight)); this.$targets.each(function () { var $tar = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this), pt = Math.round($tar.offset().top - _this.options.threshold); $tar.targetPoint = pt; _this.points.push(pt); }); } }, {
                        key: "_events", value: function _events() {
                            var _this = this; jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).one('load', function () {
                                if (_this.options.deepLinking) { if (location.hash) { _this.scrollToLoc(location.hash); } }
                                _this.calcPoints(); _this._updateActive();
                            }); _this.onLoadListener = onLoad(jquery__WEBPACK_IMPORTED_MODULE_0___default()(window), function () { _this.$element.on({ 'resizeme.zf.trigger': _this.reflow.bind(_this), 'scrollme.zf.trigger': _this._updateActive.bind(_this) }).on('click.zf.magellan', 'a[href^="#"]', function (e) { e.preventDefault(); var arrival = this.getAttribute('href'); _this.scrollToLoc(arrival); }); }); this._deepLinkScroll = function (e) { if (_this.options.deepLinking) { _this.scrollToLoc(window.location.hash); } }; jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).on('hashchange', this._deepLinkScroll);
                        }
                    }, { key: "scrollToLoc", value: function scrollToLoc(loc) { this._inTransition = true; var _this = this; var options = { animationEasing: this.options.animationEasing, animationDuration: this.options.animationDuration, threshold: this.options.threshold, offset: this.options.offset }; SmoothScroll.scrollToLoc(loc, options, function () { _this._inTransition = false; }); } }, { key: "reflow", value: function reflow() { this.calcPoints(); this._updateActive(); } }, {
                        key: "_updateActive", value: function _updateActive() {
                            var _this2 = this; if (this._inTransition) return; var newScrollPos = parseInt(window.pageYOffset, 10); var isScrollingUp = this.scrollPos > newScrollPos; this.scrollPos = newScrollPos; var activeIdx; if (newScrollPos < this.points[0]); else if (newScrollPos + this.winHeight === this.docHeight) { activeIdx = this.points.length - 1; }
                            else { var visibleLinks = this.points.filter(function (p, i) { return p - _this2.options.offset - (isScrollingUp ? _this2.options.threshold : 0) <= newScrollPos; }); activeIdx = visibleLinks.length ? visibleLinks.length - 1 : 0; }
                            var $oldActive = this.$active; var activeHash = ''; if (typeof activeIdx !== 'undefined') { this.$active = this.$links.filter('[href="#' + this.$targets.eq(activeIdx).data('magellan-target') + '"]'); if (this.$active.length) activeHash = this.$active[0].getAttribute('href'); } else { this.$active = jquery__WEBPACK_IMPORTED_MODULE_0___default()(); }
                            var isNewActive = !(!this.$active.length && !$oldActive.length) && !this.$active.is($oldActive); var isNewHash = activeHash !== window.location.hash; if (isNewActive) { $oldActive.removeClass(this.options.activeClass); this.$active.addClass(this.options.activeClass); }
                            if (this.options.deepLinking && isNewHash) { if (window.history.pushState) { var url = activeHash ? activeHash : window.location.pathname + window.location.search; if (this.options.updateHistory) { window.history.pushState({}, '', url); } else { window.history.replaceState({}, '', url); } } else { window.location.hash = activeHash; } }
                            if (isNewActive) { this.$element.trigger('update.zf.magellan', [this.$active]); }
                        }
                    }, {
                        key: "_destroy", value: function _destroy() {
                            this.$element.off('.zf.trigger .zf.magellan').find(".".concat(this.options.activeClass)).removeClass(this.options.activeClass); if (this.options.deepLinking) { var hash = this.$active[0].getAttribute('href'); window.location.hash.replace(hash, ''); }
                            jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).off('hashchange', this._deepLinkScroll); if (this.onLoadListener) jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).off(this.onLoadListener);
                        }
                    }]); return Magellan;
                }(Plugin); Magellan.defaults = { animationDuration: 500, animationEasing: 'linear', threshold: 50, activeClass: 'is-active', deepLinking: false, updateHistory: false, offset: 0 }; var OffCanvas = function (_Plugin) {
                    _inherits(OffCanvas, _Plugin); function OffCanvas() { _classCallCheck(this, OffCanvas); return _possibleConstructorReturn(this, _getPrototypeOf(OffCanvas).apply(this, arguments)); }
                    _createClass(OffCanvas, [{ key: "_setup", value: function _setup(element, options) { var _this2 = this; this.className = 'OffCanvas'; this.$element = element; this.options = jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend({}, OffCanvas.defaults, this.$element.data(), options); this.contentClasses = { base: [], reveal: [] }; this.$lastTrigger = jquery__WEBPACK_IMPORTED_MODULE_0___default()(); this.$triggers = jquery__WEBPACK_IMPORTED_MODULE_0___default()(); this.position = 'left'; this.$content = jquery__WEBPACK_IMPORTED_MODULE_0___default()(); this.nested = !!this.options.nested; this.$sticky = jquery__WEBPACK_IMPORTED_MODULE_0___default()(); this.isInCanvas = false; jquery__WEBPACK_IMPORTED_MODULE_0___default()(['push', 'overlap']).each(function (index, val) { _this2.contentClasses.base.push('has-transition-' + val); }); jquery__WEBPACK_IMPORTED_MODULE_0___default()(['left', 'right', 'top', 'bottom']).each(function (index, val) { _this2.contentClasses.base.push('has-position-' + val); _this2.contentClasses.reveal.push('has-reveal-' + val); }); Triggers.init(jquery__WEBPACK_IMPORTED_MODULE_0___default.a); MediaQuery._init(); this._init(); this._events(); Keyboard.register('OffCanvas', { 'ESCAPE': 'close' }); } }, {
                        key: "_init", value: function _init() {
                            var id = this.$element.attr('id'); this.$element.attr('aria-hidden', 'true'); if (this.options.contentId) { this.$content = jquery__WEBPACK_IMPORTED_MODULE_0___default()('#' + this.options.contentId); } else if (this.$element.siblings('[data-off-canvas-content]').length) { this.$content = this.$element.siblings('[data-off-canvas-content]').first(); } else { this.$content = this.$element.closest('[data-off-canvas-content]').first(); }
                            if (!this.options.contentId) { this.nested = this.$element.siblings('[data-off-canvas-content]').length === 0; } else if (this.options.contentId && this.options.nested === null) { console.warn('Remember to use the nested option if using the content ID option!'); }
                            if (this.nested === true) { this.options.transition = 'overlap'; this.$element.removeClass('is-transition-push'); }
                            this.$element.addClass("is-transition-".concat(this.options.transition, " is-closed")); this.$triggers = jquery__WEBPACK_IMPORTED_MODULE_0___default()(document).find('[data-open="' + id + '"], [data-close="' + id + '"], [data-toggle="' + id + '"]').attr('aria-expanded', 'false').attr('aria-controls', id); this.position = this.$element.is('.position-left, .position-top, .position-right, .position-bottom') ? this.$element.attr('class').match(/position\-(left|top|right|bottom)/)[1] : this.position; if (this.options.contentOverlay === true) { var overlay = document.createElement('div'); var overlayPosition = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this.$element).css("position") === 'fixed' ? 'is-overlay-fixed' : 'is-overlay-absolute'; overlay.setAttribute('class', 'js-off-canvas-overlay ' + overlayPosition); this.$overlay = jquery__WEBPACK_IMPORTED_MODULE_0___default()(overlay); if (overlayPosition === 'is-overlay-fixed') { jquery__WEBPACK_IMPORTED_MODULE_0___default()(this.$overlay).insertAfter(this.$element); } else { this.$content.append(this.$overlay); } }
                            var revealOnRegExp = new RegExp(RegExpEscape(this.options.revealClass) + '([^\\s]+)', 'g'); var revealOnClass = revealOnRegExp.exec(this.$element[0].className); if (revealOnClass) { this.options.isRevealed = true; this.options.revealOn = this.options.revealOn || revealOnClass[1]; }
                            if (this.options.isRevealed === true && this.options.revealOn) { this.$element.first().addClass("".concat(this.options.revealClass).concat(this.options.revealOn)); this._setMQChecker(); }
                            if (this.options.transitionTime) { this.$element.css('transition-duration', this.options.transitionTime); }
                            this.$sticky = this.$content.find('[data-off-canvas-sticky]'); if (this.$sticky.length > 0 && this.options.transition === 'push') { this.options.contentScroll = false; }
                            var inCanvasFor = this.$element.attr('class').match(/\bin-canvas-for-(\w+)/); if (inCanvasFor && inCanvasFor.length === 2) { this.options.inCanvasOn = inCanvasFor[1]; } else if (this.options.inCanvasOn) { this.$element.addClass("in-canvas-for-".concat(this.options.inCanvasOn)); }
                            if (this.options.inCanvasOn) { this._checkInCanvas(); }
                            this._removeContentClasses();
                        }
                    }, {
                        key: "_events", value: function _events() {
                            var _this3 = this; this.$element.off('.zf.trigger .zf.offCanvas').on({ 'open.zf.trigger': this.open.bind(this), 'close.zf.trigger': this.close.bind(this), 'toggle.zf.trigger': this.toggle.bind(this), 'keydown.zf.offCanvas': this._handleKeyboard.bind(this) }); if (this.options.closeOnClick === true) { var $target = this.options.contentOverlay ? this.$overlay : this.$content; $target.on({ 'click.zf.offCanvas': this.close.bind(this) }); }
                            if (this.options.inCanvasOn) { jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).on('changed.zf.mediaquery', function () { _this3._checkInCanvas(); }); }
                        }
                    }, { key: "_setMQChecker", value: function _setMQChecker() { var _this = this; this.onLoadListener = onLoad(jquery__WEBPACK_IMPORTED_MODULE_0___default()(window), function () { if (MediaQuery.atLeast(_this.options.revealOn)) { _this.reveal(true); } }); jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).on('changed.zf.mediaquery', function () { if (MediaQuery.atLeast(_this.options.revealOn)) { _this.reveal(true); } else { _this.reveal(false); } }); } }, { key: "_checkInCanvas", value: function _checkInCanvas() { this.isInCanvas = MediaQuery.atLeast(this.options.inCanvasOn); if (this.isInCanvas === true) { this.close(); } } }, { key: "_removeContentClasses", value: function _removeContentClasses(hasReveal) { if (typeof hasReveal !== 'boolean') { this.$content.removeClass(this.contentClasses.base.join(' ')); } else if (hasReveal === false) { this.$content.removeClass("has-reveal-".concat(this.position)); } } }, { key: "_addContentClasses", value: function _addContentClasses(hasReveal) { this._removeContentClasses(hasReveal); if (typeof hasReveal !== 'boolean') { this.$content.addClass("has-transition-".concat(this.options.transition, " has-position-").concat(this.position)); } else if (hasReveal === true) { this.$content.addClass("has-reveal-".concat(this.position)); } } }, { key: "_fixStickyElements", value: function _fixStickyElements() { this.$sticky.each(function (_, el) { var $el = jquery__WEBPACK_IMPORTED_MODULE_0___default()(el); if ($el.css('position') === 'fixed') { var topVal = parseInt($el.css('top'), 10); $el.data('offCanvasSticky', { top: topVal }); var absoluteTopVal = jquery__WEBPACK_IMPORTED_MODULE_0___default()(document).scrollTop() + topVal; $el.css({ top: "".concat(absoluteTopVal, "px"), width: '100%', transition: 'none' }); } }); } }, { key: "_unfixStickyElements", value: function _unfixStickyElements() { this.$sticky.each(function (_, el) { var $el = jquery__WEBPACK_IMPORTED_MODULE_0___default()(el); var stickyData = $el.data('offCanvasSticky'); if (_typeof(stickyData) === 'object') { $el.css({ top: "".concat(stickyData.top, "px"), width: '', transition: '' }); $el.data('offCanvasSticky', ''); } }); } }, {
                        key: "reveal", value: function reveal(isRevealed) {
                            if (isRevealed) { this.close(); this.isRevealed = true; this.$element.attr('aria-hidden', 'false'); this.$element.off('open.zf.trigger toggle.zf.trigger'); this.$element.removeClass('is-closed'); } else { this.isRevealed = false; this.$element.attr('aria-hidden', 'true'); this.$element.off('open.zf.trigger toggle.zf.trigger').on({ 'open.zf.trigger': this.open.bind(this), 'toggle.zf.trigger': this.toggle.bind(this) }); this.$element.addClass('is-closed'); }
                            this._addContentClasses(isRevealed);
                        }
                    }, { key: "_stopScrolling", value: function _stopScrolling(event) { return false; } }, {
                        key: "_recordScrollable", value: function _recordScrollable(event) {
                            var elem = this; if (elem.scrollHeight !== elem.clientHeight) {
                                if (elem.scrollTop === 0) { elem.scrollTop = 1; }
                                if (elem.scrollTop === elem.scrollHeight - elem.clientHeight) { elem.scrollTop = elem.scrollHeight - elem.clientHeight - 1; }
                            }
                            elem.allowUp = elem.scrollTop > 0; elem.allowDown = elem.scrollTop < elem.scrollHeight - elem.clientHeight; elem.lastY = event.originalEvent.pageY;
                        }
                    }, { key: "_stopScrollPropagation", value: function _stopScrollPropagation(event) { var elem = this; var parent; var up = event.pageY < elem.lastY; var down = !up; elem.lastY = event.pageY; if (up && elem.allowUp || down && elem.allowDown) { event.stopPropagation(); if (elem.hasAttribute('data-off-canvas-scrollbox')) { parent = elem.closest('[data-off-canvas], [data-off-canvas-scrollbox-outer]'); if (elem.scrollTop <= 1 && parent.scrollTop > 0) { parent.scrollTop--; } else if (elem.scrollTop >= elem.scrollHeight - elem.clientHeight - 1 && parent.scrollTop < parent.scrollHeight - parent.clientHeight) { parent.scrollTop++; } } } else { event.preventDefault(); } } }, {
                        key: "open", value: function open(event, trigger) {
                            var _this4 = this; if (this.$element.hasClass('is-open') || this.isRevealed || this.isInCanvas) { return; }
                            var _this = this; if (trigger) { this.$lastTrigger = trigger; }
                            if (this.options.forceTo === 'top') { window.scrollTo(0, 0); } else if (this.options.forceTo === 'bottom') { window.scrollTo(0, document.body.scrollHeight); }
                            if (this.options.transitionTime && this.options.transition !== 'overlap') { this.$element.siblings('[data-off-canvas-content]').css('transition-duration', this.options.transitionTime); } else { this.$element.siblings('[data-off-canvas-content]').css('transition-duration', ''); }
                            this.$element.addClass('is-open').removeClass('is-closed'); this.$triggers.attr('aria-expanded', 'true'); this.$element.attr('aria-hidden', 'false'); this.$content.addClass('is-open-' + this.position); if (this.options.contentScroll === false) { jquery__WEBPACK_IMPORTED_MODULE_0___default()('body').addClass('is-off-canvas-open').on('touchmove', this._stopScrolling); this.$element.on('touchstart', this._recordScrollable); this.$element.on('touchmove', this._stopScrollPropagation); this.$element.on('touchstart', '[data-off-canvas-scrollbox]', this._recordScrollable); this.$element.on('touchmove', '[data-off-canvas-scrollbox]', this._stopScrollPropagation); }
                            if (this.options.contentOverlay === true) { this.$overlay.addClass('is-visible'); }
                            if (this.options.closeOnClick === true && this.options.contentOverlay === true) { this.$overlay.addClass('is-closable'); }
                            if (this.options.autoFocus === true) {
                                this.$element.one(transitionend(this.$element), function () {
                                    if (!_this.$element.hasClass('is-open')) { return; }
                                    var canvasFocus = _this.$element.find('[data-autofocus]'); if (canvasFocus.length) { canvasFocus.eq(0).focus(); } else { _this.$element.find('a, button').eq(0).focus(); }
                                });
                            }
                            if (this.options.trapFocus === true) { this.$content.attr('tabindex', '-1'); Keyboard.trapFocus(this.$element); }
                            if (this.options.transition === 'push') { this._fixStickyElements(); }
                            this._addContentClasses(); this.$element.trigger('opened.zf.offCanvas'); this.$element.one(transitionend(this.$element), function () { _this4.$element.trigger('openedEnd.zf.offCanvas'); });
                        }
                    }, {
                        key: "close", value: function close(cb) {
                            var _this5 = this; if (!this.$element.hasClass('is-open') || this.isRevealed) { return; }
                            this.$element.trigger('close.zf.offCanvas'); this.$element.removeClass('is-open'); this.$element.attr('aria-hidden', 'true'); this.$content.removeClass('is-open-left is-open-top is-open-right is-open-bottom'); if (this.options.contentOverlay === true) { this.$overlay.removeClass('is-visible'); }
                            if (this.options.closeOnClick === true && this.options.contentOverlay === true) { this.$overlay.removeClass('is-closable'); }
                            this.$triggers.attr('aria-expanded', 'false'); this.$element.one(transitionend(this.$element), function (e) {
                                _this5.$element.addClass('is-closed'); _this5._removeContentClasses(); if (_this5.options.transition === 'push') { _this5._unfixStickyElements(); }
                                if (_this5.options.contentScroll === false) { jquery__WEBPACK_IMPORTED_MODULE_0___default()('body').removeClass('is-off-canvas-open').off('touchmove', _this5._stopScrolling); _this5.$element.off('touchstart', _this5._recordScrollable); _this5.$element.off('touchmove', _this5._stopScrollPropagation); _this5.$element.off('touchstart', '[data-off-canvas-scrollbox]', _this5._recordScrollable); _this5.$element.off('touchmove', '[data-off-canvas-scrollbox]', _this5._stopScrollPropagation); }
                                if (_this5.options.trapFocus === true) { _this5.$content.removeAttr('tabindex'); Keyboard.releaseFocus(_this5.$element); }
                                _this5.$element.trigger('closed.zf.offCanvas');
                            });
                        }
                    }, { key: "toggle", value: function toggle(event, trigger) { if (this.$element.hasClass('is-open')) { this.close(event, trigger); } else { this.open(event, trigger); } } }, { key: "_handleKeyboard", value: function _handleKeyboard(e) { var _this6 = this; Keyboard.handleKey(e, 'OffCanvas', { close: function close() { _this6.close(); _this6.$lastTrigger.focus(); return true; }, handled: function handled() { e.preventDefault(); } }); } }, { key: "_destroy", value: function _destroy() { this.close(); this.$element.off('.zf.trigger .zf.offCanvas'); this.$overlay.off('.zf.offCanvas'); if (this.onLoadListener) jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).off(this.onLoadListener); } }]); return OffCanvas;
                }(Plugin); OffCanvas.defaults = { closeOnClick: true, contentOverlay: true, contentId: null, nested: null, contentScroll: true, transitionTime: null, transition: 'push', forceTo: null, isRevealed: false, revealOn: null, inCanvasOn: null, autoFocus: true, revealClass: 'reveal-for-', trapFocus: false }; var Orbit = function (_Plugin) {
                    _inherits(Orbit, _Plugin); function Orbit() { _classCallCheck(this, Orbit); return _possibleConstructorReturn(this, _getPrototypeOf(Orbit).apply(this, arguments)); }
                    _createClass(Orbit, [{ key: "_setup", value: function _setup(element, options) { this.$element = element; this.options = jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend({}, Orbit.defaults, this.$element.data(), options); this.className = 'Orbit'; Touch.init(jquery__WEBPACK_IMPORTED_MODULE_0___default.a); this._init(); Keyboard.register('Orbit', { 'ltr': { 'ARROW_RIGHT': 'next', 'ARROW_LEFT': 'previous' }, 'rtl': { 'ARROW_LEFT': 'next', 'ARROW_RIGHT': 'previous' } }); } }, {
                        key: "_init", value: function _init() {
                            this._reset(); this.$wrapper = this.$element.find(".".concat(this.options.containerClass)); this.$slides = this.$element.find(".".concat(this.options.slideClass)); var $images = this.$element.find('img'), initActive = this.$slides.filter('.is-active'), id = this.$element[0].id || GetYoDigits(6, 'orbit'); this.$element.attr({ 'data-resize': id, 'id': id }); if (!initActive.length) { this.$slides.eq(0).addClass('is-active'); }
                            if (!this.options.useMUI) { this.$slides.addClass('no-motionui'); }
                            if ($images.length) { onImagesLoaded($images, this._prepareForOrbit.bind(this)); } else { this._prepareForOrbit(); }
                            if (this.options.bullets) { this._loadBullets(); }
                            this._events(); if (this.options.autoPlay && this.$slides.length > 1) { this.geoSync(); }
                            if (this.options.accessible) { this.$wrapper.attr('tabindex', 0); }
                        }
                    }, { key: "_loadBullets", value: function _loadBullets() { this.$bullets = this.$element.find(".".concat(this.options.boxOfBullets)).find('button'); } }, { key: "geoSync", value: function geoSync() { var _this = this; this.timer = new Timer(this.$element, { duration: this.options.timerDelay, infinite: false }, function () { _this.changeSlide(true); }); this.timer.start(); } }, { key: "_prepareForOrbit", value: function _prepareForOrbit() { this._setWrapperHeight(); } }, {
                        key: "_setWrapperHeight", value: function _setWrapperHeight(cb) {
                            var max = 0, temp, counter = 0, _this = this; this.$slides.each(function () {
                                temp = this.getBoundingClientRect().height; jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).attr('data-slide', counter); if (!/mui/g.test(jquery__WEBPACK_IMPORTED_MODULE_0___default()(this)[0].className) && _this.$slides.filter('.is-active')[0] !== _this.$slides.eq(counter)[0]) { jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).css({ 'display': 'none' }); }
                                max = temp > max ? temp : max; counter++;
                            }); if (counter === this.$slides.length) { this.$wrapper.css({ 'height': max }); if (cb) { cb(max); } }
                        }
                    }, { key: "_setSlideHeight", value: function _setSlideHeight(height) { this.$slides.each(function () { jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).css('max-height', height); }); } }, {
                        key: "_events", value: function _events() {
                            var _this = this; this.$element.off('.resizeme.zf.trigger').on({ 'resizeme.zf.trigger': this._prepareForOrbit.bind(this) }); if (this.$slides.length > 1) {
                                if (this.options.swipe) { this.$slides.off('swipeleft.zf.orbit swiperight.zf.orbit').on('swipeleft.zf.orbit', function (e) { e.preventDefault(); _this.changeSlide(true); }).on('swiperight.zf.orbit', function (e) { e.preventDefault(); _this.changeSlide(false); }); }
                                if (this.options.autoPlay) { this.$slides.on('click.zf.orbit', function () { _this.$element.data('clickedOn', _this.$element.data('clickedOn') ? false : true); _this.timer[_this.$element.data('clickedOn') ? 'pause' : 'start'](); }); if (this.options.pauseOnHover) { this.$element.on('mouseenter.zf.orbit', function () { _this.timer.pause(); }).on('mouseleave.zf.orbit', function () { if (!_this.$element.data('clickedOn')) { _this.timer.start(); } }); } }
                                if (this.options.navButtons) { var $controls = this.$element.find(".".concat(this.options.nextClass, ", .").concat(this.options.prevClass)); $controls.attr('tabindex', 0).on('click.zf.orbit touchend.zf.orbit', function (e) { e.preventDefault(); _this.changeSlide(jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).hasClass(_this.options.nextClass)); }); }
                                if (this.options.bullets) {
                                    this.$bullets.on('click.zf.orbit touchend.zf.orbit', function () {
                                        if (/is-active/g.test(this.className)) { return false; }
                                        var idx = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).data('slide'), ltr = idx > _this.$slides.filter('.is-active').data('slide'), $slide = _this.$slides.eq(idx); _this.changeSlide(ltr, $slide, idx);
                                    });
                                }
                                if (this.options.accessible) { this.$wrapper.add(this.$bullets).on('keydown.zf.orbit', function (e) { Keyboard.handleKey(e, 'Orbit', { next: function next() { _this.changeSlide(true); }, previous: function previous() { _this.changeSlide(false); }, handled: function handled() { if (jquery__WEBPACK_IMPORTED_MODULE_0___default()(e.target).is(_this.$bullets)) { _this.$bullets.filter('.is-active').focus(); } } }); }); }
                            }
                        }
                    }, {
                        key: "_reset", value: function _reset() {
                            if (typeof this.$slides == 'undefined') { return; }
                            if (this.$slides.length > 1) {
                                this.$element.off('.zf.orbit').find('*').off('.zf.orbit'); if (this.options.autoPlay) { this.timer.restart(); }
                                this.$slides.each(function (el) { jquery__WEBPACK_IMPORTED_MODULE_0___default()(el).removeClass('is-active is-active is-in').removeAttr('aria-live').hide(); }); this.$slides.first().addClass('is-active').show(); this.$element.trigger('slidechange.zf.orbit', [this.$slides.first()]); if (this.options.bullets) { this._updateBullets(0); }
                            }
                        }
                    }, {
                        key: "changeSlide", value: function changeSlide(isLTR, chosenSlide, idx) {
                            if (!this.$slides) { return; }
                            var $curSlide = this.$slides.filter('.is-active').eq(0); if (/mui/g.test($curSlide[0].className)) { return false; }
                            var $firstSlide = this.$slides.first(), $lastSlide = this.$slides.last(), dirIn = isLTR ? 'Right' : 'Left', dirOut = isLTR ? 'Left' : 'Right', _this = this, $newSlide; if (!chosenSlide) { $newSlide = isLTR ? this.options.infiniteWrap ? $curSlide.next(".".concat(this.options.slideClass)).length ? $curSlide.next(".".concat(this.options.slideClass)) : $firstSlide : $curSlide.next(".".concat(this.options.slideClass)) : this.options.infiniteWrap ? $curSlide.prev(".".concat(this.options.slideClass)).length ? $curSlide.prev(".".concat(this.options.slideClass)) : $lastSlide : $curSlide.prev(".".concat(this.options.slideClass)); } else { $newSlide = chosenSlide; }
                            if ($newSlide.length) {
                                this.$element.trigger('beforeslidechange.zf.orbit', [$curSlide, $newSlide]); if (this.options.bullets) { idx = idx || this.$slides.index($newSlide); this._updateBullets(idx); }
                                if (this.options.useMUI && !this.$element.is(':hidden')) { Motion.animateIn($newSlide.addClass('is-active'), this.options["animInFrom".concat(dirIn)], function () { $newSlide.css({ 'display': 'block' }).attr('aria-live', 'polite'); }); Motion.animateOut($curSlide.removeClass('is-active'), this.options["animOutTo".concat(dirOut)], function () { $curSlide.removeAttr('aria-live'); if (_this.options.autoPlay && !_this.timer.isPaused) { _this.timer.restart(); } }); } else { $curSlide.removeClass('is-active is-in').removeAttr('aria-live').hide(); $newSlide.addClass('is-active is-in').attr('aria-live', 'polite').show(); if (this.options.autoPlay && !this.timer.isPaused) { this.timer.restart(); } }
                                this.$element.trigger('slidechange.zf.orbit', [$newSlide]);
                            }
                        }
                    }, {
                        key: "_updateBullets", value: function _updateBullets(idx) {
                            var $oldBullet = this.$bullets.filter('.is-active'); var $othersBullets = this.$bullets.not('.is-active'); var $newBullet = this.$bullets.eq(idx); $oldBullet.removeClass('is-active').blur(); $newBullet.addClass('is-active'); var activeStateDescriptor = $oldBullet.children('[data-slide-active-label]').last(); if (!activeStateDescriptor.length) { var spans = $oldBullet.children('span'); var spanCountInOthersBullets = $othersBullets.toArray().map(function (b) { return jquery__WEBPACK_IMPORTED_MODULE_0___default()(b).children('span').length; }); if (spanCountInOthersBullets.every(function (count) { return count < spans.length; })) { activeStateDescriptor = spans.last(); activeStateDescriptor.attr('data-slide-active-label', ''); } }
                            if (activeStateDescriptor.length) { activeStateDescriptor.detach(); $newBullet.append(activeStateDescriptor); }
                        }
                    }, { key: "_destroy", value: function _destroy() { this.$element.off('.zf.orbit').find('*').off('.zf.orbit').end().hide(); } }]); return Orbit;
                }(Plugin); Orbit.defaults = { bullets: true, navButtons: true, animInFromRight: 'slide-in-right', animOutToRight: 'slide-out-right', animInFromLeft: 'slide-in-left', animOutToLeft: 'slide-out-left', autoPlay: true, timerDelay: 5000, infiniteWrap: true, swipe: true, pauseOnHover: true, accessible: true, containerClass: 'orbit-container', slideClass: 'orbit-slide', boxOfBullets: 'orbit-bullets', nextClass: 'orbit-next', prevClass: 'orbit-previous', useMUI: true }; var MenuPlugins = { dropdown: { cssClass: 'dropdown', plugin: DropdownMenu }, drilldown: { cssClass: 'drilldown', plugin: Drilldown }, accordion: { cssClass: 'accordion-menu', plugin: AccordionMenu } }; var ResponsiveMenu = function (_Plugin) {
                    _inherits(ResponsiveMenu, _Plugin); function ResponsiveMenu() { _classCallCheck(this, ResponsiveMenu); return _possibleConstructorReturn(this, _getPrototypeOf(ResponsiveMenu).apply(this, arguments)); }
                    _createClass(ResponsiveMenu, [{ key: "_setup", value: function _setup(element, options) { this.$element = jquery__WEBPACK_IMPORTED_MODULE_0___default()(element); this.rules = this.$element.data('responsive-menu'); this.currentMq = null; this.currentPlugin = null; this.className = 'ResponsiveMenu'; this._init(); this._events(); } }, {
                        key: "_init", value: function _init() {
                            MediaQuery._init(); if (typeof this.rules === 'string') {
                                var rulesTree = {}; var rules = this.rules.split(' '); for (var i = 0; i < rules.length; i++) { var rule = rules[i].split('-'); var ruleSize = rule.length > 1 ? rule[0] : 'small'; var rulePlugin = rule.length > 1 ? rule[1] : rule[0]; if (MenuPlugins[rulePlugin] !== null) { rulesTree[ruleSize] = MenuPlugins[rulePlugin]; } }
                                this.rules = rulesTree;
                            }
                            if (!jquery__WEBPACK_IMPORTED_MODULE_0___default.a.isEmptyObject(this.rules)) { this._checkMediaQueries(); }
                            this.$element.attr('data-mutate', this.$element.attr('data-mutate') || GetYoDigits(6, 'responsive-menu'));
                        }
                    }, { key: "_events", value: function _events() { var _this = this; jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).on('changed.zf.mediaquery', function () { _this._checkMediaQueries(); }); } }, { key: "_checkMediaQueries", value: function _checkMediaQueries() { var matchedMq, _this = this; jquery__WEBPACK_IMPORTED_MODULE_0___default.a.each(this.rules, function (key) { if (MediaQuery.atLeast(key)) { matchedMq = key; } }); if (!matchedMq) return; if (this.currentPlugin instanceof this.rules[matchedMq].plugin) return; jquery__WEBPACK_IMPORTED_MODULE_0___default.a.each(MenuPlugins, function (key, value) { _this.$element.removeClass(value.cssClass); }); this.$element.addClass(this.rules[matchedMq].cssClass); if (this.currentPlugin) this.currentPlugin.destroy(); this.currentPlugin = new this.rules[matchedMq].plugin(this.$element, {}); } }, { key: "_destroy", value: function _destroy() { this.currentPlugin.destroy(); jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).off('.zf.ResponsiveMenu'); } }]); return ResponsiveMenu;
                }(Plugin); ResponsiveMenu.defaults = {}; var ResponsiveToggle = function (_Plugin) {
                    _inherits(ResponsiveToggle, _Plugin); function ResponsiveToggle() { _classCallCheck(this, ResponsiveToggle); return _possibleConstructorReturn(this, _getPrototypeOf(ResponsiveToggle).apply(this, arguments)); }
                    _createClass(ResponsiveToggle, [{ key: "_setup", value: function _setup(element, options) { this.$element = jquery__WEBPACK_IMPORTED_MODULE_0___default()(element); this.options = jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend({}, ResponsiveToggle.defaults, this.$element.data(), options); this.className = 'ResponsiveToggle'; this._init(); this._events(); } }, {
                        key: "_init", value: function _init() {
                            MediaQuery._init(); var targetID = this.$element.data('responsive-toggle'); if (!targetID) { console.error('Your tab bar needs an ID of a Menu as the value of data-tab-bar.'); }
                            this.$targetMenu = jquery__WEBPACK_IMPORTED_MODULE_0___default()("#".concat(targetID)); this.$toggler = this.$element.find('[data-toggle]').filter(function () { var target = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).data('toggle'); return target === targetID || target === ""; }); this.options = jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend({}, this.options, this.$targetMenu.data()); if (this.options.animate) { var input = this.options.animate.split(' '); this.animationIn = input[0]; this.animationOut = input[1] || null; }
                            this._update();
                        }
                    }, { key: "_events", value: function _events() { this._updateMqHandler = this._update.bind(this); jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).on('changed.zf.mediaquery', this._updateMqHandler); this.$toggler.on('click.zf.responsiveToggle', this.toggleMenu.bind(this)); } }, {
                        key: "_update", value: function _update() {
                            if (!MediaQuery.atLeast(this.options.hideFor)) { this.$element.show(); this.$targetMenu.hide(); }
                            else { this.$element.hide(); this.$targetMenu.show(); }
                        }
                    }, { key: "toggleMenu", value: function toggleMenu() { var _this2 = this; if (!MediaQuery.atLeast(this.options.hideFor)) { if (this.options.animate) { if (this.$targetMenu.is(':hidden')) { Motion.animateIn(this.$targetMenu, this.animationIn, function () { _this2.$element.trigger('toggled.zf.responsiveToggle'); _this2.$targetMenu.find('[data-mutate]').triggerHandler('mutateme.zf.trigger'); }); } else { Motion.animateOut(this.$targetMenu, this.animationOut, function () { _this2.$element.trigger('toggled.zf.responsiveToggle'); }); } } else { this.$targetMenu.toggle(0); this.$targetMenu.find('[data-mutate]').trigger('mutateme.zf.trigger'); this.$element.trigger('toggled.zf.responsiveToggle'); } } } }, { key: "_destroy", value: function _destroy() { this.$element.off('.zf.responsiveToggle'); this.$toggler.off('.zf.responsiveToggle'); jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).off('changed.zf.mediaquery', this._updateMqHandler); } }]); return ResponsiveToggle;
                }(Plugin); ResponsiveToggle.defaults = { hideFor: 'medium', animate: false }; var Reveal = function (_Plugin) {
                    _inherits(Reveal, _Plugin); function Reveal() { _classCallCheck(this, Reveal); return _possibleConstructorReturn(this, _getPrototypeOf(Reveal).apply(this, arguments)); }
                    _createClass(Reveal, [{ key: "_setup", value: function _setup(element, options) { this.$element = element; this.options = jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend({}, Reveal.defaults, this.$element.data(), options); this.className = 'Reveal'; this._init(); Touch.init(jquery__WEBPACK_IMPORTED_MODULE_0___default.a); Triggers.init(jquery__WEBPACK_IMPORTED_MODULE_0___default.a); Keyboard.register('Reveal', { 'ESCAPE': 'close' }); } }, {
                        key: "_init", value: function _init() {
                            var _this2 = this; MediaQuery._init(); this.id = this.$element.attr('id'); this.isActive = false; this.cached = { mq: MediaQuery.current }; this.$anchor = jquery__WEBPACK_IMPORTED_MODULE_0___default()("[data-open=\"".concat(this.id, "\"]")).length ? jquery__WEBPACK_IMPORTED_MODULE_0___default()("[data-open=\"".concat(this.id, "\"]")) : jquery__WEBPACK_IMPORTED_MODULE_0___default()("[data-toggle=\"".concat(this.id, "\"]")); this.$anchor.attr({ 'aria-controls': this.id, 'aria-haspopup': true, 'tabindex': 0 }); if (this.options.fullScreen || this.$element.hasClass('full')) { this.options.fullScreen = true; this.options.overlay = false; }
                            if (this.options.overlay && !this.$overlay) { this.$overlay = this._makeOverlay(this.id); }
                            this.$element.attr({ 'role': 'dialog', 'aria-hidden': true, 'data-yeti-box': this.id, 'data-resize': this.id }); if (this.$overlay) { this.$element.detach().appendTo(this.$overlay); } else { this.$element.detach().appendTo(jquery__WEBPACK_IMPORTED_MODULE_0___default()(this.options.appendTo)); this.$element.addClass('without-overlay'); }
                            this._events(); if (this.options.deepLink && window.location.hash === "#".concat(this.id)) { this.onLoadListener = onLoad(jquery__WEBPACK_IMPORTED_MODULE_0___default()(window), function () { return _this2.open(); }); }
                        }
                    }, {
                        key: "_makeOverlay", value: function _makeOverlay() {
                            var additionalOverlayClasses = ''; if (this.options.additionalOverlayClasses) { additionalOverlayClasses = ' ' + this.options.additionalOverlayClasses; }
                            return jquery__WEBPACK_IMPORTED_MODULE_0___default()('<div></div>').addClass('reveal-overlay' + additionalOverlayClasses).appendTo(this.options.appendTo);
                        }
                    }, {
                        key: "_updatePosition", value: function _updatePosition() {
                            var width = this.$element.outerWidth(); var outerWidth = jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).width(); var height = this.$element.outerHeight(); var outerHeight = jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).height(); var left, top = null; if (this.options.hOffset === 'auto') { left = parseInt((outerWidth - width) / 2, 10); } else { left = parseInt(this.options.hOffset, 10); }
                            if (this.options.vOffset === 'auto') { if (height > outerHeight) { top = parseInt(Math.min(100, outerHeight / 10), 10); } else { top = parseInt((outerHeight - height) / 4, 10); } } else if (this.options.vOffset !== null) { top = parseInt(this.options.vOffset, 10); }
                            if (top !== null) { this.$element.css({ top: top + 'px' }); }
                            if (!this.$overlay || this.options.hOffset !== 'auto') { this.$element.css({ left: left + 'px' }); this.$element.css({ margin: '0px' }); }
                        }
                    }, {
                        key: "_events", value: function _events() {
                            var _this3 = this; var _this = this; this.$element.on({ 'open.zf.trigger': this.open.bind(this), 'close.zf.trigger': function closeZfTrigger(event, $element) { if (event.target === _this.$element[0] || jquery__WEBPACK_IMPORTED_MODULE_0___default()(event.target).parents('[data-closable]')[0] === $element) { return _this3.close.apply(_this3); } }, 'toggle.zf.trigger': this.toggle.bind(this), 'resizeme.zf.trigger': function resizemeZfTrigger() { _this._updatePosition(); } }); if (this.options.closeOnClick && this.options.overlay) {
                                this.$overlay.off('.zf.reveal').on('click.zf.dropdown tap.zf.dropdown', function (e) {
                                    if (e.target === _this.$element[0] || jquery__WEBPACK_IMPORTED_MODULE_0___default.a.contains(_this.$element[0], e.target) || !jquery__WEBPACK_IMPORTED_MODULE_0___default.a.contains(document, e.target)) { return; }
                                    _this.close();
                                });
                            }
                            if (this.options.deepLink) { jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).on("hashchange.zf.reveal:".concat(this.id), this._handleState.bind(this)); }
                        }
                    }, { key: "_handleState", value: function _handleState(e) { if (window.location.hash === '#' + this.id && !this.isActive) { this.open(); } else { this.close(); } } }, { key: "_disableScroll", value: function _disableScroll(scrollTop) { scrollTop = scrollTop || jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).scrollTop(); if (jquery__WEBPACK_IMPORTED_MODULE_0___default()(document).height() > jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).height()) { jquery__WEBPACK_IMPORTED_MODULE_0___default()("html").css("top", -scrollTop); } } }, { key: "_enableScroll", value: function _enableScroll(scrollTop) { scrollTop = scrollTop || parseInt(jquery__WEBPACK_IMPORTED_MODULE_0___default()("html").css("top")); if (jquery__WEBPACK_IMPORTED_MODULE_0___default()(document).height() > jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).height()) { jquery__WEBPACK_IMPORTED_MODULE_0___default()("html").css("top", ""); jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).scrollTop(-scrollTop); } } }, {
                        key: "open", value: function open() {
                            var _this4 = this; var hash = "#".concat(this.id); if (this.options.deepLink && window.location.hash !== hash) { if (window.history.pushState) { if (this.options.updateHistory) { window.history.pushState({}, '', hash); } else { window.history.replaceState({}, '', hash); } } else { window.location.hash = hash; } }
                            this.$activeAnchor = jquery__WEBPACK_IMPORTED_MODULE_0___default()(document.activeElement).is(this.$anchor) ? jquery__WEBPACK_IMPORTED_MODULE_0___default()(document.activeElement) : this.$anchor; this.isActive = true; this.$element.css({ 'visibility': 'hidden' }).show().scrollTop(0); if (this.options.overlay) { this.$overlay.css({ 'visibility': 'hidden' }).show(); }
                            this._updatePosition(); this.$element.hide().css({ 'visibility': '' }); if (this.$overlay) { this.$overlay.css({ 'visibility': '' }).hide(); if (this.$element.hasClass('fast')) { this.$overlay.addClass('fast'); } else if (this.$element.hasClass('slow')) { this.$overlay.addClass('slow'); } }
                            if (!this.options.multipleOpened) { this.$element.trigger('closeme.zf.reveal', this.id); }
                            if (jquery__WEBPACK_IMPORTED_MODULE_0___default()('.reveal:visible').length === 0) { this._disableScroll(); }
                            var _this = this; if (this.options.animationIn) {
                                var afterAnimation = function afterAnimation() { _this.$element.attr({ 'aria-hidden': false, 'tabindex': -1 }).focus(); _this._addGlobalClasses(); Keyboard.trapFocus(_this.$element); }; if (this.options.overlay) { Motion.animateIn(this.$overlay, 'fade-in'); }
                                Motion.animateIn(this.$element, this.options.animationIn, function () { if (_this4.$element) { _this4.focusableElements = Keyboard.findFocusable(_this4.$element); afterAnimation(); } });
                            }
                            else {
                                if (this.options.overlay) { this.$overlay.show(0); }
                                this.$element.show(this.options.showDelay);
                            }
                            this.$element.attr({ 'aria-hidden': false, 'tabindex': -1 }).focus(); Keyboard.trapFocus(this.$element); this._addGlobalClasses(); this._addGlobalListeners(); this.$element.trigger('open.zf.reveal');
                        }
                    }, { key: "_addGlobalClasses", value: function _addGlobalClasses() { var updateScrollbarClass = function updateScrollbarClass() { jquery__WEBPACK_IMPORTED_MODULE_0___default()('html').toggleClass('zf-has-scroll', !!(jquery__WEBPACK_IMPORTED_MODULE_0___default()(document).height() > jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).height())); }; this.$element.on('resizeme.zf.trigger.revealScrollbarListener', function () { return updateScrollbarClass(); }); updateScrollbarClass(); jquery__WEBPACK_IMPORTED_MODULE_0___default()('html').addClass('is-reveal-open'); } }, { key: "_removeGlobalClasses", value: function _removeGlobalClasses() { this.$element.off('resizeme.zf.trigger.revealScrollbarListener'); jquery__WEBPACK_IMPORTED_MODULE_0___default()('html').removeClass('is-reveal-open'); jquery__WEBPACK_IMPORTED_MODULE_0___default()('html').removeClass('zf-has-scroll'); } }, {
                        key: "_addGlobalListeners", value: function _addGlobalListeners() {
                            var _this = this; if (!this.$element) { return; }
                            this.focusableElements = Keyboard.findFocusable(this.$element); if (!this.options.overlay && this.options.closeOnClick && !this.options.fullScreen) {
                                jquery__WEBPACK_IMPORTED_MODULE_0___default()('body').on('click.zf.dropdown tap.zf.dropdown', function (e) {
                                    if (e.target === _this.$element[0] || jquery__WEBPACK_IMPORTED_MODULE_0___default.a.contains(_this.$element[0], e.target) || !jquery__WEBPACK_IMPORTED_MODULE_0___default.a.contains(document, e.target)) { return; }
                                    _this.close();
                                });
                            }
                            if (this.options.closeOnEsc) { jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).on('keydown.zf.reveal', function (e) { Keyboard.handleKey(e, 'Reveal', { close: function close() { if (_this.options.closeOnEsc) { _this.close(); } } }); }); }
                        }
                    }, {
                        key: "close", value: function close() {
                            if (!this.isActive || !this.$element.is(':visible')) { return false; }
                            var _this = this; if (this.options.animationOut) {
                                if (this.options.overlay) { Motion.animateOut(this.$overlay, 'fade-out'); }
                                Motion.animateOut(this.$element, this.options.animationOut, finishUp);
                            }
                            else { this.$element.hide(this.options.hideDelay); if (this.options.overlay) { this.$overlay.hide(0, finishUp); } else { finishUp(); } }
                            if (this.options.closeOnEsc) { jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).off('keydown.zf.reveal'); }
                            if (!this.options.overlay && this.options.closeOnClick) { jquery__WEBPACK_IMPORTED_MODULE_0___default()('body').off('click.zf.dropdown tap.zf.dropdown'); }
                            this.$element.off('keydown.zf.reveal'); function finishUp() {
                                var scrollTop = parseInt(jquery__WEBPACK_IMPORTED_MODULE_0___default()("html").css("top")); if (jquery__WEBPACK_IMPORTED_MODULE_0___default()('.reveal:visible').length === 0) { _this._removeGlobalClasses(); }
                                Keyboard.releaseFocus(_this.$element); _this.$element.attr('aria-hidden', true); if (jquery__WEBPACK_IMPORTED_MODULE_0___default()('.reveal:visible').length === 0) { _this._enableScroll(scrollTop); }
                                _this.$element.trigger('closed.zf.reveal');
                            }
                            if (this.options.resetOnClose) { this.$element.html(this.$element.html()); }
                            this.isActive = false; if (_this.options.deepLink && window.location.hash === "#".concat(this.id)) { if (window.history.replaceState) { var urlWithoutHash = window.location.pathname + window.location.search; if (this.options.updateHistory) { window.history.pushState({}, '', urlWithoutHash); } else { window.history.replaceState('', document.title, urlWithoutHash); } } else { window.location.hash = ''; } }
                            this.$activeAnchor.focus();
                        }
                    }, { key: "toggle", value: function toggle() { if (this.isActive) { this.close(); } else { this.open(); } } }, {
                        key: "_destroy", value: function _destroy() {
                            if (this.options.overlay) { this.$element.appendTo(jquery__WEBPACK_IMPORTED_MODULE_0___default()(this.options.appendTo)); this.$overlay.hide().off().remove(); }
                            this.$element.hide().off(); this.$anchor.off('.zf'); jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).off(".zf.reveal:".concat(this.id)); if (this.onLoadListener) jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).off(this.onLoadListener); if (jquery__WEBPACK_IMPORTED_MODULE_0___default()('.reveal:visible').length === 0) { this._removeGlobalClasses(); }
                        }
                    }]); return Reveal;
                }(Plugin); Reveal.defaults = { animationIn: '', animationOut: '', showDelay: 0, hideDelay: 0, closeOnClick: true, closeOnEsc: true, multipleOpened: false, vOffset: 'auto', hOffset: 'auto', fullScreen: false, overlay: true, resetOnClose: false, deepLink: false, updateHistory: false, appendTo: "body", additionalOverlayClasses: '' }; var Slider = function (_Plugin) {
                    _inherits(Slider, _Plugin); function Slider() { _classCallCheck(this, Slider); return _possibleConstructorReturn(this, _getPrototypeOf(Slider).apply(this, arguments)); }
                    _createClass(Slider, [{ key: "_setup", value: function _setup(element, options) { this.$element = element; this.options = jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend({}, Slider.defaults, this.$element.data(), options); this.className = 'Slider'; Touch.init(jquery__WEBPACK_IMPORTED_MODULE_0___default.a); Triggers.init(jquery__WEBPACK_IMPORTED_MODULE_0___default.a); this._init(); Keyboard.register('Slider', { 'ltr': { 'ARROW_RIGHT': 'increase', 'ARROW_UP': 'increase', 'ARROW_DOWN': 'decrease', 'ARROW_LEFT': 'decrease', 'SHIFT_ARROW_RIGHT': 'increase_fast', 'SHIFT_ARROW_UP': 'increase_fast', 'SHIFT_ARROW_DOWN': 'decrease_fast', 'SHIFT_ARROW_LEFT': 'decrease_fast', 'HOME': 'min', 'END': 'max' }, 'rtl': { 'ARROW_LEFT': 'increase', 'ARROW_RIGHT': 'decrease', 'SHIFT_ARROW_LEFT': 'increase_fast', 'SHIFT_ARROW_RIGHT': 'decrease_fast' } }); } }, {
                        key: "_init", value: function _init() {
                            this.inputs = this.$element.find('input'); this.handles = this.$element.find('[data-slider-handle]'); this.$handle = this.handles.eq(0); this.$input = this.inputs.length ? this.inputs.eq(0) : jquery__WEBPACK_IMPORTED_MODULE_0___default()("#".concat(this.$handle.attr('aria-controls'))); this.$fill = this.$element.find('[data-slider-fill]').css(this.options.vertical ? 'height' : 'width', 0); if (this.options.disabled || this.$element.hasClass(this.options.disabledClass)) { this.options.disabled = true; this.$element.addClass(this.options.disabledClass); }
                            if (!this.inputs.length) { this.inputs = jquery__WEBPACK_IMPORTED_MODULE_0___default()().add(this.$input); this.options.binding = true; }
                            this._setInitAttr(0); if (this.handles[1]) {
                                this.options.doubleSided = true; this.$handle2 = this.handles.eq(1); this.$input2 = this.inputs.length > 1 ? this.inputs.eq(1) : jquery__WEBPACK_IMPORTED_MODULE_0___default()("#".concat(this.$handle2.attr('aria-controls'))); if (!this.inputs[1]) { this.inputs = this.inputs.add(this.$input2); }
                                this._setInitAttr(1);
                            }
                            this.setHandles(); this._events();
                        }
                    }, { key: "setHandles", value: function setHandles() { var _this2 = this; if (this.handles[1]) { this._setHandlePos(this.$handle, this.inputs.eq(0).val(), function () { _this2._setHandlePos(_this2.$handle2, _this2.inputs.eq(1).val()); }); } else { this._setHandlePos(this.$handle, this.inputs.eq(0).val()); } } }, { key: "_reflow", value: function _reflow() { this.setHandles(); } }, {
                        key: "_pctOfBar", value: function _pctOfBar(value) {
                            var pctOfBar = percent(value - this.options.start, this.options.end - this.options.start); switch (this.options.positionValueFunction) { case "pow": pctOfBar = this._logTransform(pctOfBar); break; case "log": pctOfBar = this._powTransform(pctOfBar); break; }
                            return pctOfBar.toFixed(2);
                        }
                    }, {
                        key: "_value", value: function _value(pctOfBar) {
                            switch (this.options.positionValueFunction) { case "pow": pctOfBar = this._powTransform(pctOfBar); break; case "log": pctOfBar = this._logTransform(pctOfBar); break; }
                            var value; if (this.options.vertical) { value = parseFloat(this.options.end) + pctOfBar * (this.options.start - this.options.end); } else { value = (this.options.end - this.options.start) * pctOfBar + parseFloat(this.options.start); }
                            return value;
                        }
                    }, { key: "_logTransform", value: function _logTransform(value) { return baseLog(this.options.nonLinearBase, value * (this.options.nonLinearBase - 1) + 1); } }, { key: "_powTransform", value: function _powTransform(value) { return (Math.pow(this.options.nonLinearBase, value) - 1) / (this.options.nonLinearBase - 1); } }, {
                        key: "_setHandlePos", value: function _setHandlePos($hndl, location, cb) {
                            if (this.$element.hasClass(this.options.disabledClass)) { return; }
                            location = parseFloat(location); if (location < this.options.start) { location = this.options.start; } else if (location > this.options.end) { location = this.options.end; }
                            var isDbl = this.options.doubleSided; if (isDbl) { if (this.handles.index($hndl) === 0) { var h2Val = parseFloat(this.$handle2.attr('aria-valuenow')); location = location >= h2Val ? h2Val - this.options.step : location; } else { var h1Val = parseFloat(this.$handle.attr('aria-valuenow')); location = location <= h1Val ? h1Val + this.options.step : location; } }
                            var _this = this, vert = this.options.vertical, hOrW = vert ? 'height' : 'width', lOrT = vert ? 'top' : 'left', handleDim = $hndl[0].getBoundingClientRect()[hOrW], elemDim = this.$element[0].getBoundingClientRect()[hOrW], pctOfBar = this._pctOfBar(location), pxToMove = (elemDim - handleDim) * pctOfBar, movement = (percent(pxToMove, elemDim) * 100).toFixed(this.options.decimal); location = parseFloat(location.toFixed(this.options.decimal)); var css = {}; this._setValues($hndl, location); if (isDbl) {
                                var isLeftHndl = this.handles.index($hndl) === 0, dim, handlePct = ~~(percent(handleDim, elemDim) * 100); if (isLeftHndl) { css[lOrT] = "".concat(movement, "%"); dim = parseFloat(this.$handle2[0].style[lOrT]) - movement + handlePct; if (cb && typeof cb === 'function') { cb(); } } else { var handlePos = parseFloat(this.$handle[0].style[lOrT]); dim = movement - (isNaN(handlePos) ? (this.options.initialStart - this.options.start) / ((this.options.end - this.options.start) / 100) : handlePos) + handlePct; }
                                css["min-".concat(hOrW)] = "".concat(dim, "%");
                            }
                            this.$element.one('finished.zf.animate', function () { _this.$element.trigger('moved.zf.slider', [$hndl]); }); var moveTime = this.$element.data('dragging') ? 1000 / 60 : this.options.moveTime; Move(moveTime, $hndl, function () {
                                if (isNaN(movement)) { $hndl.css(lOrT, "".concat(pctOfBar * 100, "%")); } else { $hndl.css(lOrT, "".concat(movement, "%")); }
                                if (!_this.options.doubleSided) { _this.$fill.css(hOrW, "".concat(pctOfBar * 100, "%")); } else { _this.$fill.css(css); }
                            }); clearTimeout(_this.timeout); _this.timeout = setTimeout(function () { _this.$element.trigger('changed.zf.slider', [$hndl]); }, _this.options.changedDelay);
                        }
                    }, { key: "_setInitAttr", value: function _setInitAttr(idx) { var initVal = idx === 0 ? this.options.initialStart : this.options.initialEnd; var id = this.inputs.eq(idx).attr('id') || GetYoDigits(6, 'slider'); this.inputs.eq(idx).attr({ 'id': id, 'max': this.options.end, 'min': this.options.start, 'step': this.options.step }); this.inputs.eq(idx).val(initVal); this.handles.eq(idx).attr({ 'role': 'slider', 'aria-controls': id, 'aria-valuemax': this.options.end, 'aria-valuemin': this.options.start, 'aria-valuenow': initVal, 'aria-orientation': this.options.vertical ? 'vertical' : 'horizontal', 'tabindex': 0 }); } }, { key: "_setValues", value: function _setValues($handle, val) { var idx = this.options.doubleSided ? this.handles.index($handle) : 0; this.inputs.eq(idx).val(val); $handle.attr('aria-valuenow', val); } }, {
                        key: "_handleEvent", value: function _handleEvent(e, $handle, val) {
                            var value; if (!val) {
                                e.preventDefault(); var _this = this, vertical = this.options.vertical, param = vertical ? 'height' : 'width', direction = vertical ? 'top' : 'left', eventOffset = vertical ? e.pageY : e.pageX, barDim = this.$element[0].getBoundingClientRect()[param], windowScroll = vertical ? jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).scrollTop() : jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).scrollLeft(); var elemOffset = this.$element.offset()[direction]; if (e.clientY === e.pageY) { eventOffset = eventOffset + windowScroll; }
                                var eventFromBar = eventOffset - elemOffset; var barXY; if (eventFromBar < 0) { barXY = 0; } else if (eventFromBar > barDim) { barXY = barDim; } else { barXY = eventFromBar; }
                                var offsetPct = percent(barXY, barDim); value = this._value(offsetPct); if (rtl() && !this.options.vertical) { value = this.options.end - value; }
                                value = _this._adjustValue(null, value); if (!$handle) { var firstHndlPos = absPosition(this.$handle, direction, barXY, param), secndHndlPos = absPosition(this.$handle2, direction, barXY, param); $handle = firstHndlPos <= secndHndlPos ? this.$handle : this.$handle2; }
                            } else { value = this._adjustValue(null, val); }
                            this._setHandlePos($handle, value);
                        }
                    }, {
                        key: "_adjustValue", value: function _adjustValue($handle, value) {
                            var val, step = this.options.step, div = parseFloat(step / 2), left, prev_val, next_val; if (!!$handle) { val = parseFloat($handle.attr('aria-valuenow')); } else { val = value; }
                            if (val >= 0) { left = val % step; } else { left = step + val % step; }
                            prev_val = val - left; next_val = prev_val + step; if (left === 0) { return val; }
                            val = val >= prev_val + div ? next_val : prev_val; return val;
                        }
                    }, { key: "_events", value: function _events() { this._eventsForHandle(this.$handle); if (this.handles[1]) { this._eventsForHandle(this.$handle2); } } }, {
                        key: "_eventsForHandle", value: function _eventsForHandle($handle) {
                            var _this = this, curHandle; var handleChangeEvent = function handleChangeEvent(e) { var idx = _this.inputs.index(jquery__WEBPACK_IMPORTED_MODULE_0___default()(this)); _this._handleEvent(e, _this.handles.eq(idx), jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).val()); }; this.inputs.off('keyup.zf.slider').on('keyup.zf.slider', function (e) { if (e.keyCode == 13) handleChangeEvent.call(this, e); }); this.inputs.off('change.zf.slider').on('change.zf.slider', handleChangeEvent); if (this.options.clickSelect) {
                                this.$element.off('click.zf.slider').on('click.zf.slider', function (e) {
                                    if (_this.$element.data('dragging')) { return false; }
                                    if (!jquery__WEBPACK_IMPORTED_MODULE_0___default()(e.target).is('[data-slider-handle]')) { if (_this.options.doubleSided) { _this._handleEvent(e); } else { _this._handleEvent(e, _this.$handle); } }
                                });
                            }
                            if (this.options.draggable) { this.handles.addTouch(); var $body = jquery__WEBPACK_IMPORTED_MODULE_0___default()('body'); $handle.off('mousedown.zf.slider').on('mousedown.zf.slider', function (e) { $handle.addClass('is-dragging'); _this.$fill.addClass('is-dragging'); _this.$element.data('dragging', true); curHandle = jquery__WEBPACK_IMPORTED_MODULE_0___default()(e.currentTarget); $body.on('mousemove.zf.slider', function (e) { e.preventDefault(); _this._handleEvent(e, curHandle); }).on('mouseup.zf.slider', function (e) { _this._handleEvent(e, curHandle); $handle.removeClass('is-dragging'); _this.$fill.removeClass('is-dragging'); _this.$element.data('dragging', false); $body.off('mousemove.zf.slider mouseup.zf.slider'); }); }).on('selectstart.zf.slider touchmove.zf.slider', function (e) { e.preventDefault(); }); }
                            $handle.off('keydown.zf.slider').on('keydown.zf.slider', function (e) { var _$handle = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this), idx = _this.options.doubleSided ? _this.handles.index(_$handle) : 0, oldValue = parseFloat(_this.inputs.eq(idx).val()), newValue; Keyboard.handleKey(e, 'Slider', { decrease: function decrease() { newValue = oldValue - _this.options.step; }, increase: function increase() { newValue = oldValue + _this.options.step; }, decrease_fast: function decrease_fast() { newValue = oldValue - _this.options.step * 10; }, increase_fast: function increase_fast() { newValue = oldValue + _this.options.step * 10; }, min: function min() { newValue = _this.options.start; }, max: function max() { newValue = _this.options.end; }, handled: function handled() { e.preventDefault(); _this._setHandlePos(_$handle, newValue); } }); });
                        }
                    }, { key: "_destroy", value: function _destroy() { this.handles.off('.zf.slider'); this.inputs.off('.zf.slider'); this.$element.off('.zf.slider'); clearTimeout(this.timeout); } }]); return Slider;
                }(Plugin); Slider.defaults = { start: 0, end: 100, step: 1, initialStart: 0, initialEnd: 100, binding: false, clickSelect: true, vertical: false, draggable: true, disabled: false, doubleSided: false, decimal: 2, moveTime: 200, disabledClass: 'disabled', invertVertical: false, changedDelay: 500, nonLinearBase: 5, positionValueFunction: 'linear' }; function percent(frac, num) { return frac / num; }
                function absPosition($handle, dir, clickPos, param) { return Math.abs($handle.position()[dir] + $handle[param]() / 2 - clickPos); }
                function baseLog(base, value) { return Math.log(value) / Math.log(base); }
                var Sticky = function (_Plugin) {
                    _inherits(Sticky, _Plugin); function Sticky() { _classCallCheck(this, Sticky); return _possibleConstructorReturn(this, _getPrototypeOf(Sticky).apply(this, arguments)); }
                    _createClass(Sticky, [{ key: "_setup", value: function _setup(element, options) { this.$element = element; this.options = jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend({}, Sticky.defaults, this.$element.data(), options); this.className = 'Sticky'; Triggers.init(jquery__WEBPACK_IMPORTED_MODULE_0___default.a); this._init(); } }, {
                        key: "_init", value: function _init() {
                            MediaQuery._init(); var $parent = this.$element.parent('[data-sticky-container]'), id = this.$element[0].id || GetYoDigits(6, 'sticky'), _this = this; if ($parent.length) { this.$container = $parent; } else { this.wasWrapped = true; this.$element.wrap(this.options.container); this.$container = this.$element.parent(); }
                            this.$container.addClass(this.options.containerClass); this.$element.addClass(this.options.stickyClass).attr({ 'data-resize': id, 'data-mutate': id }); if (this.options.anchor !== '') { jquery__WEBPACK_IMPORTED_MODULE_0___default()('#' + _this.options.anchor).attr({ 'data-mutate': id }); }
                            this.scrollCount = this.options.checkEvery; this.isStuck = false; this.onLoadListener = onLoad(jquery__WEBPACK_IMPORTED_MODULE_0___default()(window), function () {
                                _this.containerHeight = _this.$element.css("display") == "none" ? 0 : _this.$element[0].getBoundingClientRect().height; _this.$container.css('height', _this.containerHeight); _this.elemHeight = _this.containerHeight; if (_this.options.anchor !== '') { _this.$anchor = jquery__WEBPACK_IMPORTED_MODULE_0___default()('#' + _this.options.anchor); } else { _this._parsePoints(); }
                                _this._setSizes(function () { var scroll = window.pageYOffset; _this._calc(false, scroll); if (!_this.isStuck) { _this._removeSticky(scroll >= _this.topPoint ? false : true); } }); _this._events(id.split('-').reverse().join('-'));
                            });
                        }
                    }, {
                        key: "_parsePoints", value: function _parsePoints() {
                            var top = this.options.topAnchor == "" ? 1 : this.options.topAnchor, btm = this.options.btmAnchor == "" ? document.documentElement.scrollHeight : this.options.btmAnchor, pts = [top, btm], breaks = {}; for (var i = 0, len = pts.length; i < len && pts[i]; i++) {
                                var pt; if (typeof pts[i] === 'number') { pt = pts[i]; } else { var place = pts[i].split(':'), anchor = jquery__WEBPACK_IMPORTED_MODULE_0___default()("#".concat(place[0])); pt = anchor.offset().top; if (place[1] && place[1].toLowerCase() === 'bottom') { pt += anchor[0].getBoundingClientRect().height; } }
                                breaks[i] = pt;
                            }
                            this.points = breaks; return;
                        }
                    }, {
                        key: "_events", value: function _events(id) {
                            var _this = this, scrollListener = this.scrollListener = "scroll.zf.".concat(id); if (this.isOn) { return; }
                            if (this.canStick) { this.isOn = true; jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).off(scrollListener).on(scrollListener, function (e) { if (_this.scrollCount === 0) { _this.scrollCount = _this.options.checkEvery; _this._setSizes(function () { _this._calc(false, window.pageYOffset); }); } else { _this.scrollCount--; _this._calc(false, window.pageYOffset); } }); }
                            this.$element.off('resizeme.zf.trigger').on('resizeme.zf.trigger', function (e, el) { _this._eventsHandler(id); }); this.$element.on('mutateme.zf.trigger', function (e, el) { _this._eventsHandler(id); }); if (this.$anchor) { this.$anchor.on('mutateme.zf.trigger', function (e, el) { _this._eventsHandler(id); }); }
                        }
                    }, { key: "_eventsHandler", value: function _eventsHandler(id) { var _this = this, scrollListener = this.scrollListener = "scroll.zf.".concat(id); _this._setSizes(function () { _this._calc(false); if (_this.canStick) { if (!_this.isOn) { _this._events(id); } } else if (_this.isOn) { _this._pauseListeners(scrollListener); } }); } }, { key: "_pauseListeners", value: function _pauseListeners(scrollListener) { this.isOn = false; jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).off(scrollListener); this.$element.trigger('pause.zf.sticky'); } }, {
                        key: "_calc", value: function _calc(checkSizes, scroll) {
                            if (checkSizes) { this._setSizes(); }
                            if (!this.canStick) {
                                if (this.isStuck) { this._removeSticky(true); }
                                return false;
                            }
                            if (!scroll) { scroll = window.pageYOffset; }
                            if (scroll >= this.topPoint) { if (scroll <= this.bottomPoint) { if (!this.isStuck) { this._setSticky(); } } else { if (this.isStuck) { this._removeSticky(false); } } } else { if (this.isStuck) { this._removeSticky(true); } }
                        }
                    }, { key: "_setSticky", value: function _setSticky() { var _this = this, stickTo = this.options.stickTo, mrgn = stickTo === 'top' ? 'marginTop' : 'marginBottom', notStuckTo = stickTo === 'top' ? 'bottom' : 'top', css = {}; css[mrgn] = "".concat(this.options[mrgn], "em"); css[stickTo] = 0; css[notStuckTo] = 'auto'; this.isStuck = true; this.$element.removeClass("is-anchored is-at-".concat(notStuckTo)).addClass("is-stuck is-at-".concat(stickTo)).css(css).trigger("sticky.zf.stuckto:".concat(stickTo)); this.$element.on("transitionend webkitTransitionEnd oTransitionEnd otransitionend MSTransitionEnd", function () { _this._setSizes(); }); } }, {
                        key: "_removeSticky", value: function _removeSticky(isTop) {
                            var stickTo = this.options.stickTo, stickToTop = stickTo === 'top', css = {}, anchorPt = (this.points ? this.points[1] - this.points[0] : this.anchorHeight) - this.elemHeight, mrgn = stickToTop ? 'marginTop' : 'marginBottom', topOrBottom = isTop ? 'top' : 'bottom'; css[mrgn] = 0; css['bottom'] = 'auto'; if (isTop) { css['top'] = 0; } else { css['top'] = anchorPt; }
                            this.isStuck = false; this.$element.removeClass("is-stuck is-at-".concat(stickTo)).addClass("is-anchored is-at-".concat(topOrBottom)).css(css).trigger("sticky.zf.unstuckfrom:".concat(topOrBottom));
                        }
                    }, {
                        key: "_setSizes", value: function _setSizes(cb) {
                            this.canStick = MediaQuery.is(this.options.stickyOn); if (!this.canStick) { if (cb && typeof cb === 'function') { cb(); } }
                            var newElemWidth = this.$container[0].getBoundingClientRect().width, comp = window.getComputedStyle(this.$container[0]), pdngl = parseInt(comp['padding-left'], 10), pdngr = parseInt(comp['padding-right'], 10); if (this.$anchor && this.$anchor.length) { this.anchorHeight = this.$anchor[0].getBoundingClientRect().height; } else { this._parsePoints(); }
                            this.$element.css({ 'max-width': "".concat(newElemWidth - pdngl - pdngr, "px") }); if (this.options.dynamicHeight || !this.containerHeight) { var newContainerHeight = this.$element[0].getBoundingClientRect().height || this.containerHeight; newContainerHeight = this.$element.css("display") == "none" ? 0 : newContainerHeight; this.$container.css('height', newContainerHeight); this.containerHeight = newContainerHeight; }
                            this.elemHeight = this.containerHeight; if (!this.isStuck) { if (this.$element.hasClass('is-at-bottom')) { var anchorPt = (this.points ? this.points[1] - this.$container.offset().top : this.anchorHeight) - this.elemHeight; this.$element.css('top', anchorPt); } }
                            this._setBreakPoints(this.containerHeight, function () { if (cb && typeof cb === 'function') { cb(); } });
                        }
                    }, {
                        key: "_setBreakPoints", value: function _setBreakPoints(elemHeight, cb) {
                            if (!this.canStick) { if (cb && typeof cb === 'function') { cb(); } else { return false; } }
                            var mTop = emCalc(this.options.marginTop), mBtm = emCalc(this.options.marginBottom), topPoint = this.points ? this.points[0] : this.$anchor.offset().top, bottomPoint = this.points ? this.points[1] : topPoint + this.anchorHeight, winHeight = window.innerHeight; if (this.options.stickTo === 'top') { topPoint -= mTop; bottomPoint -= elemHeight + mTop; } else if (this.options.stickTo === 'bottom') { topPoint -= winHeight - (elemHeight + mBtm); bottomPoint -= winHeight - mBtm; }
                            this.topPoint = topPoint; this.bottomPoint = bottomPoint; if (cb && typeof cb === 'function') { cb(); }
                        }
                    }, {
                        key: "_destroy", value: function _destroy() {
                            this._removeSticky(true); this.$element.removeClass("".concat(this.options.stickyClass, " is-anchored is-at-top")).css({ height: '', top: '', bottom: '', 'max-width': '' }).off('resizeme.zf.trigger').off('mutateme.zf.trigger'); if (this.$anchor && this.$anchor.length) { this.$anchor.off('change.zf.sticky'); }
                            if (this.scrollListener) jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).off(this.scrollListener); if (this.onLoadListener) jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).off(this.onLoadListener); if (this.wasWrapped) { this.$element.unwrap(); } else { this.$container.removeClass(this.options.containerClass).css({ height: '' }); }
                        }
                    }]); return Sticky;
                }(Plugin); Sticky.defaults = { container: '<div data-sticky-container></div>', stickTo: 'top', anchor: '', topAnchor: '', btmAnchor: '', marginTop: 1, marginBottom: 1, stickyOn: 'medium', stickyClass: 'sticky', containerClass: 'sticky-container', dynamicHeight: true, checkEvery: -1 }; function emCalc(em) { return parseInt(window.getComputedStyle(document.body, null).fontSize, 10) * em; }
                var Tabs = function (_Plugin) {
                    _inherits(Tabs, _Plugin); function Tabs() { _classCallCheck(this, Tabs); return _possibleConstructorReturn(this, _getPrototypeOf(Tabs).apply(this, arguments)); }
                    _createClass(Tabs, [{ key: "_setup", value: function _setup(element, options) { this.$element = element; this.options = jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend({}, Tabs.defaults, this.$element.data(), options); this.className = 'Tabs'; this._init(); Keyboard.register('Tabs', { 'ENTER': 'open', 'SPACE': 'open', 'ARROW_RIGHT': 'next', 'ARROW_UP': 'previous', 'ARROW_DOWN': 'next', 'ARROW_LEFT': 'previous' }); } }, {
                        key: "_init", value: function _init() {
                            var _this2 = this; var _this = this; this._isInitializing = true; this.$element.attr({ 'role': 'tablist' }); this.$tabTitles = this.$element.find(".".concat(this.options.linkClass)); this.$tabContent = jquery__WEBPACK_IMPORTED_MODULE_0___default()("[data-tabs-content=\"".concat(this.$element[0].id, "\"]")); this.$tabTitles.each(function () {
                                var $elem = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this), $link = $elem.find('a'), isActive = $elem.hasClass("".concat(_this.options.linkActiveClass)), hash = $link.attr('data-tabs-target') || $link[0].hash.slice(1), linkId = $link[0].id ? $link[0].id : "".concat(hash, "-label"), $tabContent = jquery__WEBPACK_IMPORTED_MODULE_0___default()("#".concat(hash)); $elem.attr({ 'role': 'presentation' }); $link.attr({ 'role': 'tab', 'aria-controls': hash, 'aria-selected': isActive, 'id': linkId, 'tabindex': isActive ? '0' : '-1' }); $tabContent.attr({ 'role': 'tabpanel', 'aria-labelledby': linkId }); if (isActive) { _this._initialAnchor = "#".concat(hash); }
                                if (!isActive) { $tabContent.attr('aria-hidden', 'true'); }
                                if (isActive && _this.options.autoFocus) { _this.onLoadListener = onLoad(jquery__WEBPACK_IMPORTED_MODULE_0___default()(window), function () { jquery__WEBPACK_IMPORTED_MODULE_0___default()('html, body').animate({ scrollTop: $elem.offset().top }, _this.options.deepLinkSmudgeDelay, function () { $link.focus(); }); }); }
                            }); if (this.options.matchHeight) { var $images = this.$tabContent.find('img'); if ($images.length) { onImagesLoaded($images, this._setHeight.bind(this)); } else { this._setHeight(); } }
                            this._checkDeepLink = function () {
                                var anchor = window.location.hash; if (!anchor.length) { if (_this2._isInitializing) return; if (_this2._initialAnchor) anchor = _this2._initialAnchor; }
                                var anchorNoHash = anchor.indexOf('#') >= 0 ? anchor.slice(1) : anchor; var $anchor = anchorNoHash && jquery__WEBPACK_IMPORTED_MODULE_0___default()("#".concat(anchorNoHash)); var $link = anchor && _this2.$element.find("[href$=\"".concat(anchor, "\"],[data-tabs-target=\"").concat(anchorNoHash, "\"]")).first(); var isOwnAnchor = !!($anchor.length && $link.length); if (isOwnAnchor) {
                                    if ($anchor && $anchor.length && $link && $link.length) { _this2.selectTab($anchor, true); }
                                    else { _this2._collapse(); }
                                    if (_this2.options.deepLinkSmudge) { var offset = _this2.$element.offset(); jquery__WEBPACK_IMPORTED_MODULE_0___default()('html, body').animate({ scrollTop: offset.top }, _this2.options.deepLinkSmudgeDelay); }
                                    _this2.$element.trigger('deeplink.zf.tabs', [$link, $anchor]);
                                }
                            }; if (this.options.deepLink) { this._checkDeepLink(); }
                            this._events(); this._isInitializing = false;
                        }
                    }, {
                        key: "_events", value: function _events() {
                            this._addKeyHandler(); this._addClickHandler(); this._setHeightMqHandler = null; if (this.options.matchHeight) { this._setHeightMqHandler = this._setHeight.bind(this); jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).on('changed.zf.mediaquery', this._setHeightMqHandler); }
                            if (this.options.deepLink) { jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).on('hashchange', this._checkDeepLink); }
                        }
                    }, { key: "_addClickHandler", value: function _addClickHandler() { var _this = this; this.$element.off('click.zf.tabs').on('click.zf.tabs', ".".concat(this.options.linkClass), function (e) { e.preventDefault(); _this._handleTabChange(jquery__WEBPACK_IMPORTED_MODULE_0___default()(this)); }); } }, {
                        key: "_addKeyHandler", value: function _addKeyHandler() {
                            var _this = this; this.$tabTitles.off('keydown.zf.tabs').on('keydown.zf.tabs', function (e) {
                                if (e.which === 9) return; var $element = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this), $elements = $element.parent('ul').children('li'), $prevElement, $nextElement; $elements.each(function (i) {
                                    if (jquery__WEBPACK_IMPORTED_MODULE_0___default()(this).is($element)) {
                                        if (_this.options.wrapOnKeys) { $prevElement = i === 0 ? $elements.last() : $elements.eq(i - 1); $nextElement = i === $elements.length - 1 ? $elements.first() : $elements.eq(i + 1); } else { $prevElement = $elements.eq(Math.max(0, i - 1)); $nextElement = $elements.eq(Math.min(i + 1, $elements.length - 1)); }
                                        return;
                                    }
                                }); Keyboard.handleKey(e, 'Tabs', { open: function open() { $element.find('[role="tab"]').focus(); _this._handleTabChange($element); }, previous: function previous() { $prevElement.find('[role="tab"]').focus(); _this._handleTabChange($prevElement); }, next: function next() { $nextElement.find('[role="tab"]').focus(); _this._handleTabChange($nextElement); }, handled: function handled() { e.preventDefault(); } });
                            });
                        }
                    }, {
                        key: "_handleTabChange", value: function _handleTabChange($target, historyHandled) {
                            if ($target.hasClass("".concat(this.options.linkActiveClass))) {
                                if (this.options.activeCollapse) { this._collapse(); }
                                return;
                            }
                            var $oldTab = this.$element.find(".".concat(this.options.linkClass, ".").concat(this.options.linkActiveClass)), $tabLink = $target.find('[role="tab"]'), target = $tabLink.attr('data-tabs-target'), anchor = target && target.length ? "#".concat(target) : $tabLink[0].hash, $targetContent = this.$tabContent.find(anchor); this._collapseTab($oldTab); this._openTab($target); if (this.options.deepLink && !historyHandled) { if (this.options.updateHistory) { history.pushState({}, '', anchor); } else { history.replaceState({}, '', anchor); } }
                            this.$element.trigger('change.zf.tabs', [$target, $targetContent]); $targetContent.find("[data-mutate]").trigger("mutateme.zf.trigger");
                        }
                    }, { key: "_openTab", value: function _openTab($target) { var $tabLink = $target.find('[role="tab"]'), hash = $tabLink.attr('data-tabs-target') || $tabLink[0].hash.slice(1), $targetContent = this.$tabContent.find("#".concat(hash)); $target.addClass("".concat(this.options.linkActiveClass)); $tabLink.attr({ 'aria-selected': 'true', 'tabindex': '0' }); $targetContent.addClass("".concat(this.options.panelActiveClass)).removeAttr('aria-hidden'); } }, { key: "_collapseTab", value: function _collapseTab($target) { var $target_anchor = $target.removeClass("".concat(this.options.linkActiveClass)).find('[role="tab"]').attr({ 'aria-selected': 'false', 'tabindex': -1 }); jquery__WEBPACK_IMPORTED_MODULE_0___default()("#".concat($target_anchor.attr('aria-controls'))).removeClass("".concat(this.options.panelActiveClass)).attr({ 'aria-hidden': 'true' }); } }, { key: "_collapse", value: function _collapse() { var $activeTab = this.$element.find(".".concat(this.options.linkClass, ".").concat(this.options.linkActiveClass)); if ($activeTab.length) { this._collapseTab($activeTab); this.$element.trigger('collapse.zf.tabs', [$activeTab]); } } }, {
                        key: "selectTab", value: function selectTab(elem, historyHandled) {
                            var idStr, hashIdStr; if (_typeof(elem) === 'object') { idStr = elem[0].id; } else { idStr = elem; }
                            if (idStr.indexOf('#') < 0) { hashIdStr = "#".concat(idStr); } else { hashIdStr = idStr; idStr = idStr.slice(1); }
                            var $target = this.$tabTitles.has("[href$=\"".concat(hashIdStr, "\"],[data-tabs-target=\"").concat(idStr, "\"]")).first(); this._handleTabChange($target, historyHandled);
                        }
                    }, {
                        key: "_setHeight", value: function _setHeight() {
                            var max = 0, _this = this; this.$tabContent.find(".".concat(this.options.panelClass)).css('height', '').each(function () {
                                var panel = jquery__WEBPACK_IMPORTED_MODULE_0___default()(this), isActive = panel.hasClass("".concat(_this.options.panelActiveClass)); if (!isActive) { panel.css({ 'visibility': 'hidden', 'display': 'block' }); }
                                var temp = this.getBoundingClientRect().height; if (!isActive) { panel.css({ 'visibility': '', 'display': '' }); }
                                max = temp > max ? temp : max;
                            }).css('height', "".concat(max, "px"));
                        }
                    }, {
                        key: "_destroy", value: function _destroy() {
                            this.$element.find(".".concat(this.options.linkClass)).off('.zf.tabs').hide().end().find(".".concat(this.options.panelClass)).hide(); if (this.options.matchHeight) { if (this._setHeightMqHandler != null) { jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).off('changed.zf.mediaquery', this._setHeightMqHandler); } }
                            if (this.options.deepLink) { jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).off('hashchange', this._checkDeepLink); }
                            if (this.onLoadListener) { jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).off(this.onLoadListener); }
                        }
                    }]); return Tabs;
                }(Plugin); Tabs.defaults = { deepLink: false, deepLinkSmudge: false, deepLinkSmudgeDelay: 300, updateHistory: false, autoFocus: false, wrapOnKeys: true, matchHeight: false, activeCollapse: false, linkClass: 'tabs-title', linkActiveClass: 'is-active', panelClass: 'tabs-panel', panelActiveClass: 'is-active' }; var Toggler = function (_Plugin) {
                    _inherits(Toggler, _Plugin); function Toggler() { _classCallCheck(this, Toggler); return _possibleConstructorReturn(this, _getPrototypeOf(Toggler).apply(this, arguments)); }
                    _createClass(Toggler, [{ key: "_setup", value: function _setup(element, options) { this.$element = element; this.options = jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend({}, Toggler.defaults, element.data(), options); this.className = ''; this.className = 'Toggler'; Triggers.init(jquery__WEBPACK_IMPORTED_MODULE_0___default.a); this._init(); this._events(); } }, {
                        key: "_init", value: function _init() {
                            var id = this.$element[0].id, $triggers = jquery__WEBPACK_IMPORTED_MODULE_0___default()("[data-open~=\"".concat(id, "\"], [data-close~=\"").concat(id, "\"], [data-toggle~=\"").concat(id, "\"]")); var input; if (this.options.animate) { input = this.options.animate.split(' '); this.animationIn = input[0]; this.animationOut = input[1] || null; $triggers.attr('aria-expanded', !this.$element.is(':hidden')); }
                            else {
                                input = this.options.toggler; if (typeof input !== 'string' || !input.length) { throw new Error("The 'toogler' option containing the target class is required, got \"".concat(input, "\"")); }
                                this.className = input[0] === '.' ? input.slice(1) : input; $triggers.attr('aria-expanded', this.$element.hasClass(this.className));
                            }
                            $triggers.each(function (index, trigger) { var $trigger = jquery__WEBPACK_IMPORTED_MODULE_0___default()(trigger); var controls = $trigger.attr('aria-controls') || ''; var containsId = new RegExp("\\b".concat(RegExpEscape(id), "\\b")).test(controls); if (!containsId) $trigger.attr('aria-controls', controls ? "".concat(controls, " ").concat(id) : id); });
                        }
                    }, { key: "_events", value: function _events() { this.$element.off('toggle.zf.trigger').on('toggle.zf.trigger', this.toggle.bind(this)); } }, { key: "toggle", value: function toggle() { this[this.options.animate ? '_toggleAnimate' : '_toggleClass'](); } }, {
                        key: "_toggleClass", value: function _toggleClass() {
                            this.$element.toggleClass(this.className); var isOn = this.$element.hasClass(this.className); if (isOn) { this.$element.trigger('on.zf.toggler'); } else { this.$element.trigger('off.zf.toggler'); }
                            this._updateARIA(isOn); this.$element.find('[data-mutate]').trigger('mutateme.zf.trigger');
                        }
                    }, { key: "_toggleAnimate", value: function _toggleAnimate() { var _this = this; if (this.$element.is(':hidden')) { Motion.animateIn(this.$element, this.animationIn, function () { _this._updateARIA(true); this.trigger('on.zf.toggler'); this.find('[data-mutate]').trigger('mutateme.zf.trigger'); }); } else { Motion.animateOut(this.$element, this.animationOut, function () { _this._updateARIA(false); this.trigger('off.zf.toggler'); this.find('[data-mutate]').trigger('mutateme.zf.trigger'); }); } } }, { key: "_updateARIA", value: function _updateARIA(isOn) { var id = this.$element[0].id; jquery__WEBPACK_IMPORTED_MODULE_0___default()("[data-open=\"".concat(id, "\"], [data-close=\"").concat(id, "\"], [data-toggle=\"").concat(id, "\"]")).attr({ 'aria-expanded': isOn ? true : false }); } }, { key: "_destroy", value: function _destroy() { this.$element.off('.zf.toggler'); } }]); return Toggler;
                }(Plugin); Toggler.defaults = { toggler: undefined, animate: false }; var Tooltip = function (_Positionable) {
                    _inherits(Tooltip, _Positionable); function Tooltip() { _classCallCheck(this, Tooltip); return _possibleConstructorReturn(this, _getPrototypeOf(Tooltip).apply(this, arguments)); }
                    _createClass(Tooltip, [{ key: "_setup", value: function _setup(element, options) { this.$element = element; this.options = jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend({}, Tooltip.defaults, this.$element.data(), options); this.className = 'Tooltip'; this.isActive = false; this.isClick = false; Triggers.init(jquery__WEBPACK_IMPORTED_MODULE_0___default.a); this._init(); } }, {
                        key: "_init", value: function _init() {
                            MediaQuery._init(); var elemId = this.$element.attr('aria-describedby') || GetYoDigits(6, 'tooltip'); this.options.tipText = this.options.tipText || this.$element.attr('title'); this.template = this.options.template ? jquery__WEBPACK_IMPORTED_MODULE_0___default()(this.options.template) : this._buildTemplate(elemId); if (this.options.allowHtml) { this.template.appendTo(document.body).html(this.options.tipText).hide(); } else { this.template.appendTo(document.body).text(this.options.tipText).hide(); }
                            this.$element.attr({ 'title': '', 'aria-describedby': elemId, 'data-yeti-box': elemId, 'data-toggle': elemId, 'data-resize': elemId }).addClass(this.options.triggerClass); _get(_getPrototypeOf(Tooltip.prototype), "_init", this).call(this); this._events();
                        }
                    }, {
                        key: "_getDefaultPosition", value: function _getDefaultPosition() {
                            var elementClassName = this.$element[0].className; if (this.$element[0] instanceof SVGElement) { elementClassName = elementClassName.baseVal; }
                            var position = elementClassName.match(/\b(top|left|right|bottom)\b/g); return position ? position[0] : 'top';
                        }
                    }, { key: "_getDefaultAlignment", value: function _getDefaultAlignment() { return 'center'; } }, { key: "_getHOffset", value: function _getHOffset() { if (this.position === 'left' || this.position === 'right') { return this.options.hOffset + this.options.tooltipWidth; } else { return this.options.hOffset; } } }, { key: "_getVOffset", value: function _getVOffset() { if (this.position === 'top' || this.position === 'bottom') { return this.options.vOffset + this.options.tooltipHeight; } else { return this.options.vOffset; } } }, { key: "_buildTemplate", value: function _buildTemplate(id) { var templateClasses = "".concat(this.options.tooltipClass, " ").concat(this.options.templateClasses).trim(); var $template = jquery__WEBPACK_IMPORTED_MODULE_0___default()('<div></div>').addClass(templateClasses).attr({ 'role': 'tooltip', 'aria-hidden': true, 'data-is-active': false, 'data-is-focus': false, 'id': id }); return $template; } }, { key: "_setPosition", value: function _setPosition() { _get(_getPrototypeOf(Tooltip.prototype), "_setPosition", this).call(this, this.$element, this.template); } }, {
                        key: "show", value: function show() {
                            if (this.options.showOn !== 'all' && !MediaQuery.is(this.options.showOn)) { return false; }
                            var _this = this; this.template.css('visibility', 'hidden').show(); this._setPosition(); this.template.removeClass('top bottom left right').addClass(this.position); this.template.removeClass('align-top align-bottom align-left align-right align-center').addClass('align-' + this.alignment); this.$element.trigger('closeme.zf.tooltip', this.template.attr('id')); this.template.attr({ 'data-is-active': true, 'aria-hidden': false }); _this.isActive = true; this.template.stop().hide().css('visibility', '').fadeIn(this.options.fadeInDuration, function () { }); this.$element.trigger('show.zf.tooltip');
                        }
                    }, { key: "hide", value: function hide() { var _this = this; this.template.stop().attr({ 'aria-hidden': true, 'data-is-active': false }).fadeOut(this.options.fadeOutDuration, function () { _this.isActive = false; _this.isClick = false; }); this.$element.trigger('hide.zf.tooltip'); } }, {
                        key: "_events", value: function _events() {
                            var _this = this; var hasTouch = 'ontouchstart' in window || typeof window.ontouchstart !== 'undefined'; var $template = this.template; var isFocus = false; if (hasTouch && this.options.disableForTouch) return; if (!this.options.disableHover) { this.$element.on('mouseenter.zf.tooltip', function (e) { if (!_this.isActive) { _this.timeout = setTimeout(function () { _this.show(); }, _this.options.hoverDelay); } }).on('mouseleave.zf.tooltip', ignoreMousedisappear(function (e) { clearTimeout(_this.timeout); if (!isFocus || _this.isClick && !_this.options.clickOpen) { _this.hide(); } })); }
                            if (hasTouch) { this.$element.on('tap.zf.tooltip touchend.zf.tooltip', function (e) { _this.isActive ? _this.hide() : _this.show(); }); }
                            if (this.options.clickOpen) { this.$element.on('mousedown.zf.tooltip', function (e) { if (_this.isClick); else { _this.isClick = true; if ((_this.options.disableHover || !_this.$element.attr('tabindex')) && !_this.isActive) { _this.show(); } } }); } else { this.$element.on('mousedown.zf.tooltip', function (e) { _this.isClick = true; }); }
                            this.$element.on({ 'close.zf.trigger': this.hide.bind(this) }); this.$element.on('focus.zf.tooltip', function (e) {
                                isFocus = true; if (_this.isClick) {
                                    if (!_this.options.clickOpen) { isFocus = false; }
                                    return false;
                                } else { _this.show(); }
                            }).on('focusout.zf.tooltip', function (e) { isFocus = false; _this.isClick = false; _this.hide(); }).on('resizeme.zf.trigger', function () { if (_this.isActive) { _this._setPosition(); } });
                        }
                    }, { key: "toggle", value: function toggle() { if (this.isActive) { this.hide(); } else { this.show(); } } }, { key: "_destroy", value: function _destroy() { this.$element.attr('title', this.template.text()).off('.zf.trigger .zf.tooltip').removeClass(this.options.triggerClass).removeClass('top right left bottom').removeAttr('aria-describedby data-disable-hover data-resize data-toggle data-tooltip data-yeti-box'); this.template.remove(); } }]); return Tooltip;
                }(Positionable); Tooltip.defaults = { hoverDelay: 200, fadeInDuration: 150, fadeOutDuration: 150, disableHover: false, disableForTouch: false, templateClasses: '', tooltipClass: 'tooltip', triggerClass: 'has-tip', showOn: 'small', template: '', tipText: '', touchCloseText: 'Tap to close.', clickOpen: true, position: 'auto', alignment: 'auto', allowOverlap: false, allowBottomOverlap: false, vOffset: 0, hOffset: 0, tooltipHeight: 14, tooltipWidth: 12, allowHtml: false }; var MenuPlugins$1 = { tabs: { cssClass: 'tabs', plugin: Tabs, open: function open(plugin, target) { return plugin.selectTab(target); }, close: null, toggle: null }, accordion: { cssClass: 'accordion', plugin: Accordion, open: function open(plugin, target) { return plugin.down(jquery__WEBPACK_IMPORTED_MODULE_0___default()(target)); }, close: function close(plugin, target) { return plugin.up(jquery__WEBPACK_IMPORTED_MODULE_0___default()(target)); }, toggle: function toggle(plugin, target) { return plugin.toggle(jquery__WEBPACK_IMPORTED_MODULE_0___default()(target)); } } }; var ResponsiveAccordionTabs = function (_Plugin) {
                    _inherits(ResponsiveAccordionTabs, _Plugin); function ResponsiveAccordionTabs(element, options) { var _this2; _classCallCheck(this, ResponsiveAccordionTabs); _this2 = _possibleConstructorReturn(this, _getPrototypeOf(ResponsiveAccordionTabs).call(this, element, options)); return _possibleConstructorReturn(_this2, _this2.options.reflow && _this2.storezfData || _assertThisInitialized(_this2)); }
                    _createClass(ResponsiveAccordionTabs, [{
                        key: "_setup", value: function _setup(element, options) {
                            this.$element = jquery__WEBPACK_IMPORTED_MODULE_0___default()(element); this.$element.data('zfPluginBase', this); this.options = jquery__WEBPACK_IMPORTED_MODULE_0___default.a.extend({}, ResponsiveAccordionTabs.defaults, this.$element.data(), options); this.rules = this.$element.data('responsive-accordion-tabs'); this.currentMq = null; this.currentRule = null; this.currentPlugin = null; this.className = 'ResponsiveAccordionTabs'; if (!this.$element.attr('id')) { this.$element.attr('id', GetYoDigits(6, 'responsiveaccordiontabs')); }
                            this._init(); this._events();
                        }
                    }, {
                        key: "_init", value: function _init() {
                            MediaQuery._init(); if (typeof this.rules === 'string') {
                                var rulesTree = {}; var rules = this.rules.split(' '); for (var i = 0; i < rules.length; i++) { var rule = rules[i].split('-'); var ruleSize = rule.length > 1 ? rule[0] : 'small'; var rulePlugin = rule.length > 1 ? rule[1] : rule[0]; if (MenuPlugins$1[rulePlugin] !== null) { rulesTree[ruleSize] = MenuPlugins$1[rulePlugin]; } }
                                this.rules = rulesTree;
                            }
                            this._getAllOptions(); if (!jquery__WEBPACK_IMPORTED_MODULE_0___default.a.isEmptyObject(this.rules)) { this._checkMediaQueries(); }
                        }
                    }, {
                        key: "_getAllOptions", value: function _getAllOptions() {
                            var _this = this; _this.allOptions = {}; for (var key in MenuPlugins$1) {
                                if (MenuPlugins$1.hasOwnProperty(key)) {
                                    var obj = MenuPlugins$1[key]; try {
                                        var dummyPlugin = jquery__WEBPACK_IMPORTED_MODULE_0___default()('<ul></ul>'); var tmpPlugin = new obj.plugin(dummyPlugin, _this.options); for (var keyKey in tmpPlugin.options) { if (tmpPlugin.options.hasOwnProperty(keyKey) && keyKey !== 'zfPlugin') { var objObj = tmpPlugin.options[keyKey]; _this.allOptions[keyKey] = objObj; } }
                                        tmpPlugin.destroy();
                                    } catch (e) { }
                                }
                            }
                        }
                    }, { key: "_events", value: function _events() { this._changedZfMediaQueryHandler = this._checkMediaQueries.bind(this); jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).on('changed.zf.mediaquery', this._changedZfMediaQueryHandler); } }, {
                        key: "_checkMediaQueries", value: function _checkMediaQueries() {
                            var matchedMq, _this = this; jquery__WEBPACK_IMPORTED_MODULE_0___default.a.each(this.rules, function (key) { if (MediaQuery.atLeast(key)) { matchedMq = key; } }); if (!matchedMq) return; if (this.currentPlugin instanceof this.rules[matchedMq].plugin) return; jquery__WEBPACK_IMPORTED_MODULE_0___default.a.each(MenuPlugins$1, function (key, value) { _this.$element.removeClass(value.cssClass); }); this.$element.addClass(this.rules[matchedMq].cssClass); if (this.currentPlugin) { if (!this.currentPlugin.$element.data('zfPlugin') && this.storezfData) this.currentPlugin.$element.data('zfPlugin', this.storezfData); this.currentPlugin.destroy(); }
                            this._handleMarkup(this.rules[matchedMq].cssClass); this.currentRule = this.rules[matchedMq]; this.currentPlugin = new this.currentRule.plugin(this.$element, this.options); this.storezfData = this.currentPlugin.$element.data('zfPlugin');
                        }
                    }, {
                        key: "_handleMarkup", value: function _handleMarkup(toSet) {
                            var _this = this, fromString = 'accordion'; var $panels = jquery__WEBPACK_IMPORTED_MODULE_0___default()('[data-tabs-content=' + this.$element.attr('id') + ']'); if ($panels.length) fromString = 'tabs'; if (fromString === toSet) { return; }
                            var tabsTitle = _this.allOptions.linkClass ? _this.allOptions.linkClass : 'tabs-title'; var tabsPanel = _this.allOptions.panelClass ? _this.allOptions.panelClass : 'tabs-panel'; this.$element.removeAttr('role'); var $liHeads = this.$element.children('.' + tabsTitle + ',[data-accordion-item]').removeClass(tabsTitle).removeClass('accordion-item').removeAttr('data-accordion-item'); var $liHeadsA = $liHeads.children('a').removeClass('accordion-title'); if (fromString === 'tabs') { $panels = $panels.children('.' + tabsPanel).removeClass(tabsPanel).removeAttr('role').removeAttr('aria-hidden').removeAttr('aria-labelledby'); $panels.children('a').removeAttr('role').removeAttr('aria-controls').removeAttr('aria-selected'); } else { $panels = $liHeads.children('[data-tab-content]').removeClass('accordion-content'); }
                            $panels.css({ display: '', visibility: '' }); $liHeads.css({ display: '', visibility: '' }); if (toSet === 'accordion') { $panels.each(function (key, value) { jquery__WEBPACK_IMPORTED_MODULE_0___default()(value).appendTo($liHeads.get(key)).addClass('accordion-content').attr('data-tab-content', '').removeClass('is-active').css({ height: '' }); jquery__WEBPACK_IMPORTED_MODULE_0___default()('[data-tabs-content=' + _this.$element.attr('id') + ']').after('<div id="tabs-placeholder-' + _this.$element.attr('id') + '"></div>').detach(); $liHeads.addClass('accordion-item').attr('data-accordion-item', ''); $liHeadsA.addClass('accordion-title'); }); } else if (toSet === 'tabs') {
                                var $tabsContent = jquery__WEBPACK_IMPORTED_MODULE_0___default()('[data-tabs-content=' + _this.$element.attr('id') + ']'); var $placeholder = jquery__WEBPACK_IMPORTED_MODULE_0___default()('#tabs-placeholder-' + _this.$element.attr('id')); if ($placeholder.length) { $tabsContent = jquery__WEBPACK_IMPORTED_MODULE_0___default()('<div class="tabs-content"></div>').insertAfter($placeholder).attr('data-tabs-content', _this.$element.attr('id')); $placeholder.remove(); } else { $tabsContent = jquery__WEBPACK_IMPORTED_MODULE_0___default()('<div class="tabs-content"></div>').insertAfter(_this.$element).attr('data-tabs-content', _this.$element.attr('id')); }
                                $panels.each(function (key, value) {
                                    var tempValue = jquery__WEBPACK_IMPORTED_MODULE_0___default()(value).appendTo($tabsContent).addClass(tabsPanel); var hash = $liHeadsA.get(key).hash.slice(1); var id = jquery__WEBPACK_IMPORTED_MODULE_0___default()(value).attr('id') || GetYoDigits(6, 'accordion'); if (hash !== id) { if (hash !== '') { jquery__WEBPACK_IMPORTED_MODULE_0___default()(value).attr('id', hash); } else { hash = id; jquery__WEBPACK_IMPORTED_MODULE_0___default()(value).attr('id', hash); jquery__WEBPACK_IMPORTED_MODULE_0___default()($liHeadsA.get(key)).attr('href', jquery__WEBPACK_IMPORTED_MODULE_0___default()($liHeadsA.get(key)).attr('href').replace('#', '') + '#' + hash); } }
                                    var isActive = jquery__WEBPACK_IMPORTED_MODULE_0___default()($liHeads.get(key)).hasClass('is-active'); if (isActive) { tempValue.addClass('is-active'); }
                                }); $liHeads.addClass(tabsTitle);
                            }
                        }
                    }, { key: "open", value: function open(_target) { if (this.currentRule && typeof this.currentRule.open === 'function') { var _this$currentRule; return (_this$currentRule = this.currentRule).open.apply(_this$currentRule, [this.currentPlugin].concat(Array.prototype.slice.call(arguments))); } } }, { key: "close", value: function close(_target) { if (this.currentRule && typeof this.currentRule.close === 'function') { var _this$currentRule2; return (_this$currentRule2 = this.currentRule).close.apply(_this$currentRule2, [this.currentPlugin].concat(Array.prototype.slice.call(arguments))); } } }, { key: "toggle", value: function toggle(_target) { if (this.currentRule && typeof this.currentRule.toggle === 'function') { var _this$currentRule3; return (_this$currentRule3 = this.currentRule).toggle.apply(_this$currentRule3, [this.currentPlugin].concat(Array.prototype.slice.call(arguments))); } } }, { key: "_destroy", value: function _destroy() { if (this.currentPlugin) this.currentPlugin.destroy(); jquery__WEBPACK_IMPORTED_MODULE_0___default()(window).off('changed.zf.mediaquery', this._changedZfMediaQueryHandler); } }]); return ResponsiveAccordionTabs;
                }(Plugin); ResponsiveAccordionTabs.defaults = {}; Foundation.addToJquery(jquery__WEBPACK_IMPORTED_MODULE_0___default.a); Foundation.rtl = rtl; Foundation.GetYoDigits = GetYoDigits; Foundation.transitionend = transitionend; Foundation.RegExpEscape = RegExpEscape; Foundation.onLoad = onLoad; Foundation.Box = Box; Foundation.onImagesLoaded = onImagesLoaded; Foundation.Keyboard = Keyboard; Foundation.MediaQuery = MediaQuery; Foundation.Motion = Motion; Foundation.Move = Move; Foundation.Nest = Nest; Foundation.Timer = Timer; Touch.init(jquery__WEBPACK_IMPORTED_MODULE_0___default.a); Triggers.init(jquery__WEBPACK_IMPORTED_MODULE_0___default.a, Foundation); MediaQuery._init(); Foundation.plugin(Abide, 'Abide'); Foundation.plugin(Accordion, 'Accordion'); Foundation.plugin(AccordionMenu, 'AccordionMenu'); Foundation.plugin(Drilldown, 'Drilldown'); Foundation.plugin(Dropdown, 'Dropdown'); Foundation.plugin(DropdownMenu, 'DropdownMenu'); Foundation.plugin(Equalizer, 'Equalizer'); Foundation.plugin(Interchange, 'Interchange'); Foundation.plugin(Magellan, 'Magellan'); Foundation.plugin(OffCanvas, 'OffCanvas'); Foundation.plugin(Orbit, 'Orbit'); Foundation.plugin(ResponsiveMenu, 'ResponsiveMenu'); Foundation.plugin(ResponsiveToggle, 'ResponsiveToggle'); Foundation.plugin(Reveal, 'Reveal'); Foundation.plugin(Slider, 'Slider'); Foundation.plugin(SmoothScroll, 'SmoothScroll'); Foundation.plugin(Sticky, 'Sticky'); Foundation.plugin(Tabs, 'Tabs'); Foundation.plugin(Toggler, 'Toggler'); Foundation.plugin(Tooltip, 'Tooltip'); Foundation.plugin(ResponsiveAccordionTabs, 'ResponsiveAccordionTabs'); __webpack_exports__["default"] = (Foundation);
            }), "./node_modules/jquery/dist/jquery.js":
            /*!********************************************!*\
              !*** ./node_modules/jquery/dist/jquery.js ***!
              \********************************************/
            /*! no static exports found */
            (function (module, exports, __webpack_require__) {
                (function (module) {
                    var __WEBPACK_AMD_DEFINE_ARRAY__, __WEBPACK_AMD_DEFINE_RESULT__; function _typeof(obj) { if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }
                    /*!
                     * jQuery JavaScript Library v3.3.1
                     * https://jquery.com/
                     *
                     * Includes Sizzle.js
                     * https://sizzlejs.com/
                     *
                     * Copyright JS Foundation and other contributors
                     * Released under the MIT license
                     * https://jquery.org/license
                     *
                     * Date: 2018-01-20T17:24Z
                     */
                    (function (global, factory) {
                        "use strict"; if ((false ? undefined : _typeof(module)) === "object" && _typeof(module.exports) === "object") {
                            module.exports = global.document ? factory(global, true) : function (w) {
                                if (!w.document) { throw new Error("jQuery requires a window with a document"); }
                                return factory(w);
                            };
                        } else { factory(global); }
                    })(typeof window !== "undefined" ? window : this, function (window, noGlobal) {
                        "use strict"; var arr = []; var document = window.document; var getProto = Object.getPrototypeOf; var _slice = arr.slice; var concat = arr.concat; var push = arr.push; var indexOf = arr.indexOf; var class2type = {}; var toString = class2type.toString; var hasOwn = class2type.hasOwnProperty; var fnToString = hasOwn.toString; var ObjectFunctionString = fnToString.call(Object); var support = {}; var isFunction = function isFunction(obj) { return typeof obj === "function" && typeof obj.nodeType !== "number"; }; var isWindow = function isWindow(obj) { return obj != null && obj === obj.window; }; var preservedScriptAttributes = { type: true, src: true, noModule: true }; function DOMEval(code, doc, node) {
                            doc = doc || document; var i, script = doc.createElement("script"); script.text = code; if (node) { for (i in preservedScriptAttributes) { if (node[i]) { script[i] = node[i]; } } }
                            doc.head.appendChild(script).parentNode.removeChild(script);
                        }
                        function toType(obj) {
                            if (obj == null) { return obj + ""; }
                            return _typeof(obj) === "object" || typeof obj === "function" ? class2type[toString.call(obj)] || "object" : _typeof(obj);
                        }
                        var version = "3.3.1", jQuery = function jQuery(selector, context) { return new jQuery.fn.init(selector, context); }, rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g; jQuery.fn = jQuery.prototype = {
                            jquery: version, constructor: jQuery, length: 0, toArray: function toArray() { return _slice.call(this); }, get: function get(num) {
                                if (num == null) { return _slice.call(this); }
                                return num < 0 ? this[num + this.length] : this[num];
                            }, pushStack: function pushStack(elems) { var ret = jQuery.merge(this.constructor(), elems); ret.prevObject = this; return ret; }, each: function each(callback) { return jQuery.each(this, callback); }, map: function map(callback) { return this.pushStack(jQuery.map(this, function (elem, i) { return callback.call(elem, i, elem); })); }, slice: function slice() { return this.pushStack(_slice.apply(this, arguments)); }, first: function first() { return this.eq(0); }, last: function last() { return this.eq(-1); }, eq: function eq(i) { var len = this.length, j = +i + (i < 0 ? len : 0); return this.pushStack(j >= 0 && j < len ? [this[j]] : []); }, end: function end() { return this.prevObject || this.constructor(); }, push: push, sort: arr.sort, splice: arr.splice
                        }; jQuery.extend = jQuery.fn.extend = function () {
                            var options, name, src, copy, copyIsArray, clone, target = arguments[0] || {}, i = 1, length = arguments.length, deep = false; if (typeof target === "boolean") { deep = target; target = arguments[i] || {}; i++; }
                            if (_typeof(target) !== "object" && !isFunction(target)) { target = {}; }
                            if (i === length) { target = this; i--; }
                            for (; i < length; i++) {
                                if ((options = arguments[i]) != null) {
                                    for (name in options) {
                                        src = target[name]; copy = options[name]; if (target === copy) { continue; }
                                        if (deep && copy && (jQuery.isPlainObject(copy) || (copyIsArray = Array.isArray(copy)))) {
                                            if (copyIsArray) { copyIsArray = false; clone = src && Array.isArray(src) ? src : []; } else { clone = src && jQuery.isPlainObject(src) ? src : {}; }
                                            target[name] = jQuery.extend(deep, clone, copy);
                                        } else if (copy !== undefined) { target[name] = copy; }
                                    }
                                }
                            }
                            return target;
                        }; jQuery.extend({
                            expando: "jQuery" + (version + Math.random()).replace(/\D/g, ""), isReady: true, error: function error(msg) { throw new Error(msg); }, noop: function noop() { }, isPlainObject: function isPlainObject(obj) {
                                var proto, Ctor; if (!obj || toString.call(obj) !== "[object Object]") { return false; }
                                proto = getProto(obj); if (!proto) { return true; }
                                Ctor = hasOwn.call(proto, "constructor") && proto.constructor; return typeof Ctor === "function" && fnToString.call(Ctor) === ObjectFunctionString;
                            }, isEmptyObject: function isEmptyObject(obj) {
                                var name; for (name in obj) { return false; }
                                return true;
                            }, globalEval: function globalEval(code) { DOMEval(code); }, each: function each(obj, callback) {
                                var length, i = 0; if (isArrayLike(obj)) { length = obj.length; for (; i < length; i++) { if (callback.call(obj[i], i, obj[i]) === false) { break; } } } else { for (i in obj) { if (callback.call(obj[i], i, obj[i]) === false) { break; } } }
                                return obj;
                            }, trim: function trim(text) { return text == null ? "" : (text + "").replace(rtrim, ""); }, makeArray: function makeArray(arr, results) {
                                var ret = results || []; if (arr != null) { if (isArrayLike(Object(arr))) { jQuery.merge(ret, typeof arr === "string" ? [arr] : arr); } else { push.call(ret, arr); } }
                                return ret;
                            }, inArray: function inArray(elem, arr, i) { return arr == null ? -1 : indexOf.call(arr, elem, i); }, merge: function merge(first, second) {
                                var len = +second.length, j = 0, i = first.length; for (; j < len; j++) { first[i++] = second[j]; }
                                first.length = i; return first;
                            }, grep: function grep(elems, callback, invert) {
                                var callbackInverse, matches = [], i = 0, length = elems.length, callbackExpect = !invert; for (; i < length; i++) { callbackInverse = !callback(elems[i], i); if (callbackInverse !== callbackExpect) { matches.push(elems[i]); } }
                                return matches;
                            }, map: function map(elems, callback, arg) {
                                var length, value, i = 0, ret = []; if (isArrayLike(elems)) { length = elems.length; for (; i < length; i++) { value = callback(elems[i], i, arg); if (value != null) { ret.push(value); } } } else { for (i in elems) { value = callback(elems[i], i, arg); if (value != null) { ret.push(value); } } }
                                return concat.apply([], ret);
                            }, guid: 1, support: support
                        }); if (typeof Symbol === "function") { jQuery.fn[Symbol.iterator] = arr[Symbol.iterator]; }
                        jQuery.each("Boolean Number String Function Array Date RegExp Object Error Symbol".split(" "), function (i, name) { class2type["[object " + name + "]"] = name.toLowerCase(); }); function isArrayLike(obj) {
                            var length = !!obj && "length" in obj && obj.length, type = toType(obj); if (isFunction(obj) || isWindow(obj)) { return false; }
                            return type === "array" || length === 0 || typeof length === "number" && length > 0 && length - 1 in obj;
                        }
                        var Sizzle =
                            /*!
                               * Sizzle CSS Selector Engine v2.3.3
                               * https://sizzlejs.com/
                               *
                               * Copyright jQuery Foundation and other contributors
                               * Released under the MIT license
                               * http://jquery.org/license
                               *
                               * Date: 2016-08-08
                               */
                            function (window) {
                                var i, support, Expr, getText, isXML, tokenize, compile, select, outermostContext, sortInput, hasDuplicate, setDocument, document, docElem, documentIsHTML, rbuggyQSA, rbuggyMatches, matches, contains, expando = "sizzle" + 1 * new Date(), preferredDoc = window.document, dirruns = 0, done = 0, classCache = createCache(), tokenCache = createCache(), compilerCache = createCache(), sortOrder = function sortOrder(a, b) {
                                    if (a === b) { hasDuplicate = true; }
                                    return 0;
                                }, hasOwn = {}.hasOwnProperty, arr = [], pop = arr.pop, push_native = arr.push, push = arr.push, slice = arr.slice, indexOf = function indexOf(list, elem) {
                                    var i = 0, len = list.length; for (; i < len; i++) { if (list[i] === elem) { return i; } }
                                    return -1;
                                }, booleans = "checked|selected|async|autofocus|autoplay|controls|defer|disabled|hidden|ismap|loop|multiple|open|readonly|required|scoped", whitespace = "[\\x20\\t\\r\\n\\f]", identifier = "(?:\\\\.|[\\w-]|[^\0-\\xa0])+", attributes = "\\[" + whitespace + "*(" + identifier + ")(?:" + whitespace + "*([*^$|!~]?=)" + whitespace + "*(?:'((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\"|(" + identifier + "))|)" + whitespace + "*\\]", pseudos = ":(" + identifier + ")(?:\\((" + "('((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\")|" + "((?:\\\\.|[^\\\\()[\\]]|" + attributes + ")*)|" + ".*" + ")\\)|)", rwhitespace = new RegExp(whitespace + "+", "g"), rtrim = new RegExp("^" + whitespace + "+|((?:^|[^\\\\])(?:\\\\.)*)" + whitespace + "+$", "g"), rcomma = new RegExp("^" + whitespace + "*," + whitespace + "*"), rcombinators = new RegExp("^" + whitespace + "*([>+~]|" + whitespace + ")" + whitespace + "*"), rattributeQuotes = new RegExp("=" + whitespace + "*([^\\]'\"]*?)" + whitespace + "*\\]", "g"), rpseudo = new RegExp(pseudos), ridentifier = new RegExp("^" + identifier + "$"), matchExpr = { "ID": new RegExp("^#(" + identifier + ")"), "CLASS": new RegExp("^\\.(" + identifier + ")"), "TAG": new RegExp("^(" + identifier + "|[*])"), "ATTR": new RegExp("^" + attributes), "PSEUDO": new RegExp("^" + pseudos), "CHILD": new RegExp("^:(only|first|last|nth|nth-last)-(child|of-type)(?:\\(" + whitespace + "*(even|odd|(([+-]|)(\\d*)n|)" + whitespace + "*(?:([+-]|)" + whitespace + "*(\\d+)|))" + whitespace + "*\\)|)", "i"), "bool": new RegExp("^(?:" + booleans + ")$", "i"), "needsContext": new RegExp("^" + whitespace + "*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\\(" + whitespace + "*((?:-\\d)?\\d*)" + whitespace + "*\\)|)(?=[^-]|$)", "i") }, rinputs = /^(?:input|select|textarea|button)$/i, rheader = /^h\d$/i, rnative = /^[^{]+\{\s*\[native \w/, rquickExpr = /^(?:#([\w-]+)|(\w+)|\.([\w-]+))$/, rsibling = /[+~]/, runescape = new RegExp("\\\\([\\da-f]{1,6}" + whitespace + "?|(" + whitespace + ")|.)", "ig"), funescape = function funescape(_, escaped, escapedWhitespace) { var high = "0x" + escaped - 0x10000; return high !== high || escapedWhitespace ? escaped : high < 0 ? String.fromCharCode(high + 0x10000) : String.fromCharCode(high >> 10 | 0xD800, high & 0x3FF | 0xDC00); }, rcssescape = /([\0-\x1f\x7f]|^-?\d)|^-$|[^\0-\x1f\x7f-\uFFFF\w-]/g, fcssescape = function fcssescape(ch, asCodePoint) {
                                    if (asCodePoint) {
                                        if (ch === "\0") { return "\uFFFD"; }
                                        return ch.slice(0, -1) + "\\" + ch.charCodeAt(ch.length - 1).toString(16) + " ";
                                    }
                                    return "\\" + ch;
                                }, unloadHandler = function unloadHandler() { setDocument(); }, disabledAncestor = addCombinator(function (elem) { return elem.disabled === true && ("form" in elem || "label" in elem); }, { dir: "parentNode", next: "legend" }); try { push.apply(arr = slice.call(preferredDoc.childNodes), preferredDoc.childNodes); arr[preferredDoc.childNodes.length].nodeType; } catch (e) {
                                    push = {
                                        apply: arr.length ? function (target, els) { push_native.apply(target, slice.call(els)); } : function (target, els) {
                                            var j = target.length, i = 0; while (target[j++] = els[i++]) { }
                                            target.length = j - 1;
                                        }
                                    };
                                }
                                function Sizzle(selector, context, results, seed) {
                                    var m, i, elem, nid, match, groups, newSelector, newContext = context && context.ownerDocument, nodeType = context ? context.nodeType : 9; results = results || []; if (typeof selector !== "string" || !selector || nodeType !== 1 && nodeType !== 9 && nodeType !== 11) { return results; }
                                    if (!seed) {
                                        if ((context ? context.ownerDocument || context : preferredDoc) !== document) { setDocument(context); }
                                        context = context || document; if (documentIsHTML) {
                                            if (nodeType !== 11 && (match = rquickExpr.exec(selector))) { if (m = match[1]) { if (nodeType === 9) { if (elem = context.getElementById(m)) { if (elem.id === m) { results.push(elem); return results; } } else { return results; } } else { if (newContext && (elem = newContext.getElementById(m)) && contains(context, elem) && elem.id === m) { results.push(elem); return results; } } } else if (match[2]) { push.apply(results, context.getElementsByTagName(selector)); return results; } else if ((m = match[3]) && support.getElementsByClassName && context.getElementsByClassName) { push.apply(results, context.getElementsByClassName(m)); return results; } }
                                            if (support.qsa && !compilerCache[selector + " "] && (!rbuggyQSA || !rbuggyQSA.test(selector))) {
                                                if (nodeType !== 1) { newContext = context; newSelector = selector; } else if (context.nodeName.toLowerCase() !== "object") {
                                                    if (nid = context.getAttribute("id")) { nid = nid.replace(rcssescape, fcssescape); } else { context.setAttribute("id", nid = expando); }
                                                    groups = tokenize(selector); i = groups.length; while (i--) { groups[i] = "#" + nid + " " + toSelector(groups[i]); }
                                                    newSelector = groups.join(","); newContext = rsibling.test(selector) && testContext(context.parentNode) || context;
                                                }
                                                if (newSelector) { try { push.apply(results, newContext.querySelectorAll(newSelector)); return results; } catch (qsaError) { } finally { if (nid === expando) { context.removeAttribute("id"); } } }
                                            }
                                        }
                                    }
                                    return select(selector.replace(rtrim, "$1"), context, results, seed);
                                }
                                function createCache() {
                                    var keys = []; function cache(key, value) {
                                        if (keys.push(key + " ") > Expr.cacheLength) { delete cache[keys.shift()]; }
                                        return cache[key + " "] = value;
                                    }
                                    return cache;
                                }
                                function markFunction(fn) { fn[expando] = true; return fn; }
                                function assert(fn) {
                                    var el = document.createElement("fieldset"); try { return !!fn(el); } catch (e) { return false; } finally {
                                        if (el.parentNode) { el.parentNode.removeChild(el); }
                                        el = null;
                                    }
                                }
                                function addHandle(attrs, handler) { var arr = attrs.split("|"), i = arr.length; while (i--) { Expr.attrHandle[arr[i]] = handler; } }
                                function siblingCheck(a, b) {
                                    var cur = b && a, diff = cur && a.nodeType === 1 && b.nodeType === 1 && a.sourceIndex - b.sourceIndex; if (diff) { return diff; }
                                    if (cur) { while (cur = cur.nextSibling) { if (cur === b) { return -1; } } }
                                    return a ? 1 : -1;
                                }
                                function createInputPseudo(type) { return function (elem) { var name = elem.nodeName.toLowerCase(); return name === "input" && elem.type === type; }; }
                                function createButtonPseudo(type) { return function (elem) { var name = elem.nodeName.toLowerCase(); return (name === "input" || name === "button") && elem.type === type; }; }
                                function createDisabledPseudo(disabled) {
                                    return function (elem) {
                                        if ("form" in elem) {
                                            if (elem.parentNode && elem.disabled === false) {
                                                if ("label" in elem) { if ("label" in elem.parentNode) { return elem.parentNode.disabled === disabled; } else { return elem.disabled === disabled; } }
                                                return elem.isDisabled === disabled || elem.isDisabled !== !disabled && disabledAncestor(elem) === disabled;
                                            }
                                            return elem.disabled === disabled;
                                        } else if ("label" in elem) { return elem.disabled === disabled; }
                                        return false;
                                    };
                                }
                                function createPositionalPseudo(fn) { return markFunction(function (argument) { argument = +argument; return markFunction(function (seed, matches) { var j, matchIndexes = fn([], seed.length, argument), i = matchIndexes.length; while (i--) { if (seed[j = matchIndexes[i]]) { seed[j] = !(matches[j] = seed[j]); } } }); }); }
                                function testContext(context) { return context && typeof context.getElementsByTagName !== "undefined" && context; }
                                support = Sizzle.support = {}; isXML = Sizzle.isXML = function (elem) { var documentElement = elem && (elem.ownerDocument || elem).documentElement; return documentElement ? documentElement.nodeName !== "HTML" : false; }; setDocument = Sizzle.setDocument = function (node) {
                                    var hasCompare, subWindow, doc = node ? node.ownerDocument || node : preferredDoc; if (doc === document || doc.nodeType !== 9 || !doc.documentElement) { return document; }
                                    document = doc; docElem = document.documentElement; documentIsHTML = !isXML(document); if (preferredDoc !== document && (subWindow = document.defaultView) && subWindow.top !== subWindow) { if (subWindow.addEventListener) { subWindow.addEventListener("unload", unloadHandler, false); } else if (subWindow.attachEvent) { subWindow.attachEvent("onunload", unloadHandler); } }
                                    support.attributes = assert(function (el) { el.className = "i"; return !el.getAttribute("className"); }); support.getElementsByTagName = assert(function (el) { el.appendChild(document.createComment("")); return !el.getElementsByTagName("*").length; }); support.getElementsByClassName = rnative.test(document.getElementsByClassName); support.getById = assert(function (el) { docElem.appendChild(el).id = expando; return !document.getElementsByName || !document.getElementsByName(expando).length; }); if (support.getById) { Expr.filter["ID"] = function (id) { var attrId = id.replace(runescape, funescape); return function (elem) { return elem.getAttribute("id") === attrId; }; }; Expr.find["ID"] = function (id, context) { if (typeof context.getElementById !== "undefined" && documentIsHTML) { var elem = context.getElementById(id); return elem ? [elem] : []; } }; } else {
                                        Expr.filter["ID"] = function (id) { var attrId = id.replace(runescape, funescape); return function (elem) { var node = typeof elem.getAttributeNode !== "undefined" && elem.getAttributeNode("id"); return node && node.value === attrId; }; }; Expr.find["ID"] = function (id, context) {
                                            if (typeof context.getElementById !== "undefined" && documentIsHTML) {
                                                var node, i, elems, elem = context.getElementById(id); if (elem) {
                                                    node = elem.getAttributeNode("id"); if (node && node.value === id) { return [elem]; }
                                                    elems = context.getElementsByName(id); i = 0; while (elem = elems[i++]) { node = elem.getAttributeNode("id"); if (node && node.value === id) { return [elem]; } }
                                                }
                                                return [];
                                            }
                                        };
                                    }
                                    Expr.find["TAG"] = support.getElementsByTagName ? function (tag, context) { if (typeof context.getElementsByTagName !== "undefined") { return context.getElementsByTagName(tag); } else if (support.qsa) { return context.querySelectorAll(tag); } } : function (tag, context) {
                                        var elem, tmp = [], i = 0, results = context.getElementsByTagName(tag); if (tag === "*") {
                                            while (elem = results[i++]) { if (elem.nodeType === 1) { tmp.push(elem); } }
                                            return tmp;
                                        }
                                        return results;
                                    }; Expr.find["CLASS"] = support.getElementsByClassName && function (className, context) { if (typeof context.getElementsByClassName !== "undefined" && documentIsHTML) { return context.getElementsByClassName(className); } }; rbuggyMatches = []; rbuggyQSA = []; if (support.qsa = rnative.test(document.querySelectorAll)) {
                                        assert(function (el) {
                                            docElem.appendChild(el).innerHTML = "<a id='" + expando + "'></a>" + "<select id='" + expando + "-\r\\' msallowcapture=''>" + "<option selected=''></option></select>"; if (el.querySelectorAll("[msallowcapture^='']").length) { rbuggyQSA.push("[*^$]=" + whitespace + "*(?:''|\"\")"); }
                                            if (!el.querySelectorAll("[selected]").length) { rbuggyQSA.push("\\[" + whitespace + "*(?:value|" + booleans + ")"); }
                                            if (!el.querySelectorAll("[id~=" + expando + "-]").length) { rbuggyQSA.push("~="); }
                                            if (!el.querySelectorAll(":checked").length) { rbuggyQSA.push(":checked"); }
                                            if (!el.querySelectorAll("a#" + expando + "+*").length) { rbuggyQSA.push(".#.+[+~]"); }
                                        }); assert(function (el) {
                                            el.innerHTML = "<a href='' disabled='disabled'></a>" + "<select disabled='disabled'><option/></select>"; var input = document.createElement("input"); input.setAttribute("type", "hidden"); el.appendChild(input).setAttribute("name", "D"); if (el.querySelectorAll("[name=d]").length) { rbuggyQSA.push("name" + whitespace + "*[*^$|!~]?="); }
                                            if (el.querySelectorAll(":enabled").length !== 2) { rbuggyQSA.push(":enabled", ":disabled"); }
                                            docElem.appendChild(el).disabled = true; if (el.querySelectorAll(":disabled").length !== 2) { rbuggyQSA.push(":enabled", ":disabled"); }
                                            el.querySelectorAll("*,:x"); rbuggyQSA.push(",.*:");
                                        });
                                    }
                                    if (support.matchesSelector = rnative.test(matches = docElem.matches || docElem.webkitMatchesSelector || docElem.mozMatchesSelector || docElem.oMatchesSelector || docElem.msMatchesSelector)) { assert(function (el) { support.disconnectedMatch = matches.call(el, "*"); matches.call(el, "[s!='']:x"); rbuggyMatches.push("!=", pseudos); }); }
                                    rbuggyQSA = rbuggyQSA.length && new RegExp(rbuggyQSA.join("|")); rbuggyMatches = rbuggyMatches.length && new RegExp(rbuggyMatches.join("|")); hasCompare = rnative.test(docElem.compareDocumentPosition); contains = hasCompare || rnative.test(docElem.contains) ? function (a, b) { var adown = a.nodeType === 9 ? a.documentElement : a, bup = b && b.parentNode; return a === bup || !!(bup && bup.nodeType === 1 && (adown.contains ? adown.contains(bup) : a.compareDocumentPosition && a.compareDocumentPosition(bup) & 16)); } : function (a, b) {
                                        if (b) { while (b = b.parentNode) { if (b === a) { return true; } } }
                                        return false;
                                    }; sortOrder = hasCompare ? function (a, b) {
                                        if (a === b) { hasDuplicate = true; return 0; }
                                        var compare = !a.compareDocumentPosition - !b.compareDocumentPosition; if (compare) { return compare; }
                                        compare = (a.ownerDocument || a) === (b.ownerDocument || b) ? a.compareDocumentPosition(b) : 1; if (compare & 1 || !support.sortDetached && b.compareDocumentPosition(a) === compare) {
                                            if (a === document || a.ownerDocument === preferredDoc && contains(preferredDoc, a)) { return -1; }
                                            if (b === document || b.ownerDocument === preferredDoc && contains(preferredDoc, b)) { return 1; }
                                            return sortInput ? indexOf(sortInput, a) - indexOf(sortInput, b) : 0;
                                        }
                                        return compare & 4 ? -1 : 1;
                                    } : function (a, b) {
                                        if (a === b) { hasDuplicate = true; return 0; }
                                        var cur, i = 0, aup = a.parentNode, bup = b.parentNode, ap = [a], bp = [b]; if (!aup || !bup) { return a === document ? -1 : b === document ? 1 : aup ? -1 : bup ? 1 : sortInput ? indexOf(sortInput, a) - indexOf(sortInput, b) : 0; } else if (aup === bup) { return siblingCheck(a, b); }
                                        cur = a; while (cur = cur.parentNode) { ap.unshift(cur); }
                                        cur = b; while (cur = cur.parentNode) { bp.unshift(cur); }
                                        while (ap[i] === bp[i]) { i++; }
                                        return i ? siblingCheck(ap[i], bp[i]) : ap[i] === preferredDoc ? -1 : bp[i] === preferredDoc ? 1 : 0;
                                    }; return document;
                                }; Sizzle.matches = function (expr, elements) { return Sizzle(expr, null, null, elements); }; Sizzle.matchesSelector = function (elem, expr) {
                                    if ((elem.ownerDocument || elem) !== document) { setDocument(elem); }
                                    expr = expr.replace(rattributeQuotes, "='$1']"); if (support.matchesSelector && documentIsHTML && !compilerCache[expr + " "] && (!rbuggyMatches || !rbuggyMatches.test(expr)) && (!rbuggyQSA || !rbuggyQSA.test(expr))) { try { var ret = matches.call(elem, expr); if (ret || support.disconnectedMatch || elem.document && elem.document.nodeType !== 11) { return ret; } } catch (e) { } }
                                    return Sizzle(expr, document, null, [elem]).length > 0;
                                }; Sizzle.contains = function (context, elem) {
                                    if ((context.ownerDocument || context) !== document) { setDocument(context); }
                                    return contains(context, elem);
                                }; Sizzle.attr = function (elem, name) {
                                    if ((elem.ownerDocument || elem) !== document) { setDocument(elem); }
                                    var fn = Expr.attrHandle[name.toLowerCase()], val = fn && hasOwn.call(Expr.attrHandle, name.toLowerCase()) ? fn(elem, name, !documentIsHTML) : undefined; return val !== undefined ? val : support.attributes || !documentIsHTML ? elem.getAttribute(name) : (val = elem.getAttributeNode(name)) && val.specified ? val.value : null;
                                }; Sizzle.escape = function (sel) { return (sel + "").replace(rcssescape, fcssescape); }; Sizzle.error = function (msg) { throw new Error("Syntax error, unrecognized expression: " + msg); }; Sizzle.uniqueSort = function (results) {
                                    var elem, duplicates = [], j = 0, i = 0; hasDuplicate = !support.detectDuplicates; sortInput = !support.sortStable && results.slice(0); results.sort(sortOrder); if (hasDuplicate) {
                                        while (elem = results[i++]) { if (elem === results[i]) { j = duplicates.push(i); } }
                                        while (j--) { results.splice(duplicates[j], 1); }
                                    }
                                    sortInput = null; return results;
                                }; getText = Sizzle.getText = function (elem) {
                                    var node, ret = "", i = 0, nodeType = elem.nodeType; if (!nodeType) { while (node = elem[i++]) { ret += getText(node); } } else if (nodeType === 1 || nodeType === 9 || nodeType === 11) { if (typeof elem.textContent === "string") { return elem.textContent; } else { for (elem = elem.firstChild; elem; elem = elem.nextSibling) { ret += getText(elem); } } } else if (nodeType === 3 || nodeType === 4) { return elem.nodeValue; }
                                    return ret;
                                }; Expr = Sizzle.selectors = {
                                    cacheLength: 50, createPseudo: markFunction, match: matchExpr, attrHandle: {}, find: {}, relative: { ">": { dir: "parentNode", first: true }, " ": { dir: "parentNode" }, "+": { dir: "previousSibling", first: true }, "~": { dir: "previousSibling" } }, preFilter: {
                                        "ATTR": function ATTR(match) {
                                            match[1] = match[1].replace(runescape, funescape); match[3] = (match[3] || match[4] || match[5] || "").replace(runescape, funescape); if (match[2] === "~=") { match[3] = " " + match[3] + " "; }
                                            return match.slice(0, 4);
                                        }, "CHILD": function CHILD(match) {
                                            match[1] = match[1].toLowerCase(); if (match[1].slice(0, 3) === "nth") {
                                                if (!match[3]) { Sizzle.error(match[0]); }
                                                match[4] = +(match[4] ? match[5] + (match[6] || 1) : 2 * (match[3] === "even" || match[3] === "odd")); match[5] = +(match[7] + match[8] || match[3] === "odd");
                                            } else if (match[3]) { Sizzle.error(match[0]); }
                                            return match;
                                        }, "PSEUDO": function PSEUDO(match) {
                                            var excess, unquoted = !match[6] && match[2]; if (matchExpr["CHILD"].test(match[0])) { return null; }
                                            if (match[3]) { match[2] = match[4] || match[5] || ""; } else if (unquoted && rpseudo.test(unquoted) && (excess = tokenize(unquoted, true)) && (excess = unquoted.indexOf(")", unquoted.length - excess) - unquoted.length)) { match[0] = match[0].slice(0, excess); match[2] = unquoted.slice(0, excess); }
                                            return match.slice(0, 3);
                                        }
                                    }, filter: {
                                        "TAG": function TAG(nodeNameSelector) { var nodeName = nodeNameSelector.replace(runescape, funescape).toLowerCase(); return nodeNameSelector === "*" ? function () { return true; } : function (elem) { return elem.nodeName && elem.nodeName.toLowerCase() === nodeName; }; }, "CLASS": function CLASS(className) { var pattern = classCache[className + " "]; return pattern || (pattern = new RegExp("(^|" + whitespace + ")" + className + "(" + whitespace + "|$)")) && classCache(className, function (elem) { return pattern.test(typeof elem.className === "string" && elem.className || typeof elem.getAttribute !== "undefined" && elem.getAttribute("class") || ""); }); }, "ATTR": function ATTR(name, operator, check) {
                                            return function (elem) {
                                                var result = Sizzle.attr(elem, name); if (result == null) { return operator === "!="; }
                                                if (!operator) { return true; }
                                                result += ""; return operator === "=" ? result === check : operator === "!=" ? result !== check : operator === "^=" ? check && result.indexOf(check) === 0 : operator === "*=" ? check && result.indexOf(check) > -1 : operator === "$=" ? check && result.slice(-check.length) === check : operator === "~=" ? (" " + result.replace(rwhitespace, " ") + " ").indexOf(check) > -1 : operator === "|=" ? result === check || result.slice(0, check.length + 1) === check + "-" : false;
                                            };
                                        }, "CHILD": function CHILD(type, what, argument, first, last) {
                                            var simple = type.slice(0, 3) !== "nth", forward = type.slice(-4) !== "last", ofType = what === "of-type"; return first === 1 && last === 0 ? function (elem) { return !!elem.parentNode; } : function (elem, context, xml) {
                                                var cache, uniqueCache, outerCache, node, nodeIndex, start, dir = simple !== forward ? "nextSibling" : "previousSibling", parent = elem.parentNode, name = ofType && elem.nodeName.toLowerCase(), useCache = !xml && !ofType, diff = false; if (parent) {
                                                    if (simple) {
                                                        while (dir) {
                                                            node = elem; while (node = node[dir]) { if (ofType ? node.nodeName.toLowerCase() === name : node.nodeType === 1) { return false; } }
                                                            start = dir = type === "only" && !start && "nextSibling";
                                                        }
                                                        return true;
                                                    }
                                                    start = [forward ? parent.firstChild : parent.lastChild]; if (forward && useCache) { node = parent; outerCache = node[expando] || (node[expando] = {}); uniqueCache = outerCache[node.uniqueID] || (outerCache[node.uniqueID] = {}); cache = uniqueCache[type] || []; nodeIndex = cache[0] === dirruns && cache[1]; diff = nodeIndex && cache[2]; node = nodeIndex && parent.childNodes[nodeIndex]; while (node = ++nodeIndex && node && node[dir] || (diff = nodeIndex = 0) || start.pop()) { if (node.nodeType === 1 && ++diff && node === elem) { uniqueCache[type] = [dirruns, nodeIndex, diff]; break; } } } else {
                                                        if (useCache) { node = elem; outerCache = node[expando] || (node[expando] = {}); uniqueCache = outerCache[node.uniqueID] || (outerCache[node.uniqueID] = {}); cache = uniqueCache[type] || []; nodeIndex = cache[0] === dirruns && cache[1]; diff = nodeIndex; }
                                                        if (diff === false) {
                                                            while (node = ++nodeIndex && node && node[dir] || (diff = nodeIndex = 0) || start.pop()) {
                                                                if ((ofType ? node.nodeName.toLowerCase() === name : node.nodeType === 1) && ++diff) {
                                                                    if (useCache) { outerCache = node[expando] || (node[expando] = {}); uniqueCache = outerCache[node.uniqueID] || (outerCache[node.uniqueID] = {}); uniqueCache[type] = [dirruns, diff]; }
                                                                    if (node === elem) { break; }
                                                                }
                                                            }
                                                        }
                                                    }
                                                    diff -= last; return diff === first || diff % first === 0 && diff / first >= 0;
                                                }
                                            };
                                        }, "PSEUDO": function PSEUDO(pseudo, argument) {
                                            var args, fn = Expr.pseudos[pseudo] || Expr.setFilters[pseudo.toLowerCase()] || Sizzle.error("unsupported pseudo: " + pseudo); if (fn[expando]) { return fn(argument); }
                                            if (fn.length > 1) { args = [pseudo, pseudo, "", argument]; return Expr.setFilters.hasOwnProperty(pseudo.toLowerCase()) ? markFunction(function (seed, matches) { var idx, matched = fn(seed, argument), i = matched.length; while (i--) { idx = indexOf(seed, matched[i]); seed[idx] = !(matches[idx] = matched[i]); } }) : function (elem) { return fn(elem, 0, args); }; }
                                            return fn;
                                        }
                                    }, pseudos: {
                                        "not": markFunction(function (selector) { var input = [], results = [], matcher = compile(selector.replace(rtrim, "$1")); return matcher[expando] ? markFunction(function (seed, matches, context, xml) { var elem, unmatched = matcher(seed, null, xml, []), i = seed.length; while (i--) { if (elem = unmatched[i]) { seed[i] = !(matches[i] = elem); } } }) : function (elem, context, xml) { input[0] = elem; matcher(input, null, xml, results); input[0] = null; return !results.pop(); }; }), "has": markFunction(function (selector) { return function (elem) { return Sizzle(selector, elem).length > 0; }; }), "contains": markFunction(function (text) { text = text.replace(runescape, funescape); return function (elem) { return (elem.textContent || elem.innerText || getText(elem)).indexOf(text) > -1; }; }), "lang": markFunction(function (lang) {
                                            if (!ridentifier.test(lang || "")) { Sizzle.error("unsupported lang: " + lang); }
                                            lang = lang.replace(runescape, funescape).toLowerCase(); return function (elem) { var elemLang; do { if (elemLang = documentIsHTML ? elem.lang : elem.getAttribute("xml:lang") || elem.getAttribute("lang")) { elemLang = elemLang.toLowerCase(); return elemLang === lang || elemLang.indexOf(lang + "-") === 0; } } while ((elem = elem.parentNode) && elem.nodeType === 1); return false; };
                                        }), "target": function target(elem) { var hash = window.location && window.location.hash; return hash && hash.slice(1) === elem.id; }, "root": function root(elem) { return elem === docElem; }, "focus": function focus(elem) { return elem === document.activeElement && (!document.hasFocus || document.hasFocus()) && !!(elem.type || elem.href || ~elem.tabIndex); }, "enabled": createDisabledPseudo(false), "disabled": createDisabledPseudo(true), "checked": function checked(elem) { var nodeName = elem.nodeName.toLowerCase(); return nodeName === "input" && !!elem.checked || nodeName === "option" && !!elem.selected; }, "selected": function selected(elem) {
                                            if (elem.parentNode) { elem.parentNode.selectedIndex; }
                                            return elem.selected === true;
                                        }, "empty": function empty(elem) {
                                            for (elem = elem.firstChild; elem; elem = elem.nextSibling) { if (elem.nodeType < 6) { return false; } }
                                            return true;
                                        }, "parent": function parent(elem) { return !Expr.pseudos["empty"](elem); }, "header": function header(elem) { return rheader.test(elem.nodeName); }, "input": function input(elem) { return rinputs.test(elem.nodeName); }, "button": function button(elem) { var name = elem.nodeName.toLowerCase(); return name === "input" && elem.type === "button" || name === "button"; }, "text": function text(elem) { var attr; return elem.nodeName.toLowerCase() === "input" && elem.type === "text" && ((attr = elem.getAttribute("type")) == null || attr.toLowerCase() === "text"); }, "first": createPositionalPseudo(function () { return [0]; }), "last": createPositionalPseudo(function (matchIndexes, length) { return [length - 1]; }), "eq": createPositionalPseudo(function (matchIndexes, length, argument) { return [argument < 0 ? argument + length : argument]; }), "even": createPositionalPseudo(function (matchIndexes, length) {
                                            var i = 0; for (; i < length; i += 2) { matchIndexes.push(i); }
                                            return matchIndexes;
                                        }), "odd": createPositionalPseudo(function (matchIndexes, length) {
                                            var i = 1; for (; i < length; i += 2) { matchIndexes.push(i); }
                                            return matchIndexes;
                                        }), "lt": createPositionalPseudo(function (matchIndexes, length, argument) {
                                            var i = argument < 0 ? argument + length : argument; for (; --i >= 0;) { matchIndexes.push(i); }
                                            return matchIndexes;
                                        }), "gt": createPositionalPseudo(function (matchIndexes, length, argument) {
                                            var i = argument < 0 ? argument + length : argument; for (; ++i < length;) { matchIndexes.push(i); }
                                            return matchIndexes;
                                        })
                                    }
                                }; Expr.pseudos["nth"] = Expr.pseudos["eq"]; for (i in { radio: true, checkbox: true, file: true, password: true, image: true }) { Expr.pseudos[i] = createInputPseudo(i); }
                                for (i in { submit: true, reset: true }) { Expr.pseudos[i] = createButtonPseudo(i); }
                                function setFilters() { }
                                setFilters.prototype = Expr.filters = Expr.pseudos; Expr.setFilters = new setFilters(); tokenize = Sizzle.tokenize = function (selector, parseOnly) {
                                    var matched, match, tokens, type, soFar, groups, preFilters, cached = tokenCache[selector + " "]; if (cached) { return parseOnly ? 0 : cached.slice(0); }
                                    soFar = selector; groups = []; preFilters = Expr.preFilter; while (soFar) {
                                        if (!matched || (match = rcomma.exec(soFar))) {
                                            if (match) { soFar = soFar.slice(match[0].length) || soFar; }
                                            groups.push(tokens = []);
                                        }
                                        matched = false; if (match = rcombinators.exec(soFar)) { matched = match.shift(); tokens.push({ value: matched, type: match[0].replace(rtrim, " ") }); soFar = soFar.slice(matched.length); }
                                        for (type in Expr.filter) { if ((match = matchExpr[type].exec(soFar)) && (!preFilters[type] || (match = preFilters[type](match)))) { matched = match.shift(); tokens.push({ value: matched, type: type, matches: match }); soFar = soFar.slice(matched.length); } }
                                        if (!matched) { break; }
                                    }
                                    return parseOnly ? soFar.length : soFar ? Sizzle.error(selector) : tokenCache(selector, groups).slice(0);
                                }; function toSelector(tokens) {
                                    var i = 0, len = tokens.length, selector = ""; for (; i < len; i++) { selector += tokens[i].value; }
                                    return selector;
                                }
                                function addCombinator(matcher, combinator, base) {
                                    var dir = combinator.dir, skip = combinator.next, key = skip || dir, checkNonElements = base && key === "parentNode", doneName = done++; return combinator.first ? function (elem, context, xml) {
                                        while (elem = elem[dir]) { if (elem.nodeType === 1 || checkNonElements) { return matcher(elem, context, xml); } }
                                        return false;
                                    } : function (elem, context, xml) {
                                        var oldCache, uniqueCache, outerCache, newCache = [dirruns, doneName]; if (xml) { while (elem = elem[dir]) { if (elem.nodeType === 1 || checkNonElements) { if (matcher(elem, context, xml)) { return true; } } } } else { while (elem = elem[dir]) { if (elem.nodeType === 1 || checkNonElements) { outerCache = elem[expando] || (elem[expando] = {}); uniqueCache = outerCache[elem.uniqueID] || (outerCache[elem.uniqueID] = {}); if (skip && skip === elem.nodeName.toLowerCase()) { elem = elem[dir] || elem; } else if ((oldCache = uniqueCache[key]) && oldCache[0] === dirruns && oldCache[1] === doneName) { return newCache[2] = oldCache[2]; } else { uniqueCache[key] = newCache; if (newCache[2] = matcher(elem, context, xml)) { return true; } } } } }
                                        return false;
                                    };
                                }
                                function elementMatcher(matchers) {
                                    return matchers.length > 1 ? function (elem, context, xml) {
                                        var i = matchers.length; while (i--) { if (!matchers[i](elem, context, xml)) { return false; } }
                                        return true;
                                    } : matchers[0];
                                }
                                function multipleContexts(selector, contexts, results) {
                                    var i = 0, len = contexts.length; for (; i < len; i++) { Sizzle(selector, contexts[i], results); }
                                    return results;
                                }
                                function condense(unmatched, map, filter, context, xml) {
                                    var elem, newUnmatched = [], i = 0, len = unmatched.length, mapped = map != null; for (; i < len; i++) { if (elem = unmatched[i]) { if (!filter || filter(elem, context, xml)) { newUnmatched.push(elem); if (mapped) { map.push(i); } } } }
                                    return newUnmatched;
                                }
                                function setMatcher(preFilter, selector, matcher, postFilter, postFinder, postSelector) {
                                    if (postFilter && !postFilter[expando]) { postFilter = setMatcher(postFilter); }
                                    if (postFinder && !postFinder[expando]) { postFinder = setMatcher(postFinder, postSelector); }
                                    return markFunction(function (seed, results, context, xml) {
                                        var temp, i, elem, preMap = [], postMap = [], preexisting = results.length, elems = seed || multipleContexts(selector || "*", context.nodeType ? [context] : context, []), matcherIn = preFilter && (seed || !selector) ? condense(elems, preMap, preFilter, context, xml) : elems, matcherOut = matcher ? postFinder || (seed ? preFilter : preexisting || postFilter) ? [] : results : matcherIn; if (matcher) { matcher(matcherIn, matcherOut, context, xml); }
                                        if (postFilter) { temp = condense(matcherOut, postMap); postFilter(temp, [], context, xml); i = temp.length; while (i--) { if (elem = temp[i]) { matcherOut[postMap[i]] = !(matcherIn[postMap[i]] = elem); } } }
                                        if (seed) {
                                            if (postFinder || preFilter) {
                                                if (postFinder) {
                                                    temp = []; i = matcherOut.length; while (i--) { if (elem = matcherOut[i]) { temp.push(matcherIn[i] = elem); } }
                                                    postFinder(null, matcherOut = [], temp, xml);
                                                }
                                                i = matcherOut.length; while (i--) { if ((elem = matcherOut[i]) && (temp = postFinder ? indexOf(seed, elem) : preMap[i]) > -1) { seed[temp] = !(results[temp] = elem); } }
                                            }
                                        } else { matcherOut = condense(matcherOut === results ? matcherOut.splice(preexisting, matcherOut.length) : matcherOut); if (postFinder) { postFinder(null, results, matcherOut, xml); } else { push.apply(results, matcherOut); } }
                                    });
                                }
                                function matcherFromTokens(tokens) {
                                    var checkContext, matcher, j, len = tokens.length, leadingRelative = Expr.relative[tokens[0].type], implicitRelative = leadingRelative || Expr.relative[" "], i = leadingRelative ? 1 : 0, matchContext = addCombinator(function (elem) { return elem === checkContext; }, implicitRelative, true), matchAnyContext = addCombinator(function (elem) { return indexOf(checkContext, elem) > -1; }, implicitRelative, true), matchers = [function (elem, context, xml) { var ret = !leadingRelative && (xml || context !== outermostContext) || ((checkContext = context).nodeType ? matchContext(elem, context, xml) : matchAnyContext(elem, context, xml)); checkContext = null; return ret; }]; for (; i < len; i++) {
                                        if (matcher = Expr.relative[tokens[i].type]) { matchers = [addCombinator(elementMatcher(matchers), matcher)]; } else {
                                            matcher = Expr.filter[tokens[i].type].apply(null, tokens[i].matches); if (matcher[expando]) {
                                                j = ++i; for (; j < len; j++) { if (Expr.relative[tokens[j].type]) { break; } }
                                                return setMatcher(i > 1 && elementMatcher(matchers), i > 1 && toSelector(tokens.slice(0, i - 1).concat({ value: tokens[i - 2].type === " " ? "*" : "" })).replace(rtrim, "$1"), matcher, i < j && matcherFromTokens(tokens.slice(i, j)), j < len && matcherFromTokens(tokens = tokens.slice(j)), j < len && toSelector(tokens));
                                            }
                                            matchers.push(matcher);
                                        }
                                    }
                                    return elementMatcher(matchers);
                                }
                                function matcherFromGroupMatchers(elementMatchers, setMatchers) {
                                    var bySet = setMatchers.length > 0, byElement = elementMatchers.length > 0, superMatcher = function superMatcher(seed, context, xml, results, outermost) {
                                        var elem, j, matcher, matchedCount = 0, i = "0", unmatched = seed && [], setMatched = [], contextBackup = outermostContext, elems = seed || byElement && Expr.find["TAG"]("*", outermost), dirrunsUnique = dirruns += contextBackup == null ? 1 : Math.random() || 0.1, len = elems.length; if (outermost) { outermostContext = context === document || context || outermost; }
                                        for (; i !== len && (elem = elems[i]) != null; i++) {
                                            if (byElement && elem) {
                                                j = 0; if (!context && elem.ownerDocument !== document) { setDocument(elem); xml = !documentIsHTML; }
                                                while (matcher = elementMatchers[j++]) { if (matcher(elem, context || document, xml)) { results.push(elem); break; } }
                                                if (outermost) { dirruns = dirrunsUnique; }
                                            }
                                            if (bySet) {
                                                if (elem = !matcher && elem) { matchedCount--; }
                                                if (seed) { unmatched.push(elem); }
                                            }
                                        }
                                        matchedCount += i; if (bySet && i !== matchedCount) {
                                            j = 0; while (matcher = setMatchers[j++]) { matcher(unmatched, setMatched, context, xml); }
                                            if (seed) {
                                                if (matchedCount > 0) { while (i--) { if (!(unmatched[i] || setMatched[i])) { setMatched[i] = pop.call(results); } } }
                                                setMatched = condense(setMatched);
                                            }
                                            push.apply(results, setMatched); if (outermost && !seed && setMatched.length > 0 && matchedCount + setMatchers.length > 1) { Sizzle.uniqueSort(results); }
                                        }
                                        if (outermost) { dirruns = dirrunsUnique; outermostContext = contextBackup; }
                                        return unmatched;
                                    }; return bySet ? markFunction(superMatcher) : superMatcher;
                                }
                                compile = Sizzle.compile = function (selector, match) {
                                    var i, setMatchers = [], elementMatchers = [], cached = compilerCache[selector + " "]; if (!cached) {
                                        if (!match) { match = tokenize(selector); }
                                        i = match.length; while (i--) { cached = matcherFromTokens(match[i]); if (cached[expando]) { setMatchers.push(cached); } else { elementMatchers.push(cached); } }
                                        cached = compilerCache(selector, matcherFromGroupMatchers(elementMatchers, setMatchers)); cached.selector = selector;
                                    }
                                    return cached;
                                }; select = Sizzle.select = function (selector, context, results, seed) {
                                    var i, tokens, token, type, find, compiled = typeof selector === "function" && selector, match = !seed && tokenize(selector = compiled.selector || selector); results = results || []; if (match.length === 1) {
                                        tokens = match[0] = match[0].slice(0); if (tokens.length > 2 && (token = tokens[0]).type === "ID" && context.nodeType === 9 && documentIsHTML && Expr.relative[tokens[1].type]) {
                                            context = (Expr.find["ID"](token.matches[0].replace(runescape, funescape), context) || [])[0]; if (!context) { return results; } else if (compiled) { context = context.parentNode; }
                                            selector = selector.slice(tokens.shift().value.length);
                                        }
                                        i = matchExpr["needsContext"].test(selector) ? 0 : tokens.length; while (i--) {
                                            token = tokens[i]; if (Expr.relative[type = token.type]) { break; }
                                            if (find = Expr.find[type]) {
                                                if (seed = find(token.matches[0].replace(runescape, funescape), rsibling.test(tokens[0].type) && testContext(context.parentNode) || context)) {
                                                    tokens.splice(i, 1); selector = seed.length && toSelector(tokens); if (!selector) { push.apply(results, seed); return results; }
                                                    break;
                                                }
                                            }
                                        }
                                    }
                                    (compiled || compile(selector, match))(seed, context, !documentIsHTML, results, !context || rsibling.test(selector) && testContext(context.parentNode) || context); return results;
                                }; support.sortStable = expando.split("").sort(sortOrder).join("") === expando; support.detectDuplicates = !!hasDuplicate; setDocument(); support.sortDetached = assert(function (el) { return el.compareDocumentPosition(document.createElement("fieldset")) & 1; }); if (!assert(function (el) { el.innerHTML = "<a href='#'></a>"; return el.firstChild.getAttribute("href") === "#"; })) { addHandle("type|href|height|width", function (elem, name, isXML) { if (!isXML) { return elem.getAttribute(name, name.toLowerCase() === "type" ? 1 : 2); } }); }
                                if (!support.attributes || !assert(function (el) { el.innerHTML = "<input/>"; el.firstChild.setAttribute("value", ""); return el.firstChild.getAttribute("value") === ""; })) { addHandle("value", function (elem, name, isXML) { if (!isXML && elem.nodeName.toLowerCase() === "input") { return elem.defaultValue; } }); }
                                if (!assert(function (el) { return el.getAttribute("disabled") == null; })) { addHandle(booleans, function (elem, name, isXML) { var val; if (!isXML) { return elem[name] === true ? name.toLowerCase() : (val = elem.getAttributeNode(name)) && val.specified ? val.value : null; } }); }
                                return Sizzle;
                            }(window); jQuery.find = Sizzle; jQuery.expr = Sizzle.selectors; jQuery.expr[":"] = jQuery.expr.pseudos; jQuery.uniqueSort = jQuery.unique = Sizzle.uniqueSort; jQuery.text = Sizzle.getText; jQuery.isXMLDoc = Sizzle.isXML; jQuery.contains = Sizzle.contains; jQuery.escapeSelector = Sizzle.escape; var dir = function dir(elem, _dir, until) {
                                var matched = [], truncate = until !== undefined; while ((elem = elem[_dir]) && elem.nodeType !== 9) {
                                    if (elem.nodeType === 1) {
                                        if (truncate && jQuery(elem).is(until)) { break; }
                                        matched.push(elem);
                                    }
                                }
                                return matched;
                            }; var _siblings = function siblings(n, elem) {
                                var matched = []; for (; n; n = n.nextSibling) { if (n.nodeType === 1 && n !== elem) { matched.push(n); } }
                                return matched;
                            }; var rneedsContext = jQuery.expr.match.needsContext; function nodeName(elem, name) { return elem.nodeName && elem.nodeName.toLowerCase() === name.toLowerCase(); }; var rsingleTag = /^<([a-z][^\/\0>:\x20\t\r\n\f]*)[\x20\t\r\n\f]*\/?>(?:<\/\1>|)$/i; function winnow(elements, qualifier, not) {
                                if (isFunction(qualifier)) { return jQuery.grep(elements, function (elem, i) { return !!qualifier.call(elem, i, elem) !== not; }); }
                                if (qualifier.nodeType) { return jQuery.grep(elements, function (elem) { return elem === qualifier !== not; }); }
                                if (typeof qualifier !== "string") { return jQuery.grep(elements, function (elem) { return indexOf.call(qualifier, elem) > -1 !== not; }); }
                                return jQuery.filter(qualifier, elements, not);
                            }
                        jQuery.filter = function (expr, elems, not) {
                            var elem = elems[0]; if (not) { expr = ":not(" + expr + ")"; }
                            if (elems.length === 1 && elem.nodeType === 1) { return jQuery.find.matchesSelector(elem, expr) ? [elem] : []; }
                            return jQuery.find.matches(expr, jQuery.grep(elems, function (elem) { return elem.nodeType === 1; }));
                        }; jQuery.fn.extend({
                            find: function find(selector) {
                                var i, ret, len = this.length, self = this; if (typeof selector !== "string") { return this.pushStack(jQuery(selector).filter(function () { for (i = 0; i < len; i++) { if (jQuery.contains(self[i], this)) { return true; } } })); }
                                ret = this.pushStack([]); for (i = 0; i < len; i++) { jQuery.find(selector, self[i], ret); }
                                return len > 1 ? jQuery.uniqueSort(ret) : ret;
                            }, filter: function filter(selector) { return this.pushStack(winnow(this, selector || [], false)); }, not: function not(selector) { return this.pushStack(winnow(this, selector || [], true)); }, is: function is(selector) { return !!winnow(this, typeof selector === "string" && rneedsContext.test(selector) ? jQuery(selector) : selector || [], false).length; }
                        }); var rootjQuery, rquickExpr = /^(?:\s*(<[\w\W]+>)[^>]*|#([\w-]+))$/, init = jQuery.fn.init = function (selector, context, root) {
                            var match, elem; if (!selector) { return this; }
                            root = root || rootjQuery; if (typeof selector === "string") {
                                if (selector[0] === "<" && selector[selector.length - 1] === ">" && selector.length >= 3) { match = [null, selector, null]; } else { match = rquickExpr.exec(selector); }
                                if (match && (match[1] || !context)) {
                                    if (match[1]) {
                                        context = context instanceof jQuery ? context[0] : context; jQuery.merge(this, jQuery.parseHTML(match[1], context && context.nodeType ? context.ownerDocument || context : document, true)); if (rsingleTag.test(match[1]) && jQuery.isPlainObject(context)) { for (match in context) { if (isFunction(this[match])) { this[match](context[match]); } else { this.attr(match, context[match]); } } }
                                        return this;
                                    } else {
                                        elem = document.getElementById(match[2]); if (elem) { this[0] = elem; this.length = 1; }
                                        return this;
                                    }
                                } else if (!context || context.jquery) { return (context || root).find(selector); } else { return this.constructor(context).find(selector); }
                            } else if (selector.nodeType) { this[0] = selector; this.length = 1; return this; } else if (isFunction(selector)) { return root.ready !== undefined ? root.ready(selector) : selector(jQuery); }
                            return jQuery.makeArray(selector, this);
                        }; init.prototype = jQuery.fn; rootjQuery = jQuery(document); var rparentsprev = /^(?:parents|prev(?:Until|All))/, guaranteedUnique = { children: true, contents: true, next: true, prev: true }; jQuery.fn.extend({
                            has: function has(target) { var targets = jQuery(target, this), l = targets.length; return this.filter(function () { var i = 0; for (; i < l; i++) { if (jQuery.contains(this, targets[i])) { return true; } } }); }, closest: function closest(selectors, context) {
                                var cur, i = 0, l = this.length, matched = [], targets = typeof selectors !== "string" && jQuery(selectors); if (!rneedsContext.test(selectors)) { for (; i < l; i++) { for (cur = this[i]; cur && cur !== context; cur = cur.parentNode) { if (cur.nodeType < 11 && (targets ? targets.index(cur) > -1 : cur.nodeType === 1 && jQuery.find.matchesSelector(cur, selectors))) { matched.push(cur); break; } } } }
                                return this.pushStack(matched.length > 1 ? jQuery.uniqueSort(matched) : matched);
                            }, index: function index(elem) {
                                if (!elem) { return this[0] && this[0].parentNode ? this.first().prevAll().length : -1; }
                                if (typeof elem === "string") { return indexOf.call(jQuery(elem), this[0]); }
                                return indexOf.call(this, elem.jquery ? elem[0] : elem);
                            }, add: function add(selector, context) { return this.pushStack(jQuery.uniqueSort(jQuery.merge(this.get(), jQuery(selector, context)))); }, addBack: function addBack(selector) { return this.add(selector == null ? this.prevObject : this.prevObject.filter(selector)); }
                        }); function sibling(cur, dir) {
                            while ((cur = cur[dir]) && cur.nodeType !== 1) { }
                            return cur;
                        }
                        jQuery.each({
                            parent: function parent(elem) { var parent = elem.parentNode; return parent && parent.nodeType !== 11 ? parent : null; }, parents: function parents(elem) { return dir(elem, "parentNode"); }, parentsUntil: function parentsUntil(elem, i, until) { return dir(elem, "parentNode", until); }, next: function next(elem) { return sibling(elem, "nextSibling"); }, prev: function prev(elem) { return sibling(elem, "previousSibling"); }, nextAll: function nextAll(elem) { return dir(elem, "nextSibling"); }, prevAll: function prevAll(elem) { return dir(elem, "previousSibling"); }, nextUntil: function nextUntil(elem, i, until) { return dir(elem, "nextSibling", until); }, prevUntil: function prevUntil(elem, i, until) { return dir(elem, "previousSibling", until); }, siblings: function siblings(elem) { return _siblings((elem.parentNode || {}).firstChild, elem); }, children: function children(elem) { return _siblings(elem.firstChild); }, contents: function contents(elem) {
                                if (nodeName(elem, "iframe")) { return elem.contentDocument; }
                                if (nodeName(elem, "template")) { elem = elem.content || elem; }
                                return jQuery.merge([], elem.childNodes);
                            }
                        }, function (name, fn) {
                            jQuery.fn[name] = function (until, selector) {
                                var matched = jQuery.map(this, fn, until); if (name.slice(-5) !== "Until") { selector = until; }
                                if (selector && typeof selector === "string") { matched = jQuery.filter(selector, matched); }
                                if (this.length > 1) {
                                    if (!guaranteedUnique[name]) { jQuery.uniqueSort(matched); }
                                    if (rparentsprev.test(name)) { matched.reverse(); }
                                }
                                return this.pushStack(matched);
                            };
                        }); var rnothtmlwhite = /[^\x20\t\r\n\f]+/g; function createOptions(options) { var object = {}; jQuery.each(options.match(rnothtmlwhite) || [], function (_, flag) { object[flag] = true; }); return object; }
                        jQuery.Callbacks = function (options) {
                            options = typeof options === "string" ? createOptions(options) : jQuery.extend({}, options); var
                                firing, memory, _fired, _locked, list = [], queue = [], firingIndex = -1, fire = function fire() {
                                    _locked = _locked || options.once; _fired = firing = true; for (; queue.length; firingIndex = -1) { memory = queue.shift(); while (++firingIndex < list.length) { if (list[firingIndex].apply(memory[0], memory[1]) === false && options.stopOnFalse) { firingIndex = list.length; memory = false; } } }
                                    if (!options.memory) { memory = false; }
                                    firing = false; if (_locked) { if (memory) { list = []; } else { list = ""; } }
                                }, self = {
                                    add: function add() {
                                        if (list) {
                                            if (memory && !firing) { firingIndex = list.length - 1; queue.push(memory); }
                                            (function add(args) { jQuery.each(args, function (_, arg) { if (isFunction(arg)) { if (!options.unique || !self.has(arg)) { list.push(arg); } } else if (arg && arg.length && toType(arg) !== "string") { add(arg); } }); })(arguments); if (memory && !firing) { fire(); }
                                        }
                                        return this;
                                    }, remove: function remove() { jQuery.each(arguments, function (_, arg) { var index; while ((index = jQuery.inArray(arg, list, index)) > -1) { list.splice(index, 1); if (index <= firingIndex) { firingIndex--; } } }); return this; }, has: function has(fn) { return fn ? jQuery.inArray(fn, list) > -1 : list.length > 0; }, empty: function empty() {
                                        if (list) { list = []; }
                                        return this;
                                    }, disable: function disable() { _locked = queue = []; list = memory = ""; return this; }, disabled: function disabled() { return !list; }, lock: function lock() {
                                        _locked = queue = []; if (!memory && !firing) { list = memory = ""; }
                                        return this;
                                    }, locked: function locked() { return !!_locked; }, fireWith: function fireWith(context, args) {
                                        if (!_locked) { args = args || []; args = [context, args.slice ? args.slice() : args]; queue.push(args); if (!firing) { fire(); } }
                                        return this;
                                    }, fire: function fire() { self.fireWith(this, arguments); return this; }, fired: function fired() { return !!_fired; }
                                }; return self;
                        }; function Identity(v) { return v; }
                        function Thrower(ex) { throw ex; }
                        function adoptValue(value, resolve, reject, noValue) { var method; try { if (value && isFunction(method = value.promise)) { method.call(value).done(resolve).fail(reject); } else if (value && isFunction(method = value.then)) { method.call(value, resolve, reject); } else { resolve.apply(undefined, [value].slice(noValue)); } } catch (value) { reject.apply(undefined, [value]); } }
                        jQuery.extend({
                            Deferred: function Deferred(func) {
                                var tuples = [["notify", "progress", jQuery.Callbacks("memory"), jQuery.Callbacks("memory"), 2], ["resolve", "done", jQuery.Callbacks("once memory"), jQuery.Callbacks("once memory"), 0, "resolved"], ["reject", "fail", jQuery.Callbacks("once memory"), jQuery.Callbacks("once memory"), 1, "rejected"]], _state = "pending", _promise = {
                                    state: function state() { return _state; }, always: function always() { deferred.done(arguments).fail(arguments); return this; }, "catch": function _catch(fn) { return _promise.then(null, fn); }, pipe: function pipe() { var fns = arguments; return jQuery.Deferred(function (newDefer) { jQuery.each(tuples, function (i, tuple) { var fn = isFunction(fns[tuple[4]]) && fns[tuple[4]]; deferred[tuple[1]](function () { var returned = fn && fn.apply(this, arguments); if (returned && isFunction(returned.promise)) { returned.promise().progress(newDefer.notify).done(newDefer.resolve).fail(newDefer.reject); } else { newDefer[tuple[0] + "With"](this, fn ? [returned] : arguments); } }); }); fns = null; }).promise(); }, then: function then(onFulfilled, onRejected, onProgress) {
                                        var maxDepth = 0; function resolve(depth, deferred, handler, special) {
                                            return function () {
                                                var that = this, args = arguments, mightThrow = function mightThrow() {
                                                    var returned, then; if (depth < maxDepth) { return; }
                                                    returned = handler.apply(that, args); if (returned === deferred.promise()) { throw new TypeError("Thenable self-resolution"); }
                                                    then = returned && (_typeof(returned) === "object" || typeof returned === "function") && returned.then; if (isFunction(then)) { if (special) { then.call(returned, resolve(maxDepth, deferred, Identity, special), resolve(maxDepth, deferred, Thrower, special)); } else { maxDepth++; then.call(returned, resolve(maxDepth, deferred, Identity, special), resolve(maxDepth, deferred, Thrower, special), resolve(maxDepth, deferred, Identity, deferred.notifyWith)); } } else {
                                                        if (handler !== Identity) { that = undefined; args = [returned]; }
                                                        (special || deferred.resolveWith)(that, args);
                                                    }
                                                }, process = special ? mightThrow : function () {
                                                    try { mightThrow(); } catch (e) {
                                                        if (jQuery.Deferred.exceptionHook) { jQuery.Deferred.exceptionHook(e, process.stackTrace); }
                                                        if (depth + 1 >= maxDepth) {
                                                            if (handler !== Thrower) { that = undefined; args = [e]; }
                                                            deferred.rejectWith(that, args);
                                                        }
                                                    }
                                                }; if (depth) { process(); } else {
                                                    if (jQuery.Deferred.getStackHook) { process.stackTrace = jQuery.Deferred.getStackHook(); }
                                                    window.setTimeout(process);
                                                }
                                            };
                                        }
                                        return jQuery.Deferred(function (newDefer) { tuples[0][3].add(resolve(0, newDefer, isFunction(onProgress) ? onProgress : Identity, newDefer.notifyWith)); tuples[1][3].add(resolve(0, newDefer, isFunction(onFulfilled) ? onFulfilled : Identity)); tuples[2][3].add(resolve(0, newDefer, isFunction(onRejected) ? onRejected : Thrower)); }).promise();
                                    }, promise: function promise(obj) { return obj != null ? jQuery.extend(obj, _promise) : _promise; }
                                }, deferred = {}; jQuery.each(tuples, function (i, tuple) {
                                    var list = tuple[2], stateString = tuple[5]; _promise[tuple[1]] = list.add; if (stateString) { list.add(function () { _state = stateString; }, tuples[3 - i][2].disable, tuples[3 - i][3].disable, tuples[0][2].lock, tuples[0][3].lock); }
                                    list.add(tuple[3].fire); deferred[tuple[0]] = function () { deferred[tuple[0] + "With"](this === deferred ? undefined : this, arguments); return this; }; deferred[tuple[0] + "With"] = list.fireWith;
                                }); _promise.promise(deferred); if (func) { func.call(deferred, deferred); }
                                return deferred;
                            }, when: function when(singleValue) {
                                var
                                remaining = arguments.length, i = remaining, resolveContexts = Array(i), resolveValues = _slice.call(arguments), master = jQuery.Deferred(), updateFunc = function updateFunc(i) { return function (value) { resolveContexts[i] = this; resolveValues[i] = arguments.length > 1 ? _slice.call(arguments) : value; if (!--remaining) { master.resolveWith(resolveContexts, resolveValues); } }; }; if (remaining <= 1) { adoptValue(singleValue, master.done(updateFunc(i)).resolve, master.reject, !remaining); if (master.state() === "pending" || isFunction(resolveValues[i] && resolveValues[i].then)) { return master.then(); } }
                                while (i--) { adoptValue(resolveValues[i], updateFunc(i), master.reject); }
                                return master.promise();
                            }
                        }); var rerrorNames = /^(Eval|Internal|Range|Reference|Syntax|Type|URI)Error$/; jQuery.Deferred.exceptionHook = function (error, stack) { if (window.console && window.console.warn && error && rerrorNames.test(error.name)) { window.console.warn("jQuery.Deferred exception: " + error.message, error.stack, stack); } }; jQuery.readyException = function (error) { window.setTimeout(function () { throw error; }); }; var readyList = jQuery.Deferred(); jQuery.fn.ready = function (fn) { readyList.then(fn).catch(function (error) { jQuery.readyException(error); }); return this; }; jQuery.extend({
                            isReady: false, readyWait: 1, ready: function ready(wait) {
                                if (wait === true ? --jQuery.readyWait : jQuery.isReady) { return; }
                                jQuery.isReady = true; if (wait !== true && --jQuery.readyWait > 0) { return; }
                                readyList.resolveWith(document, [jQuery]);
                            }
                        }); jQuery.ready.then = readyList.then; function completed() { document.removeEventListener("DOMContentLoaded", completed); window.removeEventListener("load", completed); jQuery.ready(); }
                        if (document.readyState === "complete" || document.readyState !== "loading" && !document.documentElement.doScroll) { window.setTimeout(jQuery.ready); } else { document.addEventListener("DOMContentLoaded", completed); window.addEventListener("load", completed); }
                        var access = function access(elems, fn, key, value, chainable, emptyGet, raw) {
                            var i = 0, len = elems.length, bulk = key == null; if (toType(key) === "object") { chainable = true; for (i in key) { access(elems, fn, i, key[i], true, emptyGet, raw); } } else if (value !== undefined) {
                                chainable = true; if (!isFunction(value)) { raw = true; }
                                if (bulk) { if (raw) { fn.call(elems, value); fn = null; } else { bulk = fn; fn = function fn(elem, key, value) { return bulk.call(jQuery(elem), value); }; } }
                                if (fn) { for (; i < len; i++) { fn(elems[i], key, raw ? value : value.call(elems[i], i, fn(elems[i], key))); } }
                            }
                            if (chainable) { return elems; }
                            if (bulk) { return fn.call(elems); }
                            return len ? fn(elems[0], key) : emptyGet;
                        }; var rmsPrefix = /^-ms-/, rdashAlpha = /-([a-z])/g; function fcamelCase(all, letter) { return letter.toUpperCase(); }
                        function camelCase(string) { return string.replace(rmsPrefix, "ms-").replace(rdashAlpha, fcamelCase); }
                        var acceptData = function acceptData(owner) { return owner.nodeType === 1 || owner.nodeType === 9 || !+owner.nodeType; }; function Data() { this.expando = jQuery.expando + Data.uid++; }
                        Data.uid = 1; Data.prototype = {
                            cache: function cache(owner) {
                                var value = owner[this.expando]; if (!value) { value = {}; if (acceptData(owner)) { if (owner.nodeType) { owner[this.expando] = value; } else { Object.defineProperty(owner, this.expando, { value: value, configurable: true }); } } }
                                return value;
                            }, set: function set(owner, data, value) {
                                var prop, cache = this.cache(owner); if (typeof data === "string") { cache[camelCase(data)] = value; } else { for (prop in data) { cache[camelCase(prop)] = data[prop]; } }
                                return cache;
                            }, get: function get(owner, key) { return key === undefined ? this.cache(owner) : owner[this.expando] && owner[this.expando][camelCase(key)]; }, access: function access(owner, key, value) {
                                if (key === undefined || key && typeof key === "string" && value === undefined) { return this.get(owner, key); }
                                this.set(owner, key, value); return value !== undefined ? value : key;
                            }, remove: function remove(owner, key) {
                                var i, cache = owner[this.expando]; if (cache === undefined) { return; }
                                if (key !== undefined) {
                                    if (Array.isArray(key)) { key = key.map(camelCase); } else { key = camelCase(key); key = key in cache ? [key] : key.match(rnothtmlwhite) || []; }
                                    i = key.length; while (i--) { delete cache[key[i]]; }
                                }
                                if (key === undefined || jQuery.isEmptyObject(cache)) { if (owner.nodeType) { owner[this.expando] = undefined; } else { delete owner[this.expando]; } }
                            }, hasData: function hasData(owner) { var cache = owner[this.expando]; return cache !== undefined && !jQuery.isEmptyObject(cache); }
                        }; var dataPriv = new Data(); var dataUser = new Data(); var rbrace = /^(?:\{[\w\W]*\}|\[[\w\W]*\])$/, rmultiDash = /[A-Z]/g; function getData(data) {
                            if (data === "true") { return true; }
                            if (data === "false") { return false; }
                            if (data === "null") { return null; }
                            if (data === +data + "") { return +data; }
                            if (rbrace.test(data)) { return JSON.parse(data); }
                            return data;
                        }
                        function dataAttr(elem, key, data) {
                            var name; if (data === undefined && elem.nodeType === 1) {
                                name = "data-" + key.replace(rmultiDash, "-$&").toLowerCase(); data = elem.getAttribute(name); if (typeof data === "string") {
                                    try { data = getData(data); } catch (e) { }
                                    dataUser.set(elem, key, data);
                                } else { data = undefined; }
                            }
                            return data;
                        }
                        jQuery.extend({ hasData: function hasData(elem) { return dataUser.hasData(elem) || dataPriv.hasData(elem); }, data: function data(elem, name, _data) { return dataUser.access(elem, name, _data); }, removeData: function removeData(elem, name) { dataUser.remove(elem, name); }, _data: function _data(elem, name, data) { return dataPriv.access(elem, name, data); }, _removeData: function _removeData(elem, name) { dataPriv.remove(elem, name); } }); jQuery.fn.extend({
                            data: function data(key, value) {
                                var i, name, data, elem = this[0], attrs = elem && elem.attributes; if (key === undefined) {
                                    if (this.length) {
                                        data = dataUser.get(elem); if (elem.nodeType === 1 && !dataPriv.get(elem, "hasDataAttrs")) {
                                            i = attrs.length; while (i--) { if (attrs[i]) { name = attrs[i].name; if (name.indexOf("data-") === 0) { name = camelCase(name.slice(5)); dataAttr(elem, name, data[name]); } } }
                                            dataPriv.set(elem, "hasDataAttrs", true);
                                        }
                                    }
                                    return data;
                                }
                                if (_typeof(key) === "object") { return this.each(function () { dataUser.set(this, key); }); }
                                return access(this, function (value) {
                                    var data; if (elem && value === undefined) {
                                        data = dataUser.get(elem, key); if (data !== undefined) { return data; }
                                        data = dataAttr(elem, key); if (data !== undefined) { return data; }
                                        return;
                                    }
                                    this.each(function () { dataUser.set(this, key, value); });
                                }, null, value, arguments.length > 1, null, true);
                            }, removeData: function removeData(key) { return this.each(function () { dataUser.remove(this, key); }); }
                        }); jQuery.extend({
                            queue: function queue(elem, type, data) {
                                var queue; if (elem) {
                                    type = (type || "fx") + "queue"; queue = dataPriv.get(elem, type); if (data) { if (!queue || Array.isArray(data)) { queue = dataPriv.access(elem, type, jQuery.makeArray(data)); } else { queue.push(data); } }
                                    return queue || [];
                                }
                            }, dequeue: function dequeue(elem, type) {
                                type = type || "fx"; var queue = jQuery.queue(elem, type), startLength = queue.length, fn = queue.shift(), hooks = jQuery._queueHooks(elem, type), next = function next() { jQuery.dequeue(elem, type); }; if (fn === "inprogress") { fn = queue.shift(); startLength--; }
                                if (fn) {
                                    if (type === "fx") { queue.unshift("inprogress"); }
                                    delete hooks.stop; fn.call(elem, next, hooks);
                                }
                                if (!startLength && hooks) { hooks.empty.fire(); }
                            }, _queueHooks: function _queueHooks(elem, type) { var key = type + "queueHooks"; return dataPriv.get(elem, key) || dataPriv.access(elem, key, { empty: jQuery.Callbacks("once memory").add(function () { dataPriv.remove(elem, [type + "queue", key]); }) }); }
                        }); jQuery.fn.extend({
                            queue: function queue(type, data) {
                                var setter = 2; if (typeof type !== "string") { data = type; type = "fx"; setter--; }
                                if (arguments.length < setter) { return jQuery.queue(this[0], type); }
                                return data === undefined ? this : this.each(function () { var queue = jQuery.queue(this, type, data); jQuery._queueHooks(this, type); if (type === "fx" && queue[0] !== "inprogress") { jQuery.dequeue(this, type); } });
                            }, dequeue: function dequeue(type) { return this.each(function () { jQuery.dequeue(this, type); }); }, clearQueue: function clearQueue(type) { return this.queue(type || "fx", []); }, promise: function promise(type, obj) {
                                var tmp, count = 1, defer = jQuery.Deferred(), elements = this, i = this.length, resolve = function resolve() { if (!--count) { defer.resolveWith(elements, [elements]); } }; if (typeof type !== "string") { obj = type; type = undefined; }
                                type = type || "fx"; while (i--) { tmp = dataPriv.get(elements[i], type + "queueHooks"); if (tmp && tmp.empty) { count++; tmp.empty.add(resolve); } }
                                resolve(); return defer.promise(obj);
                            }
                        }); var pnum = /[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source; var rcssNum = new RegExp("^(?:([+-])=|)(" + pnum + ")([a-z%]*)$", "i"); var cssExpand = ["Top", "Right", "Bottom", "Left"]; var isHiddenWithinTree = function isHiddenWithinTree(elem, el) { elem = el || elem; return elem.style.display === "none" || elem.style.display === "" && jQuery.contains(elem.ownerDocument, elem) && jQuery.css(elem, "display") === "none"; }; var swap = function swap(elem, options, callback, args) {
                            var ret, name, old = {}; for (name in options) { old[name] = elem.style[name]; elem.style[name] = options[name]; }
                            ret = callback.apply(elem, args || []); for (name in options) { elem.style[name] = old[name]; }
                            return ret;
                        }; function adjustCSS(elem, prop, valueParts, tween) {
                            var adjusted, scale, maxIterations = 20, currentValue = tween ? function () { return tween.cur(); } : function () { return jQuery.css(elem, prop, ""); }, initial = currentValue(), unit = valueParts && valueParts[3] || (jQuery.cssNumber[prop] ? "" : "px"), initialInUnit = (jQuery.cssNumber[prop] || unit !== "px" && +initial) && rcssNum.exec(jQuery.css(elem, prop)); if (initialInUnit && initialInUnit[3] !== unit) {
                                initial = initial / 2; unit = unit || initialInUnit[3]; initialInUnit = +initial || 1; while (maxIterations--) {
                                    jQuery.style(elem, prop, initialInUnit + unit); if ((1 - scale) * (1 - (scale = currentValue() / initial || 0.5)) <= 0) { maxIterations = 0; }
                                    initialInUnit = initialInUnit / scale;
                                }
                                initialInUnit = initialInUnit * 2; jQuery.style(elem, prop, initialInUnit + unit); valueParts = valueParts || [];
                            }
                            if (valueParts) { initialInUnit = +initialInUnit || +initial || 0; adjusted = valueParts[1] ? initialInUnit + (valueParts[1] + 1) * valueParts[2] : +valueParts[2]; if (tween) { tween.unit = unit; tween.start = initialInUnit; tween.end = adjusted; } }
                            return adjusted;
                        }
                        var defaultDisplayMap = {}; function getDefaultDisplay(elem) {
                            var temp, doc = elem.ownerDocument, nodeName = elem.nodeName, display = defaultDisplayMap[nodeName]; if (display) { return display; }
                            temp = doc.body.appendChild(doc.createElement(nodeName)); display = jQuery.css(temp, "display"); temp.parentNode.removeChild(temp); if (display === "none") { display = "block"; }
                            defaultDisplayMap[nodeName] = display; return display;
                        }
                        function showHide(elements, show) {
                            var display, elem, values = [], index = 0, length = elements.length; for (; index < length; index++) {
                                elem = elements[index]; if (!elem.style) { continue; }
                                display = elem.style.display; if (show) {
                                    if (display === "none") { values[index] = dataPriv.get(elem, "display") || null; if (!values[index]) { elem.style.display = ""; } }
                                    if (elem.style.display === "" && isHiddenWithinTree(elem)) { values[index] = getDefaultDisplay(elem); }
                                } else { if (display !== "none") { values[index] = "none"; dataPriv.set(elem, "display", display); } }
                            }
                            for (index = 0; index < length; index++) { if (values[index] != null) { elements[index].style.display = values[index]; } }
                            return elements;
                        }
                        jQuery.fn.extend({
                            show: function show() { return showHide(this, true); }, hide: function hide() { return showHide(this); }, toggle: function toggle(state) {
                                if (typeof state === "boolean") { return state ? this.show() : this.hide(); }
                                return this.each(function () { if (isHiddenWithinTree(this)) { jQuery(this).show(); } else { jQuery(this).hide(); } });
                            }
                        }); var rcheckableType = /^(?:checkbox|radio)$/i; var rtagName = /<([a-z][^\/\0>\x20\t\r\n\f]+)/i; var rscriptType = /^$|^module$|\/(?:java|ecma)script/i; var wrapMap = { option: [1, "<select multiple='multiple'>", "</select>"], thead: [1, "<table>", "</table>"], col: [2, "<table><colgroup>", "</colgroup></table>"], tr: [2, "<table><tbody>", "</tbody></table>"], td: [3, "<table><tbody><tr>", "</tr></tbody></table>"], _default: [0, "", ""] }; wrapMap.optgroup = wrapMap.option; wrapMap.tbody = wrapMap.tfoot = wrapMap.colgroup = wrapMap.caption = wrapMap.thead; wrapMap.th = wrapMap.td; function getAll(context, tag) {
                            var ret; if (typeof context.getElementsByTagName !== "undefined") { ret = context.getElementsByTagName(tag || "*"); } else if (typeof context.querySelectorAll !== "undefined") { ret = context.querySelectorAll(tag || "*"); } else { ret = []; }
                            if (tag === undefined || tag && nodeName(context, tag)) { return jQuery.merge([context], ret); }
                            return ret;
                        }
                        function setGlobalEval(elems, refElements) { var i = 0, l = elems.length; for (; i < l; i++) { dataPriv.set(elems[i], "globalEval", !refElements || dataPriv.get(refElements[i], "globalEval")); } }
                        var rhtml = /<|&#?\w+;/; function buildFragment(elems, context, scripts, selection, ignored) {
                            var elem, tmp, tag, wrap, contains, j, fragment = context.createDocumentFragment(), nodes = [], i = 0, l = elems.length; for (; i < l; i++) {
                                elem = elems[i]; if (elem || elem === 0) {
                                    if (toType(elem) === "object") { jQuery.merge(nodes, elem.nodeType ? [elem] : elem); } else if (!rhtml.test(elem)) { nodes.push(context.createTextNode(elem)); } else {
                                        tmp = tmp || fragment.appendChild(context.createElement("div")); tag = (rtagName.exec(elem) || ["", ""])[1].toLowerCase(); wrap = wrapMap[tag] || wrapMap._default; tmp.innerHTML = wrap[1] + jQuery.htmlPrefilter(elem) + wrap[2]; j = wrap[0]; while (j--) { tmp = tmp.lastChild; }
                                        jQuery.merge(nodes, tmp.childNodes); tmp = fragment.firstChild; tmp.textContent = "";
                                    }
                                }
                            }
                            fragment.textContent = ""; i = 0; while (elem = nodes[i++]) {
                                if (selection && jQuery.inArray(elem, selection) > -1) {
                                    if (ignored) { ignored.push(elem); }
                                    continue;
                                }
                                contains = jQuery.contains(elem.ownerDocument, elem); tmp = getAll(fragment.appendChild(elem), "script"); if (contains) { setGlobalEval(tmp); }
                                if (scripts) { j = 0; while (elem = tmp[j++]) { if (rscriptType.test(elem.type || "")) { scripts.push(elem); } } }
                            }
                            return fragment;
                        }
                        (function () { var fragment = document.createDocumentFragment(), div = fragment.appendChild(document.createElement("div")), input = document.createElement("input"); input.setAttribute("type", "radio"); input.setAttribute("checked", "checked"); input.setAttribute("name", "t"); div.appendChild(input); support.checkClone = div.cloneNode(true).cloneNode(true).lastChild.checked; div.innerHTML = "<textarea>x</textarea>"; support.noCloneChecked = !!div.cloneNode(true).lastChild.defaultValue; })(); var documentElement = document.documentElement; var rkeyEvent = /^key/, rmouseEvent = /^(?:mouse|pointer|contextmenu|drag|drop)|click/, rtypenamespace = /^([^.]*)(?:\.(.+)|)/; function returnTrue() { return true; }
                        function returnFalse() { return false; }
                        function safeActiveElement() { try { return document.activeElement; } catch (err) { } }
                        function _on(elem, types, selector, data, fn, one) {
                            var origFn, type; if (_typeof(types) === "object") {
                                if (typeof selector !== "string") { data = data || selector; selector = undefined; }
                                for (type in types) { _on(elem, type, selector, data, types[type], one); }
                                return elem;
                            }
                            if (data == null && fn == null) { fn = selector; data = selector = undefined; } else if (fn == null) { if (typeof selector === "string") { fn = data; data = undefined; } else { fn = data; data = selector; selector = undefined; } }
                            if (fn === false) { fn = returnFalse; } else if (!fn) { return elem; }
                            if (one === 1) { origFn = fn; fn = function fn(event) { jQuery().off(event); return origFn.apply(this, arguments); }; fn.guid = origFn.guid || (origFn.guid = jQuery.guid++); }
                            return elem.each(function () { jQuery.event.add(this, types, fn, data, selector); });
                        }
                        jQuery.event = {
                            global: {}, add: function add(elem, types, handler, data, selector) {
                                var handleObjIn, eventHandle, tmp, events, t, handleObj, special, handlers, type, namespaces, origType, elemData = dataPriv.get(elem); if (!elemData) { return; }
                                if (handler.handler) { handleObjIn = handler; handler = handleObjIn.handler; selector = handleObjIn.selector; }
                                if (selector) { jQuery.find.matchesSelector(documentElement, selector); }
                                if (!handler.guid) { handler.guid = jQuery.guid++; }
                                if (!(events = elemData.events)) { events = elemData.events = {}; }
                                if (!(eventHandle = elemData.handle)) { eventHandle = elemData.handle = function (e) { return typeof jQuery !== "undefined" && jQuery.event.triggered !== e.type ? jQuery.event.dispatch.apply(elem, arguments) : undefined; }; }
                                types = (types || "").match(rnothtmlwhite) || [""]; t = types.length; while (t--) {
                                    tmp = rtypenamespace.exec(types[t]) || []; type = origType = tmp[1]; namespaces = (tmp[2] || "").split(".").sort(); if (!type) { continue; }
                                    special = jQuery.event.special[type] || {}; type = (selector ? special.delegateType : special.bindType) || type; special = jQuery.event.special[type] || {}; handleObj = jQuery.extend({ type: type, origType: origType, data: data, handler: handler, guid: handler.guid, selector: selector, needsContext: selector && jQuery.expr.match.needsContext.test(selector), namespace: namespaces.join(".") }, handleObjIn); if (!(handlers = events[type])) { handlers = events[type] = []; handlers.delegateCount = 0; if (!special.setup || special.setup.call(elem, data, namespaces, eventHandle) === false) { if (elem.addEventListener) { elem.addEventListener(type, eventHandle); } } }
                                    if (special.add) { special.add.call(elem, handleObj); if (!handleObj.handler.guid) { handleObj.handler.guid = handler.guid; } }
                                    if (selector) { handlers.splice(handlers.delegateCount++, 0, handleObj); } else { handlers.push(handleObj); }
                                    jQuery.event.global[type] = true;
                                }
                            }, remove: function remove(elem, types, handler, selector, mappedTypes) {
                                var j, origCount, tmp, events, t, handleObj, special, handlers, type, namespaces, origType, elemData = dataPriv.hasData(elem) && dataPriv.get(elem); if (!elemData || !(events = elemData.events)) { return; }
                                types = (types || "").match(rnothtmlwhite) || [""]; t = types.length; while (t--) {
                                    tmp = rtypenamespace.exec(types[t]) || []; type = origType = tmp[1]; namespaces = (tmp[2] || "").split(".").sort(); if (!type) {
                                        for (type in events) { jQuery.event.remove(elem, type + types[t], handler, selector, true); }
                                        continue;
                                    }
                                    special = jQuery.event.special[type] || {}; type = (selector ? special.delegateType : special.bindType) || type; handlers = events[type] || []; tmp = tmp[2] && new RegExp("(^|\\.)" + namespaces.join("\\.(?:.*\\.|)") + "(\\.|$)"); origCount = j = handlers.length; while (j--) {
                                        handleObj = handlers[j]; if ((mappedTypes || origType === handleObj.origType) && (!handler || handler.guid === handleObj.guid) && (!tmp || tmp.test(handleObj.namespace)) && (!selector || selector === handleObj.selector || selector === "**" && handleObj.selector)) {
                                            handlers.splice(j, 1); if (handleObj.selector) { handlers.delegateCount--; }
                                            if (special.remove) { special.remove.call(elem, handleObj); }
                                        }
                                    }
                                    if (origCount && !handlers.length) {
                                        if (!special.teardown || special.teardown.call(elem, namespaces, elemData.handle) === false) { jQuery.removeEvent(elem, type, elemData.handle); }
                                        delete events[type];
                                    }
                                }
                                if (jQuery.isEmptyObject(events)) { dataPriv.remove(elem, "handle events"); }
                            }, dispatch: function dispatch(nativeEvent) {
                                var event = jQuery.event.fix(nativeEvent); var i, j, ret, matched, handleObj, handlerQueue, args = new Array(arguments.length), handlers = (dataPriv.get(this, "events") || {})[event.type] || [], special = jQuery.event.special[event.type] || {}; args[0] = event; for (i = 1; i < arguments.length; i++) { args[i] = arguments[i]; }
                                event.delegateTarget = this; if (special.preDispatch && special.preDispatch.call(this, event) === false) { return; }
                                handlerQueue = jQuery.event.handlers.call(this, event, handlers); i = 0; while ((matched = handlerQueue[i++]) && !event.isPropagationStopped()) { event.currentTarget = matched.elem; j = 0; while ((handleObj = matched.handlers[j++]) && !event.isImmediatePropagationStopped()) { if (!event.rnamespace || event.rnamespace.test(handleObj.namespace)) { event.handleObj = handleObj; event.data = handleObj.data; ret = ((jQuery.event.special[handleObj.origType] || {}).handle || handleObj.handler).apply(matched.elem, args); if (ret !== undefined) { if ((event.result = ret) === false) { event.preventDefault(); event.stopPropagation(); } } } } }
                                if (special.postDispatch) { special.postDispatch.call(this, event); }
                                return event.result;
                            }, handlers: function handlers(event, _handlers) {
                                var i, handleObj, sel, matchedHandlers, matchedSelectors, handlerQueue = [], delegateCount = _handlers.delegateCount, cur = event.target; if (delegateCount && cur.nodeType && !(event.type === "click" && event.button >= 1)) {
                                    for (; cur !== this; cur = cur.parentNode || this) {
                                        if (cur.nodeType === 1 && !(event.type === "click" && cur.disabled === true)) {
                                            matchedHandlers = []; matchedSelectors = {}; for (i = 0; i < delegateCount; i++) {
                                                handleObj = _handlers[i]; sel = handleObj.selector + " "; if (matchedSelectors[sel] === undefined) { matchedSelectors[sel] = handleObj.needsContext ? jQuery(sel, this).index(cur) > -1 : jQuery.find(sel, this, null, [cur]).length; }
                                                if (matchedSelectors[sel]) { matchedHandlers.push(handleObj); }
                                            }
                                            if (matchedHandlers.length) { handlerQueue.push({ elem: cur, handlers: matchedHandlers }); }
                                        }
                                    }
                                }
                                cur = this; if (delegateCount < _handlers.length) { handlerQueue.push({ elem: cur, handlers: _handlers.slice(delegateCount) }); }
                                return handlerQueue;
                            }, addProp: function addProp(name, hook) { Object.defineProperty(jQuery.Event.prototype, name, { enumerable: true, configurable: true, get: isFunction(hook) ? function () { if (this.originalEvent) { return hook(this.originalEvent); } } : function () { if (this.originalEvent) { return this.originalEvent[name]; } }, set: function set(value) { Object.defineProperty(this, name, { enumerable: true, configurable: true, writable: true, value: value }); } }); }, fix: function fix(originalEvent) { return originalEvent[jQuery.expando] ? originalEvent : new jQuery.Event(originalEvent); }, special: { load: { noBubble: true }, focus: { trigger: function trigger() { if (this !== safeActiveElement() && this.focus) { this.focus(); return false; } }, delegateType: "focusin" }, blur: { trigger: function trigger() { if (this === safeActiveElement() && this.blur) { this.blur(); return false; } }, delegateType: "focusout" }, click: { trigger: function trigger() { if (this.type === "checkbox" && this.click && nodeName(this, "input")) { this.click(); return false; } }, _default: function _default(event) { return nodeName(event.target, "a"); } }, beforeunload: { postDispatch: function postDispatch(event) { if (event.result !== undefined && event.originalEvent) { event.originalEvent.returnValue = event.result; } } } }
                        }; jQuery.removeEvent = function (elem, type, handle) { if (elem.removeEventListener) { elem.removeEventListener(type, handle); } }; jQuery.Event = function (src, props) {
                            if (!(this instanceof jQuery.Event)) { return new jQuery.Event(src, props); }
                            if (src && src.type) { this.originalEvent = src; this.type = src.type; this.isDefaultPrevented = src.defaultPrevented || src.defaultPrevented === undefined && src.returnValue === false ? returnTrue : returnFalse; this.target = src.target && src.target.nodeType === 3 ? src.target.parentNode : src.target; this.currentTarget = src.currentTarget; this.relatedTarget = src.relatedTarget; } else { this.type = src; }
                            if (props) { jQuery.extend(this, props); }
                            this.timeStamp = src && src.timeStamp || Date.now(); this[jQuery.expando] = true;
                        }; jQuery.Event.prototype = {
                            constructor: jQuery.Event, isDefaultPrevented: returnFalse, isPropagationStopped: returnFalse, isImmediatePropagationStopped: returnFalse, isSimulated: false, preventDefault: function preventDefault() { var e = this.originalEvent; this.isDefaultPrevented = returnTrue; if (e && !this.isSimulated) { e.preventDefault(); } }, stopPropagation: function stopPropagation() { var e = this.originalEvent; this.isPropagationStopped = returnTrue; if (e && !this.isSimulated) { e.stopPropagation(); } }, stopImmediatePropagation: function stopImmediatePropagation() {
                                var e = this.originalEvent; this.isImmediatePropagationStopped = returnTrue; if (e && !this.isSimulated) { e.stopImmediatePropagation(); }
                                this.stopPropagation();
                            }
                        }; jQuery.each({
                            altKey: true, bubbles: true, cancelable: true, changedTouches: true, ctrlKey: true, detail: true, eventPhase: true, metaKey: true, pageX: true, pageY: true, shiftKey: true, view: true, "char": true, charCode: true, key: true, keyCode: true, button: true, buttons: true, clientX: true, clientY: true, offsetX: true, offsetY: true, pointerId: true, pointerType: true, screenX: true, screenY: true, targetTouches: true, toElement: true, touches: true, which: function which(event) {
                                var button = event.button; if (event.which == null && rkeyEvent.test(event.type)) { return event.charCode != null ? event.charCode : event.keyCode; }
                                if (!event.which && button !== undefined && rmouseEvent.test(event.type)) {
                                    if (button & 1) { return 1; }
                                    if (button & 2) { return 3; }
                                    if (button & 4) { return 2; }
                                    return 0;
                                }
                                return event.which;
                            }
                        }, jQuery.event.addProp); jQuery.each({ mouseenter: "mouseover", mouseleave: "mouseout", pointerenter: "pointerover", pointerleave: "pointerout" }, function (orig, fix) {
                            jQuery.event.special[orig] = {
                                delegateType: fix, bindType: fix, handle: function handle(event) {
                                    var ret, target = this, related = event.relatedTarget, handleObj = event.handleObj; if (!related || related !== target && !jQuery.contains(target, related)) { event.type = handleObj.origType; ret = handleObj.handler.apply(this, arguments); event.type = fix; }
                                    return ret;
                                }
                            };
                        }); jQuery.fn.extend({
                            on: function on(types, selector, data, fn) { return _on(this, types, selector, data, fn); }, one: function one(types, selector, data, fn) { return _on(this, types, selector, data, fn, 1); }, off: function off(types, selector, fn) {
                                var handleObj, type; if (types && types.preventDefault && types.handleObj) { handleObj = types.handleObj; jQuery(types.delegateTarget).off(handleObj.namespace ? handleObj.origType + "." + handleObj.namespace : handleObj.origType, handleObj.selector, handleObj.handler); return this; }
                                if (_typeof(types) === "object") {
                                    for (type in types) { this.off(type, selector, types[type]); }
                                    return this;
                                }
                                if (selector === false || typeof selector === "function") { fn = selector; selector = undefined; }
                                if (fn === false) { fn = returnFalse; }
                                return this.each(function () { jQuery.event.remove(this, types, fn, selector); });
                            }
                        }); var
                            rxhtmlTag = /<(?!area|br|col|embed|hr|img|input|link|meta|param)(([a-z][^\/\0>\x20\t\r\n\f]*)[^>]*)\/>/gi, rnoInnerhtml = /<script|<style|<link/i, rchecked = /checked\s*(?:[^=]|=\s*.checked.)/i, rcleanScript = /^\s*<!(?:\[CDATA\[|--)|(?:\]\]|--)>\s*$/g; function manipulationTarget(elem, content) {
                                if (nodeName(elem, "table") && nodeName(content.nodeType !== 11 ? content : content.firstChild, "tr")) { return jQuery(elem).children("tbody")[0] || elem; }
                                return elem;
                            }
                        function disableScript(elem) { elem.type = (elem.getAttribute("type") !== null) + "/" + elem.type; return elem; }
                        function restoreScript(elem) {
                            if ((elem.type || "").slice(0, 5) === "true/") { elem.type = elem.type.slice(5); } else { elem.removeAttribute("type"); }
                            return elem;
                        }
                        function cloneCopyEvent(src, dest) {
                            var i, l, type, pdataOld, pdataCur, udataOld, udataCur, events; if (dest.nodeType !== 1) { return; }
                            if (dataPriv.hasData(src)) { pdataOld = dataPriv.access(src); pdataCur = dataPriv.set(dest, pdataOld); events = pdataOld.events; if (events) { delete pdataCur.handle; pdataCur.events = {}; for (type in events) { for (i = 0, l = events[type].length; i < l; i++) { jQuery.event.add(dest, type, events[type][i]); } } } }
                            if (dataUser.hasData(src)) { udataOld = dataUser.access(src); udataCur = jQuery.extend({}, udataOld); dataUser.set(dest, udataCur); }
                        }
                        function fixInput(src, dest) { var nodeName = dest.nodeName.toLowerCase(); if (nodeName === "input" && rcheckableType.test(src.type)) { dest.checked = src.checked; } else if (nodeName === "input" || nodeName === "textarea") { dest.defaultValue = src.defaultValue; } }
                        function domManip(collection, args, callback, ignored) {
                            args = concat.apply([], args); var fragment, first, scripts, hasScripts, node, doc, i = 0, l = collection.length, iNoClone = l - 1, value = args[0], valueIsFunction = isFunction(value); if (valueIsFunction || l > 1 && typeof value === "string" && !support.checkClone && rchecked.test(value)) {
                                return collection.each(function (index) {
                                    var self = collection.eq(index); if (valueIsFunction) { args[0] = value.call(this, index, self.html()); }
                                    domManip(self, args, callback, ignored);
                                });
                            }
                            if (l) {
                                fragment = buildFragment(args, collection[0].ownerDocument, false, collection, ignored); first = fragment.firstChild; if (fragment.childNodes.length === 1) { fragment = first; }
                                if (first || ignored) {
                                    scripts = jQuery.map(getAll(fragment, "script"), disableScript); hasScripts = scripts.length; for (; i < l; i++) {
                                        node = fragment; if (i !== iNoClone) { node = jQuery.clone(node, true, true); if (hasScripts) { jQuery.merge(scripts, getAll(node, "script")); } }
                                        callback.call(collection[i], node, i);
                                    }
                                    if (hasScripts) { doc = scripts[scripts.length - 1].ownerDocument; jQuery.map(scripts, restoreScript); for (i = 0; i < hasScripts; i++) { node = scripts[i]; if (rscriptType.test(node.type || "") && !dataPriv.access(node, "globalEval") && jQuery.contains(doc, node)) { if (node.src && (node.type || "").toLowerCase() !== "module") { if (jQuery._evalUrl) { jQuery._evalUrl(node.src); } } else { DOMEval(node.textContent.replace(rcleanScript, ""), doc, node); } } } }
                                }
                            }
                            return collection;
                        }
                        function _remove(elem, selector, keepData) {
                            var node, nodes = selector ? jQuery.filter(selector, elem) : elem, i = 0; for (; (node = nodes[i]) != null; i++) {
                                if (!keepData && node.nodeType === 1) { jQuery.cleanData(getAll(node)); }
                                if (node.parentNode) {
                                    if (keepData && jQuery.contains(node.ownerDocument, node)) { setGlobalEval(getAll(node, "script")); }
                                    node.parentNode.removeChild(node);
                                }
                            }
                            return elem;
                        }
                        jQuery.extend({
                            htmlPrefilter: function htmlPrefilter(html) { return html.replace(rxhtmlTag, "<$1></$2>"); }, clone: function clone(elem, dataAndEvents, deepDataAndEvents) {
                                var i, l, srcElements, destElements, clone = elem.cloneNode(true), inPage = jQuery.contains(elem.ownerDocument, elem); if (!support.noCloneChecked && (elem.nodeType === 1 || elem.nodeType === 11) && !jQuery.isXMLDoc(elem)) { destElements = getAll(clone); srcElements = getAll(elem); for (i = 0, l = srcElements.length; i < l; i++) { fixInput(srcElements[i], destElements[i]); } }
                                if (dataAndEvents) { if (deepDataAndEvents) { srcElements = srcElements || getAll(elem); destElements = destElements || getAll(clone); for (i = 0, l = srcElements.length; i < l; i++) { cloneCopyEvent(srcElements[i], destElements[i]); } } else { cloneCopyEvent(elem, clone); } }
                                destElements = getAll(clone, "script"); if (destElements.length > 0) { setGlobalEval(destElements, !inPage && getAll(elem, "script")); }
                                return clone;
                            }, cleanData: function cleanData(elems) {
                                var data, elem, type, special = jQuery.event.special, i = 0; for (; (elem = elems[i]) !== undefined; i++) {
                                    if (acceptData(elem)) {
                                        if (data = elem[dataPriv.expando]) {
                                            if (data.events) { for (type in data.events) { if (special[type]) { jQuery.event.remove(elem, type); } else { jQuery.removeEvent(elem, type, data.handle); } } }
                                            elem[dataPriv.expando] = undefined;
                                        }
                                        if (elem[dataUser.expando]) { elem[dataUser.expando] = undefined; }
                                    }
                                }
                            }
                        }); jQuery.fn.extend({
                            detach: function detach(selector) { return _remove(this, selector, true); }, remove: function remove(selector) { return _remove(this, selector); }, text: function text(value) { return access(this, function (value) { return value === undefined ? jQuery.text(this) : this.empty().each(function () { if (this.nodeType === 1 || this.nodeType === 11 || this.nodeType === 9) { this.textContent = value; } }); }, null, value, arguments.length); }, append: function append() { return domManip(this, arguments, function (elem) { if (this.nodeType === 1 || this.nodeType === 11 || this.nodeType === 9) { var target = manipulationTarget(this, elem); target.appendChild(elem); } }); }, prepend: function prepend() { return domManip(this, arguments, function (elem) { if (this.nodeType === 1 || this.nodeType === 11 || this.nodeType === 9) { var target = manipulationTarget(this, elem); target.insertBefore(elem, target.firstChild); } }); }, before: function before() { return domManip(this, arguments, function (elem) { if (this.parentNode) { this.parentNode.insertBefore(elem, this); } }); }, after: function after() { return domManip(this, arguments, function (elem) { if (this.parentNode) { this.parentNode.insertBefore(elem, this.nextSibling); } }); }, empty: function empty() {
                                var elem, i = 0; for (; (elem = this[i]) != null; i++) { if (elem.nodeType === 1) { jQuery.cleanData(getAll(elem, false)); elem.textContent = ""; } }
                                return this;
                            }, clone: function clone(dataAndEvents, deepDataAndEvents) { dataAndEvents = dataAndEvents == null ? false : dataAndEvents; deepDataAndEvents = deepDataAndEvents == null ? dataAndEvents : deepDataAndEvents; return this.map(function () { return jQuery.clone(this, dataAndEvents, deepDataAndEvents); }); }, html: function html(value) {
                                return access(this, function (value) {
                                    var elem = this[0] || {}, i = 0, l = this.length; if (value === undefined && elem.nodeType === 1) { return elem.innerHTML; }
                                    if (typeof value === "string" && !rnoInnerhtml.test(value) && !wrapMap[(rtagName.exec(value) || ["", ""])[1].toLowerCase()]) {
                                        value = jQuery.htmlPrefilter(value); try {
                                            for (; i < l; i++) { elem = this[i] || {}; if (elem.nodeType === 1) { jQuery.cleanData(getAll(elem, false)); elem.innerHTML = value; } }
                                            elem = 0;
                                        } catch (e) { }
                                    }
                                    if (elem) { this.empty().append(value); }
                                }, null, value, arguments.length);
                            }, replaceWith: function replaceWith() { var ignored = []; return domManip(this, arguments, function (elem) { var parent = this.parentNode; if (jQuery.inArray(this, ignored) < 0) { jQuery.cleanData(getAll(this)); if (parent) { parent.replaceChild(elem, this); } } }, ignored); }
                        }); jQuery.each({ appendTo: "append", prependTo: "prepend", insertBefore: "before", insertAfter: "after", replaceAll: "replaceWith" }, function (name, original) {
                            jQuery.fn[name] = function (selector) {
                                var elems, ret = [], insert = jQuery(selector), last = insert.length - 1, i = 0; for (; i <= last; i++) { elems = i === last ? this : this.clone(true); jQuery(insert[i])[original](elems); push.apply(ret, elems.get()); }
                                return this.pushStack(ret);
                            };
                        }); var rnumnonpx = new RegExp("^(" + pnum + ")(?!px)[a-z%]+$", "i"); var getStyles = function getStyles(elem) {
                            var view = elem.ownerDocument.defaultView; if (!view || !view.opener) { view = window; }
                            return view.getComputedStyle(elem);
                        }; var rboxStyle = new RegExp(cssExpand.join("|"), "i"); (function () {
                            function computeStyleTests() {
                                if (!div) { return; }
                                container.style.cssText = "position:absolute;left:-11111px;width:60px;" + "margin-top:1px;padding:0;border:0"; div.style.cssText = "position:relative;display:block;box-sizing:border-box;overflow:scroll;" + "margin:auto;border:1px;padding:1px;" + "width:60%;top:1%"; documentElement.appendChild(container).appendChild(div); var divStyle = window.getComputedStyle(div); pixelPositionVal = divStyle.top !== "1%"; reliableMarginLeftVal = roundPixelMeasures(divStyle.marginLeft) === 12; div.style.right = "60%"; pixelBoxStylesVal = roundPixelMeasures(divStyle.right) === 36; boxSizingReliableVal = roundPixelMeasures(divStyle.width) === 36; div.style.position = "absolute"; scrollboxSizeVal = div.offsetWidth === 36 || "absolute"; documentElement.removeChild(container); div = null;
                            }
                            function roundPixelMeasures(measure) { return Math.round(parseFloat(measure)); }
                            var pixelPositionVal, boxSizingReliableVal, scrollboxSizeVal, pixelBoxStylesVal, reliableMarginLeftVal, container = document.createElement("div"), div = document.createElement("div"); if (!div.style) { return; }
                            div.style.backgroundClip = "content-box"; div.cloneNode(true).style.backgroundClip = ""; support.clearCloneStyle = div.style.backgroundClip === "content-box"; jQuery.extend(support, { boxSizingReliable: function boxSizingReliable() { computeStyleTests(); return boxSizingReliableVal; }, pixelBoxStyles: function pixelBoxStyles() { computeStyleTests(); return pixelBoxStylesVal; }, pixelPosition: function pixelPosition() { computeStyleTests(); return pixelPositionVal; }, reliableMarginLeft: function reliableMarginLeft() { computeStyleTests(); return reliableMarginLeftVal; }, scrollboxSize: function scrollboxSize() { computeStyleTests(); return scrollboxSizeVal; } });
                        })(); function curCSS(elem, name, computed) {
                            var width, minWidth, maxWidth, ret, style = elem.style; computed = computed || getStyles(elem); if (computed) {
                                ret = computed.getPropertyValue(name) || computed[name]; if (ret === "" && !jQuery.contains(elem.ownerDocument, elem)) { ret = jQuery.style(elem, name); }
                                if (!support.pixelBoxStyles() && rnumnonpx.test(ret) && rboxStyle.test(name)) { width = style.width; minWidth = style.minWidth; maxWidth = style.maxWidth; style.minWidth = style.maxWidth = style.width = ret; ret = computed.width; style.width = width; style.minWidth = minWidth; style.maxWidth = maxWidth; }
                            }
                            return ret !== undefined ? ret + "" : ret;
                        }
                        function addGetHookIf(conditionFn, hookFn) {
                            return {
                                get: function get() {
                                    if (conditionFn()) { delete this.get; return; }
                                    return (this.get = hookFn).apply(this, arguments);
                                }
                            };
                        }
                        var
                            rdisplayswap = /^(none|table(?!-c[ea]).+)/, rcustomProp = /^--/, cssShow = { position: "absolute", visibility: "hidden", display: "block" }, cssNormalTransform = { letterSpacing: "0", fontWeight: "400" }, cssPrefixes = ["Webkit", "Moz", "ms"], emptyStyle = document.createElement("div").style; function vendorPropName(name) {
                                if (name in emptyStyle) { return name; }
                                var capName = name[0].toUpperCase() + name.slice(1), i = cssPrefixes.length; while (i--) { name = cssPrefixes[i] + capName; if (name in emptyStyle) { return name; } }
                            }
                        function finalPropName(name) {
                            var ret = jQuery.cssProps[name]; if (!ret) { ret = jQuery.cssProps[name] = vendorPropName(name) || name; }
                            return ret;
                        }
                        function setPositiveNumber(elem, value, subtract) { var matches = rcssNum.exec(value); return matches ? Math.max(0, matches[2] - (subtract || 0)) + (matches[3] || "px") : value; }
                        function boxModelAdjustment(elem, dimension, box, isBorderBox, styles, computedVal) {
                            var i = dimension === "width" ? 1 : 0, extra = 0, delta = 0; if (box === (isBorderBox ? "border" : "content")) { return 0; }
                            for (; i < 4; i += 2) {
                                if (box === "margin") { delta += jQuery.css(elem, box + cssExpand[i], true, styles); }
                                if (!isBorderBox) { delta += jQuery.css(elem, "padding" + cssExpand[i], true, styles); if (box !== "padding") { delta += jQuery.css(elem, "border" + cssExpand[i] + "Width", true, styles); } else { extra += jQuery.css(elem, "border" + cssExpand[i] + "Width", true, styles); } } else {
                                    if (box === "content") { delta -= jQuery.css(elem, "padding" + cssExpand[i], true, styles); }
                                    if (box !== "margin") { delta -= jQuery.css(elem, "border" + cssExpand[i] + "Width", true, styles); }
                                }
                            }
                            if (!isBorderBox && computedVal >= 0) { delta += Math.max(0, Math.ceil(elem["offset" + dimension[0].toUpperCase() + dimension.slice(1)] - computedVal - delta - extra - 0.5)); }
                            return delta;
                        }
                        function getWidthOrHeight(elem, dimension, extra) {
                            var styles = getStyles(elem), val = curCSS(elem, dimension, styles), isBorderBox = jQuery.css(elem, "boxSizing", false, styles) === "border-box", valueIsBorderBox = isBorderBox; if (rnumnonpx.test(val)) {
                                if (!extra) { return val; }
                                val = "auto";
                            }
                            valueIsBorderBox = valueIsBorderBox && (support.boxSizingReliable() || val === elem.style[dimension]); if (val === "auto" || !parseFloat(val) && jQuery.css(elem, "display", false, styles) === "inline") { val = elem["offset" + dimension[0].toUpperCase() + dimension.slice(1)]; valueIsBorderBox = true; }
                            val = parseFloat(val) || 0; return val + boxModelAdjustment(elem, dimension, extra || (isBorderBox ? "border" : "content"), valueIsBorderBox, styles, val) + "px";
                        }
                        jQuery.extend({
                            cssHooks: { opacity: { get: function get(elem, computed) { if (computed) { var ret = curCSS(elem, "opacity"); return ret === "" ? "1" : ret; } } } }, cssNumber: { "animationIterationCount": true, "columnCount": true, "fillOpacity": true, "flexGrow": true, "flexShrink": true, "fontWeight": true, "lineHeight": true, "opacity": true, "order": true, "orphans": true, "widows": true, "zIndex": true, "zoom": true }, cssProps: {}, style: function style(elem, name, value, extra) {
                                if (!elem || elem.nodeType === 3 || elem.nodeType === 8 || !elem.style) { return; }
                                var ret, type, hooks, origName = camelCase(name), isCustomProp = rcustomProp.test(name), style = elem.style; if (!isCustomProp) { name = finalPropName(origName); }
                                hooks = jQuery.cssHooks[name] || jQuery.cssHooks[origName]; if (value !== undefined) {
                                    type = _typeof(value); if (type === "string" && (ret = rcssNum.exec(value)) && ret[1]) { value = adjustCSS(elem, name, ret); type = "number"; }
                                    if (value == null || value !== value) { return; }
                                    if (type === "number") { value += ret && ret[3] || (jQuery.cssNumber[origName] ? "" : "px"); }
                                    if (!support.clearCloneStyle && value === "" && name.indexOf("background") === 0) { style[name] = "inherit"; }
                                    if (!hooks || !("set" in hooks) || (value = hooks.set(elem, value, extra)) !== undefined) { if (isCustomProp) { style.setProperty(name, value); } else { style[name] = value; } }
                                } else {
                                    if (hooks && "get" in hooks && (ret = hooks.get(elem, false, extra)) !== undefined) { return ret; }
                                    return style[name];
                                }
                            }, css: function css(elem, name, extra, styles) {
                                var val, num, hooks, origName = camelCase(name), isCustomProp = rcustomProp.test(name); if (!isCustomProp) { name = finalPropName(origName); }
                                hooks = jQuery.cssHooks[name] || jQuery.cssHooks[origName]; if (hooks && "get" in hooks) { val = hooks.get(elem, true, extra); }
                                if (val === undefined) { val = curCSS(elem, name, styles); }
                                if (val === "normal" && name in cssNormalTransform) { val = cssNormalTransform[name]; }
                                if (extra === "" || extra) { num = parseFloat(val); return extra === true || isFinite(num) ? num || 0 : val; }
                                return val;
                            }
                        }); jQuery.each(["height", "width"], function (i, dimension) {
                            jQuery.cssHooks[dimension] = {
                                get: function get(elem, computed, extra) { if (computed) { return rdisplayswap.test(jQuery.css(elem, "display")) && (!elem.getClientRects().length || !elem.getBoundingClientRect().width) ? swap(elem, cssShow, function () { return getWidthOrHeight(elem, dimension, extra); }) : getWidthOrHeight(elem, dimension, extra); } }, set: function set(elem, value, extra) {
                                    var matches, styles = getStyles(elem), isBorderBox = jQuery.css(elem, "boxSizing", false, styles) === "border-box", subtract = extra && boxModelAdjustment(elem, dimension, extra, isBorderBox, styles); if (isBorderBox && support.scrollboxSize() === styles.position) { subtract -= Math.ceil(elem["offset" + dimension[0].toUpperCase() + dimension.slice(1)] - parseFloat(styles[dimension]) - boxModelAdjustment(elem, dimension, "border", false, styles) - 0.5); }
                                    if (subtract && (matches = rcssNum.exec(value)) && (matches[3] || "px") !== "px") { elem.style[dimension] = value; value = jQuery.css(elem, dimension); }
                                    return setPositiveNumber(elem, value, subtract);
                                }
                            };
                        }); jQuery.cssHooks.marginLeft = addGetHookIf(support.reliableMarginLeft, function (elem, computed) { if (computed) { return (parseFloat(curCSS(elem, "marginLeft")) || elem.getBoundingClientRect().left - swap(elem, { marginLeft: 0 }, function () { return elem.getBoundingClientRect().left; })) + "px"; } }); jQuery.each({ margin: "", padding: "", border: "Width" }, function (prefix, suffix) {
                            jQuery.cssHooks[prefix + suffix] = {
                                expand: function expand(value) {
                                    var i = 0, expanded = {}, parts = typeof value === "string" ? value.split(" ") : [value]; for (; i < 4; i++) { expanded[prefix + cssExpand[i] + suffix] = parts[i] || parts[i - 2] || parts[0]; }
                                    return expanded;
                                }
                            }; if (prefix !== "margin") { jQuery.cssHooks[prefix + suffix].set = setPositiveNumber; }
                        }); jQuery.fn.extend({
                            css: function css(name, value) {
                                return access(this, function (elem, name, value) {
                                    var styles, len, map = {}, i = 0; if (Array.isArray(name)) {
                                        styles = getStyles(elem); len = name.length; for (; i < len; i++) { map[name[i]] = jQuery.css(elem, name[i], false, styles); }
                                        return map;
                                    }
                                    return value !== undefined ? jQuery.style(elem, name, value) : jQuery.css(elem, name);
                                }, name, value, arguments.length > 1);
                            }
                        }); function Tween(elem, options, prop, end, easing) { return new Tween.prototype.init(elem, options, prop, end, easing); }
                        jQuery.Tween = Tween; Tween.prototype = {
                            constructor: Tween, init: function init(elem, options, prop, end, easing, unit) { this.elem = elem; this.prop = prop; this.easing = easing || jQuery.easing._default; this.options = options; this.start = this.now = this.cur(); this.end = end; this.unit = unit || (jQuery.cssNumber[prop] ? "" : "px"); }, cur: function cur() { var hooks = Tween.propHooks[this.prop]; return hooks && hooks.get ? hooks.get(this) : Tween.propHooks._default.get(this); }, run: function run(percent) {
                                var eased, hooks = Tween.propHooks[this.prop]; if (this.options.duration) { this.pos = eased = jQuery.easing[this.easing](percent, this.options.duration * percent, 0, 1, this.options.duration); } else { this.pos = eased = percent; }
                                this.now = (this.end - this.start) * eased + this.start; if (this.options.step) { this.options.step.call(this.elem, this.now, this); }
                                if (hooks && hooks.set) { hooks.set(this); } else { Tween.propHooks._default.set(this); }
                                return this;
                            }
                        }; Tween.prototype.init.prototype = Tween.prototype; Tween.propHooks = {
                            _default: {
                                get: function get(tween) {
                                    var result; if (tween.elem.nodeType !== 1 || tween.elem[tween.prop] != null && tween.elem.style[tween.prop] == null) { return tween.elem[tween.prop]; }
                                    result = jQuery.css(tween.elem, tween.prop, ""); return !result || result === "auto" ? 0 : result;
                                }, set: function set(tween) { if (jQuery.fx.step[tween.prop]) { jQuery.fx.step[tween.prop](tween); } else if (tween.elem.nodeType === 1 && (tween.elem.style[jQuery.cssProps[tween.prop]] != null || jQuery.cssHooks[tween.prop])) { jQuery.style(tween.elem, tween.prop, tween.now + tween.unit); } else { tween.elem[tween.prop] = tween.now; } }
                            }
                        }; Tween.propHooks.scrollTop = Tween.propHooks.scrollLeft = { set: function set(tween) { if (tween.elem.nodeType && tween.elem.parentNode) { tween.elem[tween.prop] = tween.now; } } }; jQuery.easing = { linear: function linear(p) { return p; }, swing: function swing(p) { return 0.5 - Math.cos(p * Math.PI) / 2; }, _default: "swing" }; jQuery.fx = Tween.prototype.init; jQuery.fx.step = {}; var fxNow, inProgress, rfxtypes = /^(?:toggle|show|hide)$/, rrun = /queueHooks$/; function schedule() {
                            if (inProgress) {
                                if (document.hidden === false && window.requestAnimationFrame) { window.requestAnimationFrame(schedule); } else { window.setTimeout(schedule, jQuery.fx.interval); }
                                jQuery.fx.tick();
                            }
                        }
                        function createFxNow() { window.setTimeout(function () { fxNow = undefined; }); return fxNow = Date.now(); }
                        function genFx(type, includeWidth) {
                            var which, i = 0, attrs = { height: type }; includeWidth = includeWidth ? 1 : 0; for (; i < 4; i += 2 - includeWidth) { which = cssExpand[i]; attrs["margin" + which] = attrs["padding" + which] = type; }
                            if (includeWidth) { attrs.opacity = attrs.width = type; }
                            return attrs;
                        }
                        function createTween(value, prop, animation) { var tween, collection = (Animation.tweeners[prop] || []).concat(Animation.tweeners["*"]), index = 0, length = collection.length; for (; index < length; index++) { if (tween = collection[index].call(animation, prop, value)) { return tween; } } }
                        function defaultPrefilter(elem, props, opts) {
                            var prop, value, toggle, hooks, oldfire, propTween, restoreDisplay, display, isBox = "width" in props || "height" in props, anim = this, orig = {}, style = elem.style, hidden = elem.nodeType && isHiddenWithinTree(elem), dataShow = dataPriv.get(elem, "fxshow"); if (!opts.queue) {
                                hooks = jQuery._queueHooks(elem, "fx"); if (hooks.unqueued == null) { hooks.unqueued = 0; oldfire = hooks.empty.fire; hooks.empty.fire = function () { if (!hooks.unqueued) { oldfire(); } }; }
                                hooks.unqueued++; anim.always(function () { anim.always(function () { hooks.unqueued--; if (!jQuery.queue(elem, "fx").length) { hooks.empty.fire(); } }); });
                            }
                            for (prop in props) {
                                value = props[prop]; if (rfxtypes.test(value)) {
                                    delete props[prop]; toggle = toggle || value === "toggle"; if (value === (hidden ? "hide" : "show")) { if (value === "show" && dataShow && dataShow[prop] !== undefined) { hidden = true; } else { continue; } }
                                    orig[prop] = dataShow && dataShow[prop] || jQuery.style(elem, prop);
                                }
                            }
                            propTween = !jQuery.isEmptyObject(props); if (!propTween && jQuery.isEmptyObject(orig)) { return; }
                            if (isBox && elem.nodeType === 1) {
                                opts.overflow = [style.overflow, style.overflowX, style.overflowY]; restoreDisplay = dataShow && dataShow.display; if (restoreDisplay == null) { restoreDisplay = dataPriv.get(elem, "display"); }
                                display = jQuery.css(elem, "display"); if (display === "none") { if (restoreDisplay) { display = restoreDisplay; } else { showHide([elem], true); restoreDisplay = elem.style.display || restoreDisplay; display = jQuery.css(elem, "display"); showHide([elem]); } }
                                if (display === "inline" || display === "inline-block" && restoreDisplay != null) {
                                    if (jQuery.css(elem, "float") === "none") {
                                        if (!propTween) { anim.done(function () { style.display = restoreDisplay; }); if (restoreDisplay == null) { display = style.display; restoreDisplay = display === "none" ? "" : display; } }
                                        style.display = "inline-block";
                                    }
                                }
                            }
                            if (opts.overflow) { style.overflow = "hidden"; anim.always(function () { style.overflow = opts.overflow[0]; style.overflowX = opts.overflow[1]; style.overflowY = opts.overflow[2]; }); }
                            propTween = false; for (prop in orig) {
                                if (!propTween) {
                                    if (dataShow) { if ("hidden" in dataShow) { hidden = dataShow.hidden; } } else { dataShow = dataPriv.access(elem, "fxshow", { display: restoreDisplay }); }
                                    if (toggle) { dataShow.hidden = !hidden; }
                                    if (hidden) { showHide([elem], true); }
                                    anim.done(function () {
                                        if (!hidden) { showHide([elem]); }
                                        dataPriv.remove(elem, "fxshow"); for (prop in orig) { jQuery.style(elem, prop, orig[prop]); }
                                    });
                                }
                                propTween = createTween(hidden ? dataShow[prop] : 0, prop, anim); if (!(prop in dataShow)) { dataShow[prop] = propTween.start; if (hidden) { propTween.end = propTween.start; propTween.start = 0; } }
                            }
                        }
                        function propFilter(props, specialEasing) {
                            var index, name, easing, value, hooks; for (index in props) {
                                name = camelCase(index); easing = specialEasing[name]; value = props[index]; if (Array.isArray(value)) { easing = value[1]; value = props[index] = value[0]; }
                                if (index !== name) { props[name] = value; delete props[index]; }
                                hooks = jQuery.cssHooks[name]; if (hooks && "expand" in hooks) { value = hooks.expand(value); delete props[name]; for (index in value) { if (!(index in props)) { props[index] = value[index]; specialEasing[index] = easing; } } } else { specialEasing[name] = easing; }
                            }
                        }
                        function Animation(elem, properties, options) {
                            var result, stopped, index = 0, length = Animation.prefilters.length, deferred = jQuery.Deferred().always(function () { delete tick.elem; }), tick = function tick() {
                                if (stopped) { return false; }
                                var currentTime = fxNow || createFxNow(), remaining = Math.max(0, animation.startTime + animation.duration - currentTime), temp = remaining / animation.duration || 0, percent = 1 - temp, index = 0, length = animation.tweens.length; for (; index < length; index++) { animation.tweens[index].run(percent); }
                                deferred.notifyWith(elem, [animation, percent, remaining]); if (percent < 1 && length) { return remaining; }
                                if (!length) { deferred.notifyWith(elem, [animation, 1, 0]); }
                                deferred.resolveWith(elem, [animation]); return false;
                            }, animation = deferred.promise({
                                elem: elem, props: jQuery.extend({}, properties), opts: jQuery.extend(true, { specialEasing: {}, easing: jQuery.easing._default }, options), originalProperties: properties, originalOptions: options, startTime: fxNow || createFxNow(), duration: options.duration, tweens: [], createTween: function createTween(prop, end) { var tween = jQuery.Tween(elem, animation.opts, prop, end, animation.opts.specialEasing[prop] || animation.opts.easing); animation.tweens.push(tween); return tween; }, stop: function stop(gotoEnd) {
                                    var index = 0, length = gotoEnd ? animation.tweens.length : 0; if (stopped) { return this; }
                                    stopped = true; for (; index < length; index++) { animation.tweens[index].run(1); }
                                    if (gotoEnd) { deferred.notifyWith(elem, [animation, 1, 0]); deferred.resolveWith(elem, [animation, gotoEnd]); } else { deferred.rejectWith(elem, [animation, gotoEnd]); }
                                    return this;
                                }
                            }), props = animation.props; propFilter(props, animation.opts.specialEasing); for (; index < length; index++) {
                                result = Animation.prefilters[index].call(animation, elem, props, animation.opts); if (result) {
                                    if (isFunction(result.stop)) { jQuery._queueHooks(animation.elem, animation.opts.queue).stop = result.stop.bind(result); }
                                    return result;
                                }
                            }
                            jQuery.map(props, createTween, animation); if (isFunction(animation.opts.start)) { animation.opts.start.call(elem, animation); }
                            animation.progress(animation.opts.progress).done(animation.opts.done, animation.opts.complete).fail(animation.opts.fail).always(animation.opts.always); jQuery.fx.timer(jQuery.extend(tick, { elem: elem, anim: animation, queue: animation.opts.queue })); return animation;
                        }
                        jQuery.Animation = jQuery.extend(Animation, {
                            tweeners: { "*": [function (prop, value) { var tween = this.createTween(prop, value); adjustCSS(tween.elem, prop, rcssNum.exec(value), tween); return tween; }] }, tweener: function tweener(props, callback) {
                                if (isFunction(props)) { callback = props; props = ["*"]; } else { props = props.match(rnothtmlwhite); }
                                var prop, index = 0, length = props.length; for (; index < length; index++) { prop = props[index]; Animation.tweeners[prop] = Animation.tweeners[prop] || []; Animation.tweeners[prop].unshift(callback); }
                            }, prefilters: [defaultPrefilter], prefilter: function prefilter(callback, prepend) { if (prepend) { Animation.prefilters.unshift(callback); } else { Animation.prefilters.push(callback); } }
                        }); jQuery.speed = function (speed, easing, fn) {
                            var opt = speed && _typeof(speed) === "object" ? jQuery.extend({}, speed) : { complete: fn || !fn && easing || isFunction(speed) && speed, duration: speed, easing: fn && easing || easing && !isFunction(easing) && easing }; if (jQuery.fx.off) { opt.duration = 0; } else { if (typeof opt.duration !== "number") { if (opt.duration in jQuery.fx.speeds) { opt.duration = jQuery.fx.speeds[opt.duration]; } else { opt.duration = jQuery.fx.speeds._default; } } }
                            if (opt.queue == null || opt.queue === true) { opt.queue = "fx"; }
                            opt.old = opt.complete; opt.complete = function () {
                                if (isFunction(opt.old)) { opt.old.call(this); }
                                if (opt.queue) { jQuery.dequeue(this, opt.queue); }
                            }; return opt;
                        }; jQuery.fn.extend({
                            fadeTo: function fadeTo(speed, to, easing, callback) { return this.filter(isHiddenWithinTree).css("opacity", 0).show().end().animate({ opacity: to }, speed, easing, callback); }, animate: function animate(prop, speed, easing, callback) { var empty = jQuery.isEmptyObject(prop), optall = jQuery.speed(speed, easing, callback), doAnimation = function doAnimation() { var anim = Animation(this, jQuery.extend({}, prop), optall); if (empty || dataPriv.get(this, "finish")) { anim.stop(true); } }; doAnimation.finish = doAnimation; return empty || optall.queue === false ? this.each(doAnimation) : this.queue(optall.queue, doAnimation); }, stop: function stop(type, clearQueue, gotoEnd) {
                                var stopQueue = function stopQueue(hooks) { var stop = hooks.stop; delete hooks.stop; stop(gotoEnd); }; if (typeof type !== "string") { gotoEnd = clearQueue; clearQueue = type; type = undefined; }
                                if (clearQueue && type !== false) { this.queue(type || "fx", []); }
                                return this.each(function () {
                                    var dequeue = true, index = type != null && type + "queueHooks", timers = jQuery.timers, data = dataPriv.get(this); if (index) { if (data[index] && data[index].stop) { stopQueue(data[index]); } } else { for (index in data) { if (data[index] && data[index].stop && rrun.test(index)) { stopQueue(data[index]); } } }
                                    for (index = timers.length; index--;) { if (timers[index].elem === this && (type == null || timers[index].queue === type)) { timers[index].anim.stop(gotoEnd); dequeue = false; timers.splice(index, 1); } }
                                    if (dequeue || !gotoEnd) { jQuery.dequeue(this, type); }
                                });
                            }, finish: function finish(type) {
                                if (type !== false) { type = type || "fx"; }
                                return this.each(function () {
                                    var index, data = dataPriv.get(this), queue = data[type + "queue"], hooks = data[type + "queueHooks"], timers = jQuery.timers, length = queue ? queue.length : 0; data.finish = true; jQuery.queue(this, type, []); if (hooks && hooks.stop) { hooks.stop.call(this, true); }
                                    for (index = timers.length; index--;) { if (timers[index].elem === this && timers[index].queue === type) { timers[index].anim.stop(true); timers.splice(index, 1); } }
                                    for (index = 0; index < length; index++) { if (queue[index] && queue[index].finish) { queue[index].finish.call(this); } }
                                    delete data.finish;
                                });
                            }
                        }); jQuery.each(["toggle", "show", "hide"], function (i, name) { var cssFn = jQuery.fn[name]; jQuery.fn[name] = function (speed, easing, callback) { return speed == null || typeof speed === "boolean" ? cssFn.apply(this, arguments) : this.animate(genFx(name, true), speed, easing, callback); }; }); jQuery.each({ slideDown: genFx("show"), slideUp: genFx("hide"), slideToggle: genFx("toggle"), fadeIn: { opacity: "show" }, fadeOut: { opacity: "hide" }, fadeToggle: { opacity: "toggle" } }, function (name, props) { jQuery.fn[name] = function (speed, easing, callback) { return this.animate(props, speed, easing, callback); }; }); jQuery.timers = []; jQuery.fx.tick = function () {
                            var timer, i = 0, timers = jQuery.timers; fxNow = Date.now(); for (; i < timers.length; i++) { timer = timers[i]; if (!timer() && timers[i] === timer) { timers.splice(i--, 1); } }
                            if (!timers.length) { jQuery.fx.stop(); }
                            fxNow = undefined;
                        }; jQuery.fx.timer = function (timer) { jQuery.timers.push(timer); jQuery.fx.start(); }; jQuery.fx.interval = 13; jQuery.fx.start = function () {
                            if (inProgress) { return; }
                            inProgress = true; schedule();
                        }; jQuery.fx.stop = function () { inProgress = null; }; jQuery.fx.speeds = { slow: 600, fast: 200, _default: 400 }; jQuery.fn.delay = function (time, type) { time = jQuery.fx ? jQuery.fx.speeds[time] || time : time; type = type || "fx"; return this.queue(type, function (next, hooks) { var timeout = window.setTimeout(next, time); hooks.stop = function () { window.clearTimeout(timeout); }; }); }; (function () { var input = document.createElement("input"), select = document.createElement("select"), opt = select.appendChild(document.createElement("option")); input.type = "checkbox"; support.checkOn = input.value !== ""; support.optSelected = opt.selected; input = document.createElement("input"); input.value = "t"; input.type = "radio"; support.radioValue = input.value === "t"; })(); var boolHook, attrHandle = jQuery.expr.attrHandle; jQuery.fn.extend({ attr: function attr(name, value) { return access(this, jQuery.attr, name, value, arguments.length > 1); }, removeAttr: function removeAttr(name) { return this.each(function () { jQuery.removeAttr(this, name); }); } }); jQuery.extend({
                            attr: function attr(elem, name, value) {
                                var ret, hooks, nType = elem.nodeType; if (nType === 3 || nType === 8 || nType === 2) { return; }
                                if (typeof elem.getAttribute === "undefined") { return jQuery.prop(elem, name, value); }
                                if (nType !== 1 || !jQuery.isXMLDoc(elem)) { hooks = jQuery.attrHooks[name.toLowerCase()] || (jQuery.expr.match.bool.test(name) ? boolHook : undefined); }
                                if (value !== undefined) {
                                    if (value === null) { jQuery.removeAttr(elem, name); return; }
                                    if (hooks && "set" in hooks && (ret = hooks.set(elem, value, name)) !== undefined) { return ret; }
                                    elem.setAttribute(name, value + ""); return value;
                                }
                                if (hooks && "get" in hooks && (ret = hooks.get(elem, name)) !== null) { return ret; }
                                ret = jQuery.find.attr(elem, name); return ret == null ? undefined : ret;
                            }, attrHooks: {
                                type: {
                                    set: function set(elem, value) {
                                        if (!support.radioValue && value === "radio" && nodeName(elem, "input")) {
                                            var val = elem.value; elem.setAttribute("type", value); if (val) { elem.value = val; }
                                            return value;
                                        }
                                    }
                                }
                            }, removeAttr: function removeAttr(elem, value) { var name, i = 0, attrNames = value && value.match(rnothtmlwhite); if (attrNames && elem.nodeType === 1) { while (name = attrNames[i++]) { elem.removeAttribute(name); } } }
                        }); boolHook = {
                            set: function set(elem, value, name) {
                                if (value === false) { jQuery.removeAttr(elem, name); } else { elem.setAttribute(name, name); }
                                return name;
                            }
                        }; jQuery.each(jQuery.expr.match.bool.source.match(/\w+/g), function (i, name) {
                            var getter = attrHandle[name] || jQuery.find.attr; attrHandle[name] = function (elem, name, isXML) {
                                var ret, handle, lowercaseName = name.toLowerCase(); if (!isXML) { handle = attrHandle[lowercaseName]; attrHandle[lowercaseName] = ret; ret = getter(elem, name, isXML) != null ? lowercaseName : null; attrHandle[lowercaseName] = handle; }
                                return ret;
                            };
                        }); var rfocusable = /^(?:input|select|textarea|button)$/i, rclickable = /^(?:a|area)$/i; jQuery.fn.extend({ prop: function prop(name, value) { return access(this, jQuery.prop, name, value, arguments.length > 1); }, removeProp: function removeProp(name) { return this.each(function () { delete this[jQuery.propFix[name] || name]; }); } }); jQuery.extend({
                            prop: function prop(elem, name, value) {
                                var ret, hooks, nType = elem.nodeType; if (nType === 3 || nType === 8 || nType === 2) { return; }
                                if (nType !== 1 || !jQuery.isXMLDoc(elem)) { name = jQuery.propFix[name] || name; hooks = jQuery.propHooks[name]; }
                                if (value !== undefined) {
                                    if (hooks && "set" in hooks && (ret = hooks.set(elem, value, name)) !== undefined) { return ret; }
                                    return elem[name] = value;
                                }
                                if (hooks && "get" in hooks && (ret = hooks.get(elem, name)) !== null) { return ret; }
                                return elem[name];
                            }, propHooks: {
                                tabIndex: {
                                    get: function get(elem) {
                                        var tabindex = jQuery.find.attr(elem, "tabindex"); if (tabindex) { return parseInt(tabindex, 10); }
                                        if (rfocusable.test(elem.nodeName) || rclickable.test(elem.nodeName) && elem.href) { return 0; }
                                        return -1;
                                    }
                                }
                            }, propFix: { "for": "htmlFor", "class": "className" }
                        }); if (!support.optSelected) {
                            jQuery.propHooks.selected = {
                                get: function get(elem) {
                                    var parent = elem.parentNode; if (parent && parent.parentNode) { parent.parentNode.selectedIndex; }
                                    return null;
                                }, set: function set(elem) { var parent = elem.parentNode; if (parent) { parent.selectedIndex; if (parent.parentNode) { parent.parentNode.selectedIndex; } } }
                            };
                        }
                        jQuery.each(["tabIndex", "readOnly", "maxLength", "cellSpacing", "cellPadding", "rowSpan", "colSpan", "useMap", "frameBorder", "contentEditable"], function () { jQuery.propFix[this.toLowerCase()] = this; }); function stripAndCollapse(value) { var tokens = value.match(rnothtmlwhite) || []; return tokens.join(" "); }
                        function getClass(elem) { return elem.getAttribute && elem.getAttribute("class") || ""; }
                        function classesToArray(value) {
                            if (Array.isArray(value)) { return value; }
                            if (typeof value === "string") { return value.match(rnothtmlwhite) || []; }
                            return [];
                        }
                        jQuery.fn.extend({
                            addClass: function addClass(value) {
                                var classes, elem, cur, curValue, clazz, j, finalValue, i = 0; if (isFunction(value)) { return this.each(function (j) { jQuery(this).addClass(value.call(this, j, getClass(this))); }); }
                                classes = classesToArray(value); if (classes.length) {
                                    while (elem = this[i++]) {
                                        curValue = getClass(elem); cur = elem.nodeType === 1 && " " + stripAndCollapse(curValue) + " "; if (cur) {
                                            j = 0; while (clazz = classes[j++]) { if (cur.indexOf(" " + clazz + " ") < 0) { cur += clazz + " "; } }
                                            finalValue = stripAndCollapse(cur); if (curValue !== finalValue) { elem.setAttribute("class", finalValue); }
                                        }
                                    }
                                }
                                return this;
                            }, removeClass: function removeClass(value) {
                                var classes, elem, cur, curValue, clazz, j, finalValue, i = 0; if (isFunction(value)) { return this.each(function (j) { jQuery(this).removeClass(value.call(this, j, getClass(this))); }); }
                                if (!arguments.length) { return this.attr("class", ""); }
                                classes = classesToArray(value); if (classes.length) {
                                    while (elem = this[i++]) {
                                        curValue = getClass(elem); cur = elem.nodeType === 1 && " " + stripAndCollapse(curValue) + " "; if (cur) {
                                            j = 0; while (clazz = classes[j++]) { while (cur.indexOf(" " + clazz + " ") > -1) { cur = cur.replace(" " + clazz + " ", " "); } }
                                            finalValue = stripAndCollapse(cur); if (curValue !== finalValue) { elem.setAttribute("class", finalValue); }
                                        }
                                    }
                                }
                                return this;
                            }, toggleClass: function toggleClass(value, stateVal) {
                                var type = _typeof(value), isValidValue = type === "string" || Array.isArray(value); if (typeof stateVal === "boolean" && isValidValue) { return stateVal ? this.addClass(value) : this.removeClass(value); }
                                if (isFunction(value)) { return this.each(function (i) { jQuery(this).toggleClass(value.call(this, i, getClass(this), stateVal), stateVal); }); }
                                return this.each(function () {
                                    var className, i, self, classNames; if (isValidValue) { i = 0; self = jQuery(this); classNames = classesToArray(value); while (className = classNames[i++]) { if (self.hasClass(className)) { self.removeClass(className); } else { self.addClass(className); } } } else if (value === undefined || type === "boolean") {
                                        className = getClass(this); if (className) { dataPriv.set(this, "__className__", className); }
                                        if (this.setAttribute) { this.setAttribute("class", className || value === false ? "" : dataPriv.get(this, "__className__") || ""); }
                                    }
                                });
                            }, hasClass: function hasClass(selector) {
                                var className, elem, i = 0; className = " " + selector + " "; while (elem = this[i++]) { if (elem.nodeType === 1 && (" " + stripAndCollapse(getClass(elem)) + " ").indexOf(className) > -1) { return true; } }
                                return false;
                            }
                        }); var rreturn = /\r/g; jQuery.fn.extend({
                            val: function val(value) {
                                var hooks, ret, valueIsFunction, elem = this[0]; if (!arguments.length) {
                                    if (elem) {
                                        hooks = jQuery.valHooks[elem.type] || jQuery.valHooks[elem.nodeName.toLowerCase()]; if (hooks && "get" in hooks && (ret = hooks.get(elem, "value")) !== undefined) { return ret; }
                                        ret = elem.value; if (typeof ret === "string") { return ret.replace(rreturn, ""); }
                                        return ret == null ? "" : ret;
                                    }
                                    return;
                                }
                                valueIsFunction = isFunction(value); return this.each(function (i) {
                                    var val; if (this.nodeType !== 1) { return; }
                                    if (valueIsFunction) { val = value.call(this, i, jQuery(this).val()); } else { val = value; }
                                    if (val == null) { val = ""; } else if (typeof val === "number") { val += ""; } else if (Array.isArray(val)) { val = jQuery.map(val, function (value) { return value == null ? "" : value + ""; }); }
                                    hooks = jQuery.valHooks[this.type] || jQuery.valHooks[this.nodeName.toLowerCase()]; if (!hooks || !("set" in hooks) || hooks.set(this, val, "value") === undefined) { this.value = val; }
                                });
                            }
                        }); jQuery.extend({
                            valHooks: {
                                option: { get: function get(elem) { var val = jQuery.find.attr(elem, "value"); return val != null ? val : stripAndCollapse(jQuery.text(elem)); } }, select: {
                                    get: function get(elem) {
                                        var value, option, i, options = elem.options, index = elem.selectedIndex, one = elem.type === "select-one", values = one ? null : [], max = one ? index + 1 : options.length; if (index < 0) { i = max; } else { i = one ? index : 0; }
                                        for (; i < max; i++) {
                                            option = options[i]; if ((option.selected || i === index) && !option.disabled && (!option.parentNode.disabled || !nodeName(option.parentNode, "optgroup"))) {
                                                value = jQuery(option).val(); if (one) { return value; }
                                                values.push(value);
                                            }
                                        }
                                        return values;
                                    }, set: function set(elem, value) {
                                        var optionSet, option, options = elem.options, values = jQuery.makeArray(value), i = options.length; while (i--) { option = options[i]; if (option.selected = jQuery.inArray(jQuery.valHooks.option.get(option), values) > -1) { optionSet = true; } }
                                        if (!optionSet) { elem.selectedIndex = -1; }
                                        return values;
                                    }
                                }
                            }
                        }); jQuery.each(["radio", "checkbox"], function () { jQuery.valHooks[this] = { set: function set(elem, value) { if (Array.isArray(value)) { return elem.checked = jQuery.inArray(jQuery(elem).val(), value) > -1; } } }; if (!support.checkOn) { jQuery.valHooks[this].get = function (elem) { return elem.getAttribute("value") === null ? "on" : elem.value; }; } }); support.focusin = "onfocusin" in window; var rfocusMorph = /^(?:focusinfocus|focusoutblur)$/, stopPropagationCallback = function stopPropagationCallback(e) { e.stopPropagation(); }; jQuery.extend(jQuery.event, {
                            trigger: function trigger(event, data, elem, onlyHandlers) {
                                var i, cur, tmp, bubbleType, ontype, handle, special, lastElement, eventPath = [elem || document], type = hasOwn.call(event, "type") ? event.type : event, namespaces = hasOwn.call(event, "namespace") ? event.namespace.split(".") : []; cur = lastElement = tmp = elem = elem || document; if (elem.nodeType === 3 || elem.nodeType === 8) { return; }
                                if (rfocusMorph.test(type + jQuery.event.triggered)) { return; }
                                if (type.indexOf(".") > -1) { namespaces = type.split("."); type = namespaces.shift(); namespaces.sort(); }
                                ontype = type.indexOf(":") < 0 && "on" + type; event = event[jQuery.expando] ? event : new jQuery.Event(type, _typeof(event) === "object" && event); event.isTrigger = onlyHandlers ? 2 : 3; event.namespace = namespaces.join("."); event.rnamespace = event.namespace ? new RegExp("(^|\\.)" + namespaces.join("\\.(?:.*\\.|)") + "(\\.|$)") : null; event.result = undefined; if (!event.target) { event.target = elem; }
                                data = data == null ? [event] : jQuery.makeArray(data, [event]); special = jQuery.event.special[type] || {}; if (!onlyHandlers && special.trigger && special.trigger.apply(elem, data) === false) { return; }
                                if (!onlyHandlers && !special.noBubble && !isWindow(elem)) {
                                    bubbleType = special.delegateType || type; if (!rfocusMorph.test(bubbleType + type)) { cur = cur.parentNode; }
                                    for (; cur; cur = cur.parentNode) { eventPath.push(cur); tmp = cur; }
                                    if (tmp === (elem.ownerDocument || document)) { eventPath.push(tmp.defaultView || tmp.parentWindow || window); }
                                }
                                i = 0; while ((cur = eventPath[i++]) && !event.isPropagationStopped()) {
                                    lastElement = cur; event.type = i > 1 ? bubbleType : special.bindType || type; handle = (dataPriv.get(cur, "events") || {})[event.type] && dataPriv.get(cur, "handle"); if (handle) { handle.apply(cur, data); }
                                    handle = ontype && cur[ontype]; if (handle && handle.apply && acceptData(cur)) { event.result = handle.apply(cur, data); if (event.result === false) { event.preventDefault(); } }
                                }
                                event.type = type; if (!onlyHandlers && !event.isDefaultPrevented()) {
                                    if ((!special._default || special._default.apply(eventPath.pop(), data) === false) && acceptData(elem)) {
                                        if (ontype && isFunction(elem[type]) && !isWindow(elem)) {
                                            tmp = elem[ontype]; if (tmp) { elem[ontype] = null; }
                                            jQuery.event.triggered = type; if (event.isPropagationStopped()) { lastElement.addEventListener(type, stopPropagationCallback); }
                                            elem[type](); if (event.isPropagationStopped()) { lastElement.removeEventListener(type, stopPropagationCallback); }
                                            jQuery.event.triggered = undefined; if (tmp) { elem[ontype] = tmp; }
                                        }
                                    }
                                }
                                return event.result;
                            }, simulate: function simulate(type, elem, event) { var e = jQuery.extend(new jQuery.Event(), event, { type: type, isSimulated: true }); jQuery.event.trigger(e, null, elem); }
                        }); jQuery.fn.extend({ trigger: function trigger(type, data) { return this.each(function () { jQuery.event.trigger(type, data, this); }); }, triggerHandler: function triggerHandler(type, data) { var elem = this[0]; if (elem) { return jQuery.event.trigger(type, data, elem, true); } } }); if (!support.focusin) {
                            jQuery.each({ focus: "focusin", blur: "focusout" }, function (orig, fix) {
                                var handler = function handler(event) { jQuery.event.simulate(fix, event.target, jQuery.event.fix(event)); }; jQuery.event.special[fix] = {
                                    setup: function setup() {
                                        var doc = this.ownerDocument || this, attaches = dataPriv.access(doc, fix); if (!attaches) { doc.addEventListener(orig, handler, true); }
                                        dataPriv.access(doc, fix, (attaches || 0) + 1);
                                    }, teardown: function teardown() { var doc = this.ownerDocument || this, attaches = dataPriv.access(doc, fix) - 1; if (!attaches) { doc.removeEventListener(orig, handler, true); dataPriv.remove(doc, fix); } else { dataPriv.access(doc, fix, attaches); } }
                                };
                            });
                        }
                        var location = window.location; var nonce = Date.now(); var rquery = /\?/; jQuery.parseXML = function (data) {
                            var xml; if (!data || typeof data !== "string") { return null; }
                            try { xml = new window.DOMParser().parseFromString(data, "text/xml"); } catch (e) { xml = undefined; }
                            if (!xml || xml.getElementsByTagName("parsererror").length) { jQuery.error("Invalid XML: " + data); }
                            return xml;
                        }; var rbracket = /\[\]$/, rCRLF = /\r?\n/g, rsubmitterTypes = /^(?:submit|button|image|reset|file)$/i, rsubmittable = /^(?:input|select|textarea|keygen)/i; function buildParams(prefix, obj, traditional, add) { var name; if (Array.isArray(obj)) { jQuery.each(obj, function (i, v) { if (traditional || rbracket.test(prefix)) { add(prefix, v); } else { buildParams(prefix + "[" + (_typeof(v) === "object" && v != null ? i : "") + "]", v, traditional, add); } }); } else if (!traditional && toType(obj) === "object") { for (name in obj) { buildParams(prefix + "[" + name + "]", obj[name], traditional, add); } } else { add(prefix, obj); } }
                        jQuery.param = function (a, traditional) {
                            var prefix, s = [], add = function add(key, valueOrFunction) { var value = isFunction(valueOrFunction) ? valueOrFunction() : valueOrFunction; s[s.length] = encodeURIComponent(key) + "=" + encodeURIComponent(value == null ? "" : value); }; if (Array.isArray(a) || a.jquery && !jQuery.isPlainObject(a)) { jQuery.each(a, function () { add(this.name, this.value); }); } else { for (prefix in a) { buildParams(prefix, a[prefix], traditional, add); } }
                            return s.join("&");
                        }; jQuery.fn.extend({
                            serialize: function serialize() { return jQuery.param(this.serializeArray()); }, serializeArray: function serializeArray() {
                                return this.map(function () { var elements = jQuery.prop(this, "elements"); return elements ? jQuery.makeArray(elements) : this; }).filter(function () { var type = this.type; return this.name && !jQuery(this).is(":disabled") && rsubmittable.test(this.nodeName) && !rsubmitterTypes.test(type) && (this.checked || !rcheckableType.test(type)); }).map(function (i, elem) {
                                    var val = jQuery(this).val(); if (val == null) { return null; }
                                    if (Array.isArray(val)) { return jQuery.map(val, function (val) { return { name: elem.name, value: val.replace(rCRLF, "\r\n") }; }); }
                                    return { name: elem.name, value: val.replace(rCRLF, "\r\n") };
                                }).get();
                            }
                        }); var r20 = /%20/g, rhash = /#.*$/, rantiCache = /([?&])_=[^&]*/, rheaders = /^(.*?):[ \t]*([^\r\n]*)$/mg, rlocalProtocol = /^(?:about|app|app-storage|.+-extension|file|res|widget):$/, rnoContent = /^(?:GET|HEAD)$/, rprotocol = /^\/\//, prefilters = {}, transports = {}, allTypes = "*/".concat("*"), originAnchor = document.createElement("a"); originAnchor.href = location.href; function addToPrefiltersOrTransports(structure) {
                            return function (dataTypeExpression, func) {
                                if (typeof dataTypeExpression !== "string") { func = dataTypeExpression; dataTypeExpression = "*"; }
                                var dataType, i = 0, dataTypes = dataTypeExpression.toLowerCase().match(rnothtmlwhite) || []; if (isFunction(func)) { while (dataType = dataTypes[i++]) { if (dataType[0] === "+") { dataType = dataType.slice(1) || "*"; (structure[dataType] = structure[dataType] || []).unshift(func); } else { (structure[dataType] = structure[dataType] || []).push(func); } } }
                            };
                        }
                        function inspectPrefiltersOrTransports(structure, options, originalOptions, jqXHR) {
                            var inspected = {}, seekingTransport = structure === transports; function inspect(dataType) { var selected; inspected[dataType] = true; jQuery.each(structure[dataType] || [], function (_, prefilterOrFactory) { var dataTypeOrTransport = prefilterOrFactory(options, originalOptions, jqXHR); if (typeof dataTypeOrTransport === "string" && !seekingTransport && !inspected[dataTypeOrTransport]) { options.dataTypes.unshift(dataTypeOrTransport); inspect(dataTypeOrTransport); return false; } else if (seekingTransport) { return !(selected = dataTypeOrTransport); } }); return selected; }
                            return inspect(options.dataTypes[0]) || !inspected["*"] && inspect("*");
                        }
                        function ajaxExtend(target, src) {
                            var key, deep, flatOptions = jQuery.ajaxSettings.flatOptions || {}; for (key in src) { if (src[key] !== undefined) { (flatOptions[key] ? target : deep || (deep = {}))[key] = src[key]; } }
                            if (deep) { jQuery.extend(true, target, deep); }
                            return target;
                        }
                        function ajaxHandleResponses(s, jqXHR, responses) {
                            var ct, type, finalDataType, firstDataType, contents = s.contents, dataTypes = s.dataTypes; while (dataTypes[0] === "*") { dataTypes.shift(); if (ct === undefined) { ct = s.mimeType || jqXHR.getResponseHeader("Content-Type"); } }
                            if (ct) { for (type in contents) { if (contents[type] && contents[type].test(ct)) { dataTypes.unshift(type); break; } } }
                            if (dataTypes[0] in responses) { finalDataType = dataTypes[0]; } else {
                                for (type in responses) {
                                    if (!dataTypes[0] || s.converters[type + " " + dataTypes[0]]) { finalDataType = type; break; }
                                    if (!firstDataType) { firstDataType = type; }
                                }
                                finalDataType = finalDataType || firstDataType;
                            }
                            if (finalDataType) {
                                if (finalDataType !== dataTypes[0]) { dataTypes.unshift(finalDataType); }
                                return responses[finalDataType];
                            }
                        }
                        function ajaxConvert(s, response, jqXHR, isSuccess) {
                            var conv2, current, conv, tmp, prev, converters = {}, dataTypes = s.dataTypes.slice(); if (dataTypes[1]) { for (conv in s.converters) { converters[conv.toLowerCase()] = s.converters[conv]; } }
                            current = dataTypes.shift(); while (current) {
                                if (s.responseFields[current]) { jqXHR[s.responseFields[current]] = response; }
                                if (!prev && isSuccess && s.dataFilter) { response = s.dataFilter(response, s.dataType); }
                                prev = current; current = dataTypes.shift(); if (current) {
                                    if (current === "*") { current = prev; } else if (prev !== "*" && prev !== current) {
                                        conv = converters[prev + " " + current] || converters["* " + current]; if (!conv) {
                                            for (conv2 in converters) {
                                                tmp = conv2.split(" "); if (tmp[1] === current) {
                                                    conv = converters[prev + " " + tmp[0]] || converters["* " + tmp[0]]; if (conv) {
                                                        if (conv === true) { conv = converters[conv2]; } else if (converters[conv2] !== true) { current = tmp[0]; dataTypes.unshift(tmp[1]); }
                                                        break;
                                                    }
                                                }
                                            }
                                        }
                                        if (conv !== true) { if (conv && s.throws) { response = conv(response); } else { try { response = conv(response); } catch (e) { return { state: "parsererror", error: conv ? e : "No conversion from " + prev + " to " + current }; } } }
                                    }
                                }
                            }
                            return { state: "success", data: response };
                        }
                        jQuery.extend({
                            active: 0, lastModified: {}, etag: {}, ajaxSettings: { url: location.href, type: "GET", isLocal: rlocalProtocol.test(location.protocol), global: true, processData: true, async: true, contentType: "application/x-www-form-urlencoded; charset=UTF-8", accepts: { "*": allTypes, text: "text/plain", html: "text/html", xml: "application/xml, text/xml", json: "application/json, text/javascript" }, contents: { xml: /\bxml\b/, html: /\bhtml/, json: /\bjson\b/ }, responseFields: { xml: "responseXML", text: "responseText", json: "responseJSON" }, converters: { "* text": String, "text html": true, "text json": JSON.parse, "text xml": jQuery.parseXML }, flatOptions: { url: true, context: true } }, ajaxSetup: function ajaxSetup(target, settings) { return settings ? ajaxExtend(ajaxExtend(target, jQuery.ajaxSettings), settings) : ajaxExtend(jQuery.ajaxSettings, target); }, ajaxPrefilter: addToPrefiltersOrTransports(prefilters), ajaxTransport: addToPrefiltersOrTransports(transports), ajax: function ajax(url, options) {
                                if (_typeof(url) === "object") { options = url; url = undefined; }
                                options = options || {}; var transport, cacheURL, responseHeadersString, responseHeaders, timeoutTimer, urlAnchor, completed, fireGlobals, i, uncached, s = jQuery.ajaxSetup({}, options), callbackContext = s.context || s, globalEventContext = s.context && (callbackContext.nodeType || callbackContext.jquery) ? jQuery(callbackContext) : jQuery.event, deferred = jQuery.Deferred(), completeDeferred = jQuery.Callbacks("once memory"), _statusCode = s.statusCode || {}, requestHeaders = {}, requestHeadersNames = {}, strAbort = "canceled", jqXHR = {
                                    readyState: 0, getResponseHeader: function getResponseHeader(key) {
                                        var match; if (completed) {
                                            if (!responseHeaders) { responseHeaders = {}; while (match = rheaders.exec(responseHeadersString)) { responseHeaders[match[1].toLowerCase()] = match[2]; } }
                                            match = responseHeaders[key.toLowerCase()];
                                        }
                                        return match == null ? null : match;
                                    }, getAllResponseHeaders: function getAllResponseHeaders() { return completed ? responseHeadersString : null; }, setRequestHeader: function setRequestHeader(name, value) {
                                        if (completed == null) { name = requestHeadersNames[name.toLowerCase()] = requestHeadersNames[name.toLowerCase()] || name; requestHeaders[name] = value; }
                                        return this;
                                    }, overrideMimeType: function overrideMimeType(type) {
                                        if (completed == null) { s.mimeType = type; }
                                        return this;
                                    }, statusCode: function statusCode(map) {
                                        var code; if (map) { if (completed) { jqXHR.always(map[jqXHR.status]); } else { for (code in map) { _statusCode[code] = [_statusCode[code], map[code]]; } } }
                                        return this;
                                    }, abort: function abort(statusText) {
                                        var finalText = statusText || strAbort; if (transport) { transport.abort(finalText); }
                                        done(0, finalText); return this;
                                    }
                                }; deferred.promise(jqXHR); s.url = ((url || s.url || location.href) + "").replace(rprotocol, location.protocol + "//"); s.type = options.method || options.type || s.method || s.type; s.dataTypes = (s.dataType || "*").toLowerCase().match(rnothtmlwhite) || [""]; if (s.crossDomain == null) { urlAnchor = document.createElement("a"); try { urlAnchor.href = s.url; urlAnchor.href = urlAnchor.href; s.crossDomain = originAnchor.protocol + "//" + originAnchor.host !== urlAnchor.protocol + "//" + urlAnchor.host; } catch (e) { s.crossDomain = true; } }
                                if (s.data && s.processData && typeof s.data !== "string") { s.data = jQuery.param(s.data, s.traditional); }
                                inspectPrefiltersOrTransports(prefilters, s, options, jqXHR); if (completed) { return jqXHR; }
                                fireGlobals = jQuery.event && s.global; if (fireGlobals && jQuery.active++ === 0) { jQuery.event.trigger("ajaxStart"); }
                                s.type = s.type.toUpperCase(); s.hasContent = !rnoContent.test(s.type); cacheURL = s.url.replace(rhash, ""); if (!s.hasContent) {
                                    uncached = s.url.slice(cacheURL.length); if (s.data && (s.processData || typeof s.data === "string")) { cacheURL += (rquery.test(cacheURL) ? "&" : "?") + s.data; delete s.data; }
                                    if (s.cache === false) { cacheURL = cacheURL.replace(rantiCache, "$1"); uncached = (rquery.test(cacheURL) ? "&" : "?") + "_=" + nonce++ + uncached; }
                                    s.url = cacheURL + uncached;
                                } else if (s.data && s.processData && (s.contentType || "").indexOf("application/x-www-form-urlencoded") === 0) { s.data = s.data.replace(r20, "+"); }
                                if (s.ifModified) {
                                    if (jQuery.lastModified[cacheURL]) { jqXHR.setRequestHeader("If-Modified-Since", jQuery.lastModified[cacheURL]); }
                                    if (jQuery.etag[cacheURL]) { jqXHR.setRequestHeader("If-None-Match", jQuery.etag[cacheURL]); }
                                }
                                if (s.data && s.hasContent && s.contentType !== false || options.contentType) { jqXHR.setRequestHeader("Content-Type", s.contentType); }
                                jqXHR.setRequestHeader("Accept", s.dataTypes[0] && s.accepts[s.dataTypes[0]] ? s.accepts[s.dataTypes[0]] + (s.dataTypes[0] !== "*" ? ", " + allTypes + "; q=0.01" : "") : s.accepts["*"]); for (i in s.headers) { jqXHR.setRequestHeader(i, s.headers[i]); }
                                if (s.beforeSend && (s.beforeSend.call(callbackContext, jqXHR, s) === false || completed)) { return jqXHR.abort(); }
                                strAbort = "abort"; completeDeferred.add(s.complete); jqXHR.done(s.success); jqXHR.fail(s.error); transport = inspectPrefiltersOrTransports(transports, s, options, jqXHR); if (!transport) { done(-1, "No Transport"); } else {
                                    jqXHR.readyState = 1; if (fireGlobals) { globalEventContext.trigger("ajaxSend", [jqXHR, s]); }
                                    if (completed) { return jqXHR; }
                                    if (s.async && s.timeout > 0) { timeoutTimer = window.setTimeout(function () { jqXHR.abort("timeout"); }, s.timeout); }
                                    try { completed = false; transport.send(requestHeaders, done); } catch (e) {
                                        if (completed) { throw e; }
                                        done(-1, e);
                                    }
                                }
                                function done(status, nativeStatusText, responses, headers) {
                                    var isSuccess, success, error, response, modified, statusText = nativeStatusText; if (completed) { return; }
                                    completed = true; if (timeoutTimer) { window.clearTimeout(timeoutTimer); }
                                    transport = undefined; responseHeadersString = headers || ""; jqXHR.readyState = status > 0 ? 4 : 0; isSuccess = status >= 200 && status < 300 || status === 304; if (responses) { response = ajaxHandleResponses(s, jqXHR, responses); }
                                    response = ajaxConvert(s, response, jqXHR, isSuccess); if (isSuccess) {
                                        if (s.ifModified) {
                                            modified = jqXHR.getResponseHeader("Last-Modified"); if (modified) { jQuery.lastModified[cacheURL] = modified; }
                                            modified = jqXHR.getResponseHeader("etag"); if (modified) { jQuery.etag[cacheURL] = modified; }
                                        }
                                        if (status === 204 || s.type === "HEAD") { statusText = "nocontent"; } else if (status === 304) { statusText = "notmodified"; } else { statusText = response.state; success = response.data; error = response.error; isSuccess = !error; }
                                    } else { error = statusText; if (status || !statusText) { statusText = "error"; if (status < 0) { status = 0; } } }
                                    jqXHR.status = status; jqXHR.statusText = (nativeStatusText || statusText) + ""; if (isSuccess) { deferred.resolveWith(callbackContext, [success, statusText, jqXHR]); } else { deferred.rejectWith(callbackContext, [jqXHR, statusText, error]); }
                                    jqXHR.statusCode(_statusCode); _statusCode = undefined; if (fireGlobals) { globalEventContext.trigger(isSuccess ? "ajaxSuccess" : "ajaxError", [jqXHR, s, isSuccess ? success : error]); }
                                    completeDeferred.fireWith(callbackContext, [jqXHR, statusText]); if (fireGlobals) { globalEventContext.trigger("ajaxComplete", [jqXHR, s]); if (!--jQuery.active) { jQuery.event.trigger("ajaxStop"); } }
                                }
                                return jqXHR;
                            }, getJSON: function getJSON(url, data, callback) { return jQuery.get(url, data, callback, "json"); }, getScript: function getScript(url, callback) { return jQuery.get(url, undefined, callback, "script"); }
                        }); jQuery.each(["get", "post"], function (i, method) {
                            jQuery[method] = function (url, data, callback, type) {
                                if (isFunction(data)) { type = type || callback; callback = data; data = undefined; }
                                return jQuery.ajax(jQuery.extend({ url: url, type: method, dataType: type, data: data, success: callback }, jQuery.isPlainObject(url) && url));
                            };
                        }); jQuery._evalUrl = function (url) { return jQuery.ajax({ url: url, type: "GET", dataType: "script", cache: true, async: false, global: false, "throws": true }); }; jQuery.fn.extend({
                            wrapAll: function wrapAll(html) {
                                var wrap; if (this[0]) {
                                    if (isFunction(html)) { html = html.call(this[0]); }
                                    wrap = jQuery(html, this[0].ownerDocument).eq(0).clone(true); if (this[0].parentNode) { wrap.insertBefore(this[0]); }
                                    wrap.map(function () {
                                        var elem = this; while (elem.firstElementChild) { elem = elem.firstElementChild; }
                                        return elem;
                                    }).append(this);
                                }
                                return this;
                            }, wrapInner: function wrapInner(html) {
                                if (isFunction(html)) { return this.each(function (i) { jQuery(this).wrapInner(html.call(this, i)); }); }
                                return this.each(function () { var self = jQuery(this), contents = self.contents(); if (contents.length) { contents.wrapAll(html); } else { self.append(html); } });
                            }, wrap: function wrap(html) { var htmlIsFunction = isFunction(html); return this.each(function (i) { jQuery(this).wrapAll(htmlIsFunction ? html.call(this, i) : html); }); }, unwrap: function unwrap(selector) { this.parent(selector).not("body").each(function () { jQuery(this).replaceWith(this.childNodes); }); return this; }
                        }); jQuery.expr.pseudos.hidden = function (elem) { return !jQuery.expr.pseudos.visible(elem); }; jQuery.expr.pseudos.visible = function (elem) { return !!(elem.offsetWidth || elem.offsetHeight || elem.getClientRects().length); }; jQuery.ajaxSettings.xhr = function () { try { return new window.XMLHttpRequest(); } catch (e) { } }; var xhrSuccessStatus = { 0: 200, 1223: 204 }, xhrSupported = jQuery.ajaxSettings.xhr(); support.cors = !!xhrSupported && "withCredentials" in xhrSupported; support.ajax = xhrSupported = !!xhrSupported; jQuery.ajaxTransport(function (options) {
                            var _callback, errorCallback; if (support.cors || xhrSupported && !options.crossDomain) {
                                return {
                                    send: function send(headers, complete) {
                                        var i, xhr = options.xhr(); xhr.open(options.type, options.url, options.async, options.username, options.password); if (options.xhrFields) { for (i in options.xhrFields) { xhr[i] = options.xhrFields[i]; } }
                                        if (options.mimeType && xhr.overrideMimeType) { xhr.overrideMimeType(options.mimeType); }
                                        if (!options.crossDomain && !headers["X-Requested-With"]) { headers["X-Requested-With"] = "XMLHttpRequest"; }
                                        for (i in headers) { xhr.setRequestHeader(i, headers[i]); }
                                        _callback = function callback(type) { return function () { if (_callback) { _callback = errorCallback = xhr.onload = xhr.onerror = xhr.onabort = xhr.ontimeout = xhr.onreadystatechange = null; if (type === "abort") { xhr.abort(); } else if (type === "error") { if (typeof xhr.status !== "number") { complete(0, "error"); } else { complete(xhr.status, xhr.statusText); } } else { complete(xhrSuccessStatus[xhr.status] || xhr.status, xhr.statusText, (xhr.responseType || "text") !== "text" || typeof xhr.responseText !== "string" ? { binary: xhr.response } : { text: xhr.responseText }, xhr.getAllResponseHeaders()); } } }; }; xhr.onload = _callback(); errorCallback = xhr.onerror = xhr.ontimeout = _callback("error"); if (xhr.onabort !== undefined) { xhr.onabort = errorCallback; } else { xhr.onreadystatechange = function () { if (xhr.readyState === 4) { window.setTimeout(function () { if (_callback) { errorCallback(); } }); } }; }
                                        _callback = _callback("abort"); try { xhr.send(options.hasContent && options.data || null); } catch (e) { if (_callback) { throw e; } }
                                    }, abort: function abort() { if (_callback) { _callback(); } }
                                };
                            }
                        }); jQuery.ajaxPrefilter(function (s) { if (s.crossDomain) { s.contents.script = false; } }); jQuery.ajaxSetup({ accepts: { script: "text/javascript, application/javascript, " + "application/ecmascript, application/x-ecmascript" }, contents: { script: /\b(?:java|ecma)script\b/ }, converters: { "text script": function textScript(text) { jQuery.globalEval(text); return text; } } }); jQuery.ajaxPrefilter("script", function (s) {
                            if (s.cache === undefined) { s.cache = false; }
                            if (s.crossDomain) { s.type = "GET"; }
                        }); jQuery.ajaxTransport("script", function (s) { if (s.crossDomain) { var script, _callback2; return { send: function send(_, complete) { script = jQuery("<script>").prop({ charset: s.scriptCharset, src: s.url }).on("load error", _callback2 = function callback(evt) { script.remove(); _callback2 = null; if (evt) { complete(evt.type === "error" ? 404 : 200, evt.type); } }); document.head.appendChild(script[0]); }, abort: function abort() { if (_callback2) { _callback2(); } } }; } }); var oldCallbacks = [], rjsonp = /(=)\?(?=&|$)|\?\?/; jQuery.ajaxSetup({ jsonp: "callback", jsonpCallback: function jsonpCallback() { var callback = oldCallbacks.pop() || jQuery.expando + "_" + nonce++; this[callback] = true; return callback; } }); jQuery.ajaxPrefilter("json jsonp", function (s, originalSettings, jqXHR) {
                            var callbackName, overwritten, responseContainer, jsonProp = s.jsonp !== false && (rjsonp.test(s.url) ? "url" : typeof s.data === "string" && (s.contentType || "").indexOf("application/x-www-form-urlencoded") === 0 && rjsonp.test(s.data) && "data"); if (jsonProp || s.dataTypes[0] === "jsonp") {
                                callbackName = s.jsonpCallback = isFunction(s.jsonpCallback) ? s.jsonpCallback() : s.jsonpCallback; if (jsonProp) { s[jsonProp] = s[jsonProp].replace(rjsonp, "$1" + callbackName); } else if (s.jsonp !== false) { s.url += (rquery.test(s.url) ? "&" : "?") + s.jsonp + "=" + callbackName; }
                                s.converters["script json"] = function () {
                                    if (!responseContainer) { jQuery.error(callbackName + " was not called"); }
                                    return responseContainer[0];
                                }; s.dataTypes[0] = "json"; overwritten = window[callbackName]; window[callbackName] = function () { responseContainer = arguments; }; jqXHR.always(function () {
                                    if (overwritten === undefined) { jQuery(window).removeProp(callbackName); } else { window[callbackName] = overwritten; }
                                    if (s[callbackName]) { s.jsonpCallback = originalSettings.jsonpCallback; oldCallbacks.push(callbackName); }
                                    if (responseContainer && isFunction(overwritten)) { overwritten(responseContainer[0]); }
                                    responseContainer = overwritten = undefined;
                                }); return "script";
                            }
                        }); support.createHTMLDocument = function () { var body = document.implementation.createHTMLDocument("").body; body.innerHTML = "<form></form><form></form>"; return body.childNodes.length === 2; }(); jQuery.parseHTML = function (data, context, keepScripts) {
                            if (typeof data !== "string") { return []; }
                            if (typeof context === "boolean") { keepScripts = context; context = false; }
                            var base, parsed, scripts; if (!context) { if (support.createHTMLDocument) { context = document.implementation.createHTMLDocument(""); base = context.createElement("base"); base.href = document.location.href; context.head.appendChild(base); } else { context = document; } }
                            parsed = rsingleTag.exec(data); scripts = !keepScripts && []; if (parsed) { return [context.createElement(parsed[1])]; }
                            parsed = buildFragment([data], context, scripts); if (scripts && scripts.length) { jQuery(scripts).remove(); }
                            return jQuery.merge([], parsed.childNodes);
                        }; jQuery.fn.load = function (url, params, callback) {
                            var selector, type, response, self = this, off = url.indexOf(" "); if (off > -1) { selector = stripAndCollapse(url.slice(off)); url = url.slice(0, off); }
                            if (isFunction(params)) { callback = params; params = undefined; } else if (params && _typeof(params) === "object") { type = "POST"; }
                            if (self.length > 0) { jQuery.ajax({ url: url, type: type || "GET", dataType: "html", data: params }).done(function (responseText) { response = arguments; self.html(selector ? jQuery("<div>").append(jQuery.parseHTML(responseText)).find(selector) : responseText); }).always(callback && function (jqXHR, status) { self.each(function () { callback.apply(this, response || [jqXHR.responseText, status, jqXHR]); }); }); }
                            return this;
                        }; jQuery.each(["ajaxStart", "ajaxStop", "ajaxComplete", "ajaxError", "ajaxSuccess", "ajaxSend"], function (i, type) { jQuery.fn[type] = function (fn) { return this.on(type, fn); }; }); jQuery.expr.pseudos.animated = function (elem) { return jQuery.grep(jQuery.timers, function (fn) { return elem === fn.elem; }).length; }; jQuery.offset = {
                            setOffset: function setOffset(elem, options, i) {
                                var curPosition, curLeft, curCSSTop, curTop, curOffset, curCSSLeft, calculatePosition, position = jQuery.css(elem, "position"), curElem = jQuery(elem), props = {}; if (position === "static") { elem.style.position = "relative"; }
                                curOffset = curElem.offset(); curCSSTop = jQuery.css(elem, "top"); curCSSLeft = jQuery.css(elem, "left"); calculatePosition = (position === "absolute" || position === "fixed") && (curCSSTop + curCSSLeft).indexOf("auto") > -1; if (calculatePosition) { curPosition = curElem.position(); curTop = curPosition.top; curLeft = curPosition.left; } else { curTop = parseFloat(curCSSTop) || 0; curLeft = parseFloat(curCSSLeft) || 0; }
                                if (isFunction(options)) { options = options.call(elem, i, jQuery.extend({}, curOffset)); }
                                if (options.top != null) { props.top = options.top - curOffset.top + curTop; }
                                if (options.left != null) { props.left = options.left - curOffset.left + curLeft; }
                                if ("using" in options) { options.using.call(elem, props); } else { curElem.css(props); }
                            }
                        }; jQuery.fn.extend({
                            offset: function offset(options) {
                                if (arguments.length) { return options === undefined ? this : this.each(function (i) { jQuery.offset.setOffset(this, options, i); }); }
                                var rect, win, elem = this[0]; if (!elem) { return; }
                                if (!elem.getClientRects().length) { return { top: 0, left: 0 }; }
                                rect = elem.getBoundingClientRect(); win = elem.ownerDocument.defaultView; return { top: rect.top + win.pageYOffset, left: rect.left + win.pageXOffset };
                            }, position: function position() {
                                if (!this[0]) { return; }
                                var offsetParent, offset, doc, elem = this[0], parentOffset = { top: 0, left: 0 }; if (jQuery.css(elem, "position") === "fixed") { offset = elem.getBoundingClientRect(); } else {
                                    offset = this.offset(); doc = elem.ownerDocument; offsetParent = elem.offsetParent || doc.documentElement; while (offsetParent && (offsetParent === doc.body || offsetParent === doc.documentElement) && jQuery.css(offsetParent, "position") === "static") { offsetParent = offsetParent.parentNode; }
                                    if (offsetParent && offsetParent !== elem && offsetParent.nodeType === 1) { parentOffset = jQuery(offsetParent).offset(); parentOffset.top += jQuery.css(offsetParent, "borderTopWidth", true); parentOffset.left += jQuery.css(offsetParent, "borderLeftWidth", true); }
                                }
                                return { top: offset.top - parentOffset.top - jQuery.css(elem, "marginTop", true), left: offset.left - parentOffset.left - jQuery.css(elem, "marginLeft", true) };
                            }, offsetParent: function offsetParent() {
                                return this.map(function () {
                                    var offsetParent = this.offsetParent; while (offsetParent && jQuery.css(offsetParent, "position") === "static") { offsetParent = offsetParent.offsetParent; }
                                    return offsetParent || documentElement;
                                });
                            }
                        }); jQuery.each({ scrollLeft: "pageXOffset", scrollTop: "pageYOffset" }, function (method, prop) {
                            var top = "pageYOffset" === prop; jQuery.fn[method] = function (val) {
                                return access(this, function (elem, method, val) {
                                    var win; if (isWindow(elem)) { win = elem; } else if (elem.nodeType === 9) { win = elem.defaultView; }
                                    if (val === undefined) { return win ? win[prop] : elem[method]; }
                                    if (win) { win.scrollTo(!top ? val : win.pageXOffset, top ? val : win.pageYOffset); } else { elem[method] = val; }
                                }, method, val, arguments.length);
                            };
                        }); jQuery.each(["top", "left"], function (i, prop) { jQuery.cssHooks[prop] = addGetHookIf(support.pixelPosition, function (elem, computed) { if (computed) { computed = curCSS(elem, prop); return rnumnonpx.test(computed) ? jQuery(elem).position()[prop] + "px" : computed; } }); }); jQuery.each({ Height: "height", Width: "width" }, function (name, type) {
                            jQuery.each({ padding: "inner" + name, content: type, "": "outer" + name }, function (defaultExtra, funcName) {
                                jQuery.fn[funcName] = function (margin, value) {
                                    var chainable = arguments.length && (defaultExtra || typeof margin !== "boolean"), extra = defaultExtra || (margin === true || value === true ? "margin" : "border"); return access(this, function (elem, type, value) {
                                        var doc; if (isWindow(elem)) { return funcName.indexOf("outer") === 0 ? elem["inner" + name] : elem.document.documentElement["client" + name]; }
                                        if (elem.nodeType === 9) { doc = elem.documentElement; return Math.max(elem.body["scroll" + name], doc["scroll" + name], elem.body["offset" + name], doc["offset" + name], doc["client" + name]); }
                                        return value === undefined ? jQuery.css(elem, type, extra) : jQuery.style(elem, type, value, extra);
                                    }, type, chainable ? margin : undefined, chainable);
                                };
                            });
                        }); jQuery.each(("blur focus focusin focusout resize scroll click dblclick " + "mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave " + "change select submit keydown keypress keyup contextmenu").split(" "), function (i, name) { jQuery.fn[name] = function (data, fn) { return arguments.length > 0 ? this.on(name, null, data, fn) : this.trigger(name); }; }); jQuery.fn.extend({ hover: function hover(fnOver, fnOut) { return this.mouseenter(fnOver).mouseleave(fnOut || fnOver); } }); jQuery.fn.extend({ bind: function bind(types, data, fn) { return this.on(types, null, data, fn); }, unbind: function unbind(types, fn) { return this.off(types, null, fn); }, delegate: function delegate(selector, types, data, fn) { return this.on(types, selector, data, fn); }, undelegate: function undelegate(selector, types, fn) { return arguments.length === 1 ? this.off(selector, "**") : this.off(types, selector || "**", fn); } }); jQuery.proxy = function (fn, context) {
                            var tmp, args, proxy; if (typeof context === "string") { tmp = fn[context]; context = fn; fn = tmp; }
                            if (!isFunction(fn)) { return undefined; }
                            args = _slice.call(arguments, 2); proxy = function proxy() { return fn.apply(context || this, args.concat(_slice.call(arguments))); }; proxy.guid = fn.guid = fn.guid || jQuery.guid++; return proxy;
                        }; jQuery.holdReady = function (hold) { if (hold) { jQuery.readyWait++; } else { jQuery.ready(true); } }; jQuery.isArray = Array.isArray; jQuery.parseJSON = JSON.parse; jQuery.nodeName = nodeName; jQuery.isFunction = isFunction; jQuery.isWindow = isWindow; jQuery.camelCase = camelCase; jQuery.type = toType; jQuery.now = Date.now; jQuery.isNumeric = function (obj) { var type = jQuery.type(obj); return (type === "number" || type === "string") && !isNaN(obj - parseFloat(obj)); }; if (true) { !(__WEBPACK_AMD_DEFINE_ARRAY__ = [], __WEBPACK_AMD_DEFINE_RESULT__ = (function () { return jQuery; }).apply(exports, __WEBPACK_AMD_DEFINE_ARRAY__), __WEBPACK_AMD_DEFINE_RESULT__ !== undefined && (module.exports = __WEBPACK_AMD_DEFINE_RESULT__)); }
                        var
                            _jQuery = window.jQuery, _$ = window.$; jQuery.noConflict = function (deep) {
                                if (window.$ === jQuery) { window.$ = _$; }
                                if (deep && window.jQuery === jQuery) { window.jQuery = _jQuery; }
                                return jQuery;
                            }; if (!noGlobal) { window.jQuery = window.$ = jQuery; }
                        return jQuery;
                    });
                }.call(this, __webpack_require__(
                    /*! ./../../webpack/buildin/module.js */
                    "./node_modules/webpack/buildin/module.js")(module)))
            }), "./node_modules/js-cookie/src/js.cookie.js":
            /*!*************************************************!*\
              !*** ./node_modules/js-cookie/src/js.cookie.js ***!
              \*************************************************/
            /*! no static exports found */
            (function (module, exports, __webpack_require__) {
                var __WEBPACK_AMD_DEFINE_FACTORY__, __WEBPACK_AMD_DEFINE_RESULT__; function _typeof(obj) { if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); };
                /*!
                 * JavaScript Cookie v2.2.1
                 * https://github.com/js-cookie/js-cookie
                 *
                 * Copyright 2006, 2015 Klaus Hartl & Fagner Brack
                 * Released under the MIT license
                 */
                (function (factory) {
                    var registeredInModuleLoader; if (true) { !(__WEBPACK_AMD_DEFINE_FACTORY__ = (factory), __WEBPACK_AMD_DEFINE_RESULT__ = (typeof __WEBPACK_AMD_DEFINE_FACTORY__ === 'function' ? (__WEBPACK_AMD_DEFINE_FACTORY__.call(exports, __webpack_require__, exports, module)) : __WEBPACK_AMD_DEFINE_FACTORY__), __WEBPACK_AMD_DEFINE_RESULT__ !== undefined && (module.exports = __WEBPACK_AMD_DEFINE_RESULT__)); registeredInModuleLoader = true; }
                    if ((false ? undefined : _typeof(exports)) === 'object') { module.exports = factory(); registeredInModuleLoader = true; }
                    if (!registeredInModuleLoader) { var OldCookies = window.Cookies; var api = window.Cookies = factory(); api.noConflict = function () { window.Cookies = OldCookies; return api; }; }
                })(function () {
                    function extend() {
                        var i = 0; var result = {}; for (; i < arguments.length; i++) { var attributes = arguments[i]; for (var key in attributes) { result[key] = attributes[key]; } }
                        return result;
                    }
                    function decode(s) { return s.replace(/(%[0-9A-Z]{2})+/g, decodeURIComponent); }
                    function init(converter) {
                        function api() { }
                        function set(key, value, attributes) {
                            if (typeof document === 'undefined') { return; }
                            attributes = extend({ path: '/' }, api.defaults, attributes); if (typeof attributes.expires === 'number') { attributes.expires = new Date(new Date() * 1 + attributes.expires * 864e+5); }
                            attributes.expires = attributes.expires ? attributes.expires.toUTCString() : ''; try { var result = JSON.stringify(value); if (/^[\{\[]/.test(result)) { value = result; } } catch (e) { }
                            value = converter.write ? converter.write(value, key) : encodeURIComponent(String(value)).replace(/%(23|24|26|2B|3A|3C|3E|3D|2F|3F|40|5B|5D|5E|60|7B|7D|7C)/g, decodeURIComponent); key = encodeURIComponent(String(key)).replace(/%(23|24|26|2B|5E|60|7C)/g, decodeURIComponent).replace(/[\(\)]/g, escape); var stringifiedAttributes = ''; for (var attributeName in attributes) {
                                if (!attributes[attributeName]) { continue; }
                                stringifiedAttributes += '; ' + attributeName; if (attributes[attributeName] === true) { continue; }
                                stringifiedAttributes += '=' + attributes[attributeName].split(';')[0];
                            }
                            return document.cookie = key + '=' + value + stringifiedAttributes;
                        }
                        function get(key, json) {
                            if (typeof document === 'undefined') { return; }
                            var jar = {}; var cookies = document.cookie ? document.cookie.split('; ') : []; var i = 0; for (; i < cookies.length; i++) {
                                var parts = cookies[i].split('='); var cookie = parts.slice(1).join('='); if (!json && cookie.charAt(0) === '"') { cookie = cookie.slice(1, -1); }
                                try {
                                    var name = decode(parts[0]); cookie = (converter.read || converter)(cookie, name) || decode(cookie); if (json) { try { cookie = JSON.parse(cookie); } catch (e) { } }
                                    jar[name] = cookie; if (key === name) { break; }
                                } catch (e) { }
                            }
                            return key ? jar[key] : jar;
                        }
                        api.set = set; api.get = function (key) { return get(key, false); }; api.getJSON = function (key) { return get(key, true); }; api.remove = function (key, attributes) { set(key, '', extend(attributes, { expires: -1 })); }; api.defaults = {}; api.withConverter = init; return api;
                    }
                    return init(function () { });
                });
            }), "./node_modules/object-fit-images/dist/ofi.common-js.js":
            /*!**************************************************************!*\
              !*** ./node_modules/object-fit-images/dist/ofi.common-js.js ***!
              \**************************************************************/
            /*! no static exports found */
            (function (module, exports, __webpack_require__) {
                "use strict";
                /*! npm.im/object-fit-images 3.2.4 */
                var OFI = 'bfred-it:object-fit-images'; var propRegex = /(object-fit|object-position)\s*:\s*([-.\w\s%]+)/g; var testImg = typeof Image === 'undefined' ? { style: { 'object-position': 1 } } : new Image(); var supportsObjectFit = 'object-fit' in testImg.style; var supportsObjectPosition = 'object-position' in testImg.style; var supportsOFI = 'background-size' in testImg.style; var supportsCurrentSrc = typeof testImg.currentSrc === 'string'; var nativeGetAttribute = testImg.getAttribute; var nativeSetAttribute = testImg.setAttribute; var autoModeEnabled = false; function createPlaceholder(w, h) { return "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='" + w + "' height='" + h + "'%3E%3C/svg%3E"; }
                function polyfillCurrentSrc(el) {
                    if (el.srcset && !supportsCurrentSrc && window.picturefill) {
                        var pf = window.picturefill._; if (!el[pf.ns] || !el[pf.ns].evaled) { pf.fillImg(el, { reselect: true }); }
                        if (!el[pf.ns].curSrc) { el[pf.ns].supported = false; pf.fillImg(el, { reselect: true }); }
                        el.currentSrc = el[pf.ns].curSrc || el.src;
                    }
                }
                function getStyle(el) {
                    var style = getComputedStyle(el).fontFamily; var parsed; var props = {}; while ((parsed = propRegex.exec(style)) !== null) { props[parsed[1]] = parsed[2]; }
                    return props;
                }
                function setPlaceholder(img, width, height) { var placeholder = createPlaceholder(width || 1, height || 0); if (nativeGetAttribute.call(img, 'src') !== placeholder) { nativeSetAttribute.call(img, 'src', placeholder); } }
                function onImageReady(img, callback) { if (img.naturalWidth) { callback(img); } else { setTimeout(onImageReady, 100, img, callback); } }
                function fixOne(el) {
                    var style = getStyle(el); var ofi = el[OFI]; style['object-fit'] = style['object-fit'] || 'fill'; if (!ofi.img) {
                        if (style['object-fit'] === 'fill') { return; }
                        if (!ofi.skipTest && supportsObjectFit && !style['object-position']) { return; }
                    }
                    if (!ofi.img) {
                        ofi.img = new Image(el.width, el.height); ofi.img.srcset = nativeGetAttribute.call(el, "data-ofi-srcset") || el.srcset; ofi.img.src = nativeGetAttribute.call(el, "data-ofi-src") || el.src; nativeSetAttribute.call(el, "data-ofi-src", el.src); if (el.srcset) { nativeSetAttribute.call(el, "data-ofi-srcset", el.srcset); }
                        setPlaceholder(el, el.naturalWidth || el.width, el.naturalHeight || el.height); if (el.srcset) { el.srcset = ''; }
                        try { keepSrcUsable(el); } catch (err) { if (window.console) { console.warn('https://bit.ly/ofi-old-browser'); } }
                    }
                    polyfillCurrentSrc(ofi.img); el.style.backgroundImage = "url(\"" + (ofi.img.currentSrc || ofi.img.src).replace(/"/g, '\\"') + "\")"; el.style.backgroundPosition = style['object-position'] || 'center'; el.style.backgroundRepeat = 'no-repeat'; el.style.backgroundOrigin = 'content-box'; if (/scale-down/.test(style['object-fit'])) { onImageReady(ofi.img, function () { if (ofi.img.naturalWidth > el.width || ofi.img.naturalHeight > el.height) { el.style.backgroundSize = 'contain'; } else { el.style.backgroundSize = 'auto'; } }); } else { el.style.backgroundSize = style['object-fit'].replace('none', 'auto').replace('fill', '100% 100%'); }
                    onImageReady(ofi.img, function (img) { setPlaceholder(el, img.naturalWidth, img.naturalHeight); });
                }
                function keepSrcUsable(el) { var descriptors = { get: function get(prop) { return el[OFI].img[prop ? prop : 'src']; }, set: function set(value, prop) { el[OFI].img[prop ? prop : 'src'] = value; nativeSetAttribute.call(el, "data-ofi-" + prop, value); fixOne(el); return value; } }; Object.defineProperty(el, 'src', descriptors); Object.defineProperty(el, 'currentSrc', { get: function get() { return descriptors.get('currentSrc'); } }); Object.defineProperty(el, 'srcset', { get: function get() { return descriptors.get('srcset'); }, set: function set(ss) { return descriptors.set(ss, 'srcset'); } }); }
                function hijackAttributes() {
                    function getOfiImageMaybe(el, name) { return el[OFI] && el[OFI].img && (name === 'src' || name === 'srcset') ? el[OFI].img : el; }
                    if (!supportsObjectPosition) { HTMLImageElement.prototype.getAttribute = function (name) { return nativeGetAttribute.call(getOfiImageMaybe(this, name), name); }; HTMLImageElement.prototype.setAttribute = function (name, value) { return nativeSetAttribute.call(getOfiImageMaybe(this, name), name, String(value)); }; }
                }
                function fix(imgs, opts) {
                    var startAutoMode = !autoModeEnabled && !imgs; opts = opts || {}; imgs = imgs || 'img'; if (supportsObjectPosition && !opts.skipTest || !supportsOFI) { return false; }
                    if (imgs === 'img') { imgs = document.getElementsByTagName('img'); } else if (typeof imgs === 'string') { imgs = document.querySelectorAll(imgs); } else if (!('length' in imgs)) { imgs = [imgs]; }
                    for (var i = 0; i < imgs.length; i++) { imgs[i][OFI] = imgs[i][OFI] || { skipTest: opts.skipTest }; fixOne(imgs[i]); }
                    if (startAutoMode) { document.body.addEventListener('load', function (e) { if (e.target.tagName === 'IMG') { fix(e.target, { skipTest: opts.skipTest }); } }, true); autoModeEnabled = true; imgs = 'img'; }
                    if (opts.watchMQ) { window.addEventListener('resize', fix.bind(null, imgs, { skipTest: opts.skipTest })); }
                }
                fix.supportsObjectFit = supportsObjectFit; fix.supportsObjectPosition = supportsObjectPosition; hijackAttributes(); module.exports = fix;
            }), "./node_modules/scroll-out/lib/index.js":
            /*!**********************************************!*\
              !*** ./node_modules/scroll-out/lib/index.js ***!
              \**********************************************/
            /*! no static exports found */
            (function (module, exports, __webpack_require__) {
                "use strict"; function clamp(v, min, max) { return min > v ? min : max < v ? max : v; }
                function sign(x) { return +(x > 0) - +(x < 0); }
                function round(n) { return Math.round(n * 10000) / 10000; }
                var cache = {}; function replacer(match) { return '-' + match[0].toLowerCase(); }
                function hyphenate(value) { return cache[value] || (cache[value] = value.replace(/([A-Z])/g, replacer)); }
                function $(e, parent) { return !e || e.length === 0 ? [] : e.nodeName ? [e] : [].slice.call(e[0].nodeName ? e : (parent || document.documentElement).querySelectorAll(e)); }
                function setAttrs(el, attrs) { for (var key in attrs) { if (key.indexOf('_')) { el.setAttribute('data-' + hyphenate(key), attrs[key]); } } }
                function setProps(cssProps) { return function (el, props) { for (var key in props) { if (key.indexOf('_') && (cssProps === true || cssProps[key])) { el.style.setProperty('--' + hyphenate(key), round(props[key])); } } }; }
                var clearTask; var subscribers = []; function loop() { clearTask = 0; subscribers.slice().forEach(function (s2) { return s2(); }); enqueue(); }
                function enqueue() { if (!clearTask && subscribers.length) { clearTask = requestAnimationFrame(loop); } }
                function subscribe(fn) { subscribers.push(fn); enqueue(); return function () { subscribers = subscribers.filter(function (s) { return s !== fn; }); if (!subscribers.length && clearTask) { cancelAnimationFrame(clearTask); clearTask = 0; } }; }
                function unwrap(value, el, ctx, doc) { return typeof value === 'function' ? value(el, ctx, doc) : value; }
                function noop() { }
                function main(opts) {
                    opts = opts || {}; var onChange = opts.onChange || noop; var onHidden = opts.onHidden || noop; var onShown = opts.onShown || noop; var onScroll = opts.onScroll || noop; var props = opts.cssProps ? setProps(opts.cssProps) : noop; var se = opts.scrollingElement; var container = se ? $(se)[0] : window; var doc = se ? $(se)[0] : document.documentElement; var rootChanged = false; var scrollingElementContext = {}; var elementContextList = []; var clientOffsetX, clientOffsety; var sub; function index() { elementContextList = $(opts.targets || '[data-scroll]', $(opts.scope || doc)[0]).map(function (el) { return { element: el }; }); }
                    function update() {
                        var clientWidth = doc.clientWidth; var clientHeight = doc.clientHeight; var scrollDirX = sign(-clientOffsetX + (clientOffsetX = doc.scrollLeft || window.pageXOffset)); var scrollDirY = sign(-clientOffsety + (clientOffsety = doc.scrollTop || window.pageYOffset)); var scrollPercentX = doc.scrollLeft / (doc.scrollWidth - clientWidth || 1); var scrollPercentY = doc.scrollTop / (doc.scrollHeight - clientHeight || 1); rootChanged = rootChanged || scrollingElementContext.scrollDirX !== scrollDirX || scrollingElementContext.scrollDirY !== scrollDirY || scrollingElementContext.scrollPercentX !== scrollPercentX || scrollingElementContext.scrollPercentY !== scrollPercentY; scrollingElementContext.scrollDirX = scrollDirX; scrollingElementContext.scrollDirY = scrollDirY; scrollingElementContext.scrollPercentX = scrollPercentX; scrollingElementContext.scrollPercentY = scrollPercentY; var childChanged = false; for (var index_1 = 0; index_1 < elementContextList.length; index_1++) {
                            var ctx = elementContextList[index_1]; var element = ctx.element; var target = element; var offsetX = 0; var offsetY = 0; do { offsetX += target.offsetLeft; offsetY += target.offsetTop; target = target.offsetParent; } while (target && target !== container); var elementHeight = element.clientHeight || element.offsetHeight || 0; var elementWidth = element.clientWidth || element.offsetWidth || 0; var visibleX = (clamp(offsetX + elementWidth, clientOffsetX, clientOffsetX + clientWidth) - clamp(offsetX, clientOffsetX, clientOffsetX + clientWidth)) / elementWidth; var visibleY = (clamp(offsetY + elementHeight, clientOffsety, clientOffsety + clientHeight) - clamp(offsetY, clientOffsety, clientOffsety + clientHeight)) / elementHeight; var intersectX = visibleX === 1 ? 0 : sign(offsetX - clientOffsetX); var intersectY = visibleY === 1 ? 0 : sign(offsetY - clientOffsety); var viewportX = clamp((clientOffsetX - (elementWidth / 2 + offsetX - clientWidth / 2)) / (clientWidth / 2), -1, 1); var viewportY = clamp((clientOffsety - (elementHeight / 2 + offsetY - clientHeight / 2)) / (clientHeight / 2), -1, 1); var visible = void 0; if (opts.offset) { visible = unwrap(opts.offset, element, ctx, doc) <= clientOffsety ? 1 : 0; } else if ((unwrap(opts.threshold, element, ctx, doc) || 0) < visibleX * visibleY) { visible = 1; } else { visible = 0; }
                            var changedVisible = ctx.visible !== visible; var changed = ctx._changed || changedVisible || ctx.visibleX !== visibleX || ctx.visibleY !== visibleY || ctx.index !== index_1 || ctx.elementHeight !== elementHeight || ctx.elementWidth !== elementWidth || ctx.offsetX !== offsetX || ctx.offsetY !== offsetY || ctx.intersectX !== ctx.intersectX || ctx.intersectY !== ctx.intersectY || ctx.viewportX !== viewportX || ctx.viewportY !== viewportY; if (changed) { childChanged = true; ctx._changed = true; ctx._visibleChanged = changedVisible; ctx.visible = visible; ctx.elementHeight = elementHeight; ctx.elementWidth = elementWidth; ctx.index = index_1; ctx.offsetX = offsetX; ctx.offsetY = offsetY; ctx.visibleX = visibleX; ctx.visibleY = visibleY; ctx.intersectX = intersectX; ctx.intersectY = intersectY; ctx.viewportX = viewportX; ctx.viewportY = viewportY; ctx.visible = visible; }
                        }
                        if (!sub && (rootChanged || childChanged)) { sub = subscribe(render); }
                    }
                    function render() {
                        maybeUnsubscribe(); if (rootChanged) { rootChanged = false; setAttrs(doc, { scrollDirX: scrollingElementContext.scrollDirX, scrollDirY: scrollingElementContext.scrollDirY }); props(doc, scrollingElementContext); onScroll(doc, scrollingElementContext, elementContextList); }
                        var len = elementContextList.length; for (var x = len - 1; x > -1; x--) {
                            var ctx = elementContextList[x]; var el = ctx.element; var visible = ctx.visible; var justOnce = el.hasAttribute('scrollout-once') || false; if (ctx._changed) { ctx._changed = false; props(el, ctx); }
                            if (ctx._visibleChanged) { setAttrs(el, { scroll: visible ? 'in' : 'out' }); onChange(el, ctx, doc); (visible ? onShown : onHidden)(el, ctx, doc); }
                            if (visible && (opts.once || justOnce)) { elementContextList.splice(x, 1); }
                        }
                    }
                    function maybeUnsubscribe() { if (sub) { sub(); sub = undefined; } }
                    index(); update(); render(); var updateTaskId = 0; var onUpdate = function onUpdate() { updateTaskId = updateTaskId || setTimeout(function () { updateTaskId = 0; update(); }, 0); }; window.addEventListener('resize', onUpdate); container.addEventListener('scroll', onUpdate); return { index: index, update: update, teardown: function teardown() { maybeUnsubscribe(); window.removeEventListener('resize', onUpdate); container.removeEventListener('scroll', onUpdate); } };
                }
                module.exports = main;
            }), "./node_modules/webpack/buildin/module.js":
            /*!***********************************!*\
              !*** (webpack)/buildin/module.js ***!
              \***********************************/
            /*! no static exports found */
            (function (module, exports) {
                module.exports = function (module) {
                    if (!module.webpackPolyfill) { module.deprecate = function () { }; module.paths = []; if (!module.children) module.children = []; Object.defineProperty(module, "loaded", { enumerable: true, get: function get() { return module.l; } }); Object.defineProperty(module, "id", { enumerable: true, get: function get() { return module.i; } }); module.webpackPolyfill = 1; }
                    return module;
                };
            }), "./node_modules/what-input/dist/what-input.js":
            /*!****************************************************!*\
              !*** ./node_modules/what-input/dist/what-input.js ***!
              \****************************************************/
            /*! no static exports found */
            (function (module, exports, __webpack_require__) {
                (function (module) {
                    var __WEBPACK_AMD_DEFINE_FACTORY__, __WEBPACK_AMD_DEFINE_ARRAY__, __WEBPACK_AMD_DEFINE_RESULT__; function _typeof(obj) { if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }
                    (function webpackUniversalModuleDefinition(root, factory) { if ((false ? undefined : _typeof(exports)) === 'object' && (false ? undefined : _typeof(module)) === 'object') module.exports = factory(); else if (true) !(__WEBPACK_AMD_DEFINE_ARRAY__ = [], __WEBPACK_AMD_DEFINE_FACTORY__ = (factory), __WEBPACK_AMD_DEFINE_RESULT__ = (typeof __WEBPACK_AMD_DEFINE_FACTORY__ === 'function' ? (__WEBPACK_AMD_DEFINE_FACTORY__.apply(exports, __WEBPACK_AMD_DEFINE_ARRAY__)) : __WEBPACK_AMD_DEFINE_FACTORY__), __WEBPACK_AMD_DEFINE_RESULT__ !== undefined && (module.exports = __WEBPACK_AMD_DEFINE_RESULT__)); else { } })(this, function () {
                        return (function (modules) {
                            var installedModules = {}; function __webpack_require__(moduleId) {
                                if (installedModules[moduleId])
                                    return installedModules[moduleId].exports; var module = installedModules[moduleId] = { exports: {}, id: moduleId, loaded: false }; modules[moduleId].call(module.exports, module, module.exports, __webpack_require__); module.loaded = true; return module.exports;
                            }
                            __webpack_require__.m = modules; __webpack_require__.c = installedModules; __webpack_require__.p = ""; return __webpack_require__(0);
                        }([function (module, exports) {
                            'use strict'; module.exports = function () {
                                if (typeof document === 'undefined' || typeof window === 'undefined') { return { ask: function ask() { return 'initial'; }, element: function element() { return null; }, ignoreKeys: function ignoreKeys() { }, specificKeys: function specificKeys() { }, registerOnChange: function registerOnChange() { }, unRegisterOnChange: function unRegisterOnChange() { } }; }
                                var docElem = document.documentElement; var currentElement = null; var currentInput = 'initial'; var currentIntent = currentInput; try {
                                    if (window.sessionStorage.getItem('what-input')) { currentInput = window.sessionStorage.getItem('what-input'); }
                                    if (window.sessionStorage.getItem('what-intent')) { currentIntent = window.sessionStorage.getItem('what-intent'); }
                                } catch (e) { }
                                var eventTimer = null; var formInputs = ['input', 'select', 'textarea']; var functionList = []; var ignoreMap = [16, 17, 18, 91, 93]; var specificMap = []; var inputMap = { keydown: 'keyboard', keyup: 'keyboard', mousedown: 'mouse', mousemove: 'mouse', MSPointerDown: 'pointer', MSPointerMove: 'pointer', pointerdown: 'pointer', pointermove: 'pointer', touchstart: 'touch' }; var isBuffering = false; var isScrolling = false; var mousePos = { x: null, y: null }; var pointerMap = { 2: 'touch', 3: 'touch', 4: 'mouse' }; var supportsPassive = false; try { var opts = Object.defineProperty({}, 'passive', { get: function get() { supportsPassive = true; } }); window.addEventListener('test', null, opts); } catch (e) { }
                                var setUp = function setUp() { inputMap[detectWheel()] = 'mouse'; addListeners(); doUpdate('input'); doUpdate('intent'); }; var addListeners = function addListeners() {
                                    var options = supportsPassive ? { passive: true } : false; if (window.PointerEvent) { window.addEventListener('pointerdown', setInput); window.addEventListener('pointermove', setIntent); } else if (window.MSPointerEvent) { window.addEventListener('MSPointerDown', setInput); window.addEventListener('MSPointerMove', setIntent); } else { window.addEventListener('mousedown', setInput); window.addEventListener('mousemove', setIntent); if ('ontouchstart' in window) { window.addEventListener('touchstart', eventBuffer, options); window.addEventListener('touchend', setInput); } }
                                    window.addEventListener(detectWheel(), setIntent, options); window.addEventListener('keydown', eventBuffer); window.addEventListener('keyup', eventBuffer); window.addEventListener('focusin', setElement); window.addEventListener('focusout', clearElement);
                                }; var setInput = function setInput(event) {
                                    if (!isBuffering) {
                                        var eventKey = event.which; var value = inputMap[event.type]; if (value === 'pointer') { value = pointerType(event); }
                                        var ignoreMatch = !specificMap.length && ignoreMap.indexOf(eventKey) === -1; var specificMatch = specificMap.length && specificMap.indexOf(eventKey) !== -1; var shouldUpdate = value === 'keyboard' && eventKey && (ignoreMatch || specificMatch) || value === 'mouse' || value === 'touch'; if (currentInput !== value && shouldUpdate) {
                                            currentInput = value; try { window.sessionStorage.setItem('what-input', currentInput); } catch (e) { }
                                            doUpdate('input');
                                        }
                                        if (currentIntent !== value && shouldUpdate) {
                                            var activeElem = document.activeElement; var notFormInput = activeElem && activeElem.nodeName && formInputs.indexOf(activeElem.nodeName.toLowerCase()) === -1; if (notFormInput) {
                                                currentIntent = value; try { window.sessionStorage.setItem('what-intent', currentIntent); } catch (e) { }
                                                doUpdate('intent');
                                            }
                                        }
                                    }
                                }; var doUpdate = function doUpdate(which) { docElem.setAttribute('data-what' + which, which === 'input' ? currentInput : currentIntent); fireFunctions(which); }; var setIntent = function setIntent(event) {
                                    detectScrolling(event); if (!isBuffering && !isScrolling) {
                                        var value = inputMap[event.type]; if (value === 'pointer') { value = pointerType(event); }
                                        if (currentIntent !== value) {
                                            currentIntent = value; try { window.sessionStorage.setItem('what-intent', currentIntent); } catch (e) { }
                                            doUpdate('intent');
                                        }
                                    }
                                }; var setElement = function setElement(event) {
                                    if (!event.target.nodeName) { clearElement(); return; }
                                    currentElement = event.target.nodeName.toLowerCase(); docElem.setAttribute('data-whatelement', currentElement); if (event.target.classList && event.target.classList.length) { docElem.setAttribute('data-whatclasses', event.target.classList.toString().replace(' ', ',')); }
                                }; var clearElement = function clearElement() { currentElement = null; docElem.removeAttribute('data-whatelement'); docElem.removeAttribute('data-whatclasses'); }; var eventBuffer = function eventBuffer(event) { setInput(event); window.clearTimeout(eventTimer); isBuffering = true; eventTimer = window.setTimeout(function () { isBuffering = false; }, 100); }; var pointerType = function pointerType(event) { if (typeof event.pointerType === 'number') { return pointerMap[event.pointerType]; } else { return event.pointerType === 'pen' ? 'touch' : event.pointerType; } }; var detectWheel = function detectWheel() {
                                    var wheelType = void 0; if ('onwheel' in document.createElement('div')) { wheelType = 'wheel'; } else { wheelType = document.onmousewheel !== undefined ? 'mousewheel' : 'DOMMouseScroll'; }
                                    return wheelType;
                                }; var fireFunctions = function fireFunctions(type) { for (var i = 0, len = functionList.length; i < len; i++) { if (functionList[i].type === type) { functionList[i].fn.call(undefined, type === 'input' ? currentInput : currentIntent); } } }; var objPos = function objPos(match) { for (var i = 0, len = functionList.length; i < len; i++) { if (functionList[i].fn === match) { return i; } } }; var detectScrolling = function detectScrolling(event) { if (mousePos['x'] !== event.screenX || mousePos['y'] !== event.screenY) { isScrolling = false; mousePos['x'] = event.screenX; mousePos['y'] = event.screenY; } else { isScrolling = true; } }; if ('addEventListener' in window && Array.prototype.indexOf) { setUp(); }
                                return { ask: function ask(opt) { return opt === 'intent' ? currentIntent : currentInput; }, element: function element() { return currentElement; }, ignoreKeys: function ignoreKeys(arr) { ignoreMap = arr; }, specificKeys: function specificKeys(arr) { specificMap = arr; }, registerOnChange: function registerOnChange(fn, eventType) { functionList.push({ fn: fn, type: eventType || 'input' }); }, unRegisterOnChange: function unRegisterOnChange(fn) { var position = objPos(fn); if (position || position === 0) { functionList.splice(position, 1); } } };
                            }();
                        }]));
                    });;
                }.call(this, __webpack_require__(
                    /*! ./../../webpack/buildin/module.js */
                    "./node_modules/webpack/buildin/module.js")(module)))
            }), "./src/assets/js/app.js":
            /*!******************************!*\
              !*** ./src/assets/js/app.js ***!
              \******************************/
            /*! no exports provided */
            (function (module, __webpack_exports__, __webpack_require__) {
                "use strict"; __webpack_require__.r(__webpack_exports__); var jquery__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(
                    /*! jquery */
                    "./node_modules/jquery/dist/jquery.js"); var jquery__WEBPACK_IMPORTED_MODULE_0___default = __webpack_require__.n(jquery__WEBPACK_IMPORTED_MODULE_0__); var what_input__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(
                        /*! what-input */
                        "./node_modules/what-input/dist/what-input.js"); var what_input__WEBPACK_IMPORTED_MODULE_1___default = __webpack_require__.n(what_input__WEBPACK_IMPORTED_MODULE_1__); var object_fit_images__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(
                            /*! object-fit-images */
                            "./node_modules/object-fit-images/dist/ofi.common-js.js"); var object_fit_images__WEBPACK_IMPORTED_MODULE_2___default = __webpack_require__.n(object_fit_images__WEBPACK_IMPORTED_MODULE_2__); var scroll_out__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(
                                /*! scroll-out */
                                "./node_modules/scroll-out/lib/index.js"); var scroll_out__WEBPACK_IMPORTED_MODULE_3___default = __webpack_require__.n(scroll_out__WEBPACK_IMPORTED_MODULE_3__); var js_cookie__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(
                                    /*! js-cookie */
                                    "./node_modules/js-cookie/src/js.cookie.js"); var js_cookie__WEBPACK_IMPORTED_MODULE_4___default = __webpack_require__.n(js_cookie__WEBPACK_IMPORTED_MODULE_4__); window.jQuery = jquery__WEBPACK_IMPORTED_MODULE_0___default.a; __webpack_require__(
                                        /*! foundation-sites */
                                        "./node_modules/foundation-sites/dist/js/foundation.esm.js"); (function () {
                                            'use strict'; var ClickyMenus = function ClickyMenus(menu) {
                                                var container = menu.parentElement, currentMenuItem, i, len; this.init = function () { menuSetup(); document.addEventListener('click', closeOpenMenu); }; function toggleOnMenuClick(e) {
                                                    var button = e.currentTarget; if (currentMenuItem && button !== currentMenuItem) { toggleSubmenu(currentMenuItem); }
                                                    toggleSubmenu(button);
                                                }; function toggleSubmenu(button) { var submenu = document.getElementById(button.getAttribute('aria-controls')); if ('true' === button.getAttribute('aria-expanded')) { button.setAttribute('aria-expanded', false); submenu.setAttribute('aria-hidden', true); currentMenuItem = false; } else { button.setAttribute('aria-expanded', true); submenu.setAttribute('aria-hidden', false); preventOffScreenSubmenu(submenu); currentMenuItem = button; } }; function preventOffScreenSubmenu(submenu) { var screenWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth, parent = submenu.offsetParent, menuLeftEdge = parent.getBoundingClientRect().left, menuRightEdge = menuLeftEdge + submenu.offsetWidth; if (menuRightEdge + 32 > screenWidth) { submenu.classList.add('sub-menu--right'); } }
                                                function closeOnEscKey(e) { if (27 === e.keyCode) { if (null !== e.target.closest('.submenu[aria-hidden="false"]')) { currentMenuItem.focus(); toggleSubmenu(currentMenuItem); } else if ('true' === e.target.getAttribute('aria-expanded')) { toggleSubmenu(currentMenuItem); } } }
                                                function closeOpenMenu(e) { if (currentMenuItem && !e.target.closest('#' + container.id)) { toggleSubmenu(currentMenuItem); } }; function menuSetup() { menu.classList.remove('no-js'); menu.querySelectorAll('.submenu').forEach(function (submenu) { var menuItem = submenu.parentElement; if ('undefined' !== typeof submenu) { var button = convertLinkToButton(menuItem); setUpAria(submenu, button); button.addEventListener('click', toggleOnMenuClick); menu.addEventListener('keyup', closeOnEscKey); } }); }; function convertLinkToButton(menuItem) {
                                                    var link = menuItem.getElementsByTagName('a')[0], linkHTML = link.innerHTML, linkAtts = link.attributes, button = document.createElement('button'); if (null !== link) {
                                                        button.innerHTML = linkHTML.trim(); for (i = 0, len = linkAtts.length; i < len; i++) { var attr = linkAtts[i]; if ('href' !== attr.name) { button.setAttribute(attr.name, attr.value); } }
                                                        menuItem.replaceChild(button, link);
                                                    }
                                                    return button;
                                                }
                                                function setUpAria(submenu, button) {
                                                    var submenuId = submenu.getAttribute('id'); var id; if (null === submenuId) { id = button.textContent.trim().replace(/\s+/g, '-').toLowerCase() + '-submenu'; } else { id = menuItemId + '-submenu'; }
                                                    button.setAttribute('aria-controls', id); button.setAttribute('aria-expanded', false); submenu.setAttribute('id', id); submenu.setAttribute('aria-hidden', true);
                                                }
                                            }; document.addEventListener('DOMContentLoaded', function () { var menus = document.querySelectorAll('.clicky-menu'); menus.forEach(function (menu) { var clickyMenu = new ClickyMenus(menu); clickyMenu.init(); }); }); if (!Element.prototype.matches) { Element.prototype.matches = Element.prototype.msMatchesSelector || Element.prototype.webkitMatchesSelector; }
                                            if (!Element.prototype.closest) { Element.prototype.closest = function (s) { var el = this; do { if (Element.prototype.matches.call(el, s)) return el; el = el.parentElement || el.parentNode; } while (el !== null && el.nodeType === 1); return null; }; }
                                            if (window.NodeList && !NodeList.prototype.forEach) { NodeList.prototype.forEach = function (callback, thisArg) { thisArg = thisArg || window; for (var i = 0; i < this.length; i++) { callback.call(thisArg, this[i], i, this); } }; }
                                        })(); jQuery(function ($) {
                                            cookieBanner(); imageTextSlider(); menu(); menuSecondary(); objectFit(); scrollOut(); testimonialSlider(); videoModal(); hideBanner(); siteSearch(); searchMobileDropdown(); toggleSubCourseMenu(); function cookieBanner() { if (localStorage.getItem('cookieSeen') != 'shown') { $('.cookie-banner').delay(2000).addClass('is-active'); }; $('.cookie-banner .button').click(function () { $('.cookie-banner').fadeOut(); localStorage.setItem('cookieSeen', 'shown'); }); }
                                            function imageTextSlider() { $('.image-text-slider__slider').slick({ dots: true, arrows: true }); }
                                            function menu() { var toggle = document.querySelector('#primary-menu-toggle'); var menu = document.querySelector('#primary-menu'); toggle.addEventListener('click', function () { $("body").toggleClass("lock-scroll"); $("header").toggleClass("menu-open"); if (menu.classList.contains('is-active')) { this.setAttribute('aria-expanded', 'false'); menu.classList.remove('is-active'); } else { menu.classList.add('is-active'); this.setAttribute('aria-expanded', 'true'); } }); }
                                            function menuSecondary() { var toggle = document.querySelector('#secondary-menu-toggle'); var menu = document.querySelector('#secondary-menu'); toggle.addEventListener('click', function () { $("body").toggleClass("lock-scroll"); $("header").toggleClass("secondary-menu-open"); if (menu.classList.contains('is-active')) { this.setAttribute('aria-expanded', 'false'); menu.classList.remove('is-active'); } else { menu.classList.add('is-active'); this.setAttribute('aria-expanded', 'true'); } }); }
                                            function objectFit() { object_fit_images__WEBPACK_IMPORTED_MODULE_2___default()(); }
                                            function testimonialSlider() { $('.testimonials__slider').slick({ dots: true, arrows: false }); }
                                            function scrollOut() { scroll_out__WEBPACK_IMPORTED_MODULE_3___default()(); }
                                            function videoModal() { $('[data-video-id]').on('click', function (e) { var targetModal = $('#' + $(this).data('modal')); targetModal.find('iframe').attr("src", "https://www.youtube.com/embed/" + $(this).data("video-id")); targetModal.trigger('open'); e.preventDefault(); }); $(document).on('closed.zf.reveal', '#video-modal[data-reveal]', function () { $(this).find('iframe').attr("src", ""); }); }
                                            function hideBanner() { $('.alert-banner .close-button').click(function () { var bannerHash = $('.alert-banner').data('hash'); console.log(bannerHash); js_cookie__WEBPACK_IMPORTED_MODULE_4___default.a.set(bannerHash, 'true', { expires: 30 }); }); }
                                            function formSubmit() { $('.course-filters input[type="checkbox"]').click(function () { $(this).closest('form').submit(); }); }
                                            function siteSearch() { $('#js-search-toggle').click(function (e) { e.preventDefault(); $($(this).attr('href')).toggleClass('is-active'); $("body").toggleClass("lock-scroll"); $(this).toggleClass('is-active'); $(".banner__nav").toggleClass("search-open"); $("#site-search__keyword").focus(); }); $('#js-search-close').click(function (e) { e.preventDefault(); $("#js-search").toggleClass('is-active'); $("body").toggleClass("lock-scroll"); $(".banner__nav").toggleClass("search-open"); }); }
                                            function searchMobileDropdown() { $('.search-results__mobile-filter').click(function () { $(this).toggleClass('is-open'); }); }
                                            function toggleSubCourseMenu() { if ($('.sub-courses').length) { $('.sub-courses .category-select li a').click(function (e) { e.preventDefault(); $('.sub-courses .category-select li a').removeClass('active'); $(this).addClass('active'); var dataCourse = $(this).data('course'); $('.sub-courses .sub-courses__card-group').hide(); $(".sub-courses .sub-courses__card-group[data-course=\"".concat(dataCourse, "\"]")).show(); }); $('.sub-courses select').change(function (e) { e.preventDefault(); var dataCourse = $(this).children(':selected').data('course'); $('.sub-courses .sub-courses__card-group').hide(); $(".sub-courses .sub-courses__card-group[data-course=\"".concat(dataCourse, "\"]")).show(); }); } }
                                        }); jquery__WEBPACK_IMPORTED_MODULE_0___default()(document).foundation();
            }), 0:
            /*!************************************!*\
              !*** multi ./src/assets/js/app.js ***!
              \************************************/
            /*! no static exports found */
            (function (module, exports, __webpack_require__) {
                module.exports = __webpack_require__(
                    /*! /Users/dannythomson/Documents/Projects/askham-fe/src/assets/js/app.js */
                    "./src/assets/js/app.js");
            })
    });