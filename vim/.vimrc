"================
"Plugins settings
"================

call plug#begin('~/.vim/plugged')
    Plug 'lilydjwg/colorizer'
    Plug 'ap/vim-buftabline'
    "Plug 'chrisbra/Colorizer', { 'on': 'ColorHighlight' }
    Plug 'Shougo/neocomplete.vim'
    Plug 'scrooloose/nerdcommenter'
    "Plug 'itchyny/vim-cursorword-master'

call plug#end()

"let g:session_autosave="yes" "autosave session
"let g:session_autoload="yes" "autoload session

let g:neocomplete#enable_at_startup = 1 "enable Neocomplete
let g:neocomplete#enable_smart_case = 1 "smartcase for Neocomplete

let g:buftabline_indicators = 1

"================
"General settings
"================

set number
set t_Co=256
syntax on
filetype plugin indent on
"colorscheme Tomorrow-Night-Eighties-yahman
colorscheme yahman
set showcmd
set linebreak
set hlsearch
set ruler
set hidden
set confirm
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set encoding=utf-8
set ttimeout
set ttimeoutlen=10
set splitbelow
set splitright
set cursorline
set showmode
set laststatus=2
set listchars=tab:▸\ ,eol:¬,trail:⋅
set autoread
set ignorecase
set smartcase
set incsearch
set wildmenu
set scrolloff=10
set noswapfile
set statusline=
set statusline+=%f%m%=%y\ [%{strlen(&fenc)?&fenc:'none'}]\ L:%l/%L\ C:%c\ (%P)
set mouse=a
set spelllang=hu,en
"set guicursor=a:hor20-Cursor
"set guicursor+=a:blinkon0

"Highlight spell checking
hi SpellBad    ctermfg=001      ctermbg=007     cterm=bold      guibg=#ffffff   guifg=#d40000   gui=bold

"Gvim options
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
"set guifont=Monospace\ 10
set guifont=Nimbus\ Mono\ PS\ 12

highlight Cursor guibg=#000000
highlight iCursor guibg=#d40000
set guicursor=n-c:hor10-Cursor-blinkon0
set guicursor=i:hor10-iCursor-blinkon0
"set guicursor=i:ver15-iCursor-blinkon0
"set guicursor=i:hor10-iCursor-blinkwait10


""===============
""Cursor settings
""===============

"" Set the cursor on tty
"if 1
  "let &t_ve = substitute(&t_ve, '\e[?\zs0c', '112;0;0c', 'g')
"endif

"" Set the cursor on X11

"" Cursor color & shape
"" 1 or 0 -> blinking block
"" 2 -> normal block
"" 3 -> blinking underscore
"" 4 -> normal underscore
"" 5 -> blinking vertical bar
"" 6 -> normal vertical bar

"let &t_SI = "\<Esc>]12;red\x7"
"let &t_EI = "\<Esc>]12;black\x7"
"let &t_SI .= "\<Esc>[4 q"
"let &t_EI .= "\<Esc>[4 q"
"silent !echo -ne "\033]12;black\007"
"autocmd VimLeave * silent !echo -ne "\033]12;black\007"

"let &t_SI = "\<Esc>]12;green\x7"
"let &t_EI = "\<Esc>]12;black\x7"
"let &t_SI .= "\<Esc>[4 q"
"let &t_EI .= "\<Esc>[4 q"
"silent !echo -ne "\033]12;black\007"
"autocmd VimLeave * silent !echo -ne "\033]12;white\007"


"===============
"Custom commands
"===============

"Reload vimrc"
command! RR write|source ~/.vimrc

"Toggle relative line numbering"
command! RL set rnu!

"Remove trailing white space
command! RWS %s/\s\+$//|echo "Removing trailing white spaces"

"Quick delete/close buffer
command! QQ bd

"Turn on color highlight
command! COL :ColorHighlight syntax<CR>

"==================
"Custom keybindings
"==================

"Set leader key
let nomapleader = "\\"

"Faster navigation
nnoremap J <C-d>
nnoremap K <C-u>

"Map ESC key
imap <ESC> <ESC>l
"imap ii <ESC>

"Switch between buffers"
nmap < :bprevious<CR>
nmap > :bnext<CR>

"Move on displayed lines, not real lines"
noremap k gk
noremap j gj

"Unmap the arrow keys"
no <down> <Nop>
no <up> <Nop>
no <right> <Nop>
no <left> <Nop>

ino <down> <Nop>
ino <up> <Nop>
ino <right> <Nop>
ino <left> <Nop>

vno <down> <Nop>
vno <up> <Nop>
vno <right> <Nop>
vno <left> <Nop>

"Yank to system clipboard
nnoremap y "+y
vnoremap y "+y

"Paste from system clipboard
nnoremap PP <Esc>"+p<ESC>
inoremap PP <Esc>"+p<ESC>

