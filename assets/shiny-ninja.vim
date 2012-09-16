" shiny-ninja.vim - Vim color scheme
" ----------------------------------------------------------
" Author:	Sean Caetano Martin (@xonecas)
"           Noah Frederick (http://noahfrederick.com/) (creatd hemisu)
" Version:	1.0.0
" License:	Creative Commons Attribution-NonCommercial
" 			3.0 Unported License       (see README.md)
" Notes:    This is a modified version of hemisu!
" ----------------------------------------------------------

" Setup ----------------------------------------------------{{{
" Reset syntax highlighting
hi clear
if exists("syntax_on")
	syntax reset
endif

" Declare theme name
let g:colors_name="shiny-ninja"

"}}}
" The Colors -----------------------------------------------{{{
" Define reusable colors
let s:black=           { "gui": "#080808", "cterm": "232"  }
let s:white=           { "gui": "#eeeeee", "cterm": "255" }
let s:almostWhite=     { "gui": "#dadada", "cterm": "253" }
let s:almostBlack=     { "gui": "#121212", "cterm": "233" }
let s:middleDarkGrey=  { "gui": "#606060", "cterm": "241" }
let s:middleLightGrey= { "gui": "#999999", "cterm": "246" }
let s:lightGrey=       { "gui": "#b2b2b2", "cterm": "249" }
let s:darkGrey=        { "gui": "#444444", "cterm": "238" }

let s:darkSea=        { "gui": "#0000d7", "cterm": "20"  }
let s:middleDarkSea=  { "gui": "#005fd7", "cterm": "26" }
let s:middleLightSea= { "gui": "#0087d7", "cterm": "32" }
let s:lightSea=       { "gui": "#00d7d7", "cterm": "38" }

let s:darkSky=        { "gui": "#0000ff", "cterm": "21"  }
let s:middleDarkSky=  { "gui": "#005fff", "cterm": "27"  }
let s:middleLightSky= { "gui": "#0087ff", "cterm": "33" }
let s:lightSky=       { "gui": "#00afff", "cterm": "39" }

let s:darkPurple=       { "gui": "#8700d7", "cterm": "92"  }
let s:middleDarkPurple= { "gui": "#875fd7", "cterm": "98"  }
let s:middleLightPurple={ "gui": "#8787d7", "cterm": "104" }
let s:lightPurple=      { "gui": "#87afd7", "cterm": "110" }

let s:darkRed=         { "gui": "#800000", "cterm": "1"  }
let s:lightRed=        { "gui": "#ff0000", "cterm": "9" }

" Assign to semantic categories based on background color
if &background=="dark"
	" Dark theme
	let s:bg=s:black
	let s:norm=s:almostWhite
	let s:comment=s:middleDarkGrey
	let s:dimmed=s:middleLightGrey
	let s:subtle=s:darkGrey
	let s:faint=s:almostBlack
	let s:accent1=s:middleLightSky
	let s:accent2=s:middleLightPurple
	let s:accent3=s:lightPurple
	let s:accent4=s:lightRed
	let s:normRed=s:middleLightSea
	let s:normPurple=s:middleLightPurple
	let s:normSky=s:middleLightSky
	let s:faintRed=s:darkSea
	let s:faintPurple=s:darkPurple
	let s:faintSky=s:darkSky
else
	" Light theme
	let s:bg=s:white
	let s:norm=s:almostBlack
	let s:comment=s:middleLightGrey
	let s:dimmed=s:middleDarkGrey
	let s:subtle=s:lightGrey
	let s:faint=s:almostWhite
	let s:accent1=s:middleDarkSky
	let s:accent2=s:middleDarkPurple
	let s:accent3=s:middleDarkSea
	let s:accent4=s:darkRed
	let s:normRed=s:middleDarkSea
	let s:normPurple=s:middleDarkPurple
	let s:normSky=s:middleDarkSky
	let s:faintRed=s:lightSea
	let s:faintPurple=s:lightPurple
	let s:faintSky=s:lightSky
endif

"}}}
" Utilility Function ---------------------------------------{{{
function! s:h(group, style)
	execute "highlight" a:group
		\ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
		\ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
		\ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
		\ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
		\ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
		\ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
		\ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

