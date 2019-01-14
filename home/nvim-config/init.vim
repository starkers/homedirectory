" "========================================================================"
" "==========            vim-plug for plugin management"
" "========================================================================"
call plug#begin('~/.local/share/nvim/plugged')


" "========================================================================"
" "==========            completions and linting"
function! BuildYCM(info)
  " function to automatically run install.py for you
  " to run manually: "cd ~/.local/share/nvim/plugged/YouCompleteMe ; ./install.py"
  " info is a dictionary with 3 fields
  "  - name:    name of the plugin
  "  - status: 'installed', 'updated', or 'unchanged'
  "  - force:   set on Plug Install! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') } " YCM engine
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " completion framework
Plug 'w0rp/ale'                                               " Async Lint Engine (framework)
Plug 'majutsushi/tagbar'                                      " works with ctags to render tags of code
Plug 'ap/vim-buftabline'



" "========================================================================"
" "==========            Language Specifc"

" " "==========            GOLANG"
Plug 'mdempsky/gocode', { 'rtp': 'vim' }
Plug 'fatih/vim-go',      { 'do': ':GoUpdateBinaries' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'zchee/deoplete-jedi'

" " "==========            PYTHON"
Plug 'davidhalter/jedi'
Plug 'davidhalter/jedi-vim'
Plug 'jmcantrell/vim-virtualenv'

Plug 'hashivim/vim-terraform'          " basic terraform
Plug 'martinda/Jenkinsfile-vim-syntax' " fml
Plug 'ekalinin/Dockerfile.vim'

" "========================================================================"
" "==========            Workflow Optimisation"

" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'  " Default snippets for many languages

" Plug 'mattn/webapi-vim'                                           " required for gist-vim
" Plug 'mattn/gist-vim'                                             " share gists

Plug 'tpope/vim-fugitive'                                         " lets airline detect branch
Plug 'airblade/vim-gitgutter'                                     " git notations

Plug 'ctrlpvim/ctrlp.vim'          " CtrlP is installed to support tag finding in vim-go

" Plug 'wincent/command-t', {
"   \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
"   \ }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " FuzzyFinder
Plug 'junegunn/vim-easy-align'                                    " easy alignment, EG: 'gaip='
Plug 'pbogut/fzf-mru.vim'                                         " MostRecentlyUsed via FZF
Plug 'scrooloose/nerdtree'                                        " file browsing awesomeness
Plug 'tpope/vim-commentary'                                       " Allow comment toggling, EG: :gcip
Plug 'tomtom/tcomment_vim'                                        " has mappings for things like 'gcip'

" Plug 'SirVer/ultisnips'                                           " snips
" Plug 'honza/vim-snippets'                                         " snip

Plug 'towolf/vim-helm'


" " "========================================================================"
" " "==========            Visual Mods"
Plug 'vim-airline/vim-airline'                      "airline
Plug 'Yggdroot/indentLine'                          "show indent levels (very handy for yaml)
Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'


Plug 'mustache/vim-mustache-handlebars'

Plug 'ryanoasis/vim-devicons'                       "show icons for filetypes in NERDtree etc
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'      "adds colours to vim-devicons


" "========================================================================"
" "==========            Themes"
Plug 'flazz/vim-colorschemes'
Plug 'rafi/awesome-vim-colorschemes'                "collection of colorshemes
Plug 'vim-airline/vim-airline-themes'               "airline themes
Plug 'joshdick/onedark.vim'

Plug 'ddrscott/vim-side-search'

" "close all but current buffer
" Plug 'vim-scripts/BufOnly.vim'

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


" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'


let g:python_host_prog  = "/home/starkers/.venv_nvim_2.7/bin/python"
let g:python3_host_prog = "/home/starkers/.venv_nvim_3/bin/python"

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

" https://github.com/vim-airline/vim-airline/wiki/Screenshots
" let g:airline_theme = "bubblegum"                 " airline theme
" let g:airline_theme = "tomorrow"
" let g:airline_theme = "violet"
let g:airline_theme = "murmur"
" let g:airline_theme = "papercolor"
" let g:airline_theme = "cobalt2"
" let g:airline_theme = "light"
" let g:airline#extensions#tabline#enabled = 1      " Enable the list of buffers

" " let g:airline#extensions#tabline#fnamemod = ':t'  " Show just the filename
" let g:airline#extensions#tabline#show_tab_type = 1
" let g:airline#extensions#tabline#buffer_min_count = 0
" let g:airline#extensions#tabline#buffer_idx_mode = 1

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
colorscheme colorsbox-material
set scrolloff=2                                   " always show at least X lines above/below the cursor
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
let g:indentLine_enabled = 1

""" nerdtree tweaks
let NERDTreeShowHidden=1


""" "custom binds"
" nmap    <leader>[            :GitGutterPrevHunk<CR>
" nmap    <leader>]            :GitGutterNextHunk<CR>
" nmap    <silent> <leader>a   :bprevious <CR>
" nmap    <silent> <leader>d   :bnext <CR>
nmap    <C-_>                :Commentary<CR>
nmap    <Leader>c vip:TComment<cr>
nmap    <leader>g            :GitGutterToggle<CR>
nmap    <silent> <C-f>       :NERDTreeFind<cr>
nmap    <silent> <c-a>       :TagbarToggle<CR>
nmap    <silent> <c-n>       :enew <CR>
nmap    <silent> <c-o>       :FZFFreshMru<CR>
nmap    <silent> <leader>f   :NERDTreeToggle<cr>
nmap    <silent> <leader>q   :bdelete! <CR>
noremap <leader>p "+p
noremap <leader>y "+y
noremap <silent> <leader>qq   :qa!<CR>

" """ FileType rules
" au BufReadPost *Jenkinsfile set syntax=groovy
" au BufReadPost *Jenkinsfile set filetype=groovy

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



" """ deoplete completion
let g:deoplete#enable_at_startup = 1

" set completeopt=longest,menuone           " auto complete setting
" let g:deoplete#auto_complete_start_length = 1
" let g:deoplete#auto_completion_start_length = 0
" let g:deoplete#enable_at_startup=1
" let g:deoplete#enable_refresh_always=0
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#file#enable_buffer_path=1
" let g:deoplete#keyword_patterns = {}
" let g:deoplete#keyword_patterns['default'] = '\h\w*'
" let g:deoplete#omni#input_patterns = {}
" deoplete tab-complete

inoremap <expr> <tab>   pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<tab>"
" imap <expr> <cr> pumvisible() ? deoplete#close_popup() : "\<cr>"



" let g:NERDTreeFileExtensionHighlightFullName = 1
" let g:NERDTreeExactMatchHighlightFullName = 1
" let g:NERDTreePatternMatchHighlightFullName = 1

" resize current buffer by +/- 5 (shift+arrows)
nnoremap <S-up>    :resize -1<cr>
nnoremap <S-down>  :resize +1<cr>
nnoremap <S-left>  :vertical resize -3<cr>
nnoremap <S-right> :vertical resize +3<cr>


autocmd BufRead,BufNewFile *.Jenkinsfile set ft=Jenkinsfile
autocmd BufRead,BufNewFile *.Jenkinsfile setf Jenkinsfile
autocmd FileType python setlocal shiftwidth=4 tabstop=4 expandtab


let g:virtualenv_auto_activate = 1

set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>



"TODO: fixme
let g:ruby_host_prog = '/home/starkers/.gem/ruby/2.5.0/bin/neovim-ruby-host'



nmap <silent> <Leader>t <Plug>(CommandT)
nmap <silent> <Leader>b <Plug>(CommandTBuffer)
nmap <silent> <Leader>j <Plug>(CommandTJump)
let g:CommandTTraverseSCM = "file"

"       - "file": starting from the file currently being edited, traverse
"         upwards through the filesystem hierarchy until you find an SCM root
"         (as indicated by the presence of a ".git", ".hg" or similar directory)
"         and use that as the base path. If no such root is found, fall back to
"         using Vim's present working directory as a root. The list of SCM
"         directories that Command-T uses to detect an SCM root can be
" customized with the |g:CommandTSCMDirectories| option.
" in your plugin constants configuration section





"=================================================
" https://github.com/ddrscott/vim-side-search
" SideSearch current word and return to original window
nnoremap <Leader>ss :SideSearch <C-r><C-w><CR> | wincmd p

" Create an shorter `SS` command
command! -complete=file -nargs=+ SS execute 'SideSearch <args>'

" or command abbreviation
cabbrev SS SideSearch


" How should we execute the search?
" --heading and --stats are required!
let g:side_search_prg = 'ag --word-regexp'
  \. " --ignore='*.js.map'"
  \. " --heading --stats -B 1 -A 4"

" Can use `vnew` or `new`
let g:side_search_splitter = 'vnew'

" I like 40% splits, change it if you don't
let g:side_search_split_pct = 0.4



" " disable yaml auto-indent bolox
" autocmd FileType yaml.ansible setl indentkeys-=<:>

"" use Ctrl+f in insert mode instead



"""""""" FZF mods
" mostly just here as reference :/
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-v': 'split',
  \ 'ctrl-x': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

" inoremap <Down> <C-o>:echo "No down for you!"<CR>
" inoremap <Left> <C-o>:echo "No left for you!"<CR>
" inoremap <Right> <C-o>:echo "No right for you!"<CR>
" inoremap <Up> <C-o>:echo "No up for you!"<CR>

" nnoremap <Down> :echo "No down for you!"<CR>
" nnoremap <Left> :echo "No left for you!"<CR>
" nnoremap <Right> :echo "No right for you!"<CR>
" nnoremap <Up> :echo "No up for you!"<CR>

" vnoremap <Down> :<C-u>echo "No down for you!"<CR>
" vnoremap <Left> :<C-u>echo "No left for you!"<CR>
" vnoremap <Right> :<C-u>echo "No right for you!"<CR>
" vnoremap <Up> :<C-u>echo "No up for you!"<CR>

" https://robots.thoughtbot.com/faster-grepping-in-vim
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" search files matching word under the cursor
nnoremap <leader>s :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>



" ctrlp just here for vim-go, ensure its nerfed
let g:ctrlp_map = ''


" " Below you can disable default snippets for specific languages. If you set the
" " language to _ it sets the default for all languages.
" let g:neosnippet#disable_runtime_snippets = {
"     \ 'go': 1
" \}
