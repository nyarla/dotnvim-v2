call plug#begin('~/.local/share/nvim')

" Interfaces
" ==========

" file manager
" ------------
Plug 'nvim-tree/nvim-web-devicons', {'commit': 'bd7a222287c5828cd0607cd0a5605e52f0460074'}
Plug 'nvim-tree/nvim-tree.lua', {'commit': 'b712b82b0ca4eb402ced2d83f8082366989e43e0'}

" status or tab line
" ------------------
Plug 'nvim-lualine/lualine.nvim', {'commit': '0050b308552e45f7128f399886c86afefc3eb988'}

" auto-complete
" -------------
Plug 'onsails/lspkind-nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'ray-x/cmp-treesitter'
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

" nix
" ---
Plug 'LnL7/vim-nix'

" perl
" ----
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'branch': 'dev', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
Plug 'kazuho/p5-text-microtemplate', {'rtp': 'contrib/vim'}

call plug#end()
