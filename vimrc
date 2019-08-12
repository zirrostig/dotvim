" Startup
if has("vim_starting")
    set nocompatible
endif

filetype plugin indent on

" Builtin macros - Why are these not defaults
" runtime! macros/matchit.vim " Now using vim-matchup
" runtime! macros/editexisting.vim

" Plug.vim
call plug#begin('~/.vim/plugged')

" Colorschemes
Plug 'AlessandroYorba/Alduin'
Plug 'tpope/vim-vividchalk'
Plug 'w0ng/vim-hybrid'
Plug 'fcpg/vim-orbital'

" Language enhancement
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sheerun/vim-polyglot', {'do' : './build'}
Plug 'vim-scripts/cSyntaxAfter'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'hashivim/vim-terraform'
Plug 'sebdah/vim-delve'

" Completion
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" Additional completions through CoC listed below
" :CocInstall coc-tabnine
" :CocInstall coc-highlight
" :CocInstall coc-lists

" Misc
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/deol.nvim'
Plug 'airblade/vim-rooter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'guns/vim-sexp'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'kien/rainbow_parentheses.vim'
Plug 'mhinz/vim-startify'
Plug 'mileszs/ack.vim'
Plug 'rkitover/vimpager'
Plug 'tommcdo/vim-exchange'

" Visual
Plug 'andymass/vim-matchup'
Plug 'andymass/vim-tradewinds'
Plug 'jeetsukumaran/vim-markology'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-signify'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'xavierchow/vim-sequence-diagram'

" Syntastic
Plug 'scrooloose/syntastic'
Plug 'myint/syntastic-extras'

" TimPope
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
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
    set guifont=Inconsolata-Regular:h12
    set linespace=1
    " make gvim use the entire frame
    set guiheadroom=0
    autocmd GuiEnter * silent exec "!transset-df -a 0.90"
endif

"  Display/Behavior
" if $TERM ==? "rxvt-unicode-256color" || has('gui_running')
"     set cursorline
"     set cursorcolumn
" endif
set belloff=all " I hate the bell
set cmdheight=2 " for echodoc
set cpoptions+=nd$
set foldmethod=marker
set hidden
set history=500
set hlsearch " :h g:incsearch#auto_nohlsearch
set incsearch
set nojoinspaces
set nomore
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
set wrap
set breakindent
set breakindentopt=shift:8,min:20,sbr
set showbreak=>->
" Disable modeline unless at or above patched version
" CVE-2019-12735 fixed in 8.1.1365
if !has('patch-8.1-1365')
    set nomodeline 
endif
if has('patch-8.1-1366')
    set nomodelineexpr
endif
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
set tags=./tags,tags,./TAGS,TAGS,gems.tags

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

colorscheme jellybeans

" Hack for stupid terminals
if $COLORTERM ==? ('gnome-terminal' || 'xterm' || 'konsole')
    set t_Co=256
endif

" Buffer Autocmds
autocmd BufRead,BufNewFile /tmp/mutt* set ft=mail spell

" Plugins
" Ack
if executable('rg')
    let g:ackprg = 'rg --vimgrep'
endif

" CtrlP
let g:ctrlp_working_path_mode = 0
" g:ctrlp_root_markers is not used unless working path mode is changed for the current buffer
let g:ctrlp_root_markers = ['.rooter', '.git/', 'Makefile']
let g:ctrlp_by_filename = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:5,max:20,results:50'
let g:ctrlp_switch_buffer = 'ETVH'
let g:ctrlp_tabpage_position = 'al'
" if executable("rg")
"     let g:ctrlp_user_command = 'rg %s -l --nocolor --hidden -p -g ""'
" endif

" EasyAlign
vmap <Enter> <Plug>(EasyAlign>
nmap <Leader>a <Plug>(EasyAlign>

" EchoDoc
let g:echodoc_enable_at_startup = 1

" Go-vim
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" incsearch
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" incsearch-fuzzy
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

" JS-Sequence-Diagram
nmap <silent><unique><leader>td <Plug>GenerateDiagram 
let g:generate_diagram_theme_hand = 1

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

" Rooter
let g:rooter_patterns = ['.rooter', '.git/', 'Makefile' ]

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
let g:signify_vcs_list = [ 'git' ]

" SmartSwap
let g:SmartSwap_CheckDate = 1
let g:SmartSwap_CheckDiff = 1

" Startify
let g:startify_custom_header = map(split(system('fortune -a'), '\n'), '"   ". v:val')

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_stl_format = "%E{[E#: %e]}%W{[W#: %w]}"

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

" Show syntax highlighting group
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


" Leader Commands
nnoremap <leader>/ :Ack!<Space>
nnoremap <silent><leader>bt :TagbarToggle<CR>
nnoremap <silent><leader>fs :NoTrail<CR>
nnoremap <silent><leader>ig :IndentGuidesToggle<CR>
nnoremap <silent><leader>gd :SignifyDiff<CR>
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
nnoremap <silent><leader>ut :UndotreeToggle<CR>
nnoremap <silent><leader>ve :vsplit $MYVIMRC<CR>
nnoremap <silent><leader>vs :source $MYVIMRC<CR>
nmap <leader><leader>cR <Plug>(coc-rename)
nmap <silent><leader>cd <Plug>(coc-definition)
nmap <silent><leader>ci <Plug>(coc-implementation)
nmap <silent><leader>cr <Plug>(coc-references) 
nmap <silent><leader>cy <Plug>(coc-type-definition)
                                               
" Toggles                                      
noremap <silent><F4> :set list!<CR>            
inoremap <silent><F4> :set list!<CR>

" Save with sudo and tee
cmap w!! ForceSave

" Swaps
nnoremap    v   <C-V>
nnoremap <C-V>     v
vnoremap    v   <C-V>
vnoremap <C-V>     v

" Better Ex mode
nnoremap Q gQ
nnoremap gQ Q

" Presentation mode so my coworkers can read
noremap <F3> :Presentation<CR>

" vim: set ts=4 sw=4 et fdm=marker tw=80 fo+=t enc=utf-8 fenc=utf-8