"}}}
" Highlights - Vim >= 7 ------------------------------------{{{
if version >= 700
	call s:h("CursorLine",  { "bg": s:faint })
	call s:h("MatchParen",  { "fg": s:accent1, "bg": s:faint, "gui": "bold" })
	call s:h("Pmenu",       { "bg": s:faint })
	call s:h("PmenuThumb",  { "bg": s:norm })
	call s:h("PmenuSBar",   { "bg": s:subtle })
	call s:h("PmenuSel",    { "bg": s:faintSky })
	call s:h("ColorColumn", { "bg": s:faintRed })
	call s:h("SpellBad",    { "sp": s:normRed, "gui": "undercurl" })
	call s:h("SpellCap",    { "sp": s:accent1, "gui": "undercurl" })
	call s:h("SpellRare",   { "sp": s:normPurple, "gui": "undercurl" })
	call s:h("SpellLocal",  { "sp": s:accent4, "gui": "undercurl" })
	hi! link CursorColumn	CursorLine

	" Use background for cterm Spell*, which does not support undercurl
	execute "hi! SpellBad   ctermbg=" s:faintRed.cterm
	execute "hi! SpellCap   ctermbg=" s:faintSky.cterm
	execute "hi! SpellRare  ctermbg=" s:faintPurple.cterm
	execute "hi! SpellLocal ctermbg=" s:faint.cterm
endif

"}}}
" Highlights - UI ------------------------------------------{{{
call s:h("Normal",       { "fg": s:norm, "bg": s:bg })
call s:h("NonText",      { "fg": s:subtle })
call s:h("Cursor",       { "fg": s:bg, "bg": s:accent3 })
call s:h("Visual",       { "bg": s:faintSky })
call s:h("IncSearch",    { "bg": s:faintSky })
call s:h("Search",       { "bg": s:faintPurple })
call s:h("StatusLine",   { "fg": s:norm, "bg": s:faint, "gui": "bold", "cterm": "bold" })
call s:h("StatusLineNC", { "fg": s:dimmed, "bg": s:faint })
call s:h("SignColumn",   { "fg": s:norm })
call s:h("VertSplit",    { "fg": s:subtle, "bg": s:faint })
call s:h("TabLine",      { "fg": s:dimmed, "bg": s:faint })
call s:h("TabLineSel",   { "gui": "bold", "cterm": "bold" })
call s:h("Folded",       { "fg": s:comment, "bg": s:faint })
call s:h("Directory",    { "fg": s:accent1 })
call s:h("Title",        { "fg": s:accent4, "gui": "bold", "cterm": "bold" })
call s:h("ErrorMsg",     { "bg": s:faintRed })
call s:h("DiffAdd",      { "bg": s:faintPurple })
call s:h("DiffChange",   { "bg": s:faintRed })
call s:h("DiffDelete",   { "fg": s:normRed, "bg": s:faintRed })
call s:h("DiffText",     { "bg": s:faintRed, "gui": "bold", "cterm": "bold" })
call s:h("User1",        { "fg": s:bg, "bg": s:normPurple })
call s:h("User2",        { "fg": s:bg, "bg": s:normRed })
call s:h("User3",        { "fg": s:bg, "bg": s:normSky })
hi! link WildMenu	IncSearch
hi! link FoldColumn	SignColumn
hi! link WarningMsg	ErrorMsg
hi! link MoreMsg	Title
hi! link Question	MoreMsg
hi! link ModeMsg	MoreMsg
hi! link TabLineFill	StatusLineNC
hi! link LineNr		NonText
hi! link SpecialKey	NonText
hi! clear Ignore

"}}}
" Highlights - Generic Syntax ------------------------------{{{
call s:h("Delimiter",  { "fg": s:dimmed })
call s:h("Comment",    { "fg": s:comment, "gui": "italic" })
call s:h("Underlined", { "fg": s:accent1, "gui": "underline", "cterm": "underline" })
call s:h("Type",       { "fg": s:accent3 })
call s:h("String",     { "fg": s:accent2 })
call s:h("Keyword",    { "fg": s:accent2, "gui": "bold", "cterm": "bold" })
call s:h("Todo",       { "fg": s:normRed, "gui": "bold", "cterm": "bold" })
call s:h("Function",   { "gui": "bold", "cterm": "bold" })
hi! link Identifier	Function
hi! link Statement	Type
hi! link Constant	Directory
hi! link Number		Constant
hi! link Special	Constant
hi! link PreProc	Constant
hi! link Error		ErrorMsg

"}}}
" Highlights - HTML ----------------------------------------{{{
hi! link htmlLink	Underlined
hi! link htmlTag	Type
hi! link htmlEndTag	htmlTag

"}}}
" Highlights - CSS -----------------------------------------{{{
hi! link cssBraces	Delimiter
hi! link cssSelectorOp	cssBraces
hi! link cssClassName	Normal

"}}}
" Highlights - Markdown ------------------------------------{{{
hi! link mkdListItem	mkdDelimiter

"}}}
" Highlights - Shell ---------------------------------------{{{
hi! link shOperator	Delimiter
hi! link shCaseBar	Delimiter

"}}}
" Highlights - JavaScript ----------------------------------{{{
hi! link javaScriptValue	Constant
hi! link javaScriptNull	Constant
hi! link javaScriptBraces	Normal

"}}}
