---
layout: post
---

The Back Button, the Ajax, and the Chrome
-----------------------------------------

Sunnyvale, Feb 28, 2013

Yesterday I came across a weird situation, that only happens on chrome (*shocking*!).

At work, we have implemented `/search` as both a JSON endpoint and a HTML page. We choose what we send out depending on the `x-requested-with` header. Unfortunately doing this without any precaution, makes Chrome think that the latest response from `/search` xhr or page refresh is the latest version of `/search`. So when we try to navigate back to search, we get the JSON dump of the last executed search. This is simply resolved by adding a cache buster to the querystring, in our case that looks like: `/seach?q=...&_=1234567890`. We simply append the current unix timestamp in milisecconds to the xhr requests, that way chrome only caches the page renderings and not the JSON requests. I looked into filling an issue with the chromium project, but I quickly found a couple of them describing this issue. Seems that there is a discussion on the proper way to compare URLs for equality. I personaly think, that headers should be considered while doing this, to accomodate for the situation I came accross and other situations that the response may change depending on the headers (`vary` I'm looking at you)

Hope this helps someone debug the problem faster, and understand it.
