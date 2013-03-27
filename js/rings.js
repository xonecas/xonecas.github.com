/*jslint browser: true nomen: true */
var rings = (function (win, doc) {
    'use strict';
    var body      = doc.querySelector('body'),
        canvas    = doc.createElement('canvas'),
        c         = canvas.getContext('2d'),
        width     = window.innerWidth,
        height    = window.innerHeight;

    // Opera engineer Erik Möller wrote about rAF and developed a polyfill that
    // better handles browsers without native support. You can read about it, but
    // basically his code will choose a delay of between 4ms and 16ms in order to
    // more closely match 60fps. Here it is, in case you’d like to use it. Note it
    // uses the standard method name. I have also fixed the cancel* method’s name,
    // as it has changed in WebKit.
    //
    // http://paulirish.com/2011/requestanimationframe-for-smart-animating/
    (function() {
        var lastTime = 0,
            vendors = ['webkit', 'moz'],
            x;

        for(x = 0; x < vendors.length && !window.requestAnimationFrame; ++x) {
            window.requestAnimationFrame = window[vendors[x]+'RequestAnimationFrame'];
            window.cancelAnimationFrame = window[vendors[x]+'CancelAnimationFrame'] ||
                                            window[vendors[x]+'CancelRequestAnimationFrame'];
        }

        if (!window.requestAnimationFrame) {
            window.requestAnimationFrame = function(callback, element) {
                var currTime = new Date().getTime(),
                    timeToCall = Math.max(0, 16 - (currTime - lastTime)),
                    id = window.setTimeout(function() { callback(currTime + timeToCall); }, timeToCall);
                lastTime = currTime + timeToCall;
                return id;
            };
        }

        if (!window.cancelAnimationFrame) {
            window.cancelAnimationFrame = function(id) {
                clearTimeout(id);
            };
        }
    }());

    //random range
    function _rr(min, max) {
        return Math.random() * (max - min) + min;
    }

    //takes the values returns an hsla(...) css string
    function _hsla(h, s, l, a) {
        h = h || Math.floor(_rr(80, 200));
        s = s || 100;
        l = l || 50;
        a = a || 1.0;

        return "hsla(" + h + ", " + s + "%, " + l + "%, " + a + ")";
    }

    //takes degrees returns radians
    function _rad(deg) {
        return deg * (Math.PI / 180);
    }

    function Ring(options) {
        options = options || {};

        this.radius = 1;
        this.max = 1;
        this.counter = 0.1;
        this.length = Math.floor(_rr(10, 300));
        this.x = options.x || Math.floor(width / 2);
        this.y = options.y || Math.floor(height / 2);
        this.color = options.color || _hsla();

        return this;
    }

    Ring.prototype = {
        update: function () {
            if (this.radius < 1) {
                this.counter = 0.1;
            }

            this.radius = this.length * Math.sin(this.counter);
            this.counter += 0.01;

            if (this.radius < this.max) {
                this.destroy = true;
            } else {
                this.max = this.radius;
            }

            return this;
        },

        draw: function () {
            c.beginPath();
            c.arc(this.x, this.y, this.radius, 0, _rad(360), true);
            c.strokeStyle = this.color;
            c.lineWidth = 2.5;
            c.stroke();
            c.closePath();

            return this;
        }
    };

    function init() {
        var rings = [],
            hue = 1;

        canvas.width = width;
        canvas.height = height;
        body.appendChild(canvas);
        body.addEventListener('mousemove', function (ev) {
            // only make rings 30% of the time 
            if (Math.random() > 0.333) { return; }
            hue = hue + 1 === 360 ? 1 : hue + 1;
            var ring = new Ring({
                x: ev.clientX,
                y: ev.clientY,
                color: _hsla(hue)
            });
            rings.push(ring);
        }, false);

        function draw() {
            setTimeout(function () {
                window.requestAnimationFrame(draw);

                var len,
                    idx,
                    _rings = [],
                    _ring;

                c.save();
                c.fillStyle = "rgba(0, 0, 0, 0.5)";
                c.fillRect(0, 0, width, height);
                c.restore();

                if (rings.length === 0) {
                    return;
                }

                for (idx = 0, len = rings.length; idx < len; idx += 1) {
                    _ring = rings[idx];
                    if (!_ring.destroy) {
                        _rings.push(_ring);
                    }
                    _ring
                        .update()
                        .draw();
                }

                rings = _rings;
            }, 1000 / 60);
        }

        draw();

    }

    win.onload = init;

}(window, document));
