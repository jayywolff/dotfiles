set nocompatible   	              " Disable vi-compatibility
filetype off		              " required for Vundle
set rtp+=~/.vim/bundle/Vundle.vim " set runtime path to include Vundle
call vundle#begin()               " init Vundle
Plugin 'VundleVim/Vundle.vim'     " let Vundle manage Vundle, required

Plugin 'neoclide/coc.nvim', {'pinned': 1}
Plugin 'vim-airline/vim-airline'
Plugin 'joshdick/onedark.vim'
Plugin 'mhinz/vim-startify'
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'Valloric/MatchTagAlways'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-dispatch'
Plugin 'janko/vim-test'

" Rails dev plugins
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-cucumber'

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
nnoremap ZA :qall<cr>
nnoremap ZS :wall<cr>:qall<cr>
nnoremap <silent> <leader>z :pclose<cr>:cclose<cr>

nmap <leader>vr :edit ~/.vimrc<cr>
nmap <leader>zr :edit ~/.zshrc<cr>
nmap <leader>i3 :edit ~/.config/i3/config<cr>

"Change directory to match current file ,cd
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
nnoremap <leader>pd :pwd<cr>
"Reload the current buffer
nnoremap <leader>e :e!<cr>

" Misc helpers
"Easy escaping to normal mode
imap jk <esc>
" Quickly add semi-colon to end of current line
nmap ;; A;<esc>
nmap <leader><space> i<space><esc>
" Quickly insert blank line
nnoremap <leader>o o<esc>

" Switch between the last two files
nnoremap <leader><leader> <C-^>

" Open splits
nnoremap vs :vsplit<cr>
nnoremap sp :split<cr>
" Open a new buffer
nmap <leader>n :new<cr>
nnoremap <silent><leader>tt <C-w><C-]><C-w>T

" Resize vsplit;
nnoremap ;h :vertical resize +5<cr>
nnoremap ;l :vertical resize -5<cr>
nnoremap ;k :resize +5<cr>
nnoremap ;j :resize -5<cr>
nnoremap <leader>1 <c-w>=
nnoremap <leader>2 <C-h>:vertical resize 105<cr>

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

" Quick toggle comments
map <leader>c <plug>NERDCommenterToggle

" Familiar copy/cut/paste to clipboard shortcuts
let g:copy_cut_paste_no_mappings = 1
nmap <C-c> "+yy
vmap <C-c> "+y
nmap <C-v> "+p

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
" Close vim if a quickfix window is the only open buffer
autocmd bufenter * if (winnr("$") == 1 && &buftype == "quickfix") | q | endif

" Airline Stuff
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set laststatus=2    " Always show the statusline
set showtabline=2   " Always show the tabline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

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

" Use Silver Searcher instead of grep (Greplace/Ack.vim settings)
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading --ignore node_modules --ignore vendor --ignore public'
let g:ackprg = 'ag -S --nogroup --column --path-to-ignore=/home/jay/.vim/.agignore'
nmap <leader>s :Ack! "" ./<C-Left><Left><Left>
nmap <leader>ss :Ack! "<cword>" ./<cr>
nmap <leader>sa :Ack! "<cword>" ./app<cr>
nmap <leader>sd :Ack! "<cword>" ./

" FZF Stuff
nnoremap <expr> <c-p> <SID>is_git_repo() ? ':GFiles<cr>' : ':Files<cr>'
nnoremap <leader>p :History<cr>

function! s:is_git_repo()
  return split(system('git rev-parse --is-inside-work-tree'), '\n')[0] == 'true'
endfunction

" Testing
let test#strategy = "dispatch"
nmap <silent> <leader>r :TestNearest<cr>
nmap <silent> <leader>rt :TestFile<cr>
nmap <silent> <leader>ra :TestSuite<cr>
nmap <silent> <leader>rr :TestLast<cr>

" EditorConfig Settings
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" GitGutter Settings
nnoremap gb :Gblame<cr>
nnoremap gd :GitGutterPreviewHunk<cr>
nnoremap gc :BCommits<cr>
nnoremap gss :GitGutterStageHunk<cr>
nnoremap gdd :GitGutterUndoHunk<cr>:w<cr>

" Emmet Settings
let g:user_emmet_leader_key = '<C-e>'

" Html MatchTagsAlways Settings
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
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

" generate ctags
nnoremap <C-]> :tag <C-R>=expand("<cword>")<cr><cr>
nmap <leader>ct :Dispatch ~/dotfiles/scripts/rails_ctags.sh .<cr>

" Rails stuff
augroup ft_options
  autocmd!
  autocmd FileType ruby setlocal iskeyword+=?,!,=
augroup END

" Rails shortcuts
" TODO convert this call to a function to run vim-cucumber
" when the current buffer is in the features dir
nnoremap va :AV<cr>
nmap <Leader>a :A<cr>
nmap <Leader>ec :Econtroller<cr>
nmap <Leader>em :Emodel<cr>
nmap <Leader>ef :EFixtures<cr>
nmap <Leader>ev :Eview<cr>
nmap <Leader>es :e ./db/schema.rb<cr>
nmap <Leader>er :e ./config/routes.rb<cr>

" insert pry binding
nmap <leader>b obinding.pry<esc>==:w<cr>

" Coc settings
" " don't give |ins-completion-menu| messages.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <Leader>gf <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <leader>ce :<C-u>CocList diagnostics<cr>
nnoremap <silent> <leader>co  :<C-u>CocList commands<cr>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<cr>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

