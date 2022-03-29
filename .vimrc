"-------------------------------------------------------------------------------
" Plugins flipMWD/dotfiles ~/.local/bin/update-plugin-vim
"-------------------------------------------------------------------------------
" Settings {{{
"-------------------------------------------------------------------------------

" Paths
set path+=**
set noswapfile

" General
set number relativenumber
set scrolloff=3
set textwidth=80
set formatoptions+=ljr
set formatoptions-=o
set linebreak
set showbreak=»
set listchars=tab:│\ ,trail:·,nbsp:X
set list
set fillchars=vert:│
set diffopt+=context:5,foldcolumn:0
set modeline
set hidden
set splitbelow splitright
set previewpopup=height:10,width:80
set shortmess=at
set wildmenu
set wildmode=longest,full
set wildcharm=<C-z>
set wildignore+=*.bak,*.tar.*,*.cache,*.o
set wildignore+=*/.cache/**,*/.git/**,*/node_modules/**
set wildignorecase
set timeout timeoutlen=3000 ttimeoutlen=50  " deal with term esc

" Formatting
set tabstop=4           " tab length
set shiftwidth=4        " space length
set softtabstop=-1      " mix space and tab
set noexpandtab         " convert tab into spaces
set autoindent
set smartindent
set smarttab

" Search
set hlsearch
set incsearch           " highlight as type
set ignorecase
set smartcase           " type Caps to match A-Z only
set showmatch           " highlight parens

" }}}
"-------------------------------------------------------------------------------
" Colors {{{
"-------------------------------------------------------------------------------

" Status Bar
colorscheme dark-low-contrast
set laststatus=2
set statusline=
set statusline+=%1*\ %{&et?\"S\":\"T\"}%{&sw}\ %*\  " tab/space indicator
set statusline+=%<%F\ %m%=\ %r\ %y\                 " path [m] [ro] [ft]
set statusline+=%{&ff==\"dos\"?\"[CRLF]\ \":&ff==\"mac\"?\"[CR]\ \":\"\"}
set statusline+=%{&enc!=\"utf-8\"?\"[\".&enc.\"]\ \":\"\"}
set statusline+=%1*\ %l-%L\ \:\ %v\ %*              " lines-total : cols
set showcmd

" }}}
"-------------------------------------------------------------------------------
" Options {{{
"-------------------------------------------------------------------------------

" Language
filetype plugin indent on
syntax on

" Cursor
if exists('$TMUX')
	let &t_SI.="\<Esc>Ptmux;\<Esc>\<Esc>[5 q\<Esc>\\"
	let &t_SR.="\<Esc>Ptmux;\<Esc>\<Esc>[3 q\<Esc>\\"
	let &t_EI.="\<Esc>Ptmux;\<Esc>\<Esc>[1 q\<Esc>\\"
	autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033[0 q\033\\"
elseif exists('$STY')
	let &t_ti.="\eP\e[1 q\e\\"
	let &t_SI.="\eP\e[5 q\e\\"
	let &t_SR.="\eP\e[3 q\e\\"
	let &t_EI.="\eP\e[1 q\e\\"
	let &t_te.="\eP\e[0 q\e\\"
else
	let &t_SI.="\<Esc>[5 q"     " insert, blink bar
	let &t_SR.="\<Esc>[3 q"     " replace, blink underscore
	let &t_EI.="\<Esc>[1 q"     " normal, blink block
endif

" NetRW :Lex
let g:netrw_banner=0
let g:netrw_winsize=30
let g:netrw_liststyle=0                 " 0=thin, 1=detail, 2=column, 3=tree
let g:netrw_sizestyle="H"               " human-readable
let g:netrw_browse_split=4              " open on previous window
let g:netrw_list_hide='^\.\/$,'                         " hide . (current dir)
let g:netrw_list_hide.='.*\.\(o\)$,'                    " hide extensions
let g:netrw_list_hide.='.*\.\(cache\|git\|node_modules\)\/$'    " hide dirs

" Search file contents with :grep <pattern> [<dir>]
if executable("rg")
	set grepprg=rg\ --hidden\ --smart-case\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif

" Disable FZF Floating Window
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.4, 'yoffset':1, 'border': 'top' } }

" }}}
"-------------------------------------------------------------------------------
" Compiler {{{
"-------------------------------------------------------------------------------

" }}}
"-------------------------------------------------------------------------------
" Filetypes {{{
"-------------------------------------------------------------------------------

" }}}
"-------------------------------------------------------------------------------
" Functions {{{
"-------------------------------------------------------------------------------

" Alternate between Only Window and split with Alt Buffer
function! AltBOnly()
	if (bufexists(0) && winnr('$') == 1)    " buf 0 = #, win $ = last
		if (winwidth(0) >= 170)             " win 0 = current
			vsplit
			buffer #
		else
			sbuffer #
		endif
	else
		only
	endif
endfunction

function! ToggleLines()
	set cursorline!
	set cursorcolumn!
	if (&cursorcolumn)
		set colorcolumn=+1
	else
		set colorcolumn=""
	endif
endfunction

function! MakefileExists()
	if filereadable("./Makefile")
		let &makeprg = 'make'
	endif
	update
	call feedkeys(':make ')
endfunction

function! GenerateTags()
	if filereadable("./tags")
		silent !ctags -R
		redraw!
	endif
	Tags
endfunction

function! PreviewGroff()
	let ext = expand("%:e")
	if ext == "ms"
		execute "! groff -ms -Tpdf -Kutf8 % > /tmp/preview_groff.pdf"
	endif
	execute "! zathura /tmp/preview_groff.pdf"
endfunction

" }}}
"-------------------------------------------------------------------------------
" Keybindings {{{
"-------------------------------------------------------------------------------

let mapleader="\<Space>"
let maplocalleader="\<Bslash>"

" All modes, nore disallow {rhs} to execute other mappings
noremap <Leader>; <Esc>A;<Esc>
noremap <Leader>y "+y
noremap <Leader>Y "+y$

" Insert mode
inoremap <C-c> <Esc>viwUea
inoremap {<CR> {}<Esc>i<CR><Esc>O

" Visual mode
vnoremap * /<C-r>*<CR><Esc>

" Normal mode
nnoremap q; q:
nnoremap Y y$
nnoremap S <Nop>
nnoremap K <Nop>
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
nnoremap <Leader>r diw"0P
nnoremap <Leader>n :noh<CR>
nnoremap <Leader>N :let @/=""<CR>
nnoremap <Leader>v :source $MYVIMRC<CR>
nnoremap <Leader>V :split $MYVIMRC<CR>
nnoremap <Leader>x mx:%s/\s\+$//<CR>:let @/=""<CR>`x
nnoremap <Leader>" :registers<CR>
nnoremap <Leader>m :call MakefileExists()<CR>
nnoremap <silent> <Leader>s :call ToggleLines()<CR>
nnoremap <silent> <Leader><Tab> :set expandtab!<CR>
nnoremap <silent> <Leader>z :call PreviewGroff()<CR><CR><CR>

" Browse Files (gf >>> ~/.vim/after/plugin/post-plugin.vim)
nnoremap <Leader>- :Lex <C-r>=expand("%:p:h")<CR><CR>
nnoremap <Leader>_ :Lex <C-r>=getcwd()<CR><CR>

" Buffer/Window/Tab Management
" :bad :bn :bp :bm :bd :bw :bf :bl :sb[#]
" :sp :vs <C-w>{nr}| z{nr} <C-\><C-n>|<C-w>N
" gt|T :tabe|f :tabo :tabn|p :tabm -|+
nnoremap <silent> <Leader>o :call AltBOnly()<CR>
nnoremap <Leader>h :wincmd W<CR>
nnoremap <Leader>l :wincmd w<CR>
nnoremap <Leader>H :wincmd R<CR>
nnoremap <Leader>L :wincmd r<CR>

nnoremap <Leader>w- :split<CR>
nnoremap <Leader>w/ :vsplit<CR>
nnoremap <Leader>w1 :1wincmd w<CR>
nnoremap <Leader>w2 :2wincmd w<CR>
nnoremap <Leader>w3 :3wincmd w<CR>
nnoremap <Leader>w4 :4wincmd w<CR>
nnoremap <Leader>w5 :5wincmd w<CR>
nnoremap <Leader>w6 :6wincmd w<CR>
nnoremap <Leader>wj :wincmd J<CR>
nnoremap <Leader>wk :wincmd K<CR>
nnoremap <Leader>wh :wincmd H<CR>
nnoremap <Leader>wl :wincmd L<CR>
nnoremap <Leader>wt :wincmd t<CR>
nnoremap <Leader>wb :wincmd b<CR>
nnoremap <Leader>wd :quit<CR>
nnoremap <Leader>ws :vertical resize<Space>
nnoremap <Leader>we :wincmd =<CR>
nnoremap <expr> <Leader>wm winwidth(0) >= 170 ? ':vert term<CR>' : ':term<CR>'

nnoremap <Leader>i :tab sb %<CR>
nnoremap <Leader>u :tabclose<CR>

" }}}
"-------------------------------------------------------------------------------
" vim: set foldmethod=marker foldlevel=0 :
"-------------------------------------------------------------------------------
