set nocompatible   	              " Disable vi-compatibility
filetype off		              " required for Vundle
set rtp+=~/.vim/bundle/Vundle.vim " set runtime path to include Vundle
call vundle#begin()               " init Vundle
Plugin 'VundleVim/Vundle.vim'     " let Vundle manage Vundle, required

Plugin 'vim-airline/vim-airline'
Plugin 'joshdick/onedark.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'mhinz/vim-startify'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'ryanoasis/vim-devicons'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'Valloric/MatchTagAlways'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mileszs/ack.vim'
Plugin 'tobyS/vmustache'
Plugin 'NLKNguyen/copy-cut-paste.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-dispatch'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'posva/vim-vue'

" Rails dev plugins
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-cucumber'
Plugin 'thoughtbot/vim-rspec'

call vundle#end()          " End of plugins
filetype plugin indent on  " required

" Put your non-Plugin stuff after this line
set shell=/bin/zsh " zsh is cooler than bash
set updatetime=150 " update gitgutter faster
set encoding=utf8

" Color Settings
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
syntax on
colorscheme onedark
let g:onedark_terminal_italics=1
let g:airline_theme='onedark'

" gVim - Gui Settings
if has("gui_running")
  set guioptions-=m   " Removes top menu bar
  set guioptions-=T   " Removes top toolbar
  set guioptions-=r   " Removes right hand scroll bar
  set guioptions-=L   " Removes left hand scroll bar
  set guifont=Iosevka\ Nerd\ Font\ Regular\ 15
else
  " For Terminal Transparency (with truecolor support)
  highlight Normal guibg=NONE ctermbg=NONE
endif

set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set shiftwidth=4                " number of spaces to use for autoindenting
set smarttab
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set noerrorbells                " don't beep
set relativenumber              " show line numbers relative to cursor position
set splitbelow                  " create split below when doing horizontal split
set splitright                  " create split on right when doing a vertical split
set tags=tags                   " CTags file
set incsearch
set timeout timeoutlen=200 ttimeoutlen=100
set mouse+=a

" Group all swp files and backups into a dir
set backupdir=~/.vim/backups
set directory=~/.vim/backups

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
map <C-s> <esc>:wall<cr>:SSave return<cr>y<cr>
imap <C-s> <esc>:wall<cr>
nmap <leader>w :w<cr>
nmap <leader>wa :wall<cr>
nmap <leader>wq :wq<cr>
nmap <leader>q :q<cr>
nmap <leader>qa :qall<cr>

nmap <leader>vr :edit ~/dotfiles/.vimrc<cr>
nmap <leader>zr :edit ~/dotfiles/.zshrc<cr>
nmap <leader>i3 :edit ~/dotfiles/.config/i3/config<cr>

"Change directory to match current file ,cd
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
nnoremap <leader>pd :pwd<cr>
"Reload the current buffer
nnoremap <leader>e :e!<cr>
"Open a file browser in the current buffer
nnoremap <leader>f :e .<cr>

" Misc helpers
"Easy escaping to normal mode
imap jk <esc>
" Quickly add semi-colon to end of current line
nmap ;; A;<esc>
nmap <leader><space> i<space><esc>
" Quickly insert blank line
nnoremap <leader>o o<esc>
" Quickly move the text following the cursor to the line below
nmap <leader>j i<cr><esc>
" Open splits
nnoremap vs :vsplit<cr>
nnoremap sp :split<cr>
" Open a new buffer
nmap <leader>n :new<cr>
nnoremap <C-]> :tag <C-R>=expand("<cword>")<CR><CR>
nnoremap <silent><leader>tt <C-w><C-]><C-w>T

" Resize vsplit;
nnoremap ;h :vertical resize +5<cr>
nnoremap ;l :vertical resize -5<cr>
nnoremap ;k :resize +5<cr>
nnoremap ;j :resize -5<cr>
nnoremap <leader>1 <c-w>=
nnoremap <leader>2 <C-h>:vertical resize 105<cr>

" Tab handling
set nohidden "remove file from buffer when closing tab
nmap <leader>l :tabnext<cr>
nmap <leader>h :tabprevious<cr>
nmap <C-t> :tabnew<cr>
" move current buffer to a new tab
nmap <leader>t <c-w><s-t>

" Easier window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Familiar copy/cut/paste to clipboard shortcuts
let g:copy_cut_paste_no_mappings = 1
nmap <C-c> <Plug>CCP_CopyLine
vmap <C-c> <Plug>CCP_CopyText
nmap <C-v> <Plug>CCP_PasteText

" NerdTree Stuff
nmap <C-b> :NERDTreeToggle<cr>
"let g:NERDTreeDirArrowExpandable = ''
"let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeMouseMode=2
let NERDTreeWinPos='right'
let NERDTreeMinimalUI=1
let NERDTreeBookmarksFile="~/.vim/NERDTreeBookmarks"
" Close vim if NERDTree is the only open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Custom global higlighting enabled for all colorscheme
"highlight VertSplit ctermfg=8 guifg=#3E4452

" Airline Stuff
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set laststatus=2    " Always show the statusline
set showtabline=2   " Always show the tabline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Edit todo list for project
nmap <leader>todo vs :e todo.md<cr>

" common annoying typos
command! Q q " Bind :Q to :q
command! Qa qa
command! Wq wq


