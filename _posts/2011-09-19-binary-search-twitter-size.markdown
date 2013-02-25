---
layout: post
---

Binary Search, Twitter size
---------------------------

`function f(a,v,l,h){var m;return hv ? f(a,v,l, m-1): a[m] &lt; v ? f(a,v,m+1,h): m; }`

And it works too!

Using the binary operator `~~` I'm able to ditch `Math.floor()` and I replaced `false` with `!-1`. After that, it will fit in 140 chars, with room to spare!

Here's the **clean** implementation:

{% highlight javascript %}
    function fn (a, v, l, h) {
        var m;
        if (h &lt; l) {
            return false;
        } 

        m = Math.floor(l + (h - l) / 2);

        if (a[m] &gt; v) {
            return fn(a, v, l, m-1);
        } else if (a[m] &lt; v) {
            return fn(a, v, m+1, h);
        } else {
            return m;
        }
    }
{% endhighlight %}
