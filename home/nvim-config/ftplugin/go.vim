" "mdempsky/gocode"
" let g:deoplete#enable_at_startup = 1


" "HIGHLIGHTS"
au FileType go nmap <leader>, :GoDeclsDir<cr>
nmap <buffer> <leader>r <plug>(go-rename)
au FileType go nmap <leader><CR> <Plug>(go-run-vertical)
au FileType go nmap <leader>gd <Plug>(go-def)

au FileType go nmap <F8> :GoMetaLinter<cr>
au FileType go nmap <F9> :GoCoverageToggle -short<cr>
au FileType go nmap <F10> :GoTest -short<cr>
au FileType go nmap <F12> <Plug>(go-def)


set completeopt+=noinsert
set completeopt+=noselect
set completeopt-=preview " disable preview window at the bottom of the screen

inoremap <silent><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#align_class = 1

"gocode
setlocal omnifunc=gocomplete#Complete

let g:go_def_mapping_enabled = 1

" " Run goimports when running gofmt
let g:go_fmt_command = 'goimports'

" " let g:go_fmt_fail_silently = 1
" let g:go_term_enabled = 1


" setlocal  listchars=tab:▸\ ,extends:❯,precedes:❮,trail:·,nbsp:·
" setlocal  listchars=tab:→\ ,extends:❯,precedes:❮,trail:·,nbsp:·
" "Lie to me.. I don't wanna know there are tabs.. nore should i care"
setlocal  listchars=tab:\ \ ,extends:❯,precedes:❮,trail:·,nbsp:·

setlocal  noet ts=2 sw=2 sts=2


" nmap <buffer> <leader>r <plug>(go-run)
" nmap <buffer> <leader>b <plug>(go-build)
" nmap <buffer> <leader>t <plug>(go-test)
" nmap <buffer> <c-d> <plug>(go-def-vertical)
" nmap <buffer> <c-]> <plug>(go-def-vertical)
nmap <buffer> <leader>i <plug>(go-info)




"complete pointers
let g:deoplete#sources#go#pointer = 1


au FileType go nmap <leader>rt <Plug>(go-run-tab)
au FileType go nmap <leader>rs <Plug>(go-run-split)

 let g:go_decls_includes = "func,type"
 let g:go_def_mode = 'godef'




" Mappings
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
au FileType go nmap <leader>gc <Plug>(go-coverage-toggle)
au FileType go nmap <leader>gdv <Plug>(go-def-vertical)
au FileType go nmap <leader>gdh <Plug>(go-def-split)
au FileType go nmap <leader>gD <Plug>(go-doc)
au FileType go nmap <leader>gDv <Plug>(go-doc-vertical)


" " Set neosnippet as snippet engine
" let g:go_snippet_engine = "neosnippet"

" Enable syntax highlighting per default
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1

" Show the progress when running :GoCoverage
let g:go_echo_command_info = 1

" Show type information
let g:go_auto_type_info = 1

" Highlight variable uses
let g:go_auto_sameids = 1

" Add the failing test name to the output of :GoTest
let g:go_test_show_name = 1

" " Set whether the JSON tags should be snakecase or camelcase.
" let g:go_addtags_transform = "snakecase"

" " neomake configuration for Go.
" let g:neomake_go_enabled_makers = [ 'go', 'gometalinter' ]
" let g:neomake_go_gometalinter_maker = {
"   \ 'args': [
"   \   '--tests',
"   \   '--enable-gc',
"   \   '--concurrency=3',
"   \   '--fast',
"   \   '-D', 'aligncheck',
"   \   '-D', 'dupl',
"   \   '-D', 'gocyclo',
"   \   '-D', 'gotype',
"   \   '-E', 'misspell',
"   \   '-E', 'unused',
"   \   '%:p:h',
"   \ ],
"   \ 'append_file': 0,
"   \ 'errorformat':
"   \   '%E%f:%l:%c:%trror: %m,' .
"   \   '%W%f:%l:%c:%tarning: %m,' .
"   \   '%E%f:%l::%trror: %m,' .
"   \   '%W%f:%l::%tarning: %m'
" \ }
