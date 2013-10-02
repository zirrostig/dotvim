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
set foldmethod=syntax
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
let g:hybrid_use_Xresources = 1
colorscheme hybrid
set list listchars=tab:»\ ,trail:­,nbsp:­

" Make MatchPairs not look like cursor
hi clear MatchParen
hi MatchParen term=underline cterm=underline,bold, gui=underline,bold

" Statusline
set laststatus=2
set statusline=%1*#%n%*\ %f%2*%m%r%*\ %3*%y%*%=%02.v\|%03.l/%03.L
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

""""""""""""""""""""""""""""""""
" Autocmds for whatever reason "
""""""""""""""""""""""""""""""""
au BufRead,BufNewFile /tmp/mutt* set ft=mail spell

"""""""""""""""""
" Plugin Config "
"---------------"
" Ack
let g:agprg="ag --nogroup --smart-case --follow --column"

" Rainbow Parentheses
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" SmartSwap
let g:SmartSwap_CheckDate = 1
let g:SmartSwap_CheckDiff = 1

" SuperTab
let g:SuperTabDefaultCompletionType="context"

" Syntastic
let g:syntastic_python_checkers=['pyflakes']

" NeoComplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#cancel_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#cancel_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#cancel_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc' , '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

""""""""""""
" Mappings "
"----------"
let mapleader=","

cmap ` ~/

" Arrow keys
nnoremap <down> :bprevious<CR>
nnoremap <up> :bnext<CR>
nnoremap <left> :tabnext<CR>
nnoremap <right> :tabprevious<CR>

" Space clears highlighting from search
noremap <silent> <Space> :silent nohl<Bar>echo<CR>

" Movement/Scrolling
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>
noremap j gj
noremap k gk

" Leader Commands
map <silent><leader>wh <C-w>h
map <silent><leader>wj <C-w>j
map <silent><leader>wk <C-w>k
map <silent><leader>wl <C-w>l
nmap <silent><leader>c \\
vmap <silent><leader>c \\
nmap <silent><leader>C \\u
vmap <silent><leader>C \\u
nmap <silent><leader>fs :NoTrail<CR>
nmap <silent><leader>sc :close<CR>
nmap <silent><leader>sh :split<CR>
nmap <silent><leader>sv :vsplit<CR>
nmap <silent><leader>sq :QFixToggle<CR>
nmap <silent><leader>tn :tabnew<CR>
nmap <silent><leader>tc :tabclose<CR>
nmap <silent><leader>to :CtrlP<CR>
nmap <silent><leader>tb :CtrlPBuffer<CR>
nmap <silent><leader>tu :CtrlPMRU<CR>
nmap <silent><leader>ta :CtrlPMixed<CR>
nmap <silent><leader>rt :RainbowParenthesesToggle<CR>
nmap <leader>/ :Ag 

" Toggles
noremap <silent><F4> :set list!<CR>
inoremap <silent><F4> :set list!<CR>
