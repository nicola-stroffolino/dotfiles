call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'ap/vim-css-color'
Plug 'OXY2DEV/markview.nvim'
Plug 'preservim/nerdtree'

call plug#end()
