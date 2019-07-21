" Plug-ins
" vim-surround

" General
set number
set relativenumber
set textwidth=80
set formatoptions+=t
set linebreak
set showbreak=>
set ruler
set hidden
set wildmenu
set timeout timeoutlen=3000 ttimeoutlen=50  " deal with term esc codes

" Style
colorscheme default
autocmd ColorScheme *
    \ hi ModeMsg	ctermfg=12	ctermbg=none	|
    \ hi LineNr		ctermfg=7	ctermbg=none    |
    \ hi CursorLineNr	ctermfg=15	ctermbg=none	|
    \ hi VertSplit	ctermfg=0	ctermbg=none	|
    \ hi StatusLine	ctermfg=8	ctermbg=15	|
    \ hi WildMenu	ctermfg=0	ctermbg=11	cterm=bold |
    \ hi Search		ctermfg=none	ctermbg=none	cterm=bold,reverse |
    \ hi User1	    	ctermfg=7	ctermbg=8       |
    \ hi User2	    	ctermfg=15	ctermbg=0	|
    \ hi User3	    	ctermfg=0 	ctermbg=7	cterm=bold |
    \ hi User4	    	ctermfg=15	ctermbg=12	|
    \ hi User5	    	ctermfg=15	ctermbg=10	cterm=bold |
    \ hi User6	    	ctermfg=15	ctermbg=13	cterm=bold |
    \ hi User7	    	ctermfg=15	ctermbg=9	cterm=bold |
    \ hi TabLine	ctermfg=7 	ctermbg=8	cterm=none |
    \ hi TabLineFill 	ctermfg=0 	ctermbg=0	cterm=none |
    \ hi TabLineSel  	ctermfg=15	ctermbg=12	cterm=bold

set laststatus=2
set statusline=
set statusline+=%1*\ \«\ %n\ \»\ %*	    " buffer number
set statusline+=%2*\ %<%F\ %m%*		    " file path [modf]
set statusline+=%2*%=\ %y\ %*		    " file type
set statusline+=%3*\ %l-%L\ \:\ %v\ %*	    " lines-total : cols
set statusline+=%4*\ %P\ %*		    " doc percentage

" Formatting
set showmatch		" highlight parens
set shiftwidth=4	" indent length
set softtabstop=4	" mix space and tab
set autoindent
set smartindent
set smarttab

" Search
set hlsearch
set incsearch		" hl as type
set ignorecase
set smartcase		" type Caps to match A-Z only

" Language
syntax on
"set spell


"=== Keybindings ==="

let mapleader="\<Space>"
let maplocalleader="\<Bslash>"

" nore disallow that the {rhs} execute other mappings
noremap <Leader>; <Esc>A;<Esc>
noremap <Leader>d "+d
noremap <Leader>y "+y

nnoremap Y y$
nnoremap S <Nop>
nnoremap K <Nop>
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
nnoremap <Leader>r diw"0P
nnoremap <Leader>n :noh<CR><Esc>
nnoremap <Leader>N :let @/=""<CR>
nnoremap <Leader>W :split $MYVIMRC<CR>
nnoremap <Leader>w :source $MYVIMRC<CR>
nnoremap <Leader>V :set virtualedit=all<CR>
nnoremap <Leader>v :set virtualedit=""<CR>

nnoremap <Leader>a yiW:echo "<C-r>"<CR>

inoremap <C-u> <Esc>viwUea

" Buffer/Window/Tab Management
" :bad :bn :bp :bm :bd :bw :bf :bl :sb[#] +++
nnoremap <Leader>j :ls!<CR>:b<Space>
nnoremap <Leader>k :b#<CR>

" :sp :vs <C-w>t|b <C-w>H|J|K|L <C-w>=|_ z{nr} +++
nnoremap <Leader>h :wincmd W<CR>
nnoremap <Leader>l :wincmd w<CR>
nnoremap <Leader>H :wincmd R<CR>
nnoremap <Leader>L :wincmd r<CR>

" gt|T :tabf :tabo :tabn|p :tabm -|+
nnoremap <Leader>u :tab h<Space>
nnoremap <Leader>i :tab sb %
nnoremap <Leader>U :tabclose<CR>
nnoremap <Leader>I :tabe<Space>
