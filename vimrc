"{{{ Super important
set nocompatible
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
"}}}
"{{{ Builtin macros - Why are these not defaults
runtime! macros/matchit.vim
runtime! macros/editexisting.vim
"}}}
"{{{ Other Macros
" runtime plugin/dragvisuals.vim
"}}}
"{{{  Display/Behavior
set cursorline
set foldmethod=marker
set hidden
set history=500
set hlsearch
set incsearch
set nomore
set nowrap
set number
set relativenumber
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
"}}}
"{{{ Files
set dir=~/.vimlocal/swap
set nobackup
set undofile
set undodir=~/.vimlocal/undo
"}}}
"{{{ Mouse
set mouse=n
set mousefocus
set mousehide
"}}}
"{{{ Editing
set backspace=eol,indent,start
set formatoptions=croql
set matchpairs+=<:>,':',":"
set virtualedit=onemore,block
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
"}}}
"{{{ Spell Checking
set spelllang=en_us
set nospell
"}}}
"{{{ Looks
syntax on
let g:hybrid_use_Xresources = 1
colorscheme hybrid
set list listchars=tab:»\ ,trail:␣,nbsp:␣

" Make MatchPairs not look like cursor
hi clear MatchParen
hi MatchParen term=underline cterm=underline,bold, gui=underline,bold

" Statusline
set laststatus=2
set statusline=%1*#%n%*\ %f%2*%m%r%*\ %3*%y%*%=%02.v\|%03.l/%03.L
hi link User1 Number
hi link User2 Boolean
hi link User3 Identifier
"}}}
"{{{ For GVim
if has('gui_running')
    set guioptions=act
    set ballooneval
    if hostname() == 'thwomp'
        set guifont=peep\ 8
    else
        set guifont=peep\ 11
    endif
endif
"}}}
"{{{ Hack for stupid terminals
if $COLORTERM == ('gnome-terminal' || 'xterm')
    set t_Co=256
endif
"}}}
"{{{ Buffer Autocmds
au BufRead,BufNewFile /tmp/mutt* set ft=mail spell
"}}}
"{{{ Plugins
"{{{ Ack
let g:agprg="ag --nogroup --smart-case --follow --column"
"}}}

"{{{ Rainbow Parentheses
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"}}}

"{{{ SmartSwap
let g:SmartSwap_CheckDate = 1
let g:SmartSwap_CheckDiff = 1
"}}}

"{{{ SuperTab
let g:SuperTabDefaultCompletionType="context"
"}}}

"{{{ NeoComplete
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
" inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"}}}

"{{{ Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc' , '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
"}}}

"{{{ HiJump ~/.vim/plugin/hijump.vim
" This rewires n and N to do the highlighing...
" nnoremap <silent> n   n:call HLNext(0.4)<cr>
" nnoremap <silent> N   N:call HLNext(0.4)<cr>
"}}}

"{{{ HUDigraphs.vim
" inoremap <expr> <C-K> HUDG_GetDigraph()
"}}}

"{{{ DrapVisuals.vim
" vmap <expr> <LEFT>  DVB_Drag('left')
" vmap <expr> <RIGHT> DVB_Drag('right')
" vmap <expr> <DOWN>  DVB_Drag('down')
" vmap <expr> <UP>    DVB_Drag('up')
" vmap <expr> D       DVB_Duplicate()
" "   Remove any introduced trailing whitespace after moving...
" let g:DVB_TrimWS = 1
"}}}

"{{{ Schlepp
runtime $HOME/sob/vim-schlepp/plugin/schlepp.vim
"}}}
"}}} End Plugins
"{{{ Mappings
let mapleader=","

cmap ` ~/
nmap / /\v
nmap ? ?\v

"{{{ Arrow keys
nnoremap <down> :bprevious<CR>
nnoremap <up> :bnext<CR>
nnoremap <left> :tabnext<CR>
nnoremap <right> :tabprevious<CR>
"}}}

"{{{ Space clears highlighting from search
noremap <silent> <Space> :silent nohl<Bar>echo<CR>
"}}}

"{{{ Movement/Scrolling
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>
noremap j gj
noremap k gk
"}}}

"{{{ Leader Commands
noremap <silent><leader>wh <C-w>h
noremap <silent><leader>wj <C-w>j
noremap <silent><leader>wk <C-w>k
noremap <silent><leader>wl <C-w>l
nnoremap <silent><leader>c \\
vnoremap <silent><leader>c \\
nnoremap <silent><leader>C \\u
vnoremap <silent><leader>C \\u
nnoremap <silent><leader>ve :vsplit $MYVIMRC<CR>
nnoremap <silent><leader>vs :source $MYVIMRC<CR>
nnoremap <silent><leader>fs :NoTrail<CR>
nnoremap <silent><leader>ig :IndentGuidesToggle<CR>
nnoremap <silent><leader>sc :close<CR>
nnoremap <silent><leader>sh :split<CR>:bnext<CR>
nnoremap <silent><leader>sv :vsplit<CR>:bnext<CR>
nnoremap <silent><leader>sq :QFixToggle<CR>
nnoremap <silent><leader>tn :tabnew<CR>
nnoremap <silent><leader>tc :tabclose<CR>
nnoremap <silent><leader>to :CtrlP<CR>
nnoremap <silent><leader>tb :CtrlPBuffer<CR>
nnoremap <silent><leader>tu :CtrlPMRU<CR>
nnoremap <silent><leader>ta :CtrlPMixed<CR>
nnoremap <silent><leader>rt :RainbowParenthesesToggle<CR>
nnoremap <leader>/ :Ag
"}}}

"{{{ Toggles
noremap <silent><F4> :set list!<CR>
inoremap <silent><F4> :set list!<CR>
"}}}

"{{{ Swaps
nnoremap    v   <C-V>
nnoremap <C-V>     v
vnoremap    v   <C-V>
vnoremap <C-V>     v
"}}}

" vim: set ts=4 sw=4 et fdm=marker tw=80 fo+=t
