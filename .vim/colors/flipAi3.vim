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
hi Visual                               ctermbg=white
hi VisualNOS                            ctermbg=white
hi Search           ctermfg=yellow      ctermbg=none        cterm=underline
hi IncSearch        ctermfg=black       ctermbg=yellow      cterm=bold

" Status Bar
hi StatusLine       ctermfg=white       ctermbg=black       cterm=none
hi StatusLineNC     ctermfg=gray        ctermbg=black       cterm=none
hi StatusLineTerm   ctermfg=white       ctermbg=black       cterm=none
hi StatusLineTermNC ctermfg=gray        ctermbg=black       cterm=none
hi WildMenu         ctermfg=black       ctermbg=yellow      cterm=bold
hi WarningMsg       ctermfg=red
hi ErrorMsg         ctermfg=white       ctermbg=red
hi ModeMsg          ctermfg=blue
hi MoreMsg          ctermfg=darkgreen
hi Question         ctermfg=green                           cterm=none

hi Directory        ctermfg=darkblue
hi Title            ctermfg=magenta                         cterm=bold

hi User1            ctermfg=gray        ctermbg=8           cterm=bold
hi User2            ctermfg=black       ctermbg=gray        cterm=bold
hi User3            ctermfg=white       ctermbg=blue

" Lines
hi LineNr           ctermfg=gray
hi CursorLineNr     ctermfg=white
hi FoldColumn       ctermfg=blue        ctermbg=black
hi SignColumn       ctermfg=magenta     ctermbg=black
hi ColorColumn                          ctermbg=8
hi VertSplit        ctermfg=black       ctermbg=none        cterm=none
hi Folded           ctermfg=blue        ctermbg=black
hi NonText          ctermfg=8
hi SpecialKey       ctermfg=8

" Cursor
hi Cursor           ctermfg=black       ctermbg=yellow
hi lCursor          ctermfg=black       ctermbg=white
hi CursorLine                           ctermbg=black       cterm=none
hi CursorColumn                         ctermbg=black
hi MatchParen       ctermfg=white       ctermbg=magenta

" Diff Mode
hi DiffAdd          ctermfg=white       ctermbg=green
hi DiffDelete       ctermfg=black       ctermbg=red
hi DiffChange       ctermfg=yellow      ctermbg=black
hi DiffText         ctermfg=black       ctermbg=yellow

" Quickfix
hi QuickFixLine     ctermfg=yellow      ctermbg=none        cterm=underline

" Popup Menu
hi Pmenu            ctermfg=gray        ctermbg=black
hi PmenuSel         ctermfg=white       ctermbg=blue
hi PmenuSbar                            ctermbg=8
hi PmenuThumb                           ctermbg=gray

" Tab Pages
hi TabLine          ctermfg=gray        ctermbg=8           cterm=none
hi TabLineFill      ctermfg=black       ctermbg=black       cterm=none
hi TabLineSel       ctermfg=white       ctermbg=blue        cterm=bold

" Syntax
hi Comment          ctermfg=darkgray

hi Constant         ctermfg=darkblue                        cterm=none
hi String           ctermfg=darkred
hi Character        ctermfg=darkred
hi Number           ctermfg=darkgreen
hi Boolean          ctermfg=blue
hi Float            ctermfg=darkgreen

hi Identifier       ctermfg=darkblue                        cterm=none
hi Function         ctermfg=3

hi Statement        ctermfg=darkmagenta                     cterm=none
hi Conditional      ctermfg=darkmagenta
hi Repeat           ctermfg=darkmagenta
hi Label            ctermfg=darkmagenta
hi Operator         ctermfg=white
hi Keyword          ctermfg=blue
hi Exception        ctermfg=darkmagenta

hi PreProc          ctermfg=magenta                         cterm=none
hi Include          ctermfg=magenta
hi Define           ctermfg=magenta
hi Macro            ctermfg=magenta
hi PreCondit        ctermfg=magenta

hi Type             ctermfg=blue                            cterm=none
hi StorageClass     ctermfg=blue
hi Structure        ctermfg=blue
hi Typedef          ctermfg=blue

hi Special          ctermfg=cyan                            cterm=none
hi SpecialChar      ctermfg=magenta
hi Tag              ctermfg=darkred
hi Delimiter        ctermfg=cyan
hi SpecialComment   ctermfg=cyan
hi Debug            ctermfg=darkyellow

hi Underlined       ctermfg=darkcyan                        cterm=underline
hi Ignore           ctermfg=darkgray
hi Error            ctermfg=white       ctermbg=red
hi Todo             ctermfg=black       ctermbg=yellow

" Spelling Errors
hi SpellBad         ctermfg=red         ctermbg=none        cterm=underline
hi SpellCap         ctermfg=magenta     ctermbg=none        cterm=underline
hi SpellLocal       ctermfg=cyan        ctermbg=none        cterm=underline
hi SpellRare        ctermfg=cyan        ctermbg=none        cterm=underline
