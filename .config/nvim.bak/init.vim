" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Install plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense and autocomplete
Plug 'pangloss/vim-javascript' " JavaScript syntax highlighting
Plug 'mxw/vim-jsx' " JSX syntax highlighting
Plug 'tpope/vim-surround' " Surrounding text objects
Plug 'preservim/nerdtree' " File explorer
Plug 'airblade/vim-gitgutter' " Git integration

" Initialize plugin system
call plug#end()

" Basic settings
syntax on
set number
set relativenumber
set autoindent

" Enable auto-completion with Coc.nvim
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" NERDTree file explorer
nnoremap <C-n> :NERDTreeToggle<CR>

" Set tabs and indentation
set tabstop=2
set shiftwidth=2
set expandtab

