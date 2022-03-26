if !empty(globpath(&runtimepath, 'plugin/fzf.vim'))
	nnoremap <Leader>e :GFiles<CR>
	nnoremap <Leader>d :Files <C-r>=expand("%:p:h:h")<CR>
	nnoremap <Leader>f :Files <C-r>=expand("%:p:h")<CR><CR>
	nnoremap <Leader>g :Rg<CR>
	nnoremap <Leader>t :call GenerateTags()<CR>
	nnoremap <Leader>/ :Lines<CR>
	nnoremap <Leader>c :Commits<CR>
	nnoremap <Leader>b :BCommits<CR>
	nnoremap <Leader>j :Buffer<CR>
	nnoremap <Leader>k :BTags<CR>
	nnoremap <Leader>' :Marks<CR>
else
	nnoremap <Leader>e :edit <C-z><S-Tab>
	nnoremap <Leader>d :edit <C-r>=expand("%:p:h")."/"<CR><C-z><S-Tab>
	nnoremap <Leader>f :find<Space>
	nnoremap <Leader>g :grep<Space>
	nnoremap <Leader>j :ls<CR>:buffer<Space>
	nnoremap <Leader>k <C-^>
	nnoremap <Leader>' :marks<CR>:normal '
endif
