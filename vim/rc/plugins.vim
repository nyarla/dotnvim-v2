call plug#begin('~/.local/share/nvim')

" Interfaces
" ==========

" file manager
" ------------
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Files
" =====

" generic
" -------
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sbdchd/neoformat'

" nix
" ---
Plug 'LnL7/vim-nix'

" perl
" ----
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'branch': 'dev', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }

call plug#end()
