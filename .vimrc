syntax on

call plug#begin('~/.vim/plugged')

    " Addons
    Plug 'airblade/vim-gitgutter'
    Plug 'blarghmatey/split-expander'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'farmergreg/vim-lastplace'
    Plug 'fisadev/vim-isort'
    Plug 'ludovicchabant/vim-gutentags'

    Plug 'scrooloose/nerdtree'
    let NERDTreeQuitOnOpen = 1
    let NERDTreeMinimalUI = 1
    let NERDTreeDirArrows = 1

    Plug 'tell-k/vim-autopep8'
    Plug 'tmhedberg/matchit'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'vim-scripts/Tabmerge'
    Plug 'yegappan/mru'
    Plug 'sickill/vim-pasta'
    Plug 'osyo-manga/vim-over'

    " snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    let g:UltiSnipsSnippetDirectories = ['~/.vim/plugged/vim-snippets/UltiSnips']
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"

    " LaTeX stuff
    Plug 'lervag/vimtex'
    let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : '../build',
    \}
    let g:vimtex_view_method = 'skim'
    let g:tex_flavor="latex"
    let g:vimtex_quickfix_latexlog = {
      \ 'overfull' : 0,
      \ 'underfull' : 0,
      \ 'packages' : {
      \   'default' : 0,
      \ },
      \}

    " File system navigation
    Plug 'tpope/vim-eunuch'
    Plug 'kien/ctrlp.vim'

    " Display hex colors
    Plug 'chrisbra/Colorizer'

    " Syntax errors
    Plug 'w0rp/ale'
    Plug 'ntpeters/vim-better-whitespace'

    " Markdown support
    Plug 'junegunn/goyo.vim'
    Plug 'dhruvasagar/vim-table-mode'
    let g:table_mode_corner='|'
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'

    " Themes
    "Plug 'altercation/vim-colors-solarized'
    "Plug 'ErichDonGubler/vim-sublime-monokai'
    "Plug 'icymind/NeoSolarized'
    "Plug 'rakr/vim-one'
    "Plug 'dracula/vim', { 'as': 'dracula' }
    "Plug 'joshdick/onedark.vim'
    "Plug 'NLKNguyen/papercolor-theme'
    "Plug 'vim-airline/vim-airline'
    "Plug 'vim-airline/vim-airline-themes'
    "let g:airline_powerline_fonts = 1
    Plug 'itchyny/lightline.vim'
    Plug 'vim-scripts/xoria256.vim'

call plug#end()

filetype plugin indent on

" Leader Mappings
map <Leader>w :update<CR>
map <Leader>q :q<CR>
map <Leader><ESC> :qall<CR>
map <Leader>l :set cursorline!<CR>
map <Leader>r :set relativenumber!<CR>
map <C-n> :NERDTreeToggle<CR>
" map <Leader>t :10vsp<CR>:terminal<CR>
nmap <silent> ./ :nohlsearch<CR>

"set noshowmode                        " Because of airline

set nocompatible
set autoread                          " Auto reload changed files
set wildmenu                          " Tab autocomplete in command mode
set backspace=indent,eol,start        " http://vi.stackexchange.com/a/2163
set clipboard=unnamed                 " Clipboard support (OSX)
set laststatus=2                      " Show status line on startup
set splitright                        " Open new splits to the right
set splitbelow                        " Open new splits to the bottom
" set lazyredraw                        " Reduce the redraw frequency
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
set noshowmode                        " Lightline
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
" colorscheme sublimemonokai

if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
endif

" colorscheme onedark
" set background=dark
colorscheme xoria256

" Showcase comments in italics
highlight Comment cterm=italic  gui=italic

"" Not necessary since I'm using tmux-navigator
" map <C-h> <C-W>h
" map <C-l> <C-W>l
" map <C-j> <C-W>j
" map <C-k> <C-W>k

set mouse=a
if !has('nvim')
    set ttymouse=xterm2
endif

if has("gui_running")
endif

if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" Close vim if the only window left open is a NERDTree

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


