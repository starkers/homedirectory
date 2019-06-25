function! myspacevim#before() abort
"  set rtp+=~/.local/bin
"  set rtp+=~/go/bin

  " set path+=~/..local/bin
  " set path+=~/go/bin

  set history=10000
  " let g:spacevim_layer_lang_java_formatter = '/home/starkers/Downloads/google-java-format-1.7-all-deps.jar'
  autocmd BufRead,BufNewFile Jenkinsfile set ft=groovy

" "when opening a file thats already opened in another session, don't moan"
" "...just open it in [RO]"
  augroup NoSimultaneousEdits
    autocmd!
    autocmd SwapExists * let v:swapchoice = 'o'
    autocmd SwapExists * echo 'Duplicate edit session (readonly)'
    autocmd SwapExists * echohl None
  "  autocmd SwapExists * sleep 1
  augroup END

  fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
  endfun

  "tpope/vim-commentary: this is 'Ctrl + /'
  nmap    <C-_>                :Commentary<CR>

  "I suck.. but I've already bound these in my head
  nnoremap <C-Left> B
  nnoremap <C-Right> W

endfunction


function! myspacevim#after()
 " set rtp+=~/.local/bin
 " set rtp+=~/go/bin
  set mouse=
  nnoremap <S-up>    :resize -1<cr>
  nnoremap <S-down>  :resize +1<cr>
  nnoremap <S-left>  :vertical resize -3<cr>
  nnoremap <S-right> :vertical resize +3<cr>

  nnoremap <C-N> :bnext<CR>
  nnoremap <C-P> :bprev<CR>
  set listchars=extends:❯,precedes:❮,trail:·,nbsp:·
  highlight TermCursor ctermfg=red guifg=red
  highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /\s\+$/


  set directory=/dev/shm
  set backupdir=/dev/shm
  set undodir=/dev/shm

  ""  nnoremap <leader>k :call TrimWhitespace()<CR>
  call SpaceVim#mapping#space#def('nnoremap', ['-'], ':call TrimWhitespace()', 'trim any trailing whitespace', 1)

endfunction
