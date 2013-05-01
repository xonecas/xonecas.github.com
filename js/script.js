/*jslint browser: true */
/*global $: true */
(function () {
    'use strict';
    function rrange(min, max, noFloor) {
        var result = Math.random() * (max - min) + min;
        return noFloor ? result : Math.floor(result);
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
    $(function () {
        var $doc = $(document);

        $doc.on('click', '#reload-title', function (ev) {
            ev.preventDefault();
            setRandomTitle();
        });

        $doc.on('mouseenter', '#reload-title', function (ev) {
            var $node = $(ev.target);
            $node.data('text', $node.text())
                .text("Gimme a new title!");
        });
        $doc.on('mouseleave', '#reload-title', function (ev) {
            var $node = $(ev.target);
            $node.text($node.data('text'));
        });

        setRandomTitle();
        $('body').fadeIn();
    });
}());
