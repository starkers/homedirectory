" au BufRead,BufNewFile Makefile
" setlocal listchars=tab:▸\ ,extends:❯,precedes:❮,trail:·,nbsp:·
" vim-go
let g:go_def_mapping_enabled = 1
let g:go_fmt_command = 'goimports'
" let g:go_fmt_fail_silently = 1
let g:go_term_enabled = 1


" cause there will be tabs, show them but without the ^I bollox
" setlocal  listchars=tab:▸\ ,extends:❯,precedes:❮,trail:·,nbsp:·
" setlocal  listchars=tab:→\ ,extends:❯,precedes:❮,trail:·,nbsp:·
" setlocal  listchars=tab:\│\ ,extends:❯,precedes:❮,trail:·,nbsp:·
setlocal  listchars=tab:\ \ ,extends:❯,precedes:❮,trail:·,nbsp:·
setlocal  noet ts=4 sw=4 sts=4
" autocmd FileType go highlight SpecialKey guifg=red guibg=purple

nmap <buffer> <leader>r <plug>(go-run)
nmap <buffer> <leader>b <plug>(go-build)
nmap <buffer> <leader>t <plug>(go-test)
nmap <buffer> <leader>e <plug>(go-rename)
nmap <buffer> <c-d> <plug>(go-def-vertical)
nmap <buffer> <c-]> <plug>(go-def-vertical)
nmap <buffer> <leader>i <plug>(go-info)



let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#align_class = 1



" au FileType go nmap <leader>rt <Plug>(go-run-tab)
" au FileType go nmap <leader>rs <Plug>(go-run-split)
" au FileType go nmap <leader>rv <Plug>(go-run-vertical)
