" Super important
set nocompatible
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

" Builtin macros - Why are these not defaults
runtime macros/matchit.vim
runtime macros/editexisting.vim

" Display/Behavior
set cursorline
set foldmethod=indent
set hidden
set history=500
set hlsearch
set incsearch
set nomore
set nowrap
set number
set pumheight=8
set ruler
set scrolloff=4
set shortmess=aoOtI
set showmatch
set sidescrolloff=8
set smartcase
set splitbelow
set splitright
set switchbuf=usetab,split
set title
set wildchar=<Tab>
set wildmenu
set wildmode=list:longest

" Files
set dir=~/.vimlocal/swap
set nobackup
set undofile
set undodir=~/.vimlocal/undo

" Mouse
set mouse=n
set mousefocus
set mousehide

" Editing
set backspace=eol,indent,start
set formatoptions=croql
set matchpairs+=<:>,':',":"
set virtualedit=onemore,block
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent

" Spell Checking
set spelllang=en_us
set nospell

" Looks
syntax on
colorscheme jellybeans
set list listchars=tab:»\ ,trail:­,nbsp:­

" Make MatchPairs not look like cursor
hi clear MatchParen
hi MatchParen term=underline cterm=underline,bold, gui=underline,bold

" Statusline
set laststatus=2
hi link User1 Number
hi link User2 Boolean
hi link User3 Identifier

" For GVim
if has('gui_running')
    set guioptions=act
    set ballooneval
    if hostname() == 'thwomp'
        set guifont=peep\ 8
    else
        set guifont=peep\ 11
    endif
endif

" Hack for stupid terminals
if $COLORTERM == ('gnome-terminal' || 'xterm')
    set t_Co=256
endif

" Mappings
let mapleader=","

cmap ` ~/

" arrow keys switch buffers/tabs
nnoremap <down> :bprevious<CR>
nnoremap <up> :bnext<CR>
nnoremap <left> :tabnext<CR>
nnoremap <right> :tabprevious<CR>

" space clears highlighting from search
noremap <silent> <Space> :silent nohl<Bar>echo<CR>

" leader direction to switch splits
map <silent><leader>h <C-w>h
map <silent><leader>j <C-w>j
map <silent><leader>k <C-w>k
map <silent><leader>l <C-w>l

" Scroll 4 Lines at a time
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

" visual movement of j and k
noremap j gj
noremap k gk

" toggle list chars
noremap <silent><F4> :set list!<CR>
inoremap <silent><F4> :set list!<CR>

