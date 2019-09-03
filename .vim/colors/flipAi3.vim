" Vim color file
" Maintainer: flipMWD
" Last Change: 2019 Aug 04

" For whatever reason:
" 3 != Brown, DarkYellow
" 8 != DarkGray

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "flipAi3"

" General
hi Normal           ctermfg=none        ctermbg=none
hi Visual                               ctermbg=black       cterm=reverse
hi VisualNOS                            ctermbg=white
hi Search           ctermfg=3           ctermbg=none        cterm=underline
hi IncSearch        ctermfg=black       ctermbg=3           cterm=bold

" Status Bar
hi StatusLine       ctermfg=white       ctermbg=black       cterm=none
hi StatusLineNC     ctermfg=gray        ctermbg=black       cterm=none
hi StatusLineTerm   ctermfg=white       ctermbg=black       cterm=none
hi StatusLineTermNC ctermfg=gray        ctermbg=black       cterm=none
hi WildMenu         ctermfg=black       ctermbg=3           cterm=bold
hi WarningMsg       ctermfg=darkred
hi ErrorMsg         ctermfg=white       ctermbg=darkred
hi ModeMsg          ctermfg=darkblue                        cterm=none
hi MoreMsg          ctermfg=darkgreen
hi Question         ctermfg=darkgreen                       cterm=none

hi Directory        ctermfg=blue
hi Title            ctermfg=darkmagenta                     cterm=bold

hi User1            ctermfg=gray        ctermbg=8           cterm=bold
hi User2            ctermfg=black       ctermbg=gray        cterm=bold
hi User3            ctermfg=white       ctermbg=darkblue

" Lines
hi LineNr           ctermfg=gray
hi CursorLineNr     ctermfg=white
hi FoldColumn       ctermfg=darkblue    ctermbg=black
hi SignColumn       ctermfg=magenta     ctermbg=black
hi ColorColumn                          ctermbg=8
hi VertSplit        ctermfg=black       ctermbg=none        cterm=none
hi Folded           ctermfg=darkblue    ctermbg=black
hi NonText          ctermfg=8
hi SpecialKey       ctermfg=8

" Cursor
hi Cursor           ctermfg=black       ctermbg=3
hi lCursor          ctermfg=black       ctermbg=white
hi CursorLine                           ctermbg=black       cterm=none
hi CursorColumn                         ctermbg=black
hi MatchParen       ctermfg=white       ctermbg=darkmagenta

" Diff Mode
hi DiffAdd          ctermfg=white       ctermbg=darkgreen
hi DiffDelete       ctermfg=black       ctermbg=darkred
hi DiffChange       ctermfg=3           ctermbg=black
hi DiffText         ctermfg=black       ctermbg=3

" Quickfix
hi QuickFixLine     ctermfg=3           ctermbg=none        cterm=underline

" Debugging
hi debugPC          ctermfg=white       ctermbg=cyan
hi debugBreakpoint  ctermfg=white       ctermbg=darkred

" Popup Menu
hi Pmenu            ctermfg=gray        ctermbg=black
hi PmenuSel         ctermfg=white       ctermbg=darkblue
hi PmenuSbar                            ctermbg=8
hi PmenuThumb                           ctermbg=gray

" Tab Pages
hi TabLine          ctermfg=gray        ctermbg=8           cterm=none
hi TabLineFill      ctermfg=black       ctermbg=black       cterm=none
hi TabLineSel       ctermfg=white       ctermbg=darkblue    cterm=bold

" Syntax
hi Comment          ctermfg=darkgray

hi Constant         ctermfg=blue                            cterm=none
hi String           ctermfg=red
hi Character        ctermfg=red
hi Number           ctermfg=green
hi Boolean          ctermfg=darkblue
hi Float            ctermfg=green

hi Identifier       ctermfg=blue                            cterm=none
hi Function         ctermfg=yellow

hi Statement        ctermfg=magenta                         cterm=none
hi Conditional      ctermfg=magenta
hi Repeat           ctermfg=magenta
hi Label            ctermfg=magenta
hi Operator         ctermfg=white
hi Keyword          ctermfg=darkblue
hi Exception        ctermfg=magenta

hi PreProc          ctermfg=darkmagenta                     cterm=none
hi Include          ctermfg=darkmagenta
hi Define           ctermfg=darkmagenta
hi Macro            ctermfg=darkmagenta
hi PreCondit        ctermfg=darkmagenta

hi Type             ctermfg=darkblue                        cterm=none
hi StorageClass     ctermfg=darkblue
hi Structure        ctermfg=darkblue
hi Typedef          ctermfg=darkblue

hi Special          ctermfg=darkcyan                        cterm=none
hi SpecialChar      ctermfg=cyan
hi Tag              ctermfg=red
hi Delimiter        ctermfg=darkcyan
hi SpecialComment   ctermfg=darkcyan
hi Debug            ctermfg=yellow

hi Underlined       ctermfg=blue                            cterm=underline
hi Ignore           ctermfg=darkgray
hi Error            ctermfg=white       ctermbg=darkred
hi Todo             ctermfg=black       ctermbg=yellow

" Spelling Errors
hi SpellBad         ctermfg=darkred     ctermbg=none        cterm=underline
hi SpellCap         ctermfg=darkmagenta ctermbg=none        cterm=underline
hi SpellLocal       ctermfg=cyan        ctermbg=none        cterm=underline
hi SpellRare        ctermfg=cyan        ctermbg=none        cterm=underline
