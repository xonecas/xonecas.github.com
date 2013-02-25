/*jslint browser: true */
/*global $: true */
(function () {
    'use strict';
    function rrange(min, max, noFloor) {
        var result = Math.random() * (max - min) + min;
        return noFloor ? result : Math.floor(result);
    }
    function loadStyle(url, fn) {
        var style = document.createElement('style'),
            fi;
        style.textContent = '@import "' + url + '"';
        fi = setInterval(function () {
            try {
                style.sheet.cssRules; // <--- MAGIC: only populated when file is loaded
                fn(style);
                clearInterval(fi);
            } catch (e) {}
        }, 10);
        $('head').prepend(style);
    }
    function setNavActive() {
        var items = $('.nav-main li'),
            page = location.pathname.match(/\/[a-zA-Z0-9\.\-]+$/);
        if (page) {
            page = page[0];
            if (page === '/work.html') {
                items.last().addClass('active');
            } else {
                items.first().addClass('active');
            }
        }
    }
    function setRandomTitle() {
        var nouns = [ 'Functions', 'Loops', 'Bugs', 'Monkeys', 'Duck', 'String', 'Integers' ],
            adjs = [ 'Flying', 'Sleeping', 'Typing', 'Parsing', 'Lost', 'Delicious', 'Forgotten' ],
            x = rrange(1, nouns.length) - 1,
            y = rrange(1, adjs.length) - 1,
            prefix = Math.random() > 0.5 ? 'The ' : '',
            middle = Math.random() > 0.66666 ? ' of ' : ' ',
            title = Math.random() > 0.5 ?
                    prefix + adjs[y] + ' ' + nouns[x] :
                    prefix + nouns[x] + middle + adjs[y];
        $('#random-title').text(title);
    }
    function setLightSwitch(fn) {
        var saved = window.localStorage ? window.localStorage.getItem('colorscheme') : 'light',
            style = saved || 'light';
        function color(done) {
            var url = '/css/bootstrap.' + style + '.min.css';
            $('#colorscheme').remove();
            loadStyle(url, function (node) {
                node.id = 'colorscheme';
                if (done) { done(); }
            });
        }
        color(fn);
        $('#light-switch').click(function (ev) {
            ev.preventDefault();
            style = style === 'light' ? 'dark' : 'light';
            if (window.localStorage) { window.localStorage.setItem('colorscheme', style); }
            color();
        });
    }
    // google web font, no flash of unstyled text
    window.WebFontConfig = {
        google: { families: ['Quantico:400,400italic,700,700italic:latin', 'Racing+Sans+One::latin'] },
        active: function () {
            // font is ready, dom is ready, init and display
            $(function () {
                // on your css make sure you make all the elements that us this font visibility: hidden;
                $('h1, .custom-font').css({ visibility: 'visible' });
            });
        }
    };
    (function () {
        var wf = document.createElement('script'),
            s;
        wf.src = ('https:' === document.location.protocol ? 'https' : 'http') + '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
        wf.type = 'text/javascript';
        wf.async = 'true';
        s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(wf, s);
    }());
    $(function () {
        setLightSwitch(function () {
            setNavActive();
            setRandomTitle();
            $('body').show();
            $('.tipped').tooltip({ placement: 'left', animation: true });
            $('#reload-title').click(function (ev) {
                ev.preventDefault();
                setRandomTitle();
            });
        });
    });
}());
