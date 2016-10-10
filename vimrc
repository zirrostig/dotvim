" Startup
if has("vim_starting")
    set nocompatible
endif

filetype plugin indent on

" Builtin macros - Why are these not defaults
runtime! macros/matchit.vim
" runtime! macros/editexisting.vim

" Plug.vim
call plug#begin('~/.vim/plugged')

" Colorschemes
Plug 'AlessandroYorba/Alduin'
Plug 'tpope/vim-vividchalk'
Plug 'w0ng/vim-hybrid'

" Language enhancement
Plug 'artur-shaik/vim-javacomplete2'
Plug 'c9s/perlomni.vim'
Plug 'chikamichi/mediawiki.vim'
Plug 'chrisbra/csv.vim'
Plug 'hallison/vim-rdoc'
Plug 'hdima/python-syntax'
Plug 'kchmck/vim-coffee-script'
Plug 'klen/python-mode'
Plug 'vim-ruby/vim-ruby'
" Plug 'vim-utils/vim-ruby-fold'
Plug 'keith/rspec.vim'
" Plug 'skwp/vim-rspec'

" Completion
Plug 'ervandew/supertab'

" Misc
Plug 'KabbAmine/zeavim.vim'
Plug 'airblade/vim-rooter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'guns/vim-sexp'
Plug 'jeetsukumaran/vim-markology'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'kien/rainbow_parentheses.vim'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'mikelue/vim-maven-plugin'
Plug 'mileszs/ack.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'vim-scripts/cSyntaxAfter'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'

" Syntastic
Plug 'scrooloose/syntastic'
Plug 'myint/syntastic-extras'

Plug 'tommcdo/vim-exchange'

" TimPope
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

" Me
Plug 'zirrostig/vim-schlepp'
Plug 'zirrostig/vim-smart-swap'

call plug#end()

" For GVim
if has('gui_running')
    set guioptions=act
    if has("balloon_eval")
        set ballooneval
    endif
    "set guifont=Inconsolatazi4\ 8
    set guifont=Source\ Code\ Pro\ Medium\ 7
endif

"  Display/Behavior
if $TERM ==? "rxvt-unicode-256color" || has('gui_running')
    set cursorline
    set cursorcolumn
endif
set cpoptions+=d$
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
set updatetime=1000
set wildchar=<Tab>
set wildmenu
set wildmode=list:longest
let mapleader=","

" Files
silent !mkdir -p ~/.vimlocal/swap >/dev/null 2>&1
silent !mkdir -p ~/.vimlocal/undo >/dev/null 2>&1
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
" Not all terminals support unicode yet :(
if $TERM ==? "rxvt-unicode-256color" || has('gui_running')
    set list listchars=tab:»\ ,trail:·,nbsp:·
endif

" Don't change backgrough color in terminal
autocmd ColorScheme * hi Normal ctermbg=none
" Make CursorColumn look the same as CursorLine
autocmd ColorScheme * hi! link CursorColumn CursorLine
" Make MatchPairs not look like cursor
autocmd ColorScheme * hi clear MatchParen
autocmd ColorScheme * hi MatchParen term=underline cterm=underline,bold, gui=underline,bold

" Statusline
set laststatus=2
set statusline=%1*#%n%*\ %f%2*%m%r%*\ %3*%y%*%=%#ErrorMsg#%{SyntasticStatuslineFlag()}%*\ %02.v\|%03.l/%03.L
autocmd ColorScheme * hi link User1 Number
autocmd ColorScheme * hi link User2 Boolean
autocmd ColorScheme * hi link User3 Identifier

colorscheme alduin

" Hack for stupid terminals
if $COLORTERM ==? ('gnome-terminal' || 'xterm' || 'konsole')
    set t_Co=256
endif

" Buffer Autocmds
autocmd BufRead,BufNewFile /tmp/mutt* set ft=mail spell

