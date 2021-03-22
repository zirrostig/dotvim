" Startup
if has("vim_starting")
    set nocompatible
endif

filetype plugin indent on

" Builtin macros - Why are these not defaults
" runtime! macros/matchit.vim " Now using vim-matchup
" runtime! macros/editexisting.vim

" For NeoVim. These need to be set before loading plugins, otherwise
" dependencies might be installed on the wrong virtual env
if has('nvim')
    " See :help python-virtualenv
    let g:python3_host_prog = expand('~/.pyenv/versions/py3nvim/bin/python')
    " disable python 2 support
    let g:loaded_python_provider = 0
endif

" ALE and coc.nvim compatibility
let g:ale_disable_lsp = 1

" Plug.vim
call plug#begin('~/.vim/plugged')

if has('nvim')
    "Language enhancement
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
endif

" Colorschemes
Plug 'AlessandroYorba/Alduin'
Plug 'fcpg/vim-orbital'
Plug 'mkarmona/materialbox'
Plug 'morhetz/gruvbox'
Plug 'romainl/flattened'
Plug 'tpope/vim-vividchalk'
Plug 'w0ng/vim-hybrid'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'ayu-theme/ayu-vim'
Plug 'junegunn/seoul256.vim'

" Language enhancement
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'dense-analysis/ale'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'sebdah/vim-delve'
Plug 'sheerun/vim-polyglot', {'do' : './build'}
Plug 'vim-scripts/cSyntaxAfter'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Additional completions through CoC listed below
" :CocInstall coc-git
" :CocInstall coc-go
" :CocInstall coc-highlight
" :CocInstall coc-lists
" :CocInstall coc-python
" :CocInstall coc-poetry
" :CocInstall coc-spell-checker
" :CocInstall coc-tabnine
" :CocInstall coc-vimlsp
" :CocInstall coc-yaml

" Misc
Plug 'Shougo/deol.nvim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'airblade/vim-rooter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'guns/vim-sexp'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'kien/rainbow_parentheses.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mhinz/vim-startify'
Plug 'mileszs/ack.vim'
Plug 'rkitover/vimpager'
Plug 'tommcdo/vim-exchange'

" Visual
Plug 'andymass/vim-matchup'
Plug 'andymass/vim-tradewinds'
Plug 'jeetsukumaran/vim-markology'
Plug 'liuchengxu/vista.vim'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-signify'
Plug 'nathanaelkane/vim-indent-guides'

" TimPope
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dispatch'
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
    set guifont=IosevkaNerdFontComplete-Term:h12
    set linespace=1
    " make gvim use the entire frame
    set guiheadroom=0
    autocmd GuiEnter * silent exec "!transset-df -a 0.90"
endif

"  Display/Behavior
if $TERM ==? "rxvt-unicode-256color" || $TERM ==? "xterm-256color" || has('gui_running')
    set cursorline
    " set cursorcolumn
endif
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
set pumheight=8
set ruler
set scrolloff=4
set shortmess=aoOtIc
set showmatch
set sidescrolloff=8
set signcolumn=yes
set smartcase
set splitbelow
set splitright
set switchbuf=usetab,split
set termguicolors
set title
set updatetime=300
set wildchar=<Tab>
set wildmenu
set wildmode=list:longest
set wrap
set breakindent
set breakindentopt=shift:8,min:20,sbr
set showbreak=>->
" Disable modeline unless at or above patched version
" CVE-2019-12735 fixed in 8.1.1365
if !has('nvim') && !has('patch-8.1-1365')
    set nomodeline
endif
if !has('nvim') && has('patch-8.1-1366')
    set nomodelineexpr
endif
let mapleader=","

" Files
silent !mkdir -p ~/.vimlocal/swap >/dev/null 2>&1
silent !mkdir -p ~/.vimlocal/undo >/dev/null 2>&1
silent !mkdir -p ~/.vimlocal/tags >/dev/null 2>&1
set dir=~/.vimlocal/swap
set nobackup
set nowritebackup
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
" autocmd ColorScheme * hi Normal ctermbg=none
" Make CursorColumn look the same as CursorLine
autocmd ColorScheme * hi! link CursorColumn CursorLine
" Make MatchPairs not look like cursor
autocmd ColorScheme * hi clear MatchParen
autocmd ColorScheme * hi MatchParen term=underline cterm=underline,bold, gui=underline,bold

" Statusline
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set laststatus=2
set statusline=%1*#%n%*\ %f%2*%m%r%*\ %3*%y%*%=%{LinterStatus()}%*\ %4*%{get(g:,'coc_git_status','')}%*\ %02.v\|%03.l/%03.L
autocmd ColorScheme * hi link User1 Number
autocmd ColorScheme * hi link User2 Boolean
autocmd ColorScheme * hi link User3 Identifier
autocmd ColorScheme * hi link User4 Function

" Auto colorscheme based on system settings
if has('macunix')
    let iterm_profile = $ITERM_PROFILE
    if iterm_profile == "Dark"
        set background=dark
        let ayucolor="dark"
        colorscheme Tomorrow-Night
    else
        set background=light
        let ayucolor="light"
        colorscheme ayu
    endif
else
    colorscheme jellybeans
endif

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

" ALE
let g:ale_linters = {
      \   'python': ['pylint'],
      \}
let g:ale_fixers = {
      \   'python': ['black'],
      \}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0
let g:ale_linters_explicit = 0 " Disable for anything not mentioned in g:ale_linters
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" CoC
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Format go-code, import missing
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

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

" Gutentags
let g:gutentags_cache_dir = "~/.vimlocal/tags"
let g:gutentags_resolve_symlinks = 1
let g:gutentags_project_info = []

" Gutentags GoLang
call add(g:gutentags_project_info, {"type": "go", "glob": "*.go"})
let g:gutentags_ctags_executable_go = 'gotags'
let g:gutentags_file_list_command = 'git ls-files'


" Vim-go
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

" Semshi
if has('nvim')
    let g:semshi#mark_selected_nodes = 0
    let g:semshi#update_delay_factor = 0.0001
endif

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

" Terraform
let g:terraform_fmt_on_save=1

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
nnoremap <silent><leader>bt :Vista!!<CR>
nnoremap <silent><leader>fs :NoTrail<CR>
nnoremap <silent><leader>ig :IndentGuidesToggle<CR>
nnoremap <silent><leader>gd :SignifyDiff<CR>
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
nmap <leader>ca :CocAction<CR>
nmap <leader>cc :CocCommand<CR>
nmap <silent><leader>cR <Plug>(coc-rename)
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
if has('gui_running')
    noremap <F3> :Presentation<CR>
endif

" vim: set ts=4 sw=4 et fdm=marker tw=80 fo+=t enc=utf-8 fenc=utf-8
