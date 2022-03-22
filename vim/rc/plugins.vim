call plug#begin('~/.local/share/nvim')

" Interfaces
" ==========

" file manager
" ------------
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua', {'tag': '1.6.7'}

" auto-complete
" -------------
Plug 'onsails/lspkind-nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'ray-x/cmp-treesitter'
Plug 'tzachar/cmp-tabnine', {'do': 'sh install.sh'}
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-omni'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'dmitmel/cmp-vim-lsp'

" Files
" =====

" generic
" -------
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sbdchd/neoformat'

Plug 'nvim-lua/plenary.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'

" nix
" ---
Plug 'LnL7/vim-nix'

" perl
" ----
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'branch': 'dev', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
Plug 'kazuho/p5-text-microtemplate', {'rtp': 'contrib/vim'}

call plug#end()
