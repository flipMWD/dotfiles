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
set diffopt+=context:5,foldcolumn:0
set hidden
set splitbelow
set splitright
set wildmenu
set timeout timeoutlen=3000 ttimeoutlen=50  " deal with term esc

" Style
colorscheme flipAi3
set laststatus=2
set statusline=
set statusline+=%1*\ \«\ %n\ \»\ %*         " buffer number
set statusline+=\ %<%f\ %m                  " file path [modf]
set statusline+=%=\ %y\                     " file type
set statusline+=%2*\ %l-%L\ \:\ %v\ %*      " lines-total : cols
set statusline+=%3*\ %P\ %*                 " doc percentage

"set statusline+=%2*\ %<%f\ %m%*             " file path [modf]
"set statusline+=%2*%=\ %y\ %*               " file type

" Formatting
set shiftwidth=4        " indent length
set softtabstop=4       " mix space and tab
set expandtab           " into spaces
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
function AltBOnly()
    if (bufexists(0) && winnr('$') == 1)      " buf 0 = #
        if (winwidth(0) >= 170)
            vsplit
            buffer #
        else
            sbuffer #
        endif
    else
        only
    endif
endfunction

function ToggleLines()
    set list!
    set cursorline!
    set cursorcolumn!
    if (&cursorcolumn)
        set colorcolumn=+1
    else
        set colorcolumn=""
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
nnoremap <Leader>C :split $MYVIMRC<CR>
nnoremap <Leader>c :source $MYVIMRC<CR>
nnoremap <Leader>s :call ToggleLines()<CR>
nnoremap <Leader>f :find<Space>

inoremap <C-u> <Esc>viwUea

" Buffer/Window/Tab Management
" :bad :bn :bp :bm :bd :bw :bf :bl :sb[#]
nnoremap <Leader>j :ls!<CR>:b<Space>
nnoremap <Leader>k :buffer #<CR>
nnoremap <Leader>m :marks<CR>:normal `

" :sp :vs <C-w>t|b <C-w>H|J|K|L <C-w>=|_ z{nr}
nnoremap <Leader>o :call AltBOnly()<CR>
nnoremap <Leader>h :wincmd W<CR>
nnoremap <Leader>l :wincmd w<CR>
nnoremap <Leader>H :wincmd R<CR>
nnoremap <Leader>L :wincmd r<CR>

nnoremap <Leader>w- :split<CR>
nnoremap <Leader>w/ :vsplit<CR>
nnoremap <Leader>wj :wincmd J<CR>
nnoremap <Leader>wk :wincmd K<CR>
nnoremap <Leader>wh :wincmd H<CR>
nnoremap <Leader>wl :wincmd L<CR>
nnoremap <Leader>wt :wincmd t<CR>
nnoremap <Leader>wb :wincmd b<CR>
nnoremap <Leader>wd :q<CR>
nnoremap <Leader>ws :resize 10<CR>
nnoremap <Leader>we :wincmd =<CR>

" gt|T :tabe|f :tabo :tabn|p :tabm -|+
nnoremap <Leader>u :tab h<Space>
nnoremap <Leader>i :tab sb %
nnoremap <Leader>U :tabclose<CR>

nnoremap <Leader>tw :wincmd T<CR> 
nnoremap <Leader>tj :tabprevious<CR> 
nnoremap <Leader>tk :tabnext<CR> 
nnoremap <Leader>th :tabfirst<CR> 
nnoremap <Leader>tl :tabs<CR>:tabnext<Space>
nnoremap <Leader>td :tabclose<CR> 
nnoremap <Leader>to :tabonly<CR> 
nnoremap <Leader>tm :tabmove +
