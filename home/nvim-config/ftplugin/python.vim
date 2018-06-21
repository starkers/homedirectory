
let g:jedi#goto_assignments_command = "<C-]>"

" py <<EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
" EOF


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
"
let NERDTreeIgnore = ['\.pyc$']
