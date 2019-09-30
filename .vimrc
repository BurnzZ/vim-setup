execute pathogen#infect()
filetype plugin indent on

"-------------------
" usual vim stuff
"-------------------

set backspace=indent,eol,start      " allows backspace
set nowrap							" prevents wrapping of texts
set timeoutlen=50                   " prevents delay when leaving insert mode
set laststatus=2                    " fix disappearance of vim-airline
set title                           " shows the filename in the window title bar
set showmode                        " shows the current mode
set number                          " show line numbers
set ts=4                            " set tabs to have 4 spaces
set autoindent                      " indent when moving to the next line while writing code
set expandtab                       " expand tabs into spaces
set shiftwidth=4                    " when using the >> or << commands, shift lines by 4 spaces
set cursorline                      " show a visual line under the cursor's current line 
"set cursorcolumn                    " show a vertical line to the cursor
set showmatch                       " show the matching part of the pair for [] {} and ()
set wildmenu                        " visual autocomplete for command menu
set wildmode=list:longest           " autcomplete until there's ambiguity
"set incsearch                       " search as chars are entered
set hlsearch                        " highlight matches
set splitright                      " splits open on the right
set ruler                           " always show the cursor position 
set showcmd                         " display incomplete commands
set ignorecase                      " turns off search case sensitivity
set noerrorbells                    " turnoff that annoying thing
set laststatus=2                    " always show status line
set encoding=utf-8                  " standardization and uniformity
set ttyfast                         " Optimize fast term connections. More Info: http://vimdoc.sourceforge.net/htmldoc/options.html#'ttyfast'
set nostartofline                   " prevent jumping to startofline when line jumping
"set iskeyword-=_                    " adds `underscore` to word delims
set autowrite                       " save the file when buffer is switched 

"-------------------
" Other vim configs
"-------------------

" Uses `js` highlighting for JSON files
autocmd BufNewFile,BufRead *.json set ft=javascript

"-------------------
" scheme, gui, etc
"-------------------

syntax on
set t_Co=256

colorscheme gruvbox
set background=dark
let g:theme_dark = 0

function ToggleTheme()
  if (g:theme_dark)
    set background=dark
    colorscheme molokai
    let g:theme_dark = 0
  else
    colorscheme solarized
    set background=light
    let g:theme_dark = 1
  endif
endfunc

"map <leader>w :call ToggleTheme()<CR>

"-------------------
" for plugins
"-------------------

" prevents pathogen from self sourcing,
" since it's in the bundle folder
let g:pathogen_disabled = ['pathogen'] 

" for vim-indent-guides
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#00005F ctermbg=17
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#5F005F ctermbg=53

" show those dotfiles
let NERDTreeShowHidden=1

" vim-airline fonts fixes
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

" show tabnumber in vim-airline
let g:airline#extensions#tabline#tab_nr_type=1

" for the vim-bookmarks
let g:bookmark_save_per_working_dir=1 " Save bookmarks per working dir, the folder you opened vim from
let g:bookmark_manage_per_buffer=1    " Save bookmarks when leaving a buffer, load when entering one
let g:bookmark_auto_save=1            " enable auto save

" for the vim-move prefix
let g:move_key_modifier='S'

" for the vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0 " allow remapping
let g:multi_cursor_next_key='<C-n>'      " default
let g:multi_cursor_prev_key='<C-S-p>'
let g:multi_cursor_skip_key='<C-x>'      " default
let g:multi_cursor_quit_key='<Esc>'      " default

" for highlighting stuff in Golang (via vim-go)
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_list_type = "quickfix"  " makes sure that opened errors are shown only in quickfix

" for ctrlp
let g:ctrlp_custom_ignore = {
    \ 'dir': 'node_modules$\|bower_components$\|build$\|env\\*\|env2.7\\*$',
    \ 'file': '\v\.(pyc)$',
\ }

" for vim-flake8
let g:flake8_show_in_gutter=1

" for python-sntax
let g:python_highlight_all=1

"-------------------
" Key Mappings and Remaps
"-------------------

let mapleader=" "
set timeout timeoutlen=1500

map <leader>t :TagbarToggle<CR>
map <leader>n :NERDTreeToggle<CR>
map <leader>m :LivedownToggle<CR>
map <leader>a :call XMLAlign()<CR>

" for vim-easymotion
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
nmap s <Plug>(easymotion-s)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" vim-fugitive
map <leader>gs :Gstatus<CR>
map <leader>gd :Gdiff<CR>
map <leader>gb :Gblame<CR>
map <leader>gl :Glog<CR>

" turn on column ruler
noremap <leader>c :set colorcolumn=80<CR>

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

" easier buffer switching
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Windows resizing using arrow keys
nnoremap <silent> <Left> :vertical resize +1<CR>
nnoremap <silent> <Right> :vertical resize -1<CR>
nnoremap <silent> <Up> :resize -1<CR>
nnoremap <silent> <Down> :resize +1<CR>

" prevents cursor/screen from jumping around when
" a word is highlighted using `*` command.
nnoremap * :keepjumps normal! mi*`i<CR>`

" for vim-flake8
autocmd FileType python map <buffer> <Leader>f :call Flake8()<CR>

function XMLAlign()
    let cursor = getpos('.')
    let l:winview = winsaveview()
    :w
    normal(ggVGd)
    :read !python ~/.vim/bundle/xml-aligner/xml-aligner.py %
    normal(ggdd)
    call setpos('.', cursor)
    call winrestview(l:winview)
endfunction
