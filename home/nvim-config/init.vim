" "========================================================================"
" "==========            vim-plug for plugin management"
" "========================================================================"
call plug#begin('~/.local/share/nvim/plugged')


" "========================================================================"
" "==========            completions and linting"
function! BuildYCM(info)
  " function to automatically run install.py for you
  " info is a dictionary with 3 fields
  "  - name:    name of the plugin
  "  - status: 'installed', 'updated', or 'unchanged'
  "  - force:   set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') } " YCM engine
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " completion framework
Plug 'w0rp/ale'                                               " Async Lint Engine (framework)


" "========================================================================"
" "==========            Language Specifc"

Plug 'tpope/vim-fireplace', { 'for': 'clojure' }          " clojure
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }  " golang
Plug 'fatih/vim-go'                                       " golan
Plug 'zchee/deoplete-jedi'                                " python
Plug 'davidhalter/jedi'                                   " python jedi
Plug 'jmcantrell/vim-virtualenv'                          " venv support


" "========================================================================"
" "==========            Workflow Optimisation"

Plug 'mattn/webapi-vim'                                           " required for gist-vim
Plug 'mattn/gist-vim'                                             " share gists
Plug 'tpope/vim-fugitive'                                         " lets airline detect branch
Plug 'airblade/vim-gitgutter'                                     " git notations
Plug 'ctrlpvim/ctrlp.vim'                                         " Ctrl+P for file searching etc
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " FuzzyFinder
Plug 'junegunn/vim-easy-align'                                    " easy alignment, EG: 'gaip='
Plug 'pbogut/fzf-mru.vim'                                         " MostRecentlyUsed via FZF
Plug 'scrooloose/nerdtree'                                        " file browsing awesomeness
Plug 'tpope/vim-commentary'                                       " Allow comment toggling, EG: :gcip
Plug 'tomtom/tcomment_vim'                                        " has mappings for things like 'gcip'
Plug 'SirVer/ultisnips'                                           " snips
Plug 'honza/vim-snippets'                                         " snip

" "========================================================================"
" "==========            Visual Mods"
Plug 'rafi/awesome-vim-colorschemes'                "collection of colorshemes
Plug 'vim-airline/vim-airline'                      "airline
Plug 'vim-airline/vim-airline-themes'               "airline themes
Plug 'Yggdroot/indentLine'                          "show indent levels (very handy for yaml)
Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'


Plug 'hashivim/vim-terraform'

call plug#end()
""" "========================================================================"



" allow semi-colon to be used instead of ":" all the time
map ; :



" "################ basics #############"

let mapleader=','  " default leader is ,
set shiftwidth=2   " I'm a two-spacer"
set tabstop=2      " ^^
set softtabstop=2  " ^^
set autoindent     " autoindent enabled
set smartindent    " be smart about ai
set list           " show trailing cruft
set et             " expandtab on default"
set showmode       " always show paste mode
set hlsearch       " Highlight search results
set incsearch      " Show the next match while entering a search
set wildmenu       " wild menu, sounds cool
set showmatch      " highlight matching [{()}]
set ruler          " enable ruler on default
set splitbelow     " default split behavior
set splitright     " default split behavior
set number         " show line number on default
set relativenumber " show relative line number on default
syntax on          " syntax on by default

""" "initialise ALE linting"
set nocompatible                                              "no, this is NOT 'vi'
filetype off
let &runtimepath.='~/.local/share/nvim/plugged/ale'
filetype plugin on
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'


