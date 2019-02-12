syntax on

call plug#begin('~/.vim/plugged')

    " Addons
    Plug 'airblade/vim-gitgutter'
    Plug 'blarghmatey/split-expander'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'farmergreg/vim-lastplace'
    Plug 'fisadev/vim-isort'
    Plug 'itchyny/lightline.vim'
        let g:lightline = {
              \ 'colorscheme': 'jellybeans',
              \ }
    Plug 'justinmk/vim-sneak'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'mhinz/vim-startify'
    Plug 'osyo-manga/vim-over'
    Plug 'sickill/vim-pasta'
    Plug 'tell-k/vim-autopep8'
    Plug 'tmhedberg/matchit'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
        let g:surround_{char2nr('c')} = "\\\1command\1{\r}"  " https://github.com/tpope/vim-surround/issues/47#issuecomment-4254383
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-vinegar'
    Plug 'vim-scripts/Tabmerge'
    Plug 'yegappan/mru'

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

    " Themes
    "Plug 'ErichDonGubler/vim-sublime-monokai'
    "Plug 'NLKNguyen/papercolor-theme'
    "Plug 'altercation/vim-colors-solarized'
    "Plug 'dracula/vim', { 'as': 'dracula' }
    "Plug 'icymind/NeoSolarized'
    "Plug 'joshdick/onedark.vim'
    "Plug 'rakr/vim-one'
    "Plug 'vim-scripts/xoria256.vim'
    Plug 'zanglg/nova.vim'

call plug#end()

filetype plugin indent on

set autoread                          " Auto reload changed files
set backspace=indent,eol,start        " http://vi.stackexchange.com/a/2163
set clipboard=unnamed                 " Clipboard support (OSX)
set encoding=UTF-8
set expandtab shiftwidth=4 tabstop=4  " Four spaces for tabs everywhere
set history=500
set hlsearch                          " Highlight search results
set ignorecase smartcase              " Search queries intelligently set case
set incsearch                         " Show search results as you type
set laststatus=2                      " Show status line on startup
set listchars+=precedes:←             " Show arrow if line continues leftwards
set listchars=extends:→               " Show arrow if line continues rightwards
set mouse=a
set nobackup nowritebackup            " Turn off backup files
set nocompatible
set noerrorbells novisualbell         " Turn off visual and audible bells
set noshowmode                        " Lightline
set number            " Enable line numbers
set scrolloff=5       " Leave 5 lines of buffer when scrolling
set showcmd                           " Show size of visual selection
set sidescrolloff=10  " Leave 10 characters of horizontal buffer when scrolling
set spelllang=en_us,it
set splitbelow                        " Open new splits to the bottom
set splitright                        " Open new splits to the right
set timeoutlen=1000 ttimeoutlen=0     " Remove timeout when hitting escape
set ttyfast                           " Send more characters in fast terminals
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000
set wildignore+=*.so
set wildignore+=*.zip
set wildignore+=*/node_modules/
set wildignore+=*/tmp/*
set wildignore+=*/vendor/bundle/*
set wildmenu                          " Tab autocomplete in command mode

if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
    set termguicolors
endif

colorscheme nova
set background=dark
highlight Comment cterm=italic  gui=italic

"" Not necessary since I'm using tmux-navigator
" map <C-h> <C-W>h
" map <C-l> <C-W>l
" map <C-j> <C-W>j
" map <C-k> <C-W>k

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
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" vim-over functions
function! VisualFindAndReplace()
    :OverCommandLine%s/
endfunction
function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s/
endfunction

" Leader Mappings
map <Leader>w :update<CR>
map <Leader>q :q<CR>
map <Leader><ESC> :qall<CR>
map <Leader>l :set cursorline!<CR>
map <Leader>r :set relativenumber!<CR>
nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>
" map <C-n> :NERDTreeToggle<CR>
nnoremap <silent> ,<space> :nohlsearch<CR>
map <C-i> ysiwcemph<CR>
map <C-b> ysiwctextbf<CR>


