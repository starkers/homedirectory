let g:virtualenv_auto_activate = 1



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
" let g:python_host_prog = '/home/starkers/.venv_nvim_2.7/bin/python'
" let g:python3_host_prog = '/home/starkers/.venv_nvim_3/bin/python'

" see: https://github.com/zchee/deoplete-jedi
let g:deoplete#sources#jedi#show_docstring = 1

let g:jedi#auto_initialization = 1
let g:jedi#documentation_command = "D"

" when its time to go pro, read: https://afnan.io/2018-04-12/my-neovim-development-setup/



" let g:jedi#goto_command = "<leader>d"
" let g:jedi#goto_assignments_command = "<leader>g"
" let g:jedi#goto_definitions_command = ""
" let g:jedi#documentation_command = "K"
" let g:jedi#usages_command = "<leader>n"
" let g:jedi#completions_command = "<C-Space>"
" let g:jedi#rename_command = "<leader>r"
"
let g:ale_linters = {
  \ 'python': ['flake8','pycodestyle'],
  \ }

nnoremap <space>. :lnext<CR>
nnoremap <space>, :lprevious<CR>
" nnoremap <space>r :lrewind<CR>

" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0
