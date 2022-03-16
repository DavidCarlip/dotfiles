call plug#begin('~/.vim/plugged')

Plug 'lilydjwg/colorizer'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'ap/vim-buftabline'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'terryma/vim-multiple-cursors'
Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
Plug 'mhinz/neovim-remote'
Plug 'baskerville/vim-sxhkdrc'
Plug 'reedes/vim-wordy'
Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-colors-pencil'
Plug 'arcticicestudio/nord-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-scripts/guicolorscheme.vim'
Plug 'google/vim-searchindex'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'sirver/ultisnips'

call plug#end()

call glaive#Install()

set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set nocompatible

set clipboard=unnamed

syntax enable
syntax on

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
colorscheme nord

set number
set mouse=a
set lazyredraw
filetype plugin indent on

highlight Comment cterm=italic
highlight Conceal guifg='CornflowerBlue'

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch
set hidden

let mapleader = ","
let maplocalleader = "'"
let g:livepreview_previewer = 'zathura'

let g:vimtex_compiler_progname = 'nvr'
let g:tex_conceal = 'abdmg'
let g:vimtex_view_general_viewer = 'zathura'
let g:tex_flavor = 'latex'

let g:notes_directories = ['~/notes']

setlocal spell
set spelllang=nl,en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

nnoremap ; :
nnoremap <leader>. :bnext<CR>
nnoremap <leader>, :bprev<CR>
nnoremap <leader>w :bd<CR>
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
