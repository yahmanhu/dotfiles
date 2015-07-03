"================
"General settings
"================

execute pathogen#infect()
set number
set t_Co=256
syntax on
filetype plugin indent on
colorscheme grb256rio
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
set noshowmode
set laststatus=2
set listchars=tab:▸\ ,eol:¬,trail:⋅
set autoread
set ignorecase
set smartcase
set incsearch
set wildmenu
set scrolloff=10
set noswapfile

"================
"Plugins settings
"================

let g:airline#extensions#tabline#enabled = 1 "display buffers/tabs at the top
let g:airline#extensions#tabline#fnamemod = ':t' "show filenames only on tabs
let g:airline_section_b = '%{getcwd()}' "show current working directory
let g:airline_powerline_fonts = 0 "load patched powerline fonts

let g:session_autosave="yes" "autosave session
let g:session_autoload="yes" "autoload session

let g:neocomplete#enable_at_startup = 1 "enable Neocomplete
let g:neocomplete#enable_smart_case = 1 "smartcase for Neocomplete

"let g:airline_theme='darkrio' "set airline theme

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

"==================
"Custom keybindings
"==================

"Set leader key
let nomapleader = "\\"

"Faster navigation
nnoremap J <C-d>
nnoremap K <C-u>

"Map ESC key
imap ii <ESC>

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
imap PP <Esc>"+p<ESC>

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

"Use ENTER is normal mode
nmap <Enter> o<ESC>

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

"Delete end of line and go into insert mode
nnoremap d$ d$<ESC>a

"Change word
nnoremap cw ciw

"Delete word
nnoremap dw diw

"Jump to end of word then add an extra space
nnoremap e el

"NERDTree Toggle
nnoremap TN :NERDTreeToggle<ENTER>

"Turn on color highlight
nnoremap <silent> <leader>cz :ColorHighlight syntax<CR>

"Vcoolor
nnoremap <silent> <leader>vc :VCoolor<CR>
inoremap <silent> <leader>vc <Esc>:VCoolor<CR>a

"=============
"Abbreviations
"=============

iab fucntion function

"============
"Autocommands
"============

autocmd BufRead .vimperatorrc setfiletype vim
