call plug#begin('~/.config/nvim/') " Use release branch (recommend)
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
"Plug 'deoplete-plugins/deoplete-jedi'
Plug 'neoclide/coc.nvim', {'branch' : 'release'}
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/ap/vim-buftabline.git'
Plug 'jupyter-vim/jupyter-vim'
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'https://github.com/vim-scripts/a.vim.git'
Plug 'lervag/vimtex'
Plug 'https://github.com/vim-scripts/Rename2'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'https://github.com/tell-k/vim-autopep8'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'vim-airline/vim-airline'
Plug 'https://github.com/mbbill/undotree', { 'branch': 'master' }
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'https://github.com/octol/vim-cpp-enhanced-highlight.git'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/tenfyzhong/vim-gencode-cpp.git'
Plug 'https://github.com/aserebryakov/vim-todo-lists.git'
call plug#end()

let g:python3_host_prog = '/usr/local/bin/python3'
let g:neotex_enabled = 2
set directory=$HOME/.vim/swapfiles
let mapleader = ","
" Make folding appear expanded on file opening
au BufRead * normal zR
" Add gdb integration
packadd termdebug
" Basic settings
set foldmethod=syntax
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set smarttab
set smartcase
" Set permanent undo
set undofile
set nofixendofline
"set relativenumber
set number
set laststatus=2
set clipboard=unnamedplus
set listchars=eol:$,tab:>=,trail:.
set list
set background=dark
set cursorline
set hidden
" make insertion of bracets to auto add closing bracets
"inoremap { {<CR>}<Esc>ko
"
" make TAB and SHIFT + TAB to navigate between buffers in normal mode
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" set current line color
highlight CursorLine ctermbg=Black

hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <Leader>f :<C-u>ClangFormat<CR>
nnoremap <Leader>h :A<CR>

" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_posix_standard = 1
" clang-format
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ 'DerivePointerAlignment': "false",
            \ 'PointerAlignment': "Left",
            \ "BreakBeforeBraces" : "Stroustrup",
            \ "ColumnLimit" : 120}

let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_c_checkers = ['cpplint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'
" The following two lines are optional. Configure it to your liking!
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Startify settings
let g:startify_enable_special         = 0
let g:startify_enable_unsafe          = 1
let g:startify_files_number           = 15
let g:startify_relative_path          = 1
let g:startify_change_to_dir          = 1
let g:startify_change_to_vcs_root     = 1
let g:startify_session_persistence    = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_session_savevars = ['&makeprg']
let g:startify_bookmarks = [ '~/.config/nvim/init.vim' ]
let g:startify_list_order = [
      \ ['  Bookmarks:'],
      \ 'bookmarks',
      \ ['  Sessions:'],
      \ 'sessions',
      \ ['  Recent files:'],
      \ 'files',
      \ ]
let g:startify_custom_indices =
      \ map(range(0,9), 'string(v:val)') +
      \ map(range(char2nr('A'),char2nr('Z')), 'nr2char(v:val)')
let g:startify_custom_header =
      \ map(split(system('figlet Welcome'), '\n'), '"   ". v:val') + ['','']
function! s:sy_add_bookmark(bookmark)
    if !exists('g:startify_bookmarks')
        let g:startify_bookmarks = []
    endif
    let g:startify_bookmarks += [ a:bookmark ]
endfunction

command! -nargs=1 StartifyAddBookmark call <sid>sy_add_bookmark(<q-args>)

" NERDTree settings
let g:NERDTreeWinSize = 60
let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.moc$']
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
set noeol

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

nnoremap <Leader>rf :Rename <C-R>=expand("%")<CR>
nnoremap <Leader>j :JupyterConnect<CR>
nnoremap <Leader>c :JupyterSendCell<CR>
nnoremap <Leader>r :JupyterRunFile<CR>
nnoremap <Leader>df :GenDefinition<CR>
nnoremap <Leader>dc :GenDeclaration<CR>
nnoremap <Leader>b :Break<CR>
nnoremap <Leader>s :Step<CR>
nnoremap <Leader>o :Over<CR>
nnoremap <Leader>fi :CocFix<CR>
nnoremap <Leader>u :UndotreeToggle<CR>
nnoremap gt :bnext<CR>
nnoremap gT :bprev<CR>
nnoremap <Leader>e :CocDiagnostics<CR>
nnoremap NM :NERDTreeToggle<CR>
nnoremap <Leader>tw :Tws<CR>
nnoremap <Leader>S :Startify <CR>
nnoremap <Leader>ga :Git add %:p<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit -v -q<CR>
nnoremap <Leader>gt :Gcommit -v -q %:p<CR>
nmap <leader>rn <Plug>(coc-rename)
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR><CR>
nnoremap <Leader>gl :silent! Glog -- %<CR>:bot copen<CR>
nnoremap <Leader>gg :Ggrep<Space>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gB :Git branch<Space>
nnoremap <Leader>go :Git checkout<Space>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gP :Gpull<CR>
nnoremap <Leader>gh :Gbrowse<CR>