" Java
" Run Eclipse's code formatter on save
" autocmd FileWritePre *.java call Eclipse_format()
function Eclipse_format()
    exec! '!eclipse' '-nosplash' 
                \ '-application' 'org.eclipse.jdt.core.JavaCodeFormatter'
                \ '-verbose'
                \ '-config' '/home/zachs/sob/eclipse/org.eclipse.jdt.core.prefs'
                \ shellescape(@%, 1)
endfunction

" Plugins
" Ack
if executable('rg')
    let g:ackprg = 'rg --vimgrep'
endif

" cSyntaxAfter
autocmd! FileType c,cpp,java,php call CSyntaxAfter()

" EasyAlign
vmap <Enter> <Plug>(EasyAlign>
nmap <Leader>a <Plug>(EasyAlign>

" Easytags
set tags=./tags,~/.workspace/*/tags
let g:easytags_dynamic_files = 2
let g:easytags_async = 1
let g:easytags_resolve_links = 1
let g:easytags_events = ['BufWritePost']

" Goyo
let g:goyo_width = 120
let g:goyo_height = '85%'
let g:goyo_linenr = 1

" Javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete
let g:JavaComplete_JavaviLogfileDirectory = '/tmp'
let g:JavaComplete_ImportDefault = -1
let g:JavaComplete_UsePython3 = 1
let g:JavaComplete_ImportOrder = ['com.spectralogic', 'com', 'org', 'java', 'javax']

" Markology
let g:markology_textlower="\t"
let g:markology_textother="\t"
let g:markology_textupper="\t"
hi MarkologyHLl ctermfg=Green ctermbg=NONE guifg=Green guibg=NONE
hi MarkologyHLu ctermfg=Cyan ctermbg=NONE guifg=Cyan guibg=NONE
hi MarkologyHLo ctermfg=Red ctermbg=NONE guifg=Red guibg=NONE

" Rainbow Parentheses
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

" Rspec
let g:RspecKeymap=0

" Schlepp
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

" Signify
" let g:signify_vcs_list = [ 'perforce', 'subversion', 'git', 'hg' ]

" SmartSwap
let g:SmartSwap_CheckDate = 1
let g:SmartSwap_CheckDiff = 1

" SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc' , '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_stl_format = "%E{[E#: %e]}%W{[W#: %w]}"
let g:syntastic_java_checkstyle_conf_file = "/home/zachs/sob/sus/checkstyle-config/checkstyle-config/src/main/resources/sustaining_checks.xml"

"Use rubocop
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

" Mappings
cmap ` ~/
" nmap / /\v
" nmap ? ?\v
" Overrides
vnoremap = =gv

" Arrow keys
" nnoremap <down> :bprevious<CR>
" nnoremap <up> :bnext<CR>
nnoremap <left> :tabprevious<CR>
nnoremap <right> :tabnext<CR>

" Space clears highlighting from search
noremap <silent> <Space> :silent nohl<Bar>echo<CR>

" Movement/Scrolling
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>
noremap j gj
noremap k gk

" Leader Commands
nnoremap <leader>/ :Ack!<Space>
nnoremap <silent><leader>bt :TagbarToggle<CR>
nnoremap <silent><leader>fs :NoTrail<CR>
nnoremap <silent><leader>ig :IndentGuidesToggle<CR>
nnoremap <silent><leader>ra :RunSpecs
nnoremap <silent><leader>ri :RunSpecLine
nnoremap <silent><leader>rr :RunSpec
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
nnoremap <silent><leader>tt :CtrlPTag<CR>
nnoremap <silent><leader>tu :CtrlPMRU<CR>
nnoremap <silent><leader>ve :vsplit $MYVIMRC<CR>
nnoremap <silent><leader>vs :source $MYVIMRC<CR>

" Toggles
noremap <silent><F4> :set list!<CR>
inoremap <silent><F4> :set list!<CR>

" Swaps
nnoremap    v   <C-V>
nnoremap <C-V>     v
vnoremap    v   <C-V>
vnoremap <C-V>     v

" Better Ex mode
nnoremap Q gQ
nnoremap gQ Q

" vim: set ts=4 sw=4 et fdm=marker tw=80 fo+=t