""" "git"
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1


" "when opening a file thats already opened in another session, don't moan"
" "...just open it in [RO]"
augroup NoSimultaneousEdits
  autocmd!
  autocmd SwapExists * let v:swapchoice = 'o'
  autocmd SwapExists * echo 'Duplicate edit session (readonly)'
  autocmd SwapExists * echohl None
"  autocmd SwapExists * sleep 1
augroup END


" "================ ,h for some quick crips ===="
" 'cheat' is awesome.. 'pip install cheat --user'
map <silent> <leader>? :edit ~/.cheat/vim<CR>

" "================ pretties ==================="

let g:airline_theme = "bubblegum"                 " airline theme
let g:airline#extensions#tabline#enabled = 1      " Enable the list of buffers

" let g:airline#extensions#tabline#fnamemod = ':t'  " Show just the filename
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#buffer_min_count = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1

let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'


nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>[ <Plug>AirlineSelectPrevTab
nmap <leader>] <Plug>AirlineSelectNextTab
nmap <leader>d <Plug>AirlineSelectPrevTab
nmap <leader>a <Plug>AirlineSelectNextTab

" let g:airline#extensions#tabline#fnamecollapse = 0
" let g:airline#extensions#tabline#fnametruncate = 40


" with the containing parent directory.
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'



let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
" let g:airline_detect_paste=1

" let g:airline_symbols = {}
" let g:airline#extensions#branch#enabled = 1
" let g:airline#extensions#virtualenv#enabled = 1
" let g:airline_extensions = ['branch', 'virtualenv']

" let g:airline#extensions#tabline#show_tabs = 1
" let g:airline_symbols.branch = '⎇'


let g:airline_powerline_fonts = 1                 " you must have appropriate font
let g:deepspace_italics = 1                       " allow italic fonts
set background=dark                               " Dark BG please
set termguicolors                                 " allow support for more colours, this aint putty
" colorscheme deep-space                            " nice and rounded dark theme
" colorscheme paramount                            " nice and rounded dark theme
" colorscheme PaperColor                            " nice and rounded dark theme
" colorscheme onedark
colorscheme materialbox
set scrolloff=4                                   " always show at least X lines above/below the cursor
highlight TermCursor ctermfg=red guifg=red        " highlight whitespace and bad things in big fat RED
highlight ExtraWhitespace ctermbg=red guibg=red   " highlight group for ExtraWhitespace
match ExtraWhitespace /\s\+$/                     " match ExtraWhitespace


function! TabToggle()
  if &expandtab
    set shiftwidth=2
    set softtabstop=0
    set noexpandtab
    echo "expand tab is off"
  else
    set shiftwidth=2
    set softtabstop=2
    set expandtab
    echo "expand tab is on"
  endif
endfunction
nmap <leader>e :call TabToggle()<CR>
" nmap <leader>l :call ALEToggle()<CR>


""" "movement mods"
" move by vertically by visual line
nnoremap j gj
nnoremap k gk
"when visually indenting with < or > keep the selection
vnoremap < <gv
vnoremap > >gv
"always auto-center
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz
" diff
nmap ]c ]czz
nmap [c [czz


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
nnoremap <leader>n  :call NumberToggle()<cr>


""" "enable code completion"
" let g:deoplete#enable_at_startup=1
let g:deoplete#enable_refresh_always=0
let g:deoplete#file#enable_buffer_path=1
let g:deoplete#auto_completion_start_length = 0

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


" have vim jump to last location in a file on default
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif


" trim whitespace with ,w
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun
noremap <leader>w :call TrimWhitespace()<CR>


" exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"

""" "Working with terminal"
""" https://medium.com/@garoth/neovim-terminal-usecases-tricks-8961e5ac19b9

command Paste execute 'set noai | insert | set ai'

""" "Sample Workspace Setup"
" you would launch this with "nvim -c DefaultWorkspace"
" ----------------
function! DefaultWorkspace()
    " Rough num columns to decide between laptop and big monitor screens
    let numcol = 2
    if winwidth(0) >= 220
        let numcol = 3
    endif
    if numcol == 3
        e term://zsh
        file Shell\ Two
        vnew
    endif
    vsp term://zsh
    file Context
    sp term://zsh
    file Shell\ One
    wincmd k
    resize 4
    wincmd h
endfunction
command! -register DefaultWorkspace call DefaultWorkspace()

" Terminal settings
tnoremap <Leader><ESC> <C-\><C-n>

" Window navigation function
" Make ctrl-h/j/k/l move between windows and auto-insert in terminals
func! s:mapMoveToWindowInDirection(direction)
    func! s:maybeInsertMode(direction)
        stopinsert
        execute "wincmd" a:direction
        if &buftype == 'terminal'
            startinsert!
        endif
    endfunc
    execute "tnoremap" "<silent>" "<C-" . a:direction . ">"
                \ "<C-\\><C-n>"
                \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
    execute "nnoremap" "<silent>" "<C-" . a:direction . ">"
                \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
endfunc
for dir in ["h", "j", "l", "k"]
    call s:mapMoveToWindowInDirection(dir)
  endfor


""" "easy-align"
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


""" "indent guide"
let g:indentLine_char = '┆'
" let g:indentLine_color_term = 239
nmap <silent> <leader>i   :IndentLinesToggle <CR>
let g:indentLine_enabled = 0


""" "custom binds"
nmap <silent> <c-n>       :enew <CR>
nmap <leader>g            :GitGutterToggle<CR>
" nmap <leader>[            :GitGutterPrevHunk<CR>
" nmap <leader>]            :GitGutterNextHunk<CR>
nmap <silent> <C-f>       :NERDTreeFind<cr>
nmap <silent> <leader>f   :NERDTreeToggle<cr>
" nmap <silent> <leader>d   :bnext <CR>
" nmap <silent> <leader>a   :bprevious <CR>
nmap <silent> <c-o>       :FZFMru<CR>
nmap <C-_>                :Commentary<CR>
map <silent> <leader>qq   :qa!<CR>
noremap <leader>p "+p
noremap <leader>y "+y
nmap <silent> <leader>q   :bdelete! <CR>
nmap <Leader>c vip:TComment<cr>

""" FileType rules
au BufReadPost Jenkinsfile set syntax=groovy
au BufReadPost Jenkinsfile set filetype=groovy
filetype plugin indent on




""" tmp files and undo
set directory=~/.config/nvim/tmp/tmp
set backupdir=~/.config/nvim/tmp/backup
set undodir=~/.config/nvim/tmp/undo

set undofile
set backup
set cursorline
set ttyfast

" set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·,nbsp:·
set listchars=extends:❯,precedes:❮,trail:·,nbsp:·
set showbreak=↪


nmap <F2> :NextColorScheme<CR>
nmap <F3> :PrevColorScheme<CR>



" au FileType go nmap <leader>rt <Plug>(go-run-tab)
" au FileType go nmap <leader>rs <Plug>(go-run-split)
" au FileType go nmap <leader>rv <Plug>(go-run-vertical)







"""" "golang"
" au BufRead,BufNewFile *.go  set filetype=go

" vim-go
" let g:go_def_mapping_enabled = 0
let g:go_fmt_command = 'goimports'
" let g:go_fmt_fail_silently = 1
let g:go_term_enabled = 1

" cause there will be tabs, show them but without the ^I bollox
autocmd FileType sh setlocal  listchars=tab:▸\ ,extends:❯,precedes:❮,trail:·,nbsp:·
autocmd FileType go setlocal  listchars=tab:▸\ ,extends:❯,precedes:❮,trail:·,nbsp:·

autocmd FileType go nmap <buffer> <leader>r <plug>(go-run)
autocmd FileType go nmap <buffer> <leader>b <plug>(go-build)
autocmd FileType go nmap <buffer> <leader>t <plug>(go-test)
autocmd FileType go nmap <buffer> <leader>e <plug>(go-rename)
" autocmd FileType go nmap <buffer> gd <plug>(go-def-vertical)
autocmd FileType go nmap <buffer> <c-]> <plug>(go-def-vertical)
autocmd FileType go nmap <buffer> <leader>i <plug>(go-info)


" deoplete
imap <expr> <tab>   pumvisible() ? "\<c-n>" : "\<tab>"
imap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<tab>"
imap <expr> <cr> pumvisible() ? deoplete#close_popup() : "\<cr>"



" deoplete
set completeopt=longest,menuone " auto complete setting
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns['default'] = '\h\w*'
let g:deoplete#omni#input_patterns = {}
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#align_class = 1


" let NERDTree show hidden files on default
let NERDTreeShowHidden=1

" resize current buffer by +/- 5 (shift+arrows)
nnoremap <S-up>    :resize -5<cr>
nnoremap <S-down>  :resize +5<cr>
nnoremap <S-left>  :vertical resize -5<cr>
nnoremap <S-right> :vertical resize +5<cr>

