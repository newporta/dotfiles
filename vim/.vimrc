set nocompatible

"==============================================================================
" Vundle
"==============================================================================
" set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-endwise'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/ruby-matchit'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-rails'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'tpope/vim-cucumber'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'vim-scripts/bufkill.vim'
"Plugin 'godlygeek/tabular'
Plugin 'tommcdo/vim-lion'
Plugin 'tpope/vim-ragtag'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/ZoomWin'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'lambdatoast/elm.vim'
call vundle#end()


" First things first...
set encoding=utf-8
set t_Co=256
syntax on
filetype plugin indent on

" Set up cursor for insert mode, this is probably ITerm2/tmux specific
" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

"==============================================================================
" Fix up some key mappings
"==============================================================================

" Who uses "\" ?
let mapleader = ","

" These should be defaults...
noremap ' `
noremap ` '

" Lines and wrap and whitespace visibility are sometimes good
nnoremap <leader>l :set invnumber<CR>
nnoremap <leader>w :set invwrap<CR>
nnoremap <leader>s :set invhls<CR>
nnoremap <leader>h :set invlist<CR>

" Map a better escape - I really want <S-Space> but vim doesn't support it
" (traditional terminals don't distinguish space from shift space)
" I map S-Space to send C-_ (that's 0x1F in ASCII hex code) in ITerm and
" map C-_ to escape here.
inoremap <C-_> <Esc>
vnoremap <C-_> <Esc>

" Make Y work like D and C
nnoremap <S-y> y$

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" Enter a blank line below/above cursor in Normal mode.
nmap ,o o<Esc>k
nmap ,O O<Esc>j

" Map better window nav
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" Search stuff with Git grep and use a quickfix window for the results. It's
" leader-a because it used to be ack but ack is show as shit on massive projects.
nnoremap <leader>a :Ggrep 
autocmd QuickFixCmdPost *grep* cwindow

" Close a window panel
nmap <leader>c <C-w>c

" Use <leader>v to open a new vertical split and switch to it
nnoremap <leader>v <C-w>v<C-w>l

" Let's make it easy to edit/source this file
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

" Make/cd to the directory that contains the file in the current buffer.
" This is useful when you edit a file in a directory that doesn't
" (yet) exist
nmap  <leader>md :!mkdir -p %:p:h
nmap <leader>cd :lcd %:h<CR>

" Arrow keys are evil, discourage usage...
noremap <Up> <ESC>
noremap <Down> <ESC>
noremap <Left> <ESC>
noremap <Right> <ESC>

" Navigate visible lines, not physical lines
nnoremap j gj
nnoremap k gk

 " :W saves with sudo
command! W w !sudo tee % > /dev/null

" Speed up git commands
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>

" Bubble text with unimpared
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Switch between buffers
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>

" Delete buffers faster
nmap <leader>d :BD<CR>
nmap <leader>D :bufdo bd<CR>

" Make space useful in normal mode...
nmap <Space> /

" Groupings are good, make it easy to add them when building regex
cmap <leader>\ \(\)<Left><Left>

" Ctrl-P replaced command-t
nmap <leader>t :CtrlP<CR>

" Navigate visible lines, not physical lines
nnoremap j gj
nnoremap k gk

nmap <leader>n :NERDTreeToggle<cr>

"==============================================================================
" Set up vim window
"==============================================================================
set number                  " I like linenumbers
set relativenumber          " Not sure about this.....
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

set showmode                " At least let yourself know what mode you're in
set showcmd                 " Show the current command in the lower right corner
set ch=2                    " Make command line two lines high
set bg=dark                 " Tell Vim we want the defaults for a dark bg
colorscheme railscasts      " Set up a decent theme
set scrolloff=8             " Keep the cursor 8 lines from the top and bottom
set cursorline              " highlight current line
if has("statusline") && !&cp
  set laststatus=2              " always show the status bar
  set statusline=%f\ %m\ %r     " filename, modified, readonly
  set statusline+=%{fugitive#statusline()}
  set statusline+=\ %l/%L[%p%%] " current line/total lines
  set statusline+=\ %v[0x%B]    " current column [hex char]
endif

"==============================================================================
" Set up non-standard vim settings
"==============================================================================
set autoread                " Don't bug us when git updates our files, just read them again

" Search
set nohlsearch              " no highlighting search
set incsearch               " incremental searching
set ignorecase              " searches are case insensitive...
set smartcase               " ... unless they contain at least one capital letter
"set gdefault                " have :s///g flag by default on

" Don't wrap by default
set nowrap

" Yank to system clipboard
set clipboard=unnamed

" Whitespace
set tabstop=2
set shiftwidth=2
set expandtab
set list                      " show shitespace
set listchars=tab:»·,trail:·  " better whitewpace
set autoindent

set history=100                    " Keep some stuff in the history
set synmaxcol=800                  " Syntax coloring lines that are too long just slows down the world

"Select All should use visual select, not select mode
noremenu  20.400 &Edit.&Select\ All<Tab>ggVG    ggVG
inoremenu 20.400 &Edit.&Select\ All<Tab>ggVG    <Esc>ggVG
cnoremenu 20.400 &Edit.&Select\ All<Tab>ggVG    <Esc>ggVG

set mousehide                      " Hide the mouse pointer while typing
set hidden                         " This should be default...

" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

set backspace=2                    " Allow backspacing over indent, eol, and the start of an insert
set whichwrap=b,s,h,l,<,>,[,]      " Same with navigation
set shortmess+=filmnrxoOtT         " abbrev. of messages (avoids 'hit enter')

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=100

"folding settings
set foldmethod=syntax
set foldnestmax=10
set nofoldenable        "dont fold by default
" toggle the current fold
:nnoremap <Space> za

" In command-line mode, C-a jumps to beginning (to match C-e)
cnoremap <C-a> <Home>

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches"
set wildignore+=bundle/**,vendor/bundle/**,vendor/cache/** " ignore Bundler standalone/vendor installs & gems
set wildignore+=node_modules/**

set splitright
set splitbelow

" Allow jsx syntax in .js files
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

