"=======
"Options
"=======

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
"set guifont=Monospace\ 10
set guifont=Nimbus\ Mono\ PS\ 12

"==============
"Cursor options
"==============
highlight Cursor guibg=#000000
highlight iCursor guibg=#d40000
set guicursor=n-c:hor10-Cursor-blinkon0
set guicursor=i:hor10-iCursor-blinkwait5
"set guicursor=i:ver15-iCursor-blinkon0
"set guicursor=i:hor10-iCursor-blinkwait10

"=========================
"Format text in plain text
"=========================

:hi Ita guibg=background guifg=foreground gui=italic
:syntax region Ita start='_' end='_'

:hi Blank guibg=background guifg=foreground gui=bold
:syntax region Blank start='\[' end='\]'

:hi Asterisk guibg=background guifg=#880000 gui=italic
:syntax region Asterisk start='*' end='*'

"====================
"ToggleQuote Function
"====================
"
let s:tq = 0

function! ToggleQuote()
    if s:tq == 0

        :hi Quote guibg=background guifg=foreground gui=bold
        :syntax region Quote start='\"' end='\"'
        let s:tq = 1

    else

        :hi Quote guibg=background guifg=foreground gui=none
        :syntax region Quote start='\"' end='\"'
        let s:tq = 0

    endif
endfunction
nnoremap <F4> :call ToggleQuote()<CR>
