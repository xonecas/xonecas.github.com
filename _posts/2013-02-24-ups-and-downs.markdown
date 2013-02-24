---
layout: post
---

Ups and downs
=============

24, Fed 2013. Palo Alto.

I don't like camelCase. I don't think it helps making code more readable. With this said, I mostly work with Javascript. I know... It's like hell on earth since JS good practices usually ask for camelCase. I would very much rather user '_' for separation, like those lucky python folks.
I follow the good practices when coding for others, public apis where camelcase is expected. But everywhere else I use _ as a separator. This is my dirty secret. And so far I'm ok with this, even if at times, from project to project I roll back on this decision. At [blyve](//blyve.com) underscores where ok and I follow the basic rule I stated above. Altough at [edshelf](//edshelf.com) I rolled back. I'm using camelCase *agains't my will* because I enforced it on myself. I did this because I'm the architech. When new engineers join the team I won't have to explain myself about the mixed case.

Here is an example:

{% highlight javascript %}
    $(function () {
        var bucket = {}, // namespace
            this_is_my_awesome_func = function () {}; // private api, underscores used

        bucket.Search = function () {};
        bucket.Search.prototype = {
            newSearch: function () {}, // public api, camelCase expected
        };
    });
{% endhighlight %}
