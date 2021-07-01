" ============================================================================
" .vimrc file modified by Ranchow

" Lots of credit to:
" Sample .vimrc file by Dan Sheffner
" ============================================================================
command! W :w
set nocompatible
set nocp
syntax on
" set nowrap
set encoding=utf8
" ----------------------------------------------------------------------------
" Useful settings
set history=700
set undolevels=1000
set undofile  " Save undo tree.
set undodir=/tmp
" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile
" ----------------------------------------------------------------------------
set spelllang=en_us                        " Set spell check language.
set tags+=tags                               " Enable tags.
" ----------------------------------------------------------------------------
runtime ~/.vim/bundle/pathogen/autoload/pathogen.vim
" ----------------------------------------------------------------------------
" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
" ----------------------------------------------------------------------------

" Plug Start
call plug#begin('~/.vim/bundle')

" ============================================================================
"                               PLUGINS
" ============================================================================
" ============================================================================
" Utility
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'jiangmiao/auto-pairs' " Autocomplete enclosures
Plug 'scrooloose/nerdtree' " To easily browse files
Plug 'preservim/nerdcommenter' " To easily add code comments
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'kien/ctrlp.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/limelight.vim' "Hyperfocus-writing
Plug 'godlygeek/tabular'
Plug 'henrik/rename.vim'
Plug 'junegunn/goyo.vim'
Plug 'dyng/auto_mkdir'
Plug 'rking/ag.vim'
Plug 'JazzCore/ctrlp-cmatcher'
Plug 'ryanoasis/vim-devicons'
Plug 'christoomey/vim-tmux-navigator'
Plug 'APZelos/blamer.nvim'
" ============================================================================
" ============================================================================
" Generic Programming support
Plug 'honza/vim-snippets'
Plug 'tomtom/tcomment_vim'
Plug 'tobyS/vmustache'
Plug 'janko-m/vim-test'
Plug 'maksimr/vim-jsbeautify'
Plug 'neomake/neomake'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" disable autocomplete by default
let b:deoplete_disable_auto_complete=1
let g:deoplete_disable_auto_complete=1
" empty sources by default
let g:deoplete#sources = {}

set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" ============================================================================
" ============================================================================
" Ruby/Rails
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'KurtPreston/vim-autoformat-rails'
Plug 'skalnik/vim-vroom'

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 0
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 0
autocmd FileType ruby,eruby let g:rubycomplete_rails = 0
" ============================================================================
" ============================================================================
" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'Shougo/vimproc.vim'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'dsawardekar/ember.vim'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'isRuslan/vim-es6'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'mustache/vim-mustache-handlebars'
Plug 'w0rp/ale'
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
Plug 'skywind3000/asyncrun.vim'
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
" ============================================================================
" ============================================================================
" HTML/CSS/SCSS
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'tpope/vim-haml'
" enable all emmet functions
let g:user_emmet_mode='a'
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
" ============================================================================
" ============================================================================
" MarkDown
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'
" ============================================================================
" ============================================================================
" Python
" Plug 'python-mode/python-mode'
Plug 'hdima/python-syntax'
" ============================================================================
" ============================================================================
" Git
Plug 'airblade/vim-gitgutter'
let g:gitgutter_max_signs = 500  " default value
" ============================================================================
" ============================================================================
" Themes
Plug 'rakr/vim-one'
Plug 'chriskempson/base16-vim'
" ============================================================================
" ============================================================================
" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" ============================================================================
" ============================================================================
" CSV
Plug 'chrisbra/csv.vim'
" ============================================================================
" ============================================================================
" Productivity
Plug 'wakatime/vim-wakatime'
" ============================================================================
" ============================================================================
"                       CONFIGS
" ============================================================================

call plug#end()  " required

" ----------------------------------------------------------------------------
let mapleader = ","
" ----------------------------------------------------------------------------
" gets rid of extra space
autocmd BufWritePre * %s/\s\+$//e
" ----------------------------------------------------------------------------
" map ctrl n to line numbers
:nmap <C-N><C-N> :set invnumber<CR>
" ----------------------------------------------------------------------------
" Mouse and backspace
" set mouse=a " on OSX press ALT and click
set bs=2 " make backspace behave like normal again
" ----------------------------------------------------------------------------
" Nerd Commenter confif

