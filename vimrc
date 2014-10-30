"{{{ Startup and Bundles
if has("vim_starting")
    set nocompatible
    " call pathogen#infect()
    " call pathogen#helptags()
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#call_hook('on_source')
endif
"}}}
"{{{ NeoBundle
call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Floobits/floobits-vim'
NeoBundle 'c9s/perlomni.vim'
NeoBundle 'chikamichi/mediawiki.vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'hdima/python-syntax'
NeoBundle 'jamessan/vim-gnupg'
NeoBundle 'jeetsukumaran/vim-markology'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent', {
    \ 'depends' : 'kana/vim-textobj-user',
    \ }
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundleLazy 'klen/python-mode', {
    \ 'autoload' : { 'filetypes' : ['python'] },
    \ }
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundleLazy 'nelstrom/vim-textobj-rubyblock', {
    \ 'depends' : 'kana/vim-textobj-user',
    \ 'autoload' : { 'filetypes' : ['ruby', 'racc'] },
    \ }
NeoBundle 'octol/vim-cpp-enhanced-highlight'
NeoBundle 'Rip-Rip/clang_complete'
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neocomplete.vim', {
    \ 'depends' : 'Shougo/context_filetype.vim',
    \ 'disabled' : !has('lua'),
    \ 'vim_version' : '7.3.885'
    \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim', {
    \ 'build' : {
    \     'windows' : 'make -f make_mingw32.mak',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'unix' : 'make -f make_unix.mak',
    \    },
    \ }
NeoBundle 'Shougo/vinarise'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'tikhomirov/vim-glsl'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundleLazy 'travitch/hasksyn', {
    \ 'autoload' : { 'filetypes' : ['haskell'] },
    \ }
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'vim-scripts/a.vim'
NeoBundle 'vim-scripts/alex.vim'
NeoBundle 'vim-scripts/happy.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'zirrostig/vim-jack-syntax'
NeoBundleDisable 'zirrostig/vim-repaste'
NeoBundle 'zirrostig/vim-schlepp'
NeoBundle 'zirrostig/vim-smart-swap'

call neobundle#local("~/.vim/dev-bundle", {}, ['vim-sandbox'])

call neobundle#end()

filetype plugin indent on
"}}}
"{{{ For GVim
if has('gui_running')
    set guioptions=act
    if has("balloon_eval")
        set ballooneval
    endif
    set guifont=Inconsolatazi4\ 7
endif
"}}}
"{{{ Builtin macros - Why are these not defaults
runtime! macros/matchit.vim
runtime! macros/editexisting.vim
"}}}
"{{{  Display/Behavior
if $TERM ==? "rxvt-unicode-256color"
    set cursorline
endif
set foldmethod=marker
set hidden
set history=500
set nohlsearch
set incsearch
set nojoinspaces
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
let mapleader=","
"}}}
"{{{ Files
silent !mkdir -p ~/.vimlocal/swap >/dev/null 2>&1
silent !mkdir -p ~/.vimlocal/undo >/dev/null 2>&1
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
if $TERM ==? "rxvt-unicode-256color"
    let g:hybrid_use_Xresources = 1
    set list listchars=tab:»\ ,trail:␣,nbsp:␣
    colorscheme hybrid
else
    colorscheme desert
