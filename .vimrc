set nocompatible   	" Disable vi-compatibility

filetype off		" required for Vundle
set rtp+=~/.vim/bundle/Vundle.vim " set runtime path to include Vundle
call vundle#begin() " init Vundle
Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required

Plugin 'NLKNguyen/papercolor-theme'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'mattn/emmet-vim'
Plugin 'mhinz/vim-startify'
Plugin 'sheerun/vim-polyglot'
Plugin 'valloric/MatchTagAlways'
Plugin 'amirh/HTML-AutoCloseTag'
Plugin 'Raimondi/delimitMate'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors' 
Plugin 'rking/ag.vim'
Plugin 'shawncplus/phpcomplete.vim' 
Plugin 'vim-scripts/PDV--phpDocumentor-for-Vim'
Plugin 'NLKNguyen/copy-cut-paste.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'editorconfig/editorconfig-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line
set shell=/bin/zsh	" zsh is cooler than bash
set t_Co=256
set background=dark
colorscheme PaperColor
syntax enable

set guioptions-=m               " Removes top menu bar
set guioptions-=T               " Removes top toolbar
set guioptions-=r               " Removes right hand scroll bar
set go-=L                       " Removes left hand scroll bar

set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set visualbell                  " don't beep
set noerrorbells                " don't beep
set autowrite                   " save on buffer switch
set relativenumber              " show line numbers relative to cursor position
set mouse=a                     " enable mouse usage in vim
set virtualedit=onemore         " allow cursor to be placed after last character at end of line
set splitbelow                  " create split below when doing horizontal split
set splitright                  " create split on right when doing a vertical split
set timeout timeoutlen=200 ttimeoutlen=100

" Group all swp files and backups into a dir
set backupdir=~/.vim/backups
set directory=~/.vim/backups

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

"Easy escaping to normal mode
imap jj <esc>

" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>

nmap <Leader>vr :edit ~/.vimrc<cr>
nmap <Leader>zr :edit ~/.zshrc<cr>
nmap <Leader>i3 :edit ~/.i3/config<cr>

"move an entire line or block of lines up or down
nnoremap <silent> <C-S-Up> :m .-2<CR>==
nnoremap <silent> <C-S-Down> :m .+1<CR>==
inoremap <silent> <C-S-Up> <Esc>:m .-2<CR>==gi
inoremap <silent> <C-S-Down> <Esc>:m .+1<CR>==gi
vnoremap <silent> <C-S-Up> :m '<-2<CR>gv=gv
vnoremap <silent> <C-S-Down> :m '>+1<CR>gv=gv

"Change directory to match current file ,cd
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <Leader>pwd :pwd<CR>
nnoremap <Leader>e :e 

" Quickly add semi-colon to end of current line
nmap ;; A;<esc>

" Delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Open splits
nnoremap vs :vsplit<cr>
nnoremap sp :split<cr>

" Tab handling
set nohidden "remove file from buffer when closing tab
map <leader>l :tabnext<cr>
map <leader>h :tabprevious<cr>

" Easier window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Familiar copy/cut/paste to clipboard shortcuts
let g:copy_cut_paste_no_mappings = 1
nmap <C-c> <Plug>CCP_CopyLine
vmap <C-c> <Plug>CCP_CopyText
"nmap <C-x> <Plug>CCP_CutLine
"vmap <C-x> <Plug>CCP_CutText
nmap <C-v> <Plug>CCP_PasteText

" Resize vsplit
map <Leader>25 :vertical resize 40<cr>
map <Leader>50 <c-w>=
map <Leader>75 :vertical resize 120<cr>

" NerdTree Stuff
nmap <C-b> :NERDTreeToggle<cr>
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeWinPos="right"
let g:NERDTreeMouseMode=2
let NERDTreeMinimalUI=1
let NERDTreeBookmarksFile="~/.vim/NERDTreeBookmarks"
" Close vim if NERDTree is the only open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" custom global higlighting enabled for all colorscheme
highlight Search cterm=underline
highlight vertSplit ctermfg=fg ctermbg=bg
set incsearch

" Powerline Stuff
let g:powerline_pycmd = 'py3'
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set laststatus=2    " Always show the statusline
set showtabline=2   " Always show the tabline

" Auto-remove trailing spaces
autocmd BufWritePre *.php :%s/\s\+$//e

" Edit todo list for project
nmap <Leader>todo :e todo.txt<cr>

" Use Silver Searcher instead of grep
set grepprg=ag

" common annoying typos
command! Q q " Bind :Q to :q
command! W w
command! Wq wq

map Q <Nop>

" Need to rewrite this to work with ctrlP
" Stole from Jeffrey Way
" Concept - load underlying class for Laravel
function! FacadeLookup()
    let facade = input('Facade Name: ')
    let classes = {
\       'Form': 'Html/FormBuilder.php',
\       'Html': 'Html/HtmlBuilder.php',
\       'File': 'Filesystem/Filesystem.php',
\       'Eloquent': 'Database/Eloquent/Model.php',
\   }

execute ":vs vendor/laravel/framework/src/Illuminate/" . classes[facade]
endfunction
nmap <Leader>fl :call FacadeLookup()<cr>

" CtrlP Stuff
" Make CtrlP use ag for listing the files. Way faster and no useless files.
" Use custom agignore file, skip vcs ignore files, show hidden files
let g:ctrlp_user_command = 'ag %s --path-to-agignore=/home/jay/.vim/.agignore -l -U --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0
nmap <Leader>p :CtrlPBuffer<cr>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:20'
" EditorConfig Settings
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_exec_path = '/usr/bin/editorconfig'

" PHP stuff
let php_htmlInStrings = 1  "Syntax highlight HTML code inside PHP strings.
let php_sql_query = 1      "Syntax highlight SQL code inside PHP strings.

" PHP docblocks
inoremap <C-d> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-d> :call PhpDocSingle()<CR> 

" SyntasticCheck Settings
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php', 'phpmd']

" YouCompleteMe Settings
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_show_diagnostics_ui = 0

" Ultisnips Settings
let g:UltiSnipsExpandTrigger="<c-y>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Html MatchTagsAlways Settings
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'blade' : 1,
    \ 'php' : 1,
    \}

" Startify Settings
let g:startify_session_dir = '~/.vim/session'
let g:startify_custom_header = 
\ map(split(system('fortune -s | cowsay'), '\n'), '"   ". v:val') + ['','']
let g:startify_list_order = [
      \ ['   Bookmarks '], 'bookmarks',
      \ ['   Sessions '],  'sessions',
      \ ['   Recent Files '],       'files' ,
      \ ['   Recent files in cwd '],   'dir']

" Jump to last cursor position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Put at the very end of your .vimrc file.
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
