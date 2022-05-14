" Vim syntax file
" Language:     HTML
" Maintainer:   flipMWD
" Last Change:  2019 Aug 14

hi def link htmlTag                 Comment
hi def link htmlEndTag              Comment
hi def link htmlStatement           Keyword
hi def link htmlTagName             htmlStatement
hi def link htmlArg                 Identifier
hi def link htmlSpecialChar         SpecialChar
hi def link htmlEvent               Function
hi def link javaScript              Special
hi def link javaScriptExpression    javaScript
hi def link htmlItalic              Operator
hi def link htmlBoldItalic          Operator

if !exists("html_no_rendering")
    hi def link htmlTitle               Operator
    hi def link htmlH1                  Operator
endif

if exists("html_extended_events")
    syn region htmlEvent        contained start=+\<on\a\+\s*=[\t ]*'+ms=s-5 end=+'+ contains=htmlEventSQ
    syn region htmlEvent        contained start=+\<on\a\+\s*=[\t ]*"+ end=+"+ contains=htmlEventDQ
else
    syn region htmlEvent        contained start=+\<on\a\+\s*=[\t ]*'+ms=s-5 end=+'+ keepend contains=htmlEventSQ
    syn region htmlEvent        contained start=+\<on\a\+\s*=[\t ]*"+ end=+"+ keepend contains=htmlEventDQ
endif
syn region htmlEventSQ        contained start=+'+ms=s+1 end=+'+me=s-1 contains=@htmlJavaScript
syn region htmlEventDQ        contained start=+"+ms=s+1 end=+"+me=s-1 contains=@htmlJavaScript
hi def link htmlEventSQ htmlEvent
hi def link htmlEventDQ htmlEvent
