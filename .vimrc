" crccheck's vimrc
"
" all about maps:
" map KEY_SEQUENCE OPERATION
" map <F5> dd
"
" map   normal, visual, operator-pending
" map!  insert, command-line
" nmap  normal
" vmap  visual
" omap  operator-pending
" cmap  command-line
" imap  insert
" lmap  insert, command-line, lang-arg
"
" add 'nore' to prevent recursion
"
" nnoremap
" inoremap
" vnoremap
" ...

" pep8 tabs set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
"set nosmartindent
"set cindent

" use <Tab> and <S-Tab> to indent/unindent in visual mode
:vnoremap <Tab> >gv
:vnoremap <S-Tab> <gv

" search
set incsearch
set ignorecase
set smartcase

" scroll offset for some additional context
set scrolloff=3

set backup
set guifont=Monospace\ 8
" show line numbers
set number
set title
filetype plugin on
syn on
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set nowrap

" file completion
set wildmode=longest,list
"        trailing space for test       
" identify and color special keys    
set list listchars=tab:▸-,trail:·,nbsp:·
highlight SpecialKey ctermfg=15 ctermbg=1 guifg=#ce4e4e guibg=#ee6e6e

" status line
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

" F1 means ESC
map <F1> <Esc>

" use CMD Up/Down to shift a line up/down
nnoremap <C-Down> :m+<CR>
nnoremap <C-Up> :m-2<CR>
inoremap <C-Down> <Esc>:m+<CR>gi
inoremap <C-Up> <Esc>:m-2<CR>gi
vnoremap <C-Down> :m'>+<CR>gv
vnoremap <C-Up> :m-2<CR>gv

" Use CTRL-S for saving, also in Insert mode
if has("gui_running")
    noremap <C-S> :update<CR>
    vnoremap <C-S> <C-C>:update<CR>
    inoremap <C-S> <C-O>:update<CR>
endif

" put buffer into clipboard, return cursor to position
nnoremap <Leader>a ggVG"+y<CR><C-o><C-o>

" automatically compile SCSS files on write
" autocmd BufWritePost,FileWritePost *.scss :silent !sass --scss --update --stop-on-error <afile>

" automatically highlight after a search like notepad++
" this could use more work, sometimes i don't want it to clear
set hlsearch
autocmd InsertEnter * :let @/=""
autocmd InsertLeave * :let @/=""

" tabs
" ctrl+shift pgup/pgdown moves tabes like gterm
nnoremap <silent> <C-S-PageUp> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <C-S-PageDown> :execute 'silent! tabmove ' . tabpagenr()<CR>
inoremap <silent> <C-S-PageUp> <Esc>:execute 'silent! tabmove ' . (tabpagenr()-2)<CR>gi
inoremap <silent> <C-S-PageDown> <Esc>:execute 'silent! tabmove ' . tabpagenr()<CR>gi

if version >= 730
    " with vim 7.3
    set colorcolumn=80
    " BufAdd
    autocmd BufEnter * set relativenumber
    set bs=2
endif

" search and replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" NERDTree
let NERDChristmasTree=1
let NERDTreeMinimalUI=1
" single click opens directories
let NERDTreeMouseMode=2
let NERDTreeQuitOnOpen=1
if has("gui_running")
    let NERDTreeDirArrows=1
endif
nnoremap <silent> <C-Tab> :NERDTreeToggle %:p:h<CR>
inoremap <silent> <C-Tab> :NERDTreeToggle %:p:h<CR>
onoremap <silent> <C-Tab> :NERDTreeToggle %:p:h<CR>
vnoremap <silent> <C-Tab> :NERDTreeToggle %:p:h<CR>
" nnoremap <silent> <C-S-Tab> :execute 'NERDTreeToggle ' . getcwd()<CR>
autocmd BufEnter NERD_tree_* NERDTreeFind

" auto start NERDTree
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

" code folding
" TODO better colors, make fold levels work on whole buffer
set foldmethod=indent
set foldminlines=3
set foldnestmax=4
set nofoldenable
" remove all folds
inoremap <F12> <C-O>zn
nnoremap <F12> zn
onoremap <F12> <C-C>zn
vnoremap <F12> zn
" fold 1
inoremap <silent> <F9> :set foldlevel=0<CR><C-O>zA
nnoremap <silent> <F9> :set foldlevel=0<CR>zA
onoremap <silent> <F9> :set foldlevel=0<CR><C-C>zA
vnoremap <silent> <F9> :set foldlevel=0<CR>zA
" fold 2
inoremap <silent> <F10> :set foldlevel=1<CR><C-O>zA
nnoremap <silent> <F10> :set foldlevel=1<CR>zA
onoremap <silent> <F10> :set foldlevel=1<CR><C-C>zA
vnoremap <silent> <F10> :set foldlevel=1<CR>zA
" fold 3
inoremap <silent> <F11> :set foldlevel=2<CR><C-O>zA
nnoremap <silent> <F11> :set foldlevel=2<CR>zA
onoremap <silent> <F11> :set foldlevel=2<CR><C-C>zA
vnoremap <silent> <F11> :set foldlevel=2<CR>zA

au BufRead,BufNewFile Vagrantfile set filetype=ruby
