" ----------
" Bundle
" ----------
call plug#begin()

Plug 'VundleVim/Vundle.vim'
" browse
Plug 'scrooloose/nerdtree'
" comment/uncomment
Plug 'scrooloose/nerdcommenter'
" fuzzy search
Plug 'ctrlpvim/ctrlp.vim'
" pasting in vim with identation
Plug 'sickill/vim-pasta'
" repeat special things
Plug 'tpope/vim-repeat'
" auto end a line
Plug 'tpope/vim-endwise'
" git wrapper
Plug 'tpope/vim-fugitive'
" unix shell commands in vim
Plug 'tpope/vim-eunuch'
" change surrounding chars
Plug 'tpope/vim-surround'
" show git changes left
Plug 'airblade/vim-gitgutter'
" autocomplete via tab
" Plug 'ervandew/supertab'
" status tabline
Plug 'bling/vim-airline'
" move parameters in functions
Plug 'AndrewRadev/sideways.vim'
" do end to brakets and verse visa
Plug 'AndrewRadev/splitjoin.vim'
" switch words under curser true -> false
Plug 'AndrewRadev/switch.vim'
" integration of ag grep
Plug 'rking/ag.vim'
" puppet
Plug 'rodjek/vim-puppet'
" rspec
Plug 'thoughtbot/vim-rspec'
" https://github.com/ecomba/vim-ruby-refactoring
Plug 'ecomba/vim-ruby-refactoring'
" close file without closing window or buffer
Plug 'vim-scripts/bufkill.vim'
" lineup text
Plug 'godlygeek/tabular'
" markdown
Plug 'plasticboy/vim-markdown'
" syntax highlighting for everything
Plug 'sheerun/vim-polyglot'
" support multiple cursors
Plug 'terryma/vim-multiple-cursors'
" show all buffers with leader-b
Plug 'jeetsukumaran/vim-buffergator'
" show the identations
Plug 'Yggdroot/indentLine'
" linting/fixing and LSP https://github.com/w0rp/ale
"Plugin 'w0rp/ale'
" icons in vim
Plug 'ryanoasis/vim-devicons'
" autoclose quotes brakets, ..
Plug 'raimondi/delimitmate'
" change something in pairs brakets, .. https://github.com/jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs'
" grammarly similar https://github.com/rhysd/vim-grammarous
Plug 'rhysd/vim-grammarous'
" Dockerfiles syntax and other sugar https://github.com/ekalinin/Dockerfile.vim
Plug 'ekalinin/Dockerfile.vim'
" Rudi nerd tool
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" general options
set hidden "otherwise TextEdit might fail
set ruler " show the cursor position all the time
set hlsearch " highlight matches when searching
set wrap " wrapping for long lines
set linebreak
set number " show line numbers
set autoindent " autoindents when continuing on a new line
set tabstop=3 " number of spaces a tab stands for
set shiftwidth=3 " default indentation size
set tabpagemax=100 " max number of tabs
set shiftround " round indent to a multiple of shiftwidth
set expandtab " convert tabs to spaces on input
set ignorecase " when searching ignore case
set smartcase " when searching guess whether it's case sensitive based on whether there are capitals
set wildmode=longest,full " BASH like autocompletion
set backspace=indent,eol,start " for a normal backspace in insert mode
set updatetime=300 " You will have bad experience for diagnostic messages when it's default 4000.

" No backups to be created
set nowritebackup
set nobackup
set noswapfile "don't create .swp files
set undofile " save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories

set cmdheight=2 "Better display for messages
set shortmess+=c "don't give |ins-completion-menu| messages.
set signcolumn=yes " Keep sign (gutter) column visible all times

set encoding=utf-8 " set the encoding for displaying
set fileencodings=ucs-bom,utf-8,cp1251 "set the encoding for writing files
set printoptions=header:0 " don't print file header when printing
set hidden "allow switching buffers without having to save
set nolist "list disables linebreak
"set list
"set listchars=tab:▸\ 

" add support for switching to cyrillic inside vim with C-^ and then set the default back to english
set iminsert=0
set imsearch=-1

" gui options
set mouse=v " in many terminal emulators the mouse works just fine, thus enable it
set guioptions-=T " hide the toolbar
set guioptions+=b " horizontal scroll
set laststatus=2 " always display the statusline

syntax on " enable syntax highlighting
filetype plugin indent on " smart indent based on file type
" autocmd BufNewFile,BufRead *.json set filetype=javascript " enable syntax highlighting for JSON
" a line should be no longer than 120 symbols (including <LF>)
autocmd FileType ruby,python,javascript,java,cpp,haml,coffee setlocal textwidth=0
autocmd FileType ruby,python,javascript,java,cpp,haml,coffee setlocal wrapmargin=0
autocmd FileType coffee setlocal shiftwidth=2
autocmd BufEnter * set colorcolumn=+1 " display a print margin that corresponds to 'textwidth'
autocmd BufRead,BufNewFile *.iced setfiletype coffee

colorscheme desert
highlight ColorColumn guibg=darkgrey

" takes care of the terminal encoding
if &termencoding == ""
  let &termencoding = &encoding
endif

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" highlight extra spaces at end of lines
highlight ExtraWhitespace guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+\%#\@<!$/

" plug-in options

runtime macros/matchit.vim " smarter matching with % (ifs, elses...)

filetype plugin indent on

" mappings
let mapleader = ","

"map <C-w> :BD<CR>
"imap <C-w> <C-o>:BD<CR>
map <C-Tab> :wincmd w<CR>

map <Leader>h :nohlsearch \| cclose<CR>

map <CR> o<Esc>
map <S-CR> O<Esc>

imap <C-h> <C-o>h
imap <C-j> <C-o>j
imap <C-k> <C-o>k
imap <C-l> <C-o>l
map <C-j> <C-e>
map <C-k> <C-y>
" vspliting mappings
"map <Tab> <C-w>w
"map <S-Tab> <C-w>p
"map <Bar> <C-W>v<C-W><Right>
"map -     <C-W>s<C-W><Down>

" some sane editor mappings for frequently used functionality
map <M-s> :update<CR>
imap <M-s> <C-o>:update<CR>
map <C-c> "+y
imap <C-c> <C-o>"+y
noremap vv <C-v>
map <C-v> "+p
imap <C-v> <Esc>"+pa
cmap <C-v> <C-r>+
map <Home> ^
imap <Home> <C-o>^

" support file types in ~/.vim/ftplugin
filetype plugin indent on

" include the plugins settings
so ~/.vim/settings/airline.vim
so ~/.vim/settings/buffergator.vim
so ~/.vim/settings/nerdcommenter.vim
so ~/.vim/settings/nerdtree.vim
so ~/.vim/settings/fugitive.vim
so ~/.vim/settings/multi-cursors.vim
so ~/.vim/settings/ctrlp.vim
"so ~/.vim/settings/ale.vim
so ~/.vim/settings/ag.vim
so ~/.vim/settings/grammarous.vim
so ~/.vim/settings/rspec.vim
so ~/.vim/settings/splitjoin.vim
so ~/.vim/settings/delimitmate.vim
so ~/.vim/settings/polyglot.vim
so ~/.vim/settings/markdown.vim
so ~/.vim/settings/switch.vim
so ~/.vim/settings/tabular.vim
so ~/.vim/settings/dockerfile.vim
so ~/.vim/settings/coc.vim
