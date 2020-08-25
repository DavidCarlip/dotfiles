call plug#begin('~/.vim/plugged')

Plug 'lilydjwg/colorizer'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'ap/vim-buftabline'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'terryma/vim-multiple-cursors'
Plug 'lervag/vimtex'
Plug 'mhinz/neovim-remote'
Plug 'baskerville/vim-sxhkdrc'
Plug 'reedes/vim-wordy'
Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-colors-pencil'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-scripts/guicolorscheme.vim'
Plug 'google/vim-searchindex'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

call plug#end()

call glaive#Install()

set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set nocompatible

set clipboard=unnamed

syntax enable

set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set t_Co=256

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=dark
colorscheme pencil

set cursorline
set number
set mouse=a
set lazyredraw
filetype plugin indent on

highlight Comment cterm=italic
highlight Conceal guifg='CornflowerBlue'

set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch
set hidden

let mapleader = ","
let maplocalleader = "'"

let g:vimtex_compiler_progname = 'nvr'
let g:tex_conceal = 'admg'
let g:vimtex_view_general_viewer = 'firefox'

let g:notes_directories = ['~/notes']

nnoremap ; :
nnoremap <leader>. :bnext<CR>
nnoremap <leader>, :bprev<CR>
nnoremap <tab> %
vnoremap <tab> %
nnoremap <leader><space> :noh<CR>
nnoremap j gj
nnoremap k gk
nnoremap J 5gj
nnoremap K 5gk
nnoremap L g$
nnoremap H g0

vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

nnoremap <leader>c :set <C-R>=&conceallevel ? 'conceallevel=0' : 'conceallevel=2'<CR><CR>

nnoremap <leader>r :source ~/.config/nvim/init.vim<CR>

command! Q :q
