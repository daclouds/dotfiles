set nocompatible                        " be iMproved, required
filetype off                            " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'        " 화면 상하단에 상태바(버퍼, 탭, 입력상태) 표시 (커스터마이징 가능)
Plug 'myusuf3/numbers.vim'            " set nu 화면을 상대번호로 변경 (d,y,j와 같은 명령에필요한 상대번호 확인에 유용)
Plug 'kshenoy/vim-signature'          " 북마크 확장 - 자동 알파벳팅, 순회, 등?
Plug 'scrooloose/nerdtree'            " 파일탐색기 (윈도우탐색기와 같은 화면과 북마크, 탭열기, 루트 디렉토리 변경하기 등의 기능) 
Plug 'ctrlpvim/ctrlp.vim'             " 파일탐색기 (일부의 문자만 입력하더라도 파일을 찾아주는 Full path fuzzy 검색 용도) 
Plug 'mileszs/ack.vim'                " the_silver_search를 이용하여 (ack, grep 처럼) 파일내용 검색
Plug 'wellle/targets.vim'             " 다양한 text object 지정 방법
Plug 'tpope/vim-fugitive'             " git 플러그인
Plug 'nfvs/vim-perforce'              " 파일을 수정하거나 저장하면 자동으로 Perforce에 check out됨
Plug 'tomtom/tcomment_vim'            " 주석(comment) 기능으로 사용하며, 파일타입에 따라 알맞은 주석방식을 자동으로 지원함 
Plug 'tpope/vim-surround'             " '', {}, [], <p></p>와 같은 구문들을 편리하게 입력, 수정 할 수 있음
Plug 'easymotion/vim-easymotion'

" Plug 'airblade/vim-gitgutter'
Plug 'Valloric/YouCompleteMe', {'do' : './install.py' }
Plug 'leafgarland/typescript-vim'
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" Plug 'Quramy/tsuquyomi'
Plug 'majutsushi/tagbar'
Plug 'jh0x4s/vim-numbers'
" Plug 'ealize/p4blame.vim'

" Plugin 'jelera/vim-javascript-syntax'
" Plugin 'marijnh/tern_for_vim'
" Plugin 'hongqn/vim-osx-ime'
" tpope/vim-commentary
" easymotion/vim-easymotion
" christoomey/vim-tmux-navigator
"

" All of your Plugins must be added before the following line
call plug#end()
" Put your non-Plugin stuff after this line

set background=dark                             " 하이라이팅 lihgt / dark
set nocompatible                                " 오리지날 VI와 호환하지 않음
set splitright                                  " 창 분할시 우측에 새창 배치
set splitbelow                                  " 창 분할시 하단에 새창 배치
set nobackup                                    " 백업 파일을 안만듬
set visualbell                                  " 키를 잘못눌렀을 때 화면 프레시
set ruler                                       " 화면 우측 하단에 현재 커서의 위치(줄,칸) 표시
set number                                      " 행번호 표시, set nu 도 가능
set fencs=ucs-bom,utf-8,euc-kr.latin1           " 한글 파일은 euc-kr로, 유니코드는 유니코드로
set fileencoding=utf-8                          " 파일저장인코딩 
set tenc=utf-8                                  " 터미널 인코딩
set expandtab                                   " softtab 사용 
set shiftwidth=4                                " >>, << 등을 사용했을때 들여쓰기 간격
set softtabstop=4                               " tab키를 사용했을때 들여쓰기 간격
set autoindent                                  " 이전 줄의 들여쓰기 간격을 새줄에서 유지
set smartindent                                 " automatically inserts indentation in some cases
set cindent                                     " like smartindent, but stricter and more customisable
set autoread                                    " 파일이 변경되었다면 자동으로 다시 읽음
set hlsearch                                    " 검색어 강조, set hls 도 가능
set ignorecase                                  " 검색시 대소문자 무시, set ic 도 가능
set smartcase                                   " 검색어에 대문자 포함시 case sensitive 검색
set incsearch                                   " 키워드 입력시 점진적 검색
set cursorline                                  " 커서가 있는 줄 강조
set laststatus=2                                " 상태줄이 항상 나옴 
set title                                       " 편집하는 파일명을 창의 제목으로 사용
set backspace=eol,start,indent                  " 줄의 끝, 시작, 들여쓰기에서 백스페이스시 이전줄로
set history=1000                                " vi 편집기록 기억갯수 .viminfo에 기록
set hidden                                      " 저장안된 버퍼도 화면 전환이 가능하도록 함

syntax on                                       " 구문강조 사용
filetype indent on                              " 파일 종류에 따른 구문강조

autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

" macvim에서 insert mode를 나올때 영문상태로 전환함
set noimd
set imi=1
set ims=-1

" edit ~/.vimrc
map <leader>ev :e! ~/.vimrc<cr>

