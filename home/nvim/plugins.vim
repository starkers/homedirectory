let vimplug_exists=expand('~/.local/share/nvim/site/autoload/plug.vim')
if !filereadable(vimplug_exists)
  exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"
  autocmd VimEnter * PlugInstall
endif
"  let vimplug_exists=expand('~/.vim/autoload/plug.vim')
"  if !filereadable(vimplug_exists)
"    silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
"    let g:not_finish_vimplug = "yes"
"    autocmd VimEnter * PlugInstall
"  endif
"endif
"


" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')


" telescope https://github.com/nvim-telescope/telescope.nvim
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'


Plug 'mhinz/vim-startify'


"LUA
Plug 'xolox/vim-lua-ftplugin'

" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" " Plug 'bazelbuild/vim-bazel'
Plug 'cormacrelf/vim-colors-github'
"
" Plug 'martinda/Jenkinsfile-vim-syntax'
" Plug 'NLKNguyen/papercolor-theme'           " theme
Plug 'rafi/awesome-vim-colorschemes'
" Plug 'Valodim/vim-zsh-completion'           " sh
Plug 'airblade/vim-gitgutter'
" Plug 'chrisbra/vim-zsh'                     " sh
" " Plug 'ctrlpvim/ctrlp.vim'
" Plug 'dracula/vim',     { 'as': 'dracula' } " theme
Plug 'ekalinin/Dockerfile.vim'
Plug 'elzr/vim-json'
" Plug 'fatih/molokai'
Plug 'fatih/vim-go'

" Plug 'hashivim/vim-terraform', { 'commit': '3d9561d6df7b6c204d24d673756a6f098d96064c' }
Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'pbogut/fzf-mru.vim'
Plug 'majutsushi/tagbar'
" Plug 'mdempsky/gocode', { 'rtp': 'vim/'}
" Plug 'nsf/gocode'
" Plug 'patstockwell/vim-monokai-tasty'       " theme
Plug 'ryanoasis/vim-devicons'
" Plug 'scrooloose/nerdtree'

"ranger integration
Plug 'iberianpig/ranger-explorer.vim'
Plug 'rbgrouleff/bclose.vim'

"
" " Plug 'Yggdroot/LeaderF'
" " Plug 'tamago324/LeaderF-filer'
"
" Plug 'sonph/onehalf',   { 'rtp': 'vim/'}    " theme
" Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-commentary'
" Plug 'uarun/vim-protobuf'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
" Plug 'jjo/vim-cue'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'psf/black', { 'tag': '19.10b0', 'as':'psf_black' }
Plug 'ambv/black', {'as': 'ambv_black'}
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'
"
" " jsonnet
Plug 'google/vim-jsonnet'

Plug 'cappyzawa/starlark.vim'
Plug 'Yggdroot/indentLine'  " show indentation guides


Plug 'dag/vim-fish'

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --go-completer --ts-completer
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
" " Initialize plugin system
call plug#end()



" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
