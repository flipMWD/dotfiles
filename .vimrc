" Plug-ins
" vim-surround

" Paths
set path-=/usr/include
"set path+=

" General
set number
set relativenumber
set scrolloff=9
set textwidth=80
set formatoptions+=t
set linebreak
set showbreak=»
set listchars=eol:¬,tab:\|->,space:·,trail:X
set hidden
set splitbelow
set splitright
set wildmenu
set timeout timeoutlen=3000 ttimeoutlen=50  " deal with term esc

" Style
colorscheme default
autocmd ColorScheme *
    \ hi LineNr         ctermfg=7                       |
    \ hi CursorLineNr   ctermfg=15                      |
    \ hi Search         ctermfg=11      ctermbg=none    cterm=underline |
    \ hi MatchParen     ctermfg=15      ctermbg=13      |
    \ hi Visual                         ctermbg=15      |
    \ hi NonText        ctermfg=8                       |
    \ hi SpecialKey     ctermfg=8                       |
    \ hi VertSplit      ctermfg=0                       |
    \ hi Pmenu          ctermfg=7       ctermbg=0       |
    \ hi PmenuSel       ctermfg=15      ctermbg=12      |
    \ hi PmenuSbar                      ctermbg=8       |
    \ hi PmenuThumb                     ctermbg=7       |
    \ hi TabLine        ctermfg=7       ctermbg=8       cterm=none |
    \ hi TabLineFill    ctermfg=0       ctermbg=0       cterm=none |
    \ hi TabLineSel     ctermfg=15      ctermbg=12      cterm=bold |
    \ hi StatusLine     ctermfg=8       ctermbg=15      |
    \ hi WildMenu       ctermfg=0       ctermbg=11      cterm=bold |
    \ hi User1          ctermfg=7       ctermbg=8       |
    \ hi User2          ctermfg=15      ctermbg=0       |
    \ hi User3          ctermfg=0       ctermbg=7       cterm=bold |
    \ hi User4          ctermfg=15      ctermbg=12      |
    \ hi User5          ctermfg=15      ctermbg=10      cterm=bold |
    \ hi User6          ctermfg=15      ctermbg=13      cterm=bold |
    \ hi User7          ctermfg=15      ctermbg=9       cterm=bold |
    \ hi ModeMsg        ctermfg=12                      |

set laststatus=2
set statusline=
set statusline+=%1*\ \«\ %n\ \»\ %*         " buffer number
set statusline+=%2*\ %<%f\ %m%*             " file path [modf]
set statusline+=%2*%=\ %y\ %*               " file type
set statusline+=%3*\ %l-%L\ \:\ %v\ %*      " lines-total : cols
set statusline+=%4*\ %P\ %*                 " doc percentage

" Formatting
set shiftwidth=4        " indent length
set softtabstop=4       " mix space and tab
set expandtab
set autoindent
set smartindent
set smarttab

" Search
set hlsearch
set incsearch           " hl as type
set ignorecase
set smartcase           " type Caps to match A-Z only
set showmatch           " highlight parens

" Language
syntax on
"set spell

" NetRW :Lex
let g:netrw_banner=0
let g:netrw_winsize=22
let g:netrw_liststyle=0         " 0=def, 1=det, 2=list, 3=tree
let g:netrw_browse_split=4      " open on previous window


"=== Functions ==="

" Alternate between Only Window and split with Alt Buffer
function AltOwAb()
    if (bufexists(0) && winnr('$') == 1)      " buf 0 = #
        sbuffer #
    else
        only
    endif
endfunction


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
nnoremap <Leader>s :set list!<CR>
nnoremap <Leader>f :find<Space>

inoremap <C-u> <Esc>viwUea

" Buffer/Window/Tab Management
" :bad :bn :bp :bm :bd :bw :bf :bl :sb[#]
nnoremap <Leader>j :ls!<CR>:b<Space>
nnoremap <Leader>k :buffer #<CR>
nnoremap <Leader>m :marks<CR>:normal `

" :sp :vs <C-w>t|b <C-w>H|J|K|L <C-w>=|_ z{nr}
nnoremap <Leader>o :call AltOwAb()<CR>
nnoremap <Leader>h :wincmd W<CR>
nnoremap <Leader>l :wincmd w<CR>
nnoremap <Leader>H :wincmd R<CR>
nnoremap <Leader>L :wincmd r<CR>

" gt|T :tabe|f :tabo :tabn|p :tabm -|+
nnoremap <Leader>u :tab h<Space>
nnoremap <Leader>i :tab sb %
nnoremap <Leader>U :tabclose<CR>