" Function keys
nnoremap <F2> :NERDTreeToggle<CR>               " NERDTree 보이기/감추기
nnoremap <F4> :NumbersCirculator<CR>            " 줄 번호를 절대/상대/감춤 순으로 전환
nnoremap <F7> :SyntasticCheck<CR>               " 문법(Syntastic) 체크
nmap <F8> :TagbarToggle<CR>
nnoremap <F9> :e!<CR>                           " 저장안된 파일의 수정내용을 취소
nnoremap <F10> :bd<CR>                          " 버퍼 삭제
nnoremap <F11> :bN<CR>                          " 이전 버퍼를 현재 윈도우에 표시
nnoremap <F12> :bn<CR>                          " 다음 버퍼를 현재 윈도우에 표시

" nnoremap <silent> q :bd<Enter>

" Go to previous  window
nnoremap <silent> <tab> <c-w><c-p>

" Go to previous tab 
au TabLeave * let g:previoustab = tabpagenr()
nnoremap <silent> <s-tab> :exe "tabn ".g:previoustab<cr>
vnoremap <silent> <s-tab> :exe "tabn ".g:previoustab<cr>

" Open a new tab (T for with NERDTree)
map <leader>T :tabnew .<CR>
map <leader>t :tabnew <CR>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Resize current window 
map <silent> <leader>W :vertical resize +5<cr>  " 가로(width) 확장
map <silent> <leader>w :vertical resize -5<cr>  " 가로 축소
map <silent> <leader>H :resize +5<cr>           " 세로(hight) 확장
map <silent> <leader>h :resize -5<cr>           " 세로 축소
map <silent> <leader>= <c-w>=                   " 동일한 크기로 자동변경

" helpers for dealing with other people's code
" nmap \t :set ts=4 sts=4 sw=4 noet<cr>
" nmap \s :set ts=4 sts=4 sw=4 et<cr>

" make search appears in the middle of the screen
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" 입력모드에서도 ctrl+hjkl로 커서 이동 가능하도록 함
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-l> <Right>
inoremap <C-h> <Left>

map <silent> 9 $
map <silent> 0 ^

" > Plugin vim-airline
let g:airline#extensions#tabline#enabled=1      " 탭 사용시 상단에 탭목록 표시
let g:airline#extensions#tabline#tab_nr_type=1  " 탭 번호를 표시
let g:airline#extensions#tabline#fnamemod=':t'  " 탭 제목에 파일이름만 표시

" > Plugin delimitMate
let delimitMate_excluded_ft="vim"               " .vimrc 편집시 주석쓰기 불편해서 delimimate 사용안함

" > Plugin Numbers
map <leader>ln :NumbersToggle<CR>               " 행번호를 절대/상대 번호로 표시

" > Plugin ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.p4ignore']
let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/](\.(git|hg|svn)|\node_modules|\bower_components|\dist)$',
        \ 'file': '\v\.(exe|so|dll|class|ppt|png|jpg|jpeg)$',
        \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
 
" > Plugin NERDTree
" let NERDTreeShowHidden=1
" let NERDTreeQuitOnOpen=1

" > Plugin TComment
nmap <leader>c :TComment<cr>
vmap <leader>c :TComment<cr>

" > Plugin Syntastic
" Syntastic은 vim의 syntax on 감지결과로 파일타입을 인식한다. (see: h filetype)
" 그런데 typescript 파일을 인식하지 못해서, :SyntasticInfo 해보면 xmllint가
" 적용되어 있는 것을 볼 수 있는데, 이때문에 *.ts에 대해서 강제로 filetype을 
" 지정해주는 처리가 필요하다.
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_typescript_checkers=['tsc']

let g:syntastic_mode_map = { 
    \ 'mode': 'passive',
    \ 'active_filetypes': ['javascript'],
    \ 'passive_filetypes': [] 
    \ }

" {{{ Plugin YouCompleteMe
" let g:ycm_key_list_select_completion=['<C-j>', '<Down>']
" let g:ycm_key_list_previous_completion=['<C-k>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion=1
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
set completeopt-=preview

nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
nnoremap <leader>r :YcmCompleter GoToReferences<CR>
" }}}

" > Plugin Ack
" silver searcher가 설치되어있다면 사용한다
if executable('ag')                 
    let g:ackprg = 'ag --vimgrep'   
endif

" 명령어모드에서 ack로 입력하면 Ack!로 치환
cnoreabbrev ack Ack!                
nnoremap <Leader>a :Ack!<Space>

" > Plugin VIM-signature
map <leader>p m. 
map <leader>[ '[
map <leader>] ']

" {{{ fzf

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.fzf-history'

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
" }}}

" {{{ auto save/load session
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

"}}}

" {{{ tabbar-typescript
let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }
" }}}

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

set foldmethod=manual
set foldlevelstart=1
