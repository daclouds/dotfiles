" General {{{
" Use indentation for folds
set foldmethod=indent
set foldnestmax=5
set foldlevelstart=99
set foldcolumn=0

augroup vimrcFold
  " fold vimrc itself by categories
  autocmd!
  autocmd FileType vim set foldmethod=marker
  autocmd FileType vim set foldlevel=0
augroup END

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
if ! exists("mapleader")
  let mapleader = ","
endif

if ! exists("g:mapleader")
  let g:mapleader = ","
endif

" Leader key timeout
set tm=2000

" Allow the normal use of "," by pressing it twice
noremap ,, ,
" }}}

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'leafgarland/typescript-vim'
Plug 'clausreinke/typescript-tools.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Quramy/tsuquyomi'
Plug 'vim-airline/vim-airline'
Plug 'ggreer/the_silver_searcher'
Plug 'mileszs/ack.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'jgdavey/tslime.vim'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'https://github.com/clausreinke/typescript-tools.vim'

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)

" Add plugins to &runtimepath
call plug#end()

"{{{ vim-airline
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
"}}}

"{{{ The Silver Searcher
  let g:ackprg = 'ag --nogroup --nocolor --column'
  if executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif
"}}}

"{{{ YouCompleteMe
  if !exists("g:ycm_semantic_triggers")
    let g:ycm_semantic_triggers = {}
  endif
  let g:ycm_semantic_triggers['typescript'] = ['.']
  noremap pumvisible() ? "\" : " "
"}}}

set rtp+=~/.fzf

let g:session_autosave = 'yes'

" NERDTree {{{

" Close nerdtree after a file is selected
let NERDTreeQuitOnOpen = 1

function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! ToggleFindNerd()
  if IsNERDTreeOpen()
    exec ':NERDTreeToggle'
  else
    exec ':NERDTreeFind'
  endif
endfunction

" If nerd tree is closed, find current file, if open, close it
nmap <silent> <leader>f <ESC>:call ToggleFindNerd()<CR>
nmap <silent> <leader>F <ESC>:NERDTreeToggle<CR>

" }}}

" Automatically save the current session whenever vim is closed
autocmd VimLeave * mksession! ~/.vim/shutdown_session.vim

" <F7> restores that 'shutdown session'
noremap <F7> :source ~/.vim/shutdown_session.vim<CR>

" If you really want to, this next line should restore the shutdown session 
" automatically, whenever you start vim.  (Commented out for now, in case 
" somebody just copy/pastes this whole block)
" 
autocmd VimEnter source ~/.vim/shutdown_session.vim<CR>

" manually save a session with <F5>
noremap <F5> :mksession! ~/.vim/manual_session.vim<cr>

" recall the manually saved session with <F6>
noremap <F6> :source ~/.vim/manual_session.vim<cr>

set viminfo+=%
set hidden
