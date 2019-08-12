" Vim syntax file
" Language:	C
" Maintainer:	flipMWD
" Last Change:	2019 Aug 10

" Test
syn match cCustomParen          "?=(" contains=cParen,cCppParen
syn match cCustomFunc           "\w\+\s*(\@=" contains=cCustomParen
syn match cCustomScope          "::"
syn match cCustomClass          "\w\+\s*::" contains=cCustomScope

hi def link cCustomFunc         Function
hi def link cCustomClass        Special
