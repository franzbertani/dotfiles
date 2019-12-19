" Plugins {{{

call plug#begin('~/.config/nvim/plugged')

Plug 'caksoylar/vim-mysticaltutor'
Plug 'dag/vim-fish'
" Plug 'dense-analysis/ale'
"     let g:ale_virtualtext_cursor = 1
"     " let g:ale_virtualtext_delay = 200
"     hi link ALEVirtualTextError Error
"     hi link ALEVirtualTextWarning Warning
"     hi link ALEVirtualTextInfo Info
"     hi link ALEVirtualTextStyleError Error
"     hi link ALEVirtualTextStyleWarning Warning
"     let g:ale_linters = {
"     \   'c': [],
"     \   'latex': ['lacheck'],
"     \}
" Plug 'ervandew/supertab'
Plug 'farmergreg/vim-lastplace'
Plug 'itchyny/lightline.vim'
    let g:lightline = {
        \ 'colorscheme': 'jellybeans',
        \ }
Plug '/usr/local/opt/fzf'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'kien/ctrlp.vim'
Plug 'lervag/vimtex'
    let g:vimtex_complete_enabled = 1
    let g:vimtex_compiler_progname = 'nvr'
    let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : 'build',
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

" Plug 'ludovicchabant/vim-gutentags'
Plug 'matze/vim-move'
Plug 'mhinz/vim-startify'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
    let g:coc_node_path = '/usr/local/bin/node'
Plug 'sickill/vim-pasta'
Plug 'tell-k/vim-autopep8'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'yegappan/mru'
call plug#end()

"}}}

"coc {{{

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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
set updatetime=300
set hidden
set mouse=a
set noshowmode
set number
set relativenumber
set numberwidth=1
set pumblend=6
set scrolloff=10
set showcmd
set sidescrolloff=10
set splitbelow
set splitright
set ttyfast
set lazyredraw
set noea

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v/

"}}}

" Splits and Tabs {{{

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" }}}

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

" General {{{

let g:python3_host_prog = '/usr/local/bin/python3'
"}}}

" Terminal {{{

tnoremap <Esc> <C-\><C-n>
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