"Quick pairs
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i
imap <leader>{ {}<ESC>i
imap <leader>< <><ESC>i

"Surround words with quotes, brackets etc.
noremap <leader>{ lbi{<ESC>ea}<ESC>
noremap <leader>} lbi{<ESC>ea}<ESC>
noremap <leader>" lbi"<ESC>ea"<ESC>
noremap <leader>' lbi'<ESC>ea'<ESC>
noremap <leader>( lbi(<ESC>ea)<ESC>
noremap <leader>) lbi(<ESC>ea)<ESC>
noremap <leader>[ lbi[<ESC>ea]<ESC>
noremap <leader>] lbi[<ESC>ea]<ESC>
noremap <leader>< lbi<<ESC>ea><ESC>
noremap <leader>> lbi<<ESC>ea><ESC>

"Surround visual selection with quotes, brackets etc.
vnoremap <leader>{ <ESC>`<i{<ESC>`>la}<ESC>
vnoremap <leader>} <ESC>`<i{<ESC>`>la}<ESC>
vnoremap <leader>" <ESC>`<i"<ESC>`>la"<ESC>
vnoremap <leader>' <ESC>`<i'<ESC>`>la'<ESC>
vnoremap <leader>( <ESC>`<i(<ESC>`>la)<ESC>
vnoremap <leader>) <ESC>`<i(<ESC>`>la)<ESC>
vnoremap <leader>[ <ESC>`<i[<ESC>`>la]<ESC>
vnoremap <leader>] <ESC>`<i[<ESC>`>la]<ESC>
vnoremap <leader>< <ESC>`<i<<ESC>`>la><ESC>
vnoremap <leader>> <ESC>`<i<<ESC>`>la><ESC>
vnoremap <leader>_ <ESC>`<i_<ESC>`>la_<ESC>

"Delete surrounding quotes, brackets etc.
noremap <leader><leader>{ F{xf}x
noremap <leader><leader>" F"x,x
noremap <leader><leader>' F'x,x
noremap <leader><leader>( F(xf)x
noremap <leader><leader>) F(xf)x
noremap <leader><leader>[ F[xf]x
noremap <leader><leader>] F[xf]x
noremap <leader><leader>< F<xf>x
noremap <leader><leader>> F<xf>x

vnoremap <leader><leader>{ <ESC>`<x<ESC>`>x<ESC>
vnoremap <leader><leader>} <ESC>`<x<ESC>`>x<ESC>
vnoremap <leader><leader>" <ESC>`<x<ESC>`>x<ESC>
vnoremap <leader><leader>' <ESC>`<x<ESC>`>x<ESC>
vnoremap <leader><leader>( <ESC>`<x<ESC>`>x<ESC>
vnoremap <leader><leader>) <ESC>`<x<ESC>`>x<ESC>
vnoremap <leader><leader>[ <ESC>`<x<ESC>`>x<ESC>
vnoremap <leader><leader>] <ESC>`<x<ESC>`>x<ESC>
vnoremap <leader><leader>< <ESC>`<x<ESC>`>x<ESC>
vnoremap <leader><leader>> <ESC>`<x<ESC>`>x<ESC>

"Indenting in normal and visual mode
nnoremap <S-tab> <<
nnoremap <tab> >>
vnoremap <S-tab> <gv
vnoremap <tab> >gv

"Use Enter in normal mode
nmap <S-CR> i<Enter><ESC>
nmap <Enter> o<ESC>

"Use space in normal mode
nmap <Space> i<Space><ESC>
nmap <S-Space> <Backspace>

"Use backspace in normal mode
nmap <Backspace> i<Backspace><ESC>

"Use TAB for Neocomplete
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

"Toggle uppercase/lowercase
nnoremap <leader>CC g~iw
vnoremap <leader>CC ~

"Move to the beginning/end of line
nnoremap H ^
nnoremap L $
vmap H ^
vmap L $

"Change word
nnoremap cw ciw

"Delete word
nnoremap dw diw

"Jump to end of word then add an extra space
nnoremap e el

"Select all text
nnoremap <C-a> ggVG

"Set/unset spellcheck
nnoremap <leader>s :set spell<CR> <bar> :set cursorline!<CR>
nnoremap <leader>S :set nospell<CR> <bar> :set cursorline<CR>
vnoremap <leader>S 1z=

"Spell suggestions
vnoremap <leader>s z=

nnoremap S [s
nnoremap s ]s

"Paste at the end of line
nnoremap P A<Space><ESC>p

"Use " in normal mode
nnoremap " i"<ESC>

"Close buffer (for gvim)_
nnoremap <F4> :bd<CR>

"No highlight
nnoremap <leader>n :noh<CR>

"=============
"Abbreviations
"=============
iab wiht with
iab wihtout without

"============
"Autocommands
"============

"Shell script abbreviations
au FileType sh iab iff if [[ ]]; then<CR>fi<Esc>?[[ ]]<Esc>:noh<Esc>i
au FileType sh iab eliff elif [[ ]]; then<Esc>?[[ ]]<Esc>:noh<Esc>i
"au FileType sh iab awkk awk '{ }'<Esc>{? }<Esc>:noh<Esc>i
au FileType sh iab forr for; do<CR>done<Esc>?;<Esc>:noh<Esc>i

"Remove trailing whitespace when saving the file
autocmd BufWritePre * :%s/\s\+$//e

autocmd BufRead .vimperatorrc setfiletype vim
