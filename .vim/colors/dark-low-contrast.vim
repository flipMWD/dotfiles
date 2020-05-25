" Vim color file
" Maintainer: flipMWD
" Last Change: 2020 May 18

" Terminal Colors
" black         = 0     darkgray    = 8*
" darkred       = 1     red         = 9
" darkgreen     = 2     green       = 10
" darkyellow    = 3*    yellow**    = 11
" darkblue      = 4     blue        = 12
" darkmagenta   = 5     magenta     = 13
" darkcyan      = 6     cyan        = 14
" gray          = 7     white       = 15
" * These two colors only work with numbers. Darkgray and Brown also exist.
" ** Yellow is defined as Orange in ~/.Xresources.

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "dark-low-contrast"

" General
hi Normal           ctermfg=none        ctermbg=none
hi Visual                               ctermbg=black       cterm=reverse
hi VisualNOS                            ctermbg=white
hi Search           ctermfg=yellow      ctermbg=none        cterm=underline
hi IncSearch        ctermfg=black       ctermbg=yellow      cterm=bold

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

hi Directory        ctermfg=darkblue
hi Title            ctermfg=darkmagenta                     cterm=bold

hi User1            ctermfg=white       ctermbg=8           cterm=bold
hi User2            ctermfg=black       ctermbg=gray        cterm=bold

" Lines
hi LineNr           ctermfg=gray
hi CursorLineNr     ctermfg=white                           cterm=none
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
hi MatchParen       ctermfg=yellow      ctermbg=none        cterm=bold

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
hi PmenuSel         ctermfg=white       ctermbg=blue
hi PmenuSbar                            ctermbg=8
hi PmenuThumb                           ctermbg=7

" Tab Pages
hi TabLine          ctermfg=gray        ctermbg=8           cterm=none
hi TabLineFill      ctermfg=black       ctermbg=black       cterm=none
hi TabLineSel       ctermfg=white       ctermbg=blue        cterm=bold

" Syntax
hi Comment          ctermfg=7

hi Constant         ctermfg=darkmagenta                     cterm=none
hi String           ctermfg=darkmagenta
hi Character        ctermfg=magenta
hi Number           ctermfg=darkgreen
hi Boolean          ctermfg=green
hi Float            ctermfg=darkgreen

hi Identifier       ctermfg=darkblue                        cterm=none
hi Function         ctermfg=blue

hi Statement        ctermfg=darkcyan                        cterm=none
hi Conditional      ctermfg=darkcyan
hi Repeat           ctermfg=darkcyan
hi Label            ctermfg=darkcyan
hi Operator         ctermfg=white                           cterm=bold
hi Keyword          ctermfg=darkcyan
hi Exception        ctermfg=darkcyan

hi PreProc          ctermfg=cyan                            cterm=none
hi Include          ctermfg=cyan
hi Define           ctermfg=cyan
hi Macro            ctermfg=cyan
hi PreCondit        ctermfg=cyan

hi Type             ctermfg=darkblue                        cterm=bold
hi StorageClass     ctermfg=darkblue
hi Structure        ctermfg=darkblue
hi Typedef          ctermfg=darkblue

hi Special          ctermfg=magenta                         cterm=none
hi SpecialChar      ctermfg=magenta
hi Tag              ctermfg=darkyellow
hi Delimiter        ctermfg=7
hi SpecialComment   ctermfg=darkyellow
hi Debug            ctermfg=darkyellow

hi Underlined       ctermfg=darkcyan                        cterm=underline
hi Ignore           ctermfg=darkgray
hi Error            ctermfg=white       ctermbg=darkred
hi Todo             ctermfg=black       ctermbg=3

" Spelling Errors
hi SpellBad         ctermfg=red         ctermbg=none        cterm=underline
hi SpellCap         ctermfg=darkred     ctermbg=none        cterm=underline
hi SpellLocal       ctermfg=darkred     ctermbg=none        cterm=underline
hi SpellRare        ctermfg=red         ctermbg=none        cterm=underline

" Plugins
hi CtrlPMatch       ctermfg=yellow

" vim:sw=4:sts=4:ts=4:et
