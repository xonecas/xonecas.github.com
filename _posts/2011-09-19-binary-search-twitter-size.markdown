---
layout: post
title: Binary Searchy in less than 140 characters.
---

`function f(a,v,l,h){var m;return h<l ? !-1: a[(m=~~(l+(h-l)/2))]>v ? f(a,v,l, m-1): a[m] < v ? f(a,v,m+1,h): m; }`

And it works too!

Using the binary operator `~~` I'm able to ditch `Math.floor()` and I replaced `false` with `!-1`. After that, it will fit in 140 chars, with room to spare!

Here's the **clean** implementation:

{% highlight javascript %}
    function fn (a, v, l, h) {
        var m;
        if (h < l) {
            return false;
        }

        m = Math.floor(l + (h - l) / 2);

        if (a[m] > v) {
            return fn(a, v, l, m-1);
        } else if (a[m] < v) {
            return fn(a, v, m+1, h);
        } else {
            return m;
        }
    }
{% endhighlight %}

**UPDATE**: It was pointed out to me that I could have saved another character by using `!1` instead of using `!-1`