" Tmux settings
if &term =~ '^tmux'
  set ttymouse=xterm2 " tmux knows the extended mouse mode
  let g:VtrOrientation = "v"
  nmap <leader>va :VtrAttachToPane<cr>
  nmap <leader>vc :VtrSendCommandToRunner<cr>
  nmap <leader>vv :VtrSendLinesToRunner<cr>
endif

" Vim - Semi Hard Mode
" no arrow key navigation
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Use Silver Searcher instead of grep (Greplace/Ack.vim settings)
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading --ignore node_modules --ignore vendor --ignore public'
let g:ackprg = 'ag -S --nogroup --column --path-to-ignore=/home/jay/.vim/.agignore'
nmap <leader>s :Ack! "" ./<C-Left><Left><Left>
nmap <leader>ss :Ack! "<cword>" ./<cr>
nmap <leader>sa :Ack! "<cword>" ./app<cr>
nmap <leader>sd :Ack! "<cword>" ./

" CtrlP Stuff
" Make CtrlP use ag for listing the files. Way faster and no useless files.
" Use custom agignore file, skip vcs ignore files, show hidden files
let g:ctrlp_user_command = 'ack -s --smart-case --follow --sort-files -l ""'
let g:ctrlp_use_caching = 0
nmap <leader>p :CtrlPMRU<cr>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:20'

" EditorConfig Settings
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_exec_path = '/usr/bin/editorconfig'

" GitGutter Settings
nnoremap <Leader>gd :GitGutterPreviewHunk<cr>
nnoremap <Leader>gss :GitGutterStageHunk<cr>
nnoremap <Leader>gb :Gblame<cr>

" Ruby Stuff
nmap <leader>ct :Dispatch ~/dotfiles/scripts/rails_ctags.sh .<cr>

function! s:CustomRubySyntax()
  if empty(get(b:, "current_syntax"))
    return
  endif

  unlet b:current_syntax
  syn include @SQL syntax/sql.vim
  syn region sqlHeredoc start=/\v\<\<[-~]SQL/ end=/\vSQL/ keepend contains=@SQL
  let b:current_syntax = "ruby"

  if expand("%") =~# "_spec\.rb$"
    syn match rubyTestHelper "\<subject\>"
    syn match rubyTestMacro "\<let\>!\="
    syn keyword rubyTestMacro after around before
    syn keyword rubyTestMacro
          \ context
          \ describe
          \ feature
          \ containedin=rubyKeywordAsMethod
    syn keyword rubyTestMacro it it_behaves_like
    syn keyword rubyComment
          \ xcontext
          \ xdescribe
          \ xfeature
          \ containedin=rubyKeywordAsMethod
    syn keyword rubyComment xit
    syn keyword rubyAssertion
          \ allow
          \ expect
          \ is_expected
          \ skip
    syn keyword rubyTestHelper
          \ class_double
          \ described_class
          \ double
          \ instance_double
          \ instance_spy
          \ spy
  endif
endfunction

augroup ft_options
  autocmd!
  autocmd FileType ruby call <SID>CustomRubySyntax()
  autocmd FileType ruby setlocal iskeyword+=?,!,=
  autocmd FileType ruby iabbrev <buffer> dinit def initialize
augroup END

" Rails shortcuts
" TODO convert this call to a function to run vim-cucumber
" when the current buffer is in the features dir
nnoremap va :AV<cr>
nmap <Leader>a :A<cr>
nmap <Leader>ec :Econtroller<cr>
nmap <Leader>em :Emodel<cr>
nmap <Leader>ev :Eview<cr>
nmap <Leader>es :e ./db/schema.rb<cr>
nmap <Leader>er :e ./config/routes.rb<cr>

" RSpec shortcuts
map <Leader>r :call RunNearestSpec()<CR>
map <Leader>rr :call RunLastSpec()<CR>
map <Leader>rt :call RunCurrentSpecFile()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

" insert pry binding
nmap <leader>b obinding.pry<esc>==:w<cr>

" Emmet Settings
let g:user_emmet_leader_key = '<C-e>'

" YouCompleteMe Settings
let g:ycm_collect_identifiers_from_tags_files = 1

" Ultisnips Settings
let g:UltiSnipsExpandTrigger="<C-y>"
let g:UltiSnipsJumpForwardTrigger="<c-]>"
let g:UltiSnipsJumpBackwardTrigger="<c-[>"

" Html MatchTagsAlways Settings
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'blade' : 1,
    \ 'eruby' : 1,
    \ 'vue' : 1,
    \ 'php' : 1,
    \}

" Startify Settings
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_change_to_vcs_root = 1
let g:startify_files_number = 5
let g:startify_custom_header =
\ map(split(system('echo "Vim Tip of the day:"; fortune vimtips'), '\n'), '"   ". v:val') + ['','']
let g:startify_list_order = [
      \ ['  bookmarks:'], 'bookmarks',
      \ ['  sessions:'],  'sessions',
      \ ['  cwd mru:'],   'dir',
      \ ['  mru:'],       'files']

"if !isdirectory($HOME . '/.vim/backups')
  "call mkdir($HOME . '/.vim/backups', 'p')
"endif

if !isdirectory($HOME . '/.vim/backups')
  call mkdir($HOME . '/.vim/backups', 'p')
endif

" Saving directories
function! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction

augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
