" bearded-adventure.vim - Vim color scheme
" ----------------------------------------------------------
" Author:       @xonecas
" Version:      0.0.1
" Note:         Credits got to Noah Fredrick for creating
"               Hemisu
" ----------------------------------------------------------

" Setup ----------------------------------------------------
" Reset syntax highlighting
hi clear
if exists("syntax_on")
    syntax reset
endif

" Declare theme name
let g:colors_name="bearded-adventure"


" The Colors -----------------------------------------------
" Define reusable colors
let s:black=           { "gui": "#1F1F1F" }
let s:white=           { "gui": "#F7FDFA" }
let s:almostWhite=     { "gui": "#F2F2F2" }
let s:almostBlack=     { "gui": "#3B3B3B" }
let s:middleDarkGrey=  { "gui": "#919999" }
let s:middleLightGrey= { "gui": "#C0C0C0" }
let s:lightGrey=       { "gui": "#EDEDED" }
let s:darkGrey=        { "gui": "#515151" }

let s:darkOrange=        { "gui": "#E73525" }
let s:middleDarkOrange=  { "gui": "#E45635" }
let s:middleLightOrange= { "gui": "#FF9900" }
let s:lightOrange=       { "gui": "#FBB829" }

let s:darkBlue=        { "gui": "#556270" }
let s:middleDarkBlue=  { "gui": "#025D8C" }
let s:middleLightBlue= { "gui": "#2A8FBD" }
let s:lightBlue=       { "gui": "#34BEDA" }

let s:darkGreen=       { "gui": "#3C3D36" }
let s:middleDarkGreen= { "gui": "#606048" }
let s:middleLightGreen={ "gui": "#A1C820" }
let s:lightGreen=      { "gui": "#7FFF24" }

let s:darkTan=         { "gui": "#CADEE1" }
let s:lightTan=        { "gui": "#B1F1FF" }

" Assign to semantic categories based on background color
if &background=="dark"
    " Dark theme
    let s:bg=s:black
    let s:norm=s:almostWhite
    let s:comment=s:middleDarkGrey
    let s:dimmed=s:middleLightGrey
    let s:subtle=s:darkGrey
    let s:faint=s:almostBlack
    let s:accent1=s:middleLightBlue
    let s:accent2=s:middleLightGreen
    let s:accent3=s:lightGreen
    let s:accent4=s:lightTan
    let s:normRed=s:middleLightOrange
    let s:normGreen=s:middleLightGreen
    let s:normBlue=s:middleLightBlue
    let s:faintRed=s:darkOrange
    let s:faintGreen=s:darkGreen
    let s:faintBlue=s:darkBlue
else
    " Light theme
    let s:bg=s:white
    let s:norm=s:almostBlack
    let s:comment=s:middleLightGrey
    let s:dimmed=s:middleDarkGrey
    let s:subtle=s:lightGrey
    let s:faint=s:almostWhite
    let s:accent1=s:middleDarkBlue
    let s:accent2=s:middleDarkGreen
    let s:accent3=s:middleDarkOrange
    let s:accent4=s:darkTan
    let s:normRed=s:middleDarkOrange
    let s:normGreen=s:middleDarkGreen
    let s:normBlue=s:middleDarkBlue
    let s:faintRed=s:lightOrange
    let s:faintGreen=s:lightGreen
    let s:faintBlue=s:lightBlue
endif


" Utilility Function ---------------------------------------
function! s:h(group, style)
    execute "highlight" a:group
        \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
        \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
        \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
        \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
endfunction


" Highlights - Vim >= 7 ------------------------------------
if version >= 700
    call s:h("CursorLine",  { "bg": s:faint })
    call s:h("MatchParen",  { "fg": s:accent1, "bg": s:faint, "gui": "bold" })
    call s:h("Pmenu",       { "bg": s:faint })
    call s:h("PmenuThumb",  { "bg": s:norm })
    call s:h("PmenuSBar",   { "bg": s:subtle })
    call s:h("PmenuSel",    { "bg": s:faintBlue })
    call s:h("ColorColumn", { "bg": s:faintRed })
    call s:h("SpellBad",    { "sp": s:normRed, "gui": "undercurl" })
    call s:h("SpellCap",    { "sp": s:accent1, "gui": "undercurl" })
    call s:h("SpellRare",   { "sp": s:normGreen, "gui": "undercurl" })
    call s:h("SpellLocal",  { "sp": s:accent4, "gui": "undercurl" })
    hi! link CursorColumn    CursorLine
