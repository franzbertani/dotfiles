" Plugins {{{

call plug#begin('~/.config/nvim/plugged')

Plug 'caksoylar/vim-mysticaltutor'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'
Plug 'ervandew/supertab'
Plug 'farmergreg/vim-lastplace'
Plug 'itchyny/lightline.vim'
    let g:lightline = {
        \ 'colorscheme': 'jellybeans',
        \ }
Plug 'kien/ctrlp.vim'
Plug 'lervag/vimtex'
    let g:vimtex_compiler_progname = 'nvr'
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
Plug 'ludovicchabant/vim-gutentags'
Plug 'sickill/vim-pasta'
Plug 'tpope/vim-unimpaired'
Plug 'tell-k/vim-autopep8'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'

call plug#end()

"}}}

" Colors {{{

syntax enable
filetype plugin indent on
set termguicolors
colorscheme mysticaltutor
hi Normal ctermbg=none
hi Terminal ctermbg=none
hi Terminal guibg=none
hi Normal guibg=none

"}}}

" Text, Tabs And Spaces {{{

set backspace=indent,eol,start        " http://vi.stackexchange.com/a/2163
set clipboard=unnamed                 " Clipboard support (OSX)
set expandtab
set iskeyword+=-      " treat dash separated words as a word text object
set list
set listchars=tab:»·,trail:·,nbsp:·
set nowrap
set shiftwidth=4
set spelllang=en_us,it
set tabstop=4
set textwidth=80
"}}}

" Backup and Undo{{{

set nobackup nowritebackup            " Turn off backup files
set undodir=~/.config/nvim/undo
set undofile
set undolevels=1000
set undoreload=10000
"}}}

" UI {{{

highlight Comment cterm=italic  gui=italic
set autoread
set mouse=a
set noshowmode
set number
set numberwidth=1
set scrolloff=5
set showcmd
set sidescrolloff=10
set splitbelow
set splitright
set ttyfast
set lazyredraw
"}}}

" Wildmenu {{{

set wildignore+=*.so
set wildignore+=*.zip
set wildignore+=*/node_modules/
set wildignore+=*/tmp/*
set wildignore+=*/vendor/bundle/*
set wildmenu                          " Tab autocomplete in command mode
"}}}

" Leader {{{

nnoremap <Leader>k :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
vnoremap <Leader>k y :%s/<C-r>"//gc<Left><Left><Left>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
"}}}

" Section Folding {{{

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax
nnoremap <space> za

"}}}

" Searching {{{

set incsearch
set inccommand=nosplit
set hlsearch
nnoremap <silent> ,<space> :nohlsearch<CR>
set ignorecase 
set smartcase
" }}}

" INIT.VIM {{{
nnoremap <leader>ev :vsp ~/.config/nvim/init.vim<CR>
nnoremap <leader>sv :source ~/.config/nvim/init.vim <bar> :doautocmd BufRead<CR>

"}}}

" vim:foldmethod=marker:foldlevel=0
