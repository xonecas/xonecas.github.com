---
layout: post
---

Ever noticed that if you use [Google Webfonts](//www.google.com/webfonts) you might have noticed your custom font text flashing into the custom font from the basic browser supported font. This is because the font takes sometime to download, and the document is usually ready before, so your text is visible. There some extreme fixes, like hiding the whole page while it load, and then showing it all in one move. I chose to do something lighter, because I like seeing the site coming to life, and for the user experience I think it's best that the user sees something, as oposing to thinking something is wrong if the load takes too long. Here is what I had to do, to ensure the elements with the custom font only appear after they have been loaded:

#### The Javascript
{% highlight javascript %}
    // google web font, no flash of unstyled text
    window.WebFontConfig = {
        google: { families: ['Quantico:700,700italic:latin'] },
        active: function () {
            // font is ready, assume jquery
            $(function () {
                // on your css make sure you make all the elements that us this font visibility: hidden;
                $('h1, .custom-font').css({ visibility: 'visible' });
            });
        }
    };
{% endhighlight %}

#### The css
{% highlight css %}
    /* google web font */
    h1 {
        visibility: hidden;
        font-family: 'Quantico', sans-serif;
        font-weight: 700;
    }
{% endhighlight %}

This is the code I'm using on this site (the h1 header has a custom font). Take this as a proof of concept. Some things to keep in mind:

 + The active property passed to the WebFontConfig is a function that gets called when all of the fonts have either loaded successfully or failed. You can either retry or ignore. If you ignore the elements will act as esxpected and use the first available font in the css declaration.
 + This function can at times be called before the `domready` event, so we make sure to wait for that before we show the elements. This might cause a slight delay for the text to appear. This can be solved most of the times, by giving priority to the google webfonts code, before all.
