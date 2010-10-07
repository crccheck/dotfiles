" pep8 tabs
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" search
set incsearch
set ignorecase
set smartcase

" scroll offset for some additional context
set scrolloff=2

set ai
set backup
set guifont=Monospace\ 8
" i like line numbers
set number
set title
filetype plugin on
syn on
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set nowrap
set list listchars=tab:>-,trail:·
hi SpecialKey term=standout ctermfg=1 ctermbg=1 guifg=#ce4e4e guibg=#ce4e4e

" use alt j/k to shift a line up/down
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv

