syntax on

call plug#begin('~/.vim/plugged')

    " Addons
    Plug 'airblade/vim-gitgutter'
    Plug 'blarghmatey/split-expander'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'davidhalter/jedi-vim'
    Plug 'farmergreg/vim-lastplace'
    Plug 'fisadev/vim-isort'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'scrooloose/nerdtree'
    Plug 'tell-k/vim-autopep8'
    Plug 'tmhedberg/matchit'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-liquid'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'vim-scripts/Tabmerge'
    Plug 'yegappan/mru'

    " File system navigation
    Plug 'tpope/vim-eunuch'
    Plug 'kien/ctrlp.vim'

    " Syntax highlighting
    Plug 'elzr/vim-json'
    Plug 'pangloss/vim-javascript'

    " Display hex colors
    Plug 'chrisbra/Colorizer'

    " Syntax errors
    Plug 'w0rp/ale'
    Plug 'ntpeters/vim-better-whitespace'

    " Markdown support
    Plug 'junegunn/goyo.vim'
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'

    " Themes
    "Plug 'altercation/vim-colors-solarized'
    "Plug 'icymind/NeoSolarized'
    "Plug 'rakr/vim-one'
    "Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ErichDonGubler/vim-sublime-monokai'

call plug#end()

" Leader Mappings
map <Space> <leader>
map <Leader>w :update<CR>
map <Leader>q :q<CR>
map <Leader><ESC> :qall<CR>
map <Leader>l :set cursorline!<CR>
map <Leader>r :set relativenumber!<CR>

if has('nvim')
    set cursorline
endif

"set noshowmode                        " Because of airline
let g:airline_powerline_fonts = 1

set nocompatible
set autoread                          " Auto reload changed files
set wildmenu                          " Tab autocomplete in command mode
set backspace=indent,eol,start        " http://vi.stackexchange.com/a/2163
set clipboard=unnamed                 " Clipboard support (OSX)
set laststatus=2                      " Show status line on startup
set splitright                        " Open new splits to the right
set splitbelow                        " Open new splits to the bottom
set lazyredraw                        " Reduce the redraw frequency
set ttyfast                           " Send more characters in fast terminals
set spelllang=en_us,it
set listchars=extends:→               " Show arrow if line continues rightwards
set listchars+=precedes:←             " Show arrow if line continues leftwards
set nobackup nowritebackup            " Turn off backup files
set noerrorbells novisualbell         " Turn off visual and audible bells
set expandtab shiftwidth=4 tabstop=4  " Four spaces for tabs everywhere
set history=500
set hlsearch                          " Highlight search results
set ignorecase smartcase              " Search queries intelligently set case
set incsearch                         " Show search results as you type
set timeoutlen=1000 ttimeoutlen=0     " Remove timeout when hitting escape
set showcmd                           " Show size of visual selection
set encoding=UTF-8
" Persistent undo
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

" Ignored files/directories from autocomplete (and CtrlP)
set wildignore+=*/tmp/*
set wildignore+=*.so
set wildignore+=*.zip
set wildignore+=*/vendor/bundle/*
set wildignore+=*/node_modules/

"-------------------------------------------------------------------------------
" Interface
"-------------------------------------------------------------------------------

set number            " Enable line numbers
set scrolloff=5       " Leave 5 lines of buffer when scrolling
set sidescrolloff=10  " Leave 10 characters of horizontal buffer when scrolling

"-------------------------------------------------------------------------------
" Colors & Formatting
"-------------------------------------------------------------------------------
" set termguicolors
"let g:sublimemonokai_term_italic = 1
colorscheme sublimemonokai

" Showcase comments in italics
highlight Comment cterm=italic  gui=italic

map <C-n> :NERDTreeToggle<CR>
"" Not necessary since I'm using tmux-navigator
" map <C-h> <C-W>h
" map <C-l> <C-W>l
" map <C-j> <C-W>j
" map <C-k> <C-W>k

set mouse=vn
if !has('nvim')
    set ttymouse=xterm2
endif

let g:table_mode_corner='|'

