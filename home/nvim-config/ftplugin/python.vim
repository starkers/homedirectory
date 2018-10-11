


nnoremap <leader>t oimport pudb; pudb.set_trace()<Esc>

" map <Leader>t :call InsertLine()<CR>
" function! InsertLine()
"   let trace = expand("import pydb; pudb.set_trace()")
"   execute "normal o".trace
" endfunction

" " allow you to insert a breakpoint on demand
" if has('gui_running')
"   function EnableDebug()
"   " note 'pip install pudb'
"   let text="from pudb import set_trace; set_trace()"
"   0put =text
"   endfunction
"   nnoremap <leader>b :call EnableDebug()<CR>
" endif

"python with virtualenv support
"
" hide .pyc in file list
let NERDTreeIgnore = ['\.pyc$']


"    _          _ _
"  (_) ___  __| (_)
"  | |/ _ \/ _` | |
"  | |  __/ (_| | |
" _/ |\___|\__,_|_|
"|__/
"
" https://github.com/zchee/deoplete-jedi
let g:jedi#goto_assignments_command = "<C-]>"
let g:python_host_prog = '/home/starkers/.venv_nvim_2.7'
let g:python3_host_prog = '/home/starkers/.venv_nvim_3'

" see: https://github.com/zchee/deoplete-jedi
let g:deoplete#sources#jedi#show_docstring = 1

" when its time to go pro, read: https://afnan.io/2018-04-12/my-neovim-development-setup/