" ----------------------------------------------------------------------------
" bind Ctrl+<movement> keys to move around the windows
" instead of using Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" ----------------------------------------------------------------------------
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>
" ----------------------------------------------------------------------------
" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>
map <Leader>w :write<CR>
" ----------------------------------------------------------------------------
" Quick buffer reload
map <Leader>r :e<CR>
" Refresh control p
map <Leader>p :CtrlPClearCache<CR>
" ----------------------------------------------------------------------------
" Quick quit command
noremap <Leader>q :quit<CR> " Quit current window
noremap <Leader>Q :qa!<CR> " Quit all windows
noremap <Leader>e :wq<CR> " Save changes and quit current window
" ----------------------------------------------------------------------------
" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
" ----------------------------------------------------------------------------
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
" ----------------------------------------------------------------------------
" map sort function to a key
vnoremap <Leader>s :sort<CR>
" ----------------------------------------------------------------------------
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation
" ----------------------------------------------------------------------------
" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
" ----------------------------------------------------------------------------
" Enable syntax highlighting
" Pathogen load
filetype on

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
:filetype plugin on
" ----------------------------------------------------------------------------
" Showing line numbers and length
set number " show line numbers
set tw=80 " width of document (used by gd)
" set nowrap " don't automatically wrap on load
:set wrap linebreak nolist " add soft wrapping
set fo-=t " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233
" ----------------------------------------------------------------------------
" easier formatting of paragraphs
vmap Q gq
nmap Q gqap
" ----------------------------------------------------------------------------
" Real programmers don't use TABs but spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
" ----------------------------------------------------------------------------
" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase
" ============================================================================
"                Color scheme
" ============================================================================
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
set t_Co=256

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

colorscheme tomorrow-night
" colorscheme earthsong
" set background=dark
let g:one_allow_italics = 1 " Allow italics for comments. <3
let g:airline_theme='one'
" ============================================================================

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" ----------------------------------------------------------------------------
" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/dist,*/tmp

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" ----------------------------------------------------------------------------
" Git blamer
let g:blamer_enabled = 1
let g:blamer_delay = 1000
let g:blamer_show_in_visual_modes = 0
let g:blamer_prefix = '  >>> '
let g:blamer_template = '<committer> <summary>'
let g:blamer_date_format = '%d/%m/%y %H:%M'
let g:blamer_relative_time = 1
highlight Blamer guifg=cyan
" ----------------------------------------------------------------------------
" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
" map <Leader>g :call RopeGotoDefinition()<CR>
" let ropevim_enable_shortcuts = 1
" let g:pymode_rope_goto_def_newwin = vnew
" let g:pymode_rope_extended_complete = 1
" let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
" let g:pymode_syntax_builtin_objs = 0
" let g:pymode_syntax_builtin_funcs = 0
" let g:pymode_rope_lookup_project = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
" ----------------------------------------------------------------------------
" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable
" ----------------------------------------------------------------------------
" Neocomplete
" let g:neocomplete#enable_at_startup = 1
"
" ----------------------------------------------------------------------------
set wildmenu
set wildmode=list:longest,full

set clipboard=unnamedplus
" display tabs as characters
set list
set listchars=tab:>-
" ----------------------------------------------------------------------------
" load up the nerd tree
" autocmd vimenter * NERDTree
map <Leader>t <plug>NERDTreeTabsToggle<CR>

" move nerdtree to the left
let g:NERDTreeWinPos = "left"
" " move to the first buffer
autocmd VimEnter * wincmd p
" ----------------------------------------------------------------------------
" paste toggle
set pastetoggle=<F2>
" ----------------------------------------------------------------------------
" turn off auto complete
" let g:pymode_rope_completion = 0
" let g:pymode_rope_complete_on_dot = 0
" ----------------------------------------------------------------------------
" set autoread on
:set autoread
" ----------------------------------------------------------------------------
" Ctrl+P settings
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|.git\|dist'
" ----------------------------------------------------------------------------
" Prevent nvim from changing the cursor
set guicursor=a:hor20
:set guicursor+=a:blinkon0
" ----------------------------------------------------------------------------
" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-yaml',
  \ 'coc-solargraph',
  \ 'coc-yaml',
  \ 'coc-python',
  \ 'coc-emmet',
  \ 'coc-snippets',
  \ 'coc-git',
  \ 'coc-svg',
  \ 'coc-vimlsp',
  \ 'coc-markdownlint'
  \ ]
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

set updatetime=300
  " always show signcolumns
set signcolumn=yes

" don't give |ins-completion-menu| messages.
set shortmess+=c

" vim-prettier
"let g:prettier#quickfix_enabled = 0
"let g:prettier#quickfix_auto_focus = 0
" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" run prettier on save
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
" ----------------------------------------------------------------------------
" Give more space for displaying messages.
set cmdheight=1