endif

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
"{{{ Hack for stupid terminals
if $COLORTERM ==? ('gnome-terminal' || 'xterm' || 'konsole')
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
"{{{ EasyMotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_use_upper = 1
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_keys = "aoeuidhtns-,.crpg;qjkbmwvz"
map <leader>h <Plug>(easymotion-linebackward)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>l <Plug>(easymotion-lineforward)
nmap <leader>.f <Plug>(easymotion-s)
nmap <leader>.t <Plug>(easymotion-bd-t)
nmap <leader>.w <Plug>(easymotion-bd-w)
nmap <leader>.W <Plug>(easymotion-bd-W)
nmap <leader>.e <Plug>(easymotion-bd-e)
nmap <leader>.E <Plug>(easymotion-bd-E)
nmap <leader>.n <Plug>(easymotion-bd-n)
map  <leader>./ <Plug>(easymotion-sn)
map  <leader>.n <Plug>(easymotion-next)
map  <leader>.N <Plug>(easymotion-prev)
omap <leader>./ <Plug>(easymotion-tn)
"}}}
"{{{EasyAlign
vmap <Enter> <Plug>(EasyAlign>
nmap <Leader>a <Plug>(EasyAlign>
"}}}
"{{{ Gundo
nnoremap <leader>u :GundoToggle<CR>
"}}}
"{{{ Markology
let g:markology_textlower="\t"
let g:markology_textother="\t"
let g:markology_textupper="\t"
hi MarkologyHLl ctermfg=Green ctermbg=NONE guifg=Green guibg=NONE
hi MarkologyHLu ctermfg=Cyan ctermbg=NONE guifg=Cyan guibg=NONE
hi MarkologyHLo ctermfg=Red ctermbg=NONE guifg=Red guibg=NONE

"}}}
"{{{ NeoComplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
" Define keyword.
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif

let g:neocomplete#keyword_patterns['default'] = '\h\w*'
let g:neocomlpete#skip_auto_completion_time = ''
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Close popup by <Space>.
" inoremap <expr><Space> pumvisile() ? neocomplete#close_popup() : "\<Space>"
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

"clang completion
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.objc = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.objcpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_hl_errors = 0
let g:clang_complete_macros = 1

"let g:clang_use_library = 1
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


"}}}
"{{{ Python Syntax
let python_highlight_all = 1
"}}}
"{{{ Rainbow Parentheses
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"}}}
"{{{ Repaste
" nnoremap <silent> <leader>r <Plug>RePasteMotion
" vnoremap <silent> <leader>r <Plug>RePasteVisual
" let g:RePaste_DeleteRegister = "r"
"}}}
"{{{ Schlepp
vmap <unique> <up>    <Plug>SchleppUp
vmap <unique> <down>  <Plug>SchleppDown
vmap <unique> <left>  <Plug>SchleppLeft
vmap <unique> <right> <Plug>SchleppRight

vmap <unique> i        <Plug>SchleppToggleReindent
vmap <unique> <S-up>   <Plug>SchleppIndentUp
vmap <unique> <S-down> <Plug>SchleppIndentDown

vmap <unique> Dk <Plug>SchleppDupUp
vmap <unique> Dj <Plug>SchleppDupDown
vmap <unique> Dh <Plug>SchleppDupLeft
vmap <unique> Dl <Plug>SchleppDupRight

let g:Schlepp#reindent = 1
let g:Schlepp#useShiftWidthLines = 1

"}}}
"{{{ SmartSwap
let g:SmartSwap_CheckDate = 1
let g:SmartSwap_CheckDiff = 1
"}}}
"{{{ SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc' , '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
"}}}
"{{{ Syntastic
"C++11 default
let g:syntastic_cpp_compiler_options = ' -std=c++11'

"}}}
"{{{ Vinarise
let g:vinarise_enable_auto_detect = 1
"}}}
"}}} End Plugins
"{{{ Mappings

cmap ` ~/
" nmap / /\v
" nmap ? ?\v
"{{{ Overrides
vnoremap = =gv
"}}}
"{{{ Arrow keys
nnoremap <down> :bprevious<CR>
nnoremap <up> :bnext<CR>
nnoremap <left> :tabprevious<CR>
nnoremap <right> :tabnext<CR>
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
nnoremap <leader>/ :Ag
nnoremap <silent><leader>fs :NoTrail<CR>
nnoremap <silent><leader>ig :IndentGuidesToggle<CR>
nnoremap <silent><leader>rt :RainbowParenthesesToggle<CR>
nnoremap <silent><leader>sc :close<CR>
nnoremap <silent><leader>sh :split<CR>:bnext<CR>
nnoremap <silent><leader>sq :QFixToggle<CR>
nnoremap <silent><leader>sv :vsplit<CR>:bnext<CR>
nnoremap <silent><leader>ta :CtrlPMixed<CR>
nnoremap <silent><leader>tb :CtrlPBuffer<CR>
nnoremap <silent><leader>tc :tabclose<CR>
nnoremap <silent><leader>tn :tabnew<CR>
nnoremap <silent><leader>to :CtrlP<CR>
nnoremap <silent><leader>tu :CtrlPMRU<CR>
nnoremap <silent><leader>ve :vsplit $MYVIMRC<CR>
nnoremap <silent><leader>vs :source $MYVIMRC<CR>
nnoremap <silent><leader><CR> o<Esc>
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
"}}}
" vim: set ts=4 sw=4 et fdm=marker tw=80 fo+=t
