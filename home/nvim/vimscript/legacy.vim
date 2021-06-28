" always return to same location in a file when re-opening it
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"r vim-easy-align Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"" vim-easy-align Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" "" gitgutter
" let g:gitgutter_enabled = 1
" let g:gitgutter_eager = 1
" let g:gitgutter_realtime = 1
" nmap g] <Plug>(GitGutterNextHunk)      
" nmap g[ <Plug>(GitGutterPrevHunk)





"" FZF + AG
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" Use the the_silver_searcher if possible
if executable('ag')
  " let g:ackprg = 'ag --vimgrep --smart-case'
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

nnoremap <leader>a :Ag<space>
"search for word under cursor by pressing Ctrl+A
nnoremap <C-a> :Ag <C-R><C-W><cr>

map <silent><leader>qq :qa!<cr>





nnoremap n nzzzv
nnoremap N Nzzzv


"" install with:  go get github.com/starkers/yamlfmt
nnoremap <leader>yf :%!yamlfmt<CR>
