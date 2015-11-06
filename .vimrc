execute pathogen#infect()
filetype plugin indent on
syntax on

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
set incsearch                       " search as chars are entered
set hlsearch                        " highlight matches
set splitright                      " splits open on the right
set ruler                           " always show the cursor position 
set showcmd                         " display incomplete commands
set ignorecase                      " turns off search case sensitivity
set noerrorbells                    " turnoff that annoying thing
set laststatus=2                    " always show status line
set encoding=utf-8                  " standardization and uniformity
set ttyfast                         " Optimize fast term connections. More Info: http://vimdoc.sourceforge.net/htmldoc/options.html#'ttyfast'

"-------------------
" scheme, gui, etc
"-------------------

colorscheme molokai                 " yeah yeah, I know. old habits die hard
set background=dark

if &term == "screen"
    set t_Co=256
endif

"-------------------
" for plugins
"-------------------

" prevents pathogen from self sourcing,
" since it's in the bundle folder
let g:pathogen_disabled = ['pathogen'] 

" for vim-notes
let g:notes_directories = ['~/notes/vim-notes']
let g:notes_suffix = '.txt'

" for vim-indent-guides
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#00005F ctermbg=17
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#5F005F ctermbg=53

" show those dotfiles
let NERDTreeShowHidden=1

" vim-airline fonts fixes
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled=1

" show tabnumber in vim-airline
let g:airline#extensions#tabline#tab_nr_type = 1

" for the vim-bookmarks
let g:bookmark_save_per_working_dir=1 " Save bookmarks per working dir, the folder you opened vim from
let g:bookmark_manage_per_buffer=1    " Save bookmarks when leaving a buffer, load when entering one
let g:bookmark_auto_save=1            " enable auto save

" for the vim-move prefix
let g:move_key_modifier = 'S'

"-------------------
" Key Mappings and Remaps
"-------------------

let mapleader=" "
set timeout timeoutlen=1500

map <leader>t :NERDTreeToggle<CR>

noremap <C-v><F3> :CSVTable<CR>
noremap <C-v><F4> :CSVTabularize<CR>

" for vim-easymotion
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
nmap s <Plug>(easymotion-s)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

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

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

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

map <leader>a :call XMLAlign()<CR>
