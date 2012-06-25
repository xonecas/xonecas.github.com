    call pathogen#infect()
    set guioptions=
    set directory^=~/.vswap
    set number
    set ruler
    set colorcolumn=80
    set cursorline
    set visualbell t_vb=
    set incsearch
    set smartcase
    set smartindent
    set autoindent
    set expandtab
    set smarttab
    set tabstop=4
    set shiftwidth=4
    set list
    set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
    set showbreak=↪
    syntax on
    colorscheme bearded-adventure
    set background=dark
    filetype plugin on
    function! ToggleBg()
        if &background == "light"
            "let g:lucius_style = 'dark'
            set background=dark
        else
            "let g:lucius_style = 'light'
            set background=light
        endif
    endfunction
    command! ToggleBg :call ToggleBg()
    map <C-X> :ToggleBg<CR>
    map <C-C> :NERDTreeToggle<CR>