endif


" Highlights - UI ------------------------------------------
call s:h("Normal",       { "fg": s:norm, "bg": s:bg })
call s:h("NonText",      { "fg": s:subtle })
call s:h("Cursor",       { "fg": s:bg, "bg": s:accent3 })
call s:h("Visual",       { "bg": s:faintBlue })
call s:h("IncSearch",    { "bg": s:faintBlue })
call s:h("Search",       { "bg": s:faintGreen })
call s:h("StatusLine",   { "fg": s:norm, "bg": s:faint, "gui": "bold" })
call s:h("StatusLineNC", { "fg": s:dimmed, "bg": s:faint })
call s:h("SignColumn",   { "fg": s:norm })
call s:h("VertSplit",    { "fg": s:subtle, "bg": s:faint })
call s:h("TabLine",      { "fg": s:dimmed, "bg": s:faint })
call s:h("TabLineSel",   { "gui": "bold" })
call s:h("Folded",       { "fg": s:comment, "bg": s:faint })
call s:h("Directory",    { "fg": s:accent1 })
call s:h("Title",        { "fg": s:accent4, "gui": "bold" })
call s:h("ErrorMsg",     { "bg": s:faintRed })
call s:h("DiffAdd",      { "bg": s:faintGreen })
call s:h("DiffChange",   { "bg": s:faintRed })
call s:h("DiffDelete",   { "fg": s:normRed, "bg": s:faintRed })
call s:h("DiffText",     { "bg": s:faintRed, "gui": "bold" })
call s:h("User1",        { "fg": s:bg, "bg": s:normGreen })
call s:h("User2",        { "fg": s:bg, "bg": s:normRed })
call s:h("User3",        { "fg": s:bg, "bg": s:normBlue })

hi! link WildMenu    IncSearch
hi! link FoldColumn    SignColumn
hi! link WarningMsg    ErrorMsg
hi! link MoreMsg    Title
hi! link Question    MoreMsg
hi! link ModeMsg    MoreMsg
hi! link TabLineFill    StatusLineNC
hi! link LineNr        NonText
hi! link SpecialKey    NonText
hi! clear Ignore


" Highlights - Generic Syntax ------------------------------
call s:h("Delimiter",  { "fg": s:dimmed })
call s:h("Comment",    { "fg": s:comment, "gui": "italic" })
call s:h("Underlined", { "fg": s:accent1, "gui": "underline" })
call s:h("Type",       { "fg": s:accent3 })
call s:h("String",     { "fg": s:accent2 })
call s:h("Keyword",    { "fg": s:accent2, "gui": "bold" })
call s:h("Todo",       { "fg": s:normRed, "gui": "bold" })
call s:h("Function",   { "gui": "bold" })
hi! link Identifier    Function
hi! link Statement    Type
hi! link Constant    Directory
hi! link Number        Constant
hi! link Special    Constant
hi! link PreProc    Constant
hi! link Error        ErrorMsg


" Highlights - HTML ----------------------------------------
hi! link htmlLink    Underlined
hi! link htmlTag    Type
hi! link htmlEndTag    htmlTag


" Highlights - CSS -----------------------------------------
hi! link cssBraces    Delimiter
hi! link cssSelectorOp    cssBraces
hi! link cssClassName    Normal


" Highlights - Markdown ------------------------------------
hi! link mkdListItem    mkdDelimiter


" Highlights - Shell ---------------------------------------
hi! link shOperator    Delimiter
hi! link shCaseBar    Delimiter


" Highlights - JavaScript ----------------------------------
hi! link javaScriptValue    Constant
hi! link javaScriptNull    Constant
hi! link javaScriptBraces    Normal


