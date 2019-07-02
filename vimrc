call plug#begin()
Plug '/usr/local/fzf'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/ap/vim-buftabline.git'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/scrooloose/nerdcommenter.git'
Plug 'https://github.com/itchyny/vim-gitbranch.git'
Plug 'terryma/vim-multiple-cursors'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()
set rtp+=/usr/local/fzf
set number

set laststatus=2
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
set noeol
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set smarttab
set smartcase

set nofixendofline

"au VimEnter *  NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
:function MirrorNerdTreeIfOneWindow()
  if winnr("$") < 2
    NERDTreeMirror

    " hack to move the focus from the NERDTree to the main window
    wincmd p
    wincmd l
  endif
endfunction

"highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$/
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! Tws call TrimWhitespace()
function TrimSpaces() range
let oldhlsearch=ShowSpaces(1)
execute a:firstline.",".a:lastline."substitute ///gec"
let &hlsearch=oldhlsearch
endfunction

nnoremap gt :bnext<CR>
nnoremap gT :bprev<CR>
nnoremap NM :NERDTreeToggle<CR>
nnoremap NN :NERDTree %<CR>
cnoremap !py3 !python3 %:p<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <Leader>ga :Git add %:p<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit -v -q<CR>
nnoremap <Leader>gt :Gcommit -v -q %:p<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR><CR>
nnoremap <Leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <Leader>gg :Ggrep<Space>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gB :Git branch<Space>
nnoremap <Leader>go :Git checkout<Space>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gP :Gpull<CR>
nnoremap <Leader>gh :Gbrowse<CR>
nnoremap <S-F12>   m`:TrimSpaces<CR>``
vnoremap <S-F12>   :TrimSpaces<CR>

command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()

let NERDTreeWinSize=31
map ; :Files /home/mujin/<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
set hidden

set foldmethod=indent
set foldlevel=99
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set hlsearch
hi Search guibg=LightBlue

" Show git branch on statusline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
set clipboard=unnamedplus
set listchars=eol:$,tab:>=,trail:.
set list