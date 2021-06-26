"                        _
"  _ __   ___  _____   _(_)_ __ ___
" | '_ \ / _ \/ _ \ \ / / | '_ ` _ \
" | | | |  __/ (_) \ V /| | | | | | |
" |_| |_|\___|\___/ \_/ |_|_| |_| |_|
"
"

source $HOME/.config/nvim/plugins.vim


set history=500
filetype plugin on
filetype indent on


let mapleader = " "
"nmap <leader>w :w!<cr>




set path+=~/.software/bin

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set ai                         " Auto indent
set backspace=eol,start,indent " change backspace behavour
set encoding=utf8              " uft is good
set expandtab                  " expand tab on default
set foldcolumn=0               " no extra margin to the left
set ignorecase                 " ignore caps in search
set incsearch                  " realtime/incremental search (as u type)
"set lazyredraw                 " save cpu
"set lbr                        " Linebreak on 100 characters
set magic                      " this is not vi
set mat=4                      " How many tenths of a second to blink when matching brackets
"set nobackup                   " skip backup
"set noerrorbells               " No annoying sound on errors
set noswapfile                 " no swap
"set novisualbell               " No annoying sound on errors
"set nowb
set shiftwidth=2               " 2 space'd tabs
set showmatch                  " show matching results when searching
set si                         " Smart indent
set smartcase                  " smart case
set smarttab                   " smart Tag behabior
"set so=7
"set t_vb=                      " No annoying sound on errors
set tabstop=2                  " 2 is just fine
"set tm=500                     " No annoying sound on errors
"" set tw=100                     " Linebreak on 100 characters
"" set whichwrap+=<,>,h
"set wildignore+=*/.git/*,*/.hg/*,*.o,*~,*.pyc
"set wildmenu
"" set wrap                       " Wrap lines

let g:rehash256 = 1
" set t_Co=256                   " terminal has colours
" set t_ut=

if exists("$TMUX")
  set t_Co=256
  set notermguicolors
else
  set termguicolors
endif

set termguicolors
"" colorscheme jellybeans
"" colorscheme molokai

" colorscheme OceanicNext
colorscheme challenger_deep
" colorscheme deep-space
" colorscheme dracula
" colorscheme nord
" colorscheme onedark
" colorscheme onehalfdark
" colorscheme purify
" colorscheme purify
" colorscheme rdark-terminal2
" colorscheme ron
" colorscheme tender
" colorscheme vim-monokai-tasty
" colorscheme wombat256mod
" colorscheme PaperColor
" colorscheme challenger_deep
" colorscheme deus

"" use a slightly darker background, like GitHub inline code blocks
"let g:github_colors_soft = 1


"" use the dark theme
set background=dark

"" more blocky diff markers in signcolumn (e.g. GitGutter)
"let g:github_colors_block_diffmark = 0

" colorscheme materialbox
" colorscheme purify
" let g:airline_theme = "oceanicnext"

" colorscheme oceanic_material
" colorscheme challenger_deep
" colorscheme deep-space
" colorscheme mountaineer
let g:airline_theme = "jellybeans"


"" "" transparent
"" hi Normal guibg=NONE ctermbg=NONE
"" let t:is_transparent = 1



"" most colourschemes utterly suck in vimdiff mode
"" use a specific one that doesn't when vimdiff == true
if &diff
  colorscheme PaperColor
endif





"syntax enable               " enable syntax highlighting
"" vim-easy-align Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"" vim-easy-align Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
"map <c-space> ?

"" Disable highlight when <leader><cr> is pressed
"map <silent> <leader><cr> :noh<cr>

" "" Smart way to move between windows
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l

"" Close the current buffer
"map <leader>bd :Bclose<cr>:tabclose<cr>gT

"" Close all the buffers
"map <leader>ba :bufdo bd<cr>

"map <C-n> :cnext<CR>
""map <C-m> :cprevious<CR>
"" use hidden so bnext/bprev doesn't moan if u have unsaved changes
"set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
"map <leader>l :bnext<cr>
"map <leader>h :bprevious<cr>

"" Useful mappings for managing tabs
"map <leader>tn :tabnew<cr>
"map <leader>to :tabonly<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove
"map <leader>t<leader> :tabnext

"" Let 'tl' toggle between this and the last accessed tab
"let g:lasttab = 1
"nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
"au TabLeave * let g:lasttab = tabpagenr()


"" Opens a new tab with the current buffer's path
"" Super useful when editing files in the same directory
"map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

"" Switch CWD to the directory of the open buffer
"map <leader>cd :cd %:p:h<cr>:pwd<cr>


"set gcr=a:blinkon0 " Disable the blinking cursor.
set scrolloff=5 " always show some lines below the cursor
"set laststatus=2 " Always show the status line




" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv







"" Specify the behavior when switching between buffers
"try
"  set switchbuf=useopen,usetab,newtab
"  set stal=2
"catch
"endtry

"" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"" Quickly open a markdown buffer for scribble
"map <leader>x :e /keybase/private/starkers/buffer.md<cr>




"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>




"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"






" Use the the_silver_searcher if possible
if executable('ag')
  " let g:ackprg = 'ag --vimgrep --smart-case'
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif


if executable('rg')
  let g:rg_derive_root='true'
endif

"" When you press gv you Ack after the selected text
"vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

"" When you press <leader>r you can search and replace the selected text
"vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>


"noremap YY "+y<CR>
"noremap <leader>p "+gP<CR>
"noremap XX "+x<CR>


""" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" """ Move visual block
" vnoremap J :m '>+1<CR>gv=gv
" vnoremap K :m '<-2<CR>gv=gv




"" let g:ctrlp_working_path_mode = 0
"" let g:ctrlp_map = '<c-f>'
"" map <leader>j :CtrlP<cr>
"" map <c-b> :CtrlPBuffer<cr>
"" let g:ctrlp_max_height = 20
"" let g:ctrlp_custom_ignore = 'node_modules\|^\.git\|^\.coffee'


"" normal open nerd Tree
" starting to "unwind" my nerdtree habit
" map <leader>f :NERDTreeToggle<CR>

""" Ctrl+o top Open files in same dir as current file
"" opens the directory of current file in nerd tree
"map <c-o> :NERDTreeFind<CR>
"let g:NERDTreeWinPos = "right"
"let NERDTreeShowHidden=1
"let NERDTreeIgnore = ['\.pyc$', '__pycache__']
"let g:NERDTreeWinSize=35
"let NERDTreeShowBookmarks=1  " show bookmarks on default
""map <leader>nn :NERDTreeToggle<cr>
""map <leader>nb :NERDTreeFromBookmark<Space>
""map <leader>nf :NERDTreeFind<cr>




"PLUGIN:gitgutter
let g:gitgutter_enabled=1
let g:gitgutter_eager = 1
let g:gitgutter_realtime = 1
nmap g] <Plug>(GitGutterNextHunk)
nmap g[ <Plug>(GitGutterPrevHunk)

nnoremap <leader>g :GitGutterToggle<cr>


"highlight GitGutterAdd    guifg=#009900 ctermfg=2
"highlight GitGutterChange guifg=#bbbb00 ctermfg=3
"highlight GitGutterDelete guifg=#ff2222 ctermfg=1



"PLUGIN:ale

""" Disabling highlighting
"let g:ale_set_highlights = 0
""
""" Only run linting when saving the file
""let g:ale_lint_on_text_changed = 'never'
""let g:ale_lint_on_enter = 0

"" nnoremap <leader>a :cclose
map <C-l> :ALEToggle<CR>

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'







"" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
nmap <c-a> :TagbarToggle<CR>
let g:tagbar_autofocus = 1


"" " snippets
"" let g:UltiSnipsExpandTrigger="<tab>"
"" let g:UltiSnipsJumpForwardTrigger="<tab>"
"" let g:UltiSnipsJumpBackwardTrigger="<c-b>"
"" let g:UltiSnipsEditSplit="vertical"

"" ale
let g:ale_linters = {}


:call extend(g:ale_linters, {
    \"go": ['golint', 'go vet'], })


:call extend(g:ale_linters, {
   \'python': ['pep8', 'flake8'], })

"" " vim-airline
"let g:airline_theme                      = 'onehalfdark'
"" let g:airline_theme                      = 'powerlineish'
"" let g:airline_theme                      = 'simple'
"" let g:airline_theme                      = 'wombat'
"" let g:airline_theme                      = 'zenburn'
"" let g:airline_theme                      = 'molokai'


"let g:airline#extensions#ale#enabled          = 1
"let g:airline#extensions#branch#enabled       = 1
"let g:airline#extensions#tabline#enabled      = 1
"let g:airline#extensions#tabline#formatter    = 'unique_tail_improved'
"" let g:airline#extensions#tabline#left_alt_sep = ''
"" let g:airline#extensions#tabline#left_sep     = ''
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#left_sep     = ' '
"let g:airline#extensions#tagbar#enabled       = 1
"let g:airline_left_alt_sep                    = ''
"let g:airline_left_sep                        = ''
"let g:airline_powerline_fonts                 = 1
"let g:airline_right_alt_sep                   = ''
"let g:airline_right_sep                       = ''
"let g:airline_skip_empty_sections             = 0

""tpope/vim-commentary: this is 'Ctrl + /'
nmap <C-_> :Commentary<CR>


""I suck.. but I've already bound these in my head
"nnoremap <C-Left> B
"nnoremap <C-Right> W


set mouse=
nnoremap <S-up>    :resize -1<cr>
nnoremap <S-down>  :resize +1<cr>
nnoremap <S-left>  :vertical resize -3<cr>
nnoremap <S-right> :vertical resize +3<cr>


"" always highlight any trailing whitespce
set listchars=extends:❯,precedes:❮,trail:·,nbsp:·
highlight TermCursor ctermfg=red guifg=red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/


"""""" BACKUP / MRU / UNDO etc
"" au BufWritePre * let &bex = '@' . strftime("%F.%H:%M") " Meaningful backup name, ex: filename@2015-04-05.14:59
set backup                                             " Turn on backup option
set backupcopy=yes                                     " Overwrite the original backup file
set backupdir=~/.vim/backup//                          " Where to store backups
set directory=~/.vim/directory//  "dunno
set undofile  " maintain file history between sessions
set undodir=~/.vim/undo// " where to keep undo history
set writebackup                                        " Make backup before overwriting the current buffer
function! EnsureDirExists (dir)
  if !isdirectory(a:dir)
    if exists("*mkdir")
      call mkdir(a:dir,'p')
      echo "Created directory: " . a:dir
    else
      echo "Please create directory: " . a:dir
    endif
  endif
endfunction
call EnsureDirExists($HOME . '/.vim/backup')
call EnsureDirExists($HOME . '/.vim/undo')



" most recently used files
nnoremap <C-m> :FZFFreshMru<cr>







map <silent><leader>q :q!<cr>
map <silent><leader>qq :qa!<cr>


function! NumberToggle()
  if(&number == 1)
    if (&relativenumber == 1)
      set norelativenumber
      echom "showing absolute line numbers"
    else
      set norelativenumber
      set nonu
      echom "disabling line numbers"
    endif
  else
    echom "enabling line-numbers"
    set relativenumber
    set number
  endif
endfunction
"leader n for number toggle is easier to recall than `
nnoremap <leader>n :call NumberToggle()<cr>
call NumberToggle()



fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun
nnoremap <leader>- :call TrimWhitespace()<cr>















"set splitbelow
"set splitright
"" split current buffer to right
"nnoremap <C-up>    :vert sb#<cr>
"" split current buffer to bottom (vertical)
"nnoremap <C-down>  :sb#<cr>




""" auto read if the file changes under the hood
set autoread
au CursorHold,CursorHoldI * :checktime
au FocusGained,BufEnter * :checktime
set updatetime=1000





"LANG:json
autocmd FileType json setlocal shiftwidth=2 tabstop=2


""" stolen from spacevim
" this hides the quotes around keys and values in json
if exists('*json_decode')
  let g:_spacevim_api_json_trus = v:true
  let g:_spacevim_api_json_trus = v:false
  let g:_spacevim_api_json_trus = v:null
  function! s:json_decode(json) abort
    if a:json ==# ''
      return []
    endif
    return json_decode(a:json)
  endfunction
else
  function! s:json_null() abort
  endfunction
  function! s:json_true() abort
  endfunction
  function! s:json_false() abort
  endfunction
  let g:_spacevim_api_json_trus = [function('s:json_true')]
  let g:_spacevim_api_json_falss = [function('s:json_false')]
  let g:_spacevim_api_json_nuls = [function('s:json_null')]
  " @vimlint(EVL102, 1, l:true)
  " @vimlint(EVL102, 1, l:false)
  " @vimlint(EVL102, 1, l:null)
  function! s:json_decode(json) abort
    let true = g:_spacevim_api_json_trus
    let false = g:_spacevim_api_json_falss
    let null = g:_spacevim_api_json_nuls
    if substitute(a:json, '\v\"%(\\.|[^"\\])*\"|true|false|null|[+-]?\d+%(\.\d+%([Ee][+-]?\d+)?)?', '', 'g') !~# "[^,:{}[\\] \t]"
      try
        let object = eval(a:json)
      catch
        " malformed JSON
        let object = ''
      endtry
    else
      let object = ''
    endif
    return object
  endfunction
  " @vimlint(EVL102, 0, l:true)
  " @vimlint(EVL102, 0, l:false)
  " @vimlint(EVL102, 0, l:null)
endif
lockvar g:_spacevim_api_json_trus
lockvar g:_spacevim_api_json_falss
lockvar g:_spacevim_api_json_nuls



""search project files
nnoremap <c-f> :FZF<cr>

""search project files by lines of code
"nnoremap <leader>o :Lines<cr>
""search project files by tags (requirs ctags to be installed)
"nnoremap <leader>t :Tags<cr>
""search all open files/buffers
"nnoremap <leader>r :Buffers<cr>



"start a search query by pressing |
nnoremap \|  :Ag<space>
"search for word under cursor by pressing \
nnoremap \ :Ag <C-R><C-W><cr>
" nnoremap \ :Ag <C-R><C-W><cr>:cw<cr>


set cursorcolumn  "vertical line to see where my cursor is lined up with
set hlsearch       "highlight what I'm searching for in real-time


nnoremap <F2> :PrevColorScheme<CR>
nnoremap <F3> :NextColorScheme<CR>
let g:colorscheme_switcher_exclude_builtins = 1


"" format yaml



"let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/plugged/vim-go/gosnippets/UltiSnips']

"" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"" " let g:UltiSnipsExpandTrigger="<tab>"
"" let g:UltiSnipsExpandTrigger="<s-tab>"
"" " let g:UltiSnipsListSnippets=<c-tab>
"" let g:UltiSnipsJumpForwardTrigger="<c-j>"
"" let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"





"function! g:UltiSnips_Complete()
"  call UltiSnips#ExpandSnippet()
"  if g:ulti_expand_res == 0
"    if pumvisible()
"      return "\<C-n>"
"    else
"      call UltiSnips#JumpForwards()
"      if g:ulti_jump_forwards_res == 0
"        return "\<TAB>"
"      endif
"    endif
"  endif
"  return ""
"endfunction

"function! g:UltiSnips_Reverse()
"  call UltiSnips#JumpBackwards()
"  if g:ulti_jump_backwards_res == 0
"    return "\<C-P>"
"  endif

"  return ""
"endfunction


"if !exists("g:UltiSnipsJumpForwardTrigger")
"  let g:UltiSnipsJumpForwardTrigger = "<tab>"
"endif

"if !exists("g:UltiSnipsJumpBackwardTrigger")
"  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"endif

"au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger       . " <C-R>=g:UltiSnips_Complete()<cr>"
"au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

"" indentkeys-=0# indentkeys-=<:>




let g:indentLine_leadingSpaceEnabled='0'
nnoremap <leader>t :IndentLinesToggle<cr>

" " " disable indentLines for nerdtree
" autocmd BufEnter NERD_tree* :LeadingSpaceDisable




"LANG:hcl
autocmd BufNewFile,BufRead *.hcl set syntax=terraform filetype=terraform

"LANG:terraform

nnoremap <leader>tt :%!~/.software/bin/terraform fmt<CR>
"" vim augroup filetypedetect autocmd BufRead,BufNewFile *.hcl set filetype=terraform augroup END
"""Allow vim-terraform to automatically format *.tf and *.tfvars files with terraform fmt. You can also do this manually with the :TerraformFmt command.
"let g:terraform_fmt_on_save         = 1
"let g:terraform_align               = 1
"let g:vim_json_syntax_conceal       = 0
"let g:vim_json_syntax_concealcursor = ''
" Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" (Optional)Remove Info(Preview) window
set completeopt-=preview

" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" (Optional) Enable terraform plan to be include in filter
let g:syntastic_terraform_tffilter_plan = 1

" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1

" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
let g:terraform_registry_module_completion = 0




"LANG:py
"" https://pypi.org/project/black/
autocmd BufWritePre *.py set tabstop=2 sw=2 softtabstop=2


"LANG:yaml
"" autocmd BufWritePre *.yml execute ':%!yamlfmt'
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=<:>
"" install with:  go get -u github.com/wangkuiyi/yamlfmt
nnoremap <leader>yf :%!yamlfmt<CR>


"LANG:starlark
" autocmd BufNewFile *.star set ft=python tabstop=2 sw=2 softtabstop=2

"LANG:go


"let g:go_fmt_command                         = "goimports"
"let g:go_fmt_fail_silently                   = 1
"let g:go_highlight_array_whitespace_error    = 0
"let g:go_highlight_build_constraints         = 1
"let g:go_highlight_extra_types               = 1
"let g:go_highlight_fields                    = 1
"let g:go_highlight_functions                 = 1
"let g:go_highlight_generate_tags             = 1
"let g:go_highlight_methods                   = 1
"let g:go_highlight_operators                 = 1
"let g:go_highlight_space_tab_error           = 0
"let g:go_highlight_trailing_whitespace_error = 0
"let g:go_list_type                           = "quickfix"

augroup go
	autocmd!

	let g:go_highlight_types                     = 1
	let g:go_highlight_structs                   = 1

	setlocal omnifunc=gocomplete#Complete
	autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

"	" :GoBuild and :GoTestCompile
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
"	" :GoTest
"	autocmd FileType go nmap <leader>t  <Plug>(go-test)
"	" :GoRun
"	autocmd FileType go nmap <leader>r  <Plug>(go-run)
"	" :GoDoc
autocmd FileType go nmap <Leader>d <Plug>(go-doc)
"	" :GoCoverageToggle
"	autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
"	" :GoInfo
autocmd FileType go nmap <Leader>i <Plug>(go-info)
"	" :GoMetaLinter
autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)
"	" :GoDef but opens in a vertical split
autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
"	" :GoDef but opens in a horizontal split
autocmd FileType go nmap <Leader>s <Plug>(go-def-split)
"	" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>
"	autocmd FileType go nmap <leader>b  <Plug>(go-build)
"	autocmd FileType go nmap <leader>r  <Plug>(go-run)

"	"let g:go_list_type = "quickfix"

	autocmd FileType go nmap <leader>t  <Plug>(go-test)

	autocmd FileType go nmap <leader>b  <Plug>(go-build)

"	" " run :GoBuild or :GoTestCompile based on the go file
"	" function! s:build_go_files()
"	"   let l:file = expand('%')
"	"   if l:file =~# '^\f\+_test\.go$'
"	"     call go#test#Test(0, 1)
"	"   elseif l:file =~# '^\f\+\.go$'
"	"     call go#cmd#Build(0)
"	"   endif
"	" endfunction
"	" autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

augroup END


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>



" highlight recently yankyed sections
augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 1000})
augroup END




" Disable Arrow keys in Normal mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>


nnoremap <silent><Leader>n :RangerOpenCurrentFile<CR>
nnoremap <silent><Leader>c :RangerOpenCurrentDir<CR>
nnoremap <silent><Leader>f :RangerOpenProjectRootDir<CR>

let g:ranger_explorer_keymap_edit    = '<C-o>'
let g:ranger_explorer_keymap_tabedit = '<C-t>'
let g:ranger_explorer_keymap_split   = '<C-s>'
let g:ranger_explorer_keymap_vsplit  = '<C-v>'
