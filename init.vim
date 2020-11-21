set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf8
set t_Co=256
set number
set relativenumber
set mouse=a

" allow buffer switch
set hidden

" escape insert mode with jj
imap jj <Esc>

" incremental search
set incsearch

" highlighted search results
set hlsearch

" ignore case durin search, smart case
set ignorecase
set smartcase

"remove highlight of last search by Esc
nnoremap <silent> <Esc> :noh<CR>:<backspace>


" exit insert mode in terminal with Esc
tnoremap <Esc> <C-\><C-n>

" change leader key (\) to space
let mapleader=" "
nnoremap <SPACE> <Nop>

" disable displaying mode in command line (mode is displayed in airline)
set noshowmode

set updatetime=100 " faster git gutter display

call plug#begin()
Plug 'preservim/nerdtree' " project tree (open with CTRL+N)
Plug 'Xuyuanp/nerdtree-git-plugin' " git status in project tree
Plug 'vim-airline/vim-airline' " airline 
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive' " use git from vim
Plug 'jmcantrell/vim-virtualenv' " integration with virtualenvs
Plug 'mhinz/vim-startify' " starting window
Plug 'davidhalter/jedi-vim' " code understanding
Plug 'jeetsukumaran/vim-pythonsense' " better python motions (e.g. go to next class, go to next function)
Plug 'Vimjas/vim-python-pep8-indent' " python indendation 
Plug 'Shougo/deoplete.nvim', {'do': ':autocmd VimEnter * UpdateRemotePlugins'}
Plug 'deoplete-plugins/deoplete-jedi' "jedi autocompletion for deoplete
Plug 'jiangmiao/auto-pairs' "automaticly add pair
Plug 'tpope/vim-surround' "vim sorround
Plug 'Shougo/echodoc.vim' " show function signatures
Plug 'easymotion/vim-easymotion' " easier code navigation 
Plug 'tpope/vim-commentary' " easy coment adding 
Plug 'tommcdo/vim-exchange' " better swaping of words, lines etx
Plug 'kassio/neoterm' " terminal 
Plug 'ervandew/supertab' " tab completion 
Plug 'tpope/vim-repeat' " repeat commands in surround
Plug 'patstockwell/vim-monokai-tasty' " colorscheme
Plug 'airblade/vim-gitgutter' " vim gutter


call plug#end()


" start NERDTree plugin with CTRL+N shortcut
map <C-n> :NERDTreeToggle<CR>
"
"" close vim, if NERDTree is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" Enable folder icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Fix directory colors
highlight! link NERDTreeFlags NERDTreeDir

" Remove expandable arrows in nerdtree
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"
let NERDTreeNodeDelimiter = "\x07"

" Autorefresh on tree focus
function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction
autocmd BufEnter * call NERDTreeRefresh()

" set airline theme, list of themes  https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0

" display virtualenv name in airline
let g:airline#extensions#virtualenv#enabled = 1


" disable display linter hints in airline
let g:airline#extensions#ale#enabled = 0
let g:airline#extensions#whitespace#enabled = 0

" disable jedi-vim autocompletion (deoplete is used instead), disable showing
" function signatures 
let g:jedi#completions_enabled = 0
let g:jedi#show_call_signatures = 0

" disable jedi warnings at startup
let g:jedi#squelch_py_warning = 1

" don't load deoplete if python is not installed
if has('python3')

  " enable deoplete at startup
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#sources#jedi#show_docstring = 0
  
  
  " show signature of functions 
  let g:echodoc#enable_at_startup=1
  let g:echodoc#type = 'virtual'

endif

" select first autocompletion in deoplete
set completeopt+=noinsert

" disable preview window in deoplete
set completeopt-=preview

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3


"enable folding with space
set foldmethod=indent
set foldlevel=99


" easier window switch
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" neoterm options
let g:neoterm_default_mod = 'botright'
let g:neoterm_size = 10
let g:neoterm_fixedsize = 1
let g:neoterm_autoscroll=1

" open terminal at startup enable toggling terminal with f12
map <silent> <F12> :Ttoggle <CR>
nmap <silent> <F10> :call ExecutePythonScript()<CR>
function ExecutePythonScript()
  if &filetype ==? 'python'
    write
    Topen 
    T python %
  else 
    echo "No Python script"
  endif
endfunction

" make super tab scroll suggestion from top to bottom
let g:SuperTabDefaultCompletionType = "<c-n>"

" smart case easy motion search
let g:EasyMotion_smartcase = 1

" start easy-motion with s key
nmap s <Plug>(easymotion-overwin-f2)
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

colorscheme vim-monokai-tasty
