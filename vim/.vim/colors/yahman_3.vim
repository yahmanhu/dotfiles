set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "yahman_2"
hi Normal	    guifg=black	    guibg=white
"hi Normal	    guifg=#ffffff	    guibg=#333333
hi NonText		guifg=black	ctermfg=lightMagenta
hi comment		guifg=gray		ctermfg=gray	ctermbg=darkBlue	gui=bold
hi constant		guifg=cyan		ctermfg=cyan
hi identifier	guifg=gray		ctermfg=red
hi statement	guifg=white		ctermfg=white	ctermbg=darkBlue	gui=none
hi preproc		guifg=green		ctermfg=green
hi type			guifg=white	ctermfg=lightRed	ctermbg=darkBlue
hi special		guifg=magenta	ctermfg=lightMagenta	ctermbg=darkBlue
hi Underlined	guifg=cyan		ctermfg=cyan	gui=underline	cterm=underline
hi label		guifg=yellow	ctermfg=yellow
hi operator		guifg=orange	gui=bold	ctermfg=lightRed	ctermbg=darkBlue

hi ErrorMsg		guifg=red	guibg=white gui=bold	ctermfg=lightRed
hi WarningMsg	guifg=cyan		guibg=darkBlue	ctermfg=cyan	gui=bold
hi ModeMsg		guifg=blue	gui=Bold	ctermfg=yellow
hi MoreMsg		guifg=blue	gui=NONE	ctermfg=yellow
hi Error		guifg=red		guibg=white	gui=bold	ctermfg=red

hi Todo			guifg=black		guibg=lightgreen	ctermfg=black	ctermbg=darkYellow
hi Cursor		guifg=white		guibg=black		ctermfg=black	ctermbg=white
hi iCursor      guifg=white     guibg=black
hi Search		guifg=black		guibg=orange	ctermfg=black	ctermbg=darkYellow
hi IncSearch	guifg=lightblue		guibg=black	ctermfg=black	ctermbg=darkYellow
hi LineNr		guifg=black guibg=white	ctermfg=cyan
hi CursorLineNr	guifg=black guibg=white	ctermfg=yellow
hi title		guifg=white	gui=bold	cterm=bold

hi StatusLineNC	gui=NONE	guifg=black guibg=darkgray	ctermfg=black  ctermbg=blue
hi StatusLine	gui=NONE	guifg=black	guibg=darkgray	ctermfg=cyan   ctermbg=blue
hi VertSplit	gui=none	guifg=blue	guibg=blue	ctermfg=blue	ctermbg=blue

hi Visual		term=reverse		ctermfg=black	ctermbg=darkCyan	guifg=black		guibg=lightblue

hi DiffChange	guibg=darkGreen		guifg=black	ctermbg=darkGreen	ctermfg=black
hi DiffText		guibg=olivedrab		guifg=black		ctermbg=lightGreen	ctermfg=black
hi DiffAdd		guibg=slateblue		guifg=black		ctermbg=blue		ctermfg=black
hi DiffDelete   guibg=coral			guifg=black	ctermbg=cyan		ctermfg=black

hi Folded		guibg=orange		guifg=black		ctermbg=yellow		ctermfg=black
hi FoldColumn	guibg=gray30		guifg=black	ctermbg=gray		ctermfg=black
hi cIf0			guifg=gray			ctermfg=gray

hi TabLine      guibg=black guifg=#1E6DAA
hi TabLineFill  guibg=black guifg=#1E6DAA
hi TabLineSel   guibg=#1E6DAA guifg=white

hi PMenu        guibg=gray guifg=black
hi PMenuSel     guifg=black guibg=lightblue gui=bold

hi CursorLine   guibg=white

hi SpellBad guifg=red
hi SpellCap gui=undercurl guisp=red

hi MatchParen guifg=black guibg=cyan

:hi Ita guibg=background guifg=foreground gui=italic
:syntax region Ita start='_' end='_'

:hi Blank guibg=background guifg=foreground gui=bold
:syntax region Blank start='\[' end='\]'

:hi Hashtag guibg=background guifg=blue gui=italic
:syntax region Hashtag start='#' end='#'

":au InsertEnter * hi CursorLine guibg=#666666 guifg=lightcyan
":au InsertLeave * hi CursorLine guibg=#555555 guifg=lightcyan
":au InsertEnter * hi iCursor guibg=black guifg=black
":au InsertLeave * hi Cursor guibg=white guifg=white
"
":au InsertEnter * hi StatusLine guifg=white	guibg=darkCyan
":au InsertLeave * hi StatusLine guifg=black	guibg=darkgray

":au InsertEnter * hi Normal guifg=black	guibg=lightcyan
":au InsertLeave * hi Normal guifg=lightcyan	guibg=#666666


set guifont=Courier\ New\ 12
