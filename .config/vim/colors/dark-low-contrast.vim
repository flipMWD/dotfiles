" Vim colorscheme file
" Maintainer: flipMWD
" Last Change: 2021 Oct 07

" Terminal Colors
" black         = 0     darkgray    = 8*
" darkred       = 1     red         = 9
" darkgreen     = 2     green       = 10
" darkyellow    = 3*    yellow      = 11
" darkblue      = 4     blue        = 12
" darkmagenta   = 5     magenta     = 13
" darkcyan      = 6     cyan        = 14
" gray          = 7*    white       = 15
" * These colors only work with numbers. Gray, Darkgray and Brown also exist.

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "dark-low-contrast"

" General
hi Normal           ctermfg=none        ctermbg=none
hi Visual                               ctermbg=none        cterm=reverse
hi VisualNOS                            ctermbg=none        cterm=reverse
hi Search           ctermfg=yellow      ctermbg=none        cterm=underline
hi IncSearch        ctermfg=black       ctermbg=yellow      cterm=bold,underline

" Status Bar
hi StatusLine       ctermfg=white       ctermbg=black       cterm=none
hi StatusLineNC     ctermfg=7           ctermbg=none        cterm=none
hi StatusLineTerm   ctermfg=white       ctermbg=black       cterm=none
hi StatusLineTermNC ctermfg=7           ctermbg=none        cterm=none
hi WildMenu         ctermfg=black       ctermbg=3           cterm=bold
hi WarningMsg       ctermfg=darkred
hi ErrorMsg         ctermfg=white       ctermbg=red
hi ModeMsg          ctermfg=darkblue                        cterm=none
hi MoreMsg          ctermfg=darkgreen
hi Question         ctermfg=darkgreen                       cterm=none

hi Directory        ctermfg=darkblue
hi Title            ctermfg=darkmagenta                     cterm=bold

hi User1            ctermfg=darkblue    ctermbg=none        cterm=bold,reverse

" Lines
hi LineNr           ctermfg=7
hi CursorLineNr     ctermfg=none                            cterm=none
hi FoldColumn       ctermfg=darkblue    ctermbg=black
hi SignColumn       ctermfg=magenta     ctermbg=black
hi ColorColumn                          ctermbg=8
hi VertSplit        ctermfg=black       ctermbg=none        cterm=none
hi Folded           ctermfg=darkblue    ctermbg=black
hi NonText          ctermfg=0
hi SpecialKey       ctermfg=0

" Cursor
hi Cursor           ctermfg=black       ctermbg=3
hi lCursor          ctermfg=black       ctermbg=white
hi CursorLine                           ctermbg=black       cterm=none
hi CursorColumn                         ctermbg=black
hi MatchParen       ctermfg=yellow      ctermbg=none        cterm=bold

" Diff Mode
hi DiffAdd          ctermfg=darkgreen   ctermbg=none
hi DiffDelete       ctermfg=darkred     ctermbg=none
hi DiffChange       ctermfg=3           ctermbg=none
hi DiffText         ctermfg=3           ctermbg=none        cterm=reverse

" Quickfix
hi QuickFixLine     ctermfg=darkred     ctermbg=none        cterm=none

" Debugging
hi debugPC          ctermfg=white       ctermbg=darkcyan
hi debugBreakpoint  ctermfg=white       ctermbg=red

" Popup Menu
hi Pmenu            ctermfg=7           ctermbg=black
hi PmenuSel         ctermfg=darkblue    ctermbg=none        cterm=reverse
hi PmenuSbar                            ctermbg=8
hi PmenuThumb                           ctermbg=7

" Tab Pages
hi TabLine          ctermfg=none        ctermbg=none        cterm=none
hi TabLineFill      ctermfg=black       ctermbg=none        cterm=none
hi TabLineSel       ctermfg=none        ctermbg=black       cterm=bold

" Syntax
hi Comment          ctermfg=7

hi Constant         ctermfg=darkmagenta                     cterm=none
hi String           ctermfg=darkmagenta
hi Character        ctermfg=darkmagenta
hi Number           ctermfg=darkgreen
hi Boolean          ctermfg=darkgreen
hi Float            ctermfg=darkgreen

hi Identifier       ctermfg=darkblue                        cterm=none
hi Function         ctermfg=darkblue

hi Statement        ctermfg=darkcyan                        cterm=none
hi Conditional      ctermfg=darkcyan
hi Repeat           ctermfg=darkcyan
hi Label            ctermfg=darkcyan
hi Operator         ctermfg=white
hi Keyword          ctermfg=darkcyan
hi Exception        ctermfg=darkcyan

hi PreProc          ctermfg=darkcyan                        cterm=none
hi Include          ctermfg=darkcyan
hi Define           ctermfg=darkcyan
hi Macro            ctermfg=darkcyan
hi PreCondit        ctermfg=darkcyan

hi Type             ctermfg=darkblue
hi StorageClass     ctermfg=darkblue
hi Structure        ctermfg=darkblue
hi Typedef          ctermfg=darkblue

hi Special          ctermfg=white                           cterm=none
hi SpecialChar      ctermfg=white
hi Tag              ctermfg=darkyellow
hi Delimiter        ctermfg=7
hi SpecialComment   ctermfg=darkyellow
hi Debug            ctermfg=darkyellow

hi Underlined       ctermfg=darkcyan                        cterm=underline
hi Ignore           ctermfg=8
hi Error            ctermfg=white       ctermbg=darkred
hi Todo             ctermfg=black       ctermbg=3

" Spelling Errors
hi SpellBad         ctermfg=red         ctermbg=none        cterm=underline
hi SpellCap         ctermfg=darkred     ctermbg=none        cterm=underline
hi SpellLocal       ctermfg=darkred     ctermbg=none        cterm=underline
hi SpellRare        ctermfg=red         ctermbg=none        cterm=underline

" vim:sw=4:sts=4:ts=4:et
