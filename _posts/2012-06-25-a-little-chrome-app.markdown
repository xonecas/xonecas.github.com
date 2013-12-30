---
layout: post
title: An example Chrome app
---

I've been using [Backbone.js](http://documentcloud.github.com/backbone/backbone.js) and after a few hours of reading the source in the browser my eyes demanded some syntax highlight. I assumed someone would've done this by now, but I could only find apps that provide much more than a nicer **reading** environment (I'm not looking to edit code on the browser).  *Great!*, I tough to myself, *I get to roll my own*!  Because I read mostly javascript source code, I focused on that, maybe if the need arises I'll beef it up with html and css highlight.

So to get started I looked around for highlighting libraries, and found a couple of heavyweights and then I saw [hijs.js by cloudhead](https://github.com/cloudhead/hijs) and I grabbed it!

After having a good grasp on what happens inside Hijs I was happy to see that it fits the bill perfectly because it will invoque itself when loaded. At that point all I needed was to actually create the app.

I googled for some tutorials and ended up in the [official docs](http://code.google.com/chrome/extensions/overview.html) where I found everything I needed. It wasn't much, all I was missing was a manifest file.

And... here it is:

{% highlight javascript %}
    {
       "name": "Hijs",
       "version": "0.0.1",
       "description": "Raw javascript file highlighter.",
       "permissions" : [
          "http://*/*.js",
          "https://*/*.js"
       ],
       "content_scripts": [
          {
             "matches": ["http://*/*.js", "https://*/*.js"],
             "js": ["hijs.js"],
             "css": ["highlight.css"]
          }
       ]
    }
{% endhighlight %}

It is very simple, but i'm sure it can get much more complicated. Just read the docs!

So if you'd like to try it out before I have it done, head on to the [github repo](https://github.com/xonecas/chrome-hijs)
