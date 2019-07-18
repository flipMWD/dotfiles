" General
set number
set relativenumber
set textwidth=80
set linebreak
set showbreak=->
set ruler
set hidden
set wildmenu

" Style
colorscheme default
autocmd ColorScheme *
    \ hi ModeMsg	ctermfg=12	ctermbg=none	|
    \ hi LineNr		ctermfg=8	ctermbg=none    |
    \ hi CursorLineNr	ctermfg=7	ctermbg=none	|
    \ hi VertSplit	ctermfg=0	ctermbg=none	|
    \ hi StatusLine	ctermfg=8	ctermbg=7	|
    \ hi WildMenu	ctermfg=0	ctermbg=11	cterm=bold |
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

" let s:display=''
" function! ModeDisplay()
"     if mode()==#'i'
" 	s:display.='%5* >_ %*'
"     elseif mode()==#'v'
" 	s:display.='%6* () %*'
"     elseif mode()==#'R'
" 	s:display.='%7* XX %*'
"     else
" 	s:display.='%2* :: %*'
"     endif
" 
"     s:display.='%1* « %n » %*'
"     s:display.='%2* %F %m%*'
"     s:display.='%2*%= %y %*'
"     s:display.='%3* %l-%L : %v %*'
"     s:display.='%4* %P %*'
" 
"     return s:display
" endfunction

" let all = '%1* « %n » %*%2* %F %m%*%2*%= %y %*%3* %l-%L : %v %*%4* %P %*'
" let buf = '%1* « %n » %*'
" let fil = '%2* %F %m%*'
" let typ = '%2*%= %y %*'
" let lin = '%3* %l-%L : %v %*'
" let pct = '%4* %P %*'

set laststatus=2
" set statusline=%!ModeDisplay()
set statusline=
set statusline+=%1*\ \«\ %n\ \»\ %*		" buffer number
set statusline+=%2*\ %F\ %m%*			" Full file path [modf]
set statusline+=%2*%=\ %y\ %*			" file type / hlsearch
set statusline+=%3*\ %l-%L\ \:\ %v\ %*		" lines-total : cols
set statusline+=%4*\ %P\ %*			" doc percentage

" Formatting
set showmatch
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set smarttab

" Search
set hlsearch
set smartcase
set incsearch

" Language
syntax on
"set spell
