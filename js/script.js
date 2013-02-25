/*jslint browser: true */
/*global $: true */
(function () {
    'use strict';
    // google web font, no flash of unstyled text
    window.WebFontConfig = {
        google: { families: ['Quantico:400,400italic,700,700italic:latin'] },
        active: function () {
            // font is ready, assume jquery
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

    function setNavActive() {
        var items = $('.navbar .nav li'),
            page = location.pathname.match(/\/[a-zA-Z0-9\.\-]+$/);
        page = page ? page[0] : page;
        if (page === '/work.html') {
            items.last().addClass('active');
        } else {
            items.first().addClass('active');
        }
    }

    function loadStyle(url, fn) {
        var style = document.createElement('style'),
            fi;
        style.textContent = '@import "' + url + '"';
        fi = setInterval(function () {
            try {
                style.sheet.cssRules; // <--- MAGIC: only populated when file is loaded
                fn();
                clearInterval(fi);
            } catch (e) {}
        }, 10);

        $('head').prepend(style);
    }

    $(function () {
        var body = $('body'),
            nav = $('.navbar'),
            now = new Date().getHours(),
            color = now > 6 && now < 18 ? 'light' : 'dark';
        loadStyle('/css/bootstrap.' + color + '.min.css', function () {
            body.show();
            nav.affix({offset: 221});
            setNavActive();
        });
    });
}());
