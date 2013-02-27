---
layout: post
---

Easy way to randomly choose a vim colorscheme
---------------------------------------------

Sunnyvale, Feb 26, 2013

Have you ever caught yourself cycling through your colorschems with `:colo <TAB>`? I have and I always endup using a colorscheme from the subset that I know and like.

The Idea: What if vim new what subset is that? Which colorschemes I like?

Solution: Tell vim exactly that.

Create an collection of colorschemes you like, put them in your config with this code:

{% highlight vim %}

    function! ToggleScheme()
        if has("gui_running")
            " this is the collection of colorschemes
            let schemes = 'FreshCut Peacock Revelation TronLegacy Yule'
            let seconds = str2nr(strftime('%S'))
            " number needs to match the schemes count
            execute 'colorscheme '.split(schemes)[seconds%5]
            redraw
        endif
    endfunction
    command! ToggleScheme :call ToggleScheme()
    map <leader>x :ToggleScheme<CR>
    set background=dark
    call ToggleScheme()

{% endhighlight %}
