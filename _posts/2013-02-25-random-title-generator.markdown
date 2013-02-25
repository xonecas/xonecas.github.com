---
layout: post
---

Random title generator
----------------------

Sunnyvale, Feb 24, 2013

Titles are hard, giving something a name demands thinking about it and making a decision. Unless of course you know some javascript. And... I do. So I can't come up with a title, I'll let the code choose a random(ish) one for us.

This is done with an array of nouns, an array of adjectives and a prefix to the title. The basic idea is to randomly concatenate those terms together. Since the prefix would become repetitive, I've set it to only show up 50% of the times.

Here is the code wrote.

{% highlight javascript %}
    // for convenience, return a number within the range. Pass the noFloor for a float.
    function rrange(min, max, noFloor) {
        var result = Math.random() * (max - min) + min;
        return noFloor ? result : Math.floor(result);
    }
    // generate the title.
    function randomTitle() {
        // some nouns and adjectives...
        var nouns = [ 'Functions', 'Loops', 'Bugs', 'Monkeys', 'Duck', 'String', 'Integers' ],
            adjs = [ 'Flying', 'Sleeping', 'Typing', 'Parsing', 'Lost', 'Delicious', 'Forgotten' ],
            // random ints
            x = rrange(1, nouns.length) - 1,
            y = rrange(1, adjs.length) - 1,
            // coin flip for the prefix
            prefix = Math.random() > 0.5 ? 'The ' : '',
            // concat it all
            title = prefix + adjs[y] + ' ' + nouns[x];
        // set the title
        $('#random-title').text(title);
    }
    $(function () { randomTitle() })
{% endhighlight %}

There is more that can be done, like adding more nouns and adjectives and different title constructs. If you decide to extend this, or have done something like it, please share your nouns and adjectives.
