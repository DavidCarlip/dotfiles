call plug#begin('~/.vim/plugged')

Plug 'lilydjwg/colorizer'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'Yggdroot/indentLine'
Plug 'ap/vim-buftabline'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'terryma/vim-multiple-cursors'
Plug 'lervag/vimtex'
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

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme pencil

set number
set mouse=a

let mapleader = ","
let maplocalleader = "'"

nnoremap ; :

set hidden
nnoremap <leader>. :bnext<CR>
nnoremap <leader>, :bprev<CR>
