
""""""""""""""""""""""""""""""""""""""
" Vundle: Plugin Manager Config
""""""""""""""""""""""""""""""""""""""
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"

filetype on                              " Setting 'filetype on' before 'filetype off' fixes a bug in OSX
filetype off                             " required
set rtp+=~/.vim/bundle/Vundle.vim        " set the runtime path to include Vundle and initialize

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" ------------------------------- Vundle Plugins Below This Line ------------------------------- "

" Plugins from http://vim-scripts.org/vim/scripts.html
Plugin 'The-NERD-tree'
Plugin 'ctrlp.vim'

" Plugins from GitHub repos
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
Plugin 'pangloss/vim-javascript'
Plugin 'ervandew/supertab'


" ------------------------------- Vundle Plugins Above This Line ------------------------------- "

call vundle#end()                        " required
filetype plugin indent on                " required





""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""

" Plugin: NERDTree
if has("autocmd")
    augroup open_nerdtree_if_no_file " {
        autocmd!
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    augroup END " }
endif

" Plugin: Ctrl-P

" Plugin: Airline 
let g:airline_powerline_fonts = 1
let g:airline_theme = 'papercolor'

" Plugin: Surround

" Plugin: Vim JavaScript

" Plugin: SuperTab






""""""""""""""""""""""""""""""""""""""
" OS & file system integration
""""""""""""""""""""""""""""""""""""""

set runtimepath^=~/.vim                  " On Windows, allow us to use '.vim' folder instead of "vimfiles"
set nobackup                             " Death to Vim backup files. They are just litter and I never use them
set nocompatible                         " Compatibility with old timer vi is not needed or desirable
set clipboard=unnamed                    " Use the OS clipboard by default (on versions compiled with `+clipboard`)
set encoding=utf-8 nobomb                " Use UTF-8 without BOM
set exrc                                 " Enable per-directory .vimrc files and disable unsafe commands in them
set secure
set modeline                             " Enable modeline (i.e. the top/bottom 4 lines in a file may include vim settings to be used as file-specific overrides)
set modelines=4
set ttyfast                              " Optimize for fast terminal connections (because it's no longer 1978)

if has("autocmd")
    "autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript         " Treat .json files as .js
    "autocmd BufNewFile,BufReadPost *.md set filetype=markdown                    " By default, vim thinks .md is Modula-2
    augroup reload_vimrc " {                                                     " Reload .vimrc automatically when it changes
        autocmd!
        autocmd BufWritePost $MYVIMRC source $MYVIMRC
    augroup END " }
endif





""""""""""""""""""""""""""""""""""""""
" UI - General
""""""""""""""""""""""""""""""""""""""

set number                               " Show line number gutter
set laststatus=2                         " Show the status line
set history=500                          " Keep 500 lines of command line history
set title                                " Show the filename in the window titlebar
set list                                 " Show 'invisible' characters like tabs and trailing spaces
set lcs=tab:▸\ ,trail:·,nbsp:_
set ruler                                " Show the cursor position
set showmatch                            " Show matching brackets
set showmode                             " Show the current mode
set showcmd                              " Show the (partial) command as you're typing it
set noerrorbells visualbell t_vb=        " Disable error bells
autocmd GUIEnter * set visualbell t_vb=
set wildmenu                             " Use a better command-line completion UI
set wildignore=*.o,*.obj,*~              " Stuff to ignore when tab completing
set shortmess=atI                        " Don’t show the intro message when starting Vim
set lazyredraw                           " Don't redraw screen when running macros.

if has("gui_running")                                                            " If we are running in a GUI (like gVim):
    set columns=165 lines=48                                                     " Show a bigger editor window
    set guifont=Sauce_Code_Powerline:h10:cANSI                                   " Make sure to use a Powerline-ready font
endif



""""""""""""""""""""""""""""""""""""""
" UI - Tabs Are Awesome
""""""""""""""""""""""""""""""""""""""

set autoindent                           " Autoindent when hitting <enter>
                                         " Note: This may cause pasted blocks of code to be crazy-indented, so you should remember to toggle INSERT(paste) mode.
                                         " Using the <F2> binding makes this a little bit faster
set pastetoggle=<F2>
set expandtab                            " Use spaces for indenting
set smarttab
set tabstop=4                            " Make tabs 4 spaces wide
set shiftwidth=4
set softtabstop=4
set shiftround                           " When at 3 spaces and I hit Tab, go to 4, not 7.





""""""""""""""""""""""""""""""""""""""
" Navigation
""""""""""""""""""""""""""""""""""""""

set esckeys                              " Allow cursor keys in insert mode
set whichwrap+=<,>,h,l,[,]               " Left/Right keys wrap between lines, you know, like in every other editor ever.
set backspace=indent,eol,start           " Allow backspace in insert mode
set nostartofline                        " Don’t reset cursor to start of line when moving around.
set scrolloff=3                          " Start scrolling three lines before the horizontal window border
if has('mouse')                          " Enable mouse input (sorry for being a n00b)
    set mouse=a
endif
nnoremap Q <nop>                         " Avoid accidentally entering the dreaded Ex mode





""""""""""""""""""""""""""""""""""""""
" Colors & Highlighting
""""""""""""""""""""""""""""""""""""""

if !has("gui_running")                   " ConEmu settings
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
endif

colorscheme molokai                      " Default to the Molokai color scheme (originally created for TextMate by Wimer Hazenberg)
syntax on                                " Enable syntax highlighting
set cursorline                           " Highlight current line





""""""""""""""""""""""""""""""""""""""
" Search & Replace
""""""""""""""""""""""""""""""""""""""

set gdefault                             " Add the /g (global) flag to search/replace by default
set wrapscan                             " Wrap around (back to top) when searching
set hlsearch                             " Highlight searches
set incsearch                            " Scroll to match instantly as pattern is typed
set ignorecase                           " Ignore case in searches
set smartcase                            " ..unless the search pattern contains an uppercase char
map N Nzz                                " When jumping to the next search result, the result is centered in the viewport
map n nzz





""""""""""""""""""""""""""""""""""""""
" Advanced / custom commands
""""""""""""""""""""""""""""""""""""""

noremap <C-S>       :update<CR>          " Use CTRL-S for saving, also in Insert mode (why? Because RSI, that's why)
vnoremap <C-S>      <C-C>:update<CR>
inoremap <C-S>      <C-O>:update<CR>

:command! WQ wq                          " Those pesky typos; just do what I want, Vim!
:command! Wq wq
:command! W w
:command! Q q

let mapleader=","                        " Use comma as leader key for custom macros

function! StripWhitespace()              " Command: Strip trailing whitespace (,ss)
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>









