syntax on

call plug#begin('~/.vim/plugged')
        " Addons
    Plug 'scrooloose/nerdtree'
    Plug 'yegappan/mru'
    Plug 'airblade/vim-gitgutter'
    Plug 'ervandew/supertab'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tmhedberg/matchit'
    Plug 'vim-scripts/tComment'
    Plug 'jremmen/vim-ripgrep'
    Plug 'blarghmatey/split-expander'
    Plug 'farmergreg/vim-lastplace'
    Plug 'tell-k/vim-autopep8'
    Plug 'davidhalter/jedi-vim'
    Plug 'fisadev/vim-isort'

    " File system navigation
    Plug 'tpope/vim-eunuch'
    Plug 'kien/ctrlp.vim'

    " Syntax highlighting
    Plug 'elzr/vim-json'
    Plug 'tpope/vim-markdown'
    Plug 'pangloss/vim-javascript'

    " Syntax errors
    Plug 'w0rp/ale'
    Plug 'ntpeters/vim-better-whitespace'

    " Markdown support
    Plug 'junegunn/goyo.vim'

    " Git support
    Plug 'tpope/vim-fugitive', { 'commit': '444ba9fda5d05aa14c7e8664fa4a66a59c62a550' }

    " Themes
"    Plug 'altercation/vim-colors-solarized'
"    Plug 'icymind/NeoSolarized'
"    Plug 'rakr/vim-one'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'dracula/vim', { 'as': 'dracula' }

    " Testing
    Plug 'janko-m/vim-test'

    " Display hex colors
    Plug 'chrisbra/Colorizer'

    " Gist
    Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'
call plug#end()

" Leader Mappings
map <Space> <leader>
map <Leader>w :update<CR>
map <Leader>q :qall<CR>
map <Leader>gs :Gstatus<CR>

set noshowmode                        " Because of airline
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg='dark'

set autoread                          " Auto reload changed files
set wildmenu                          " Tab autocomplete in command mode
set backspace=indent,eol,start        " http://vi.stackexchange.com/a/2163
set clipboard=unnamed                 " Clipboard support (OSX)
set laststatus=2                      " Show status line on startup
set splitright                        " Open new splits to the right
set splitbelow                        " Open new splits to the bottom
set lazyredraw                        " Reduce the redraw frequency
set ttyfast                           " Send more characters in fast terminals
set nowrap                            " Don't wrap long lines
set listchars=extends:→               " Show arrow if line continues rightwards
set listchars+=precedes:←             " Show arrow if line continues leftwards
set nobackup nowritebackup noswapfile " Turn off backup files
set noerrorbells novisualbell         " Turn off visual and audible bells
set expandtab shiftwidth=4 tabstop=4  " Four spaces for tabs everywhere
set history=500
set hlsearch                          " Highlight search results
set ignorecase smartcase              " Search queries intelligently set case
set incsearch                         " Show search results as you type
set timeoutlen=1000 ttimeoutlen=0     " Remove timeout when hitting escape
set showcmd                           " Show size of visual selection
set encoding=utf-8
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

let g:dracula_italic = 1
color dracula
highlight Normal ctermbg=NONE

" Showcase comments in italics
"highlight Comment cterm=italic  gui=italic

" Nerd Tree toggling
map <C-b> :NERDTreeToggle<CR>
map <C-h> <C-W>h
map <C-l> <C-W>l

" Get off my lawn - helpful when learning Vim :)
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
