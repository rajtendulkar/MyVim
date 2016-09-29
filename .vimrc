" Install pathogen
execute pathogen#infect()

set number						" Display Line Numbers
set autoindent					" Auto-indenting
set showmatch					" Highlight Matching brackets
set tabstop=4					" Default tabstop value
set shiftwidth=4
set smarttab					" Enable smart tab
set hlsearch					" highlight searched items
set ignorecase					" ignore case when searching
set smartcase 					" ignore case if search pattern is all lowercase, case-sensitive otherwise

filetype plugin on
filetype plugin indent on
set ic
autocmd filetype python set expandtab

set laststatus=2           " always show statusline
"set mouse=a " use mouse everywhere

" BUT do highlight as you type you search phrase
" set incsearch

" Set leader key
let mapleader = ","

""""""""""""""""""""""""""""""""""
" Colorscheme
""""""""""""""""""""""""""""""""""
syntax on
set t_Co=256
" colorscheme apprentice
" colorscheme deepsea
" colorscheme flattown
" colorscheme seoul256
" colorscheme bvemu
" colorscheme bubblegum-256-dark
" colorscheme Benokai
" colorscheme termschool
colorscheme seoul256
"set background=darkburn
""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""

" Remove the trailing white-spaces in the C-file
autocmd FileType c,cpp,h autocmd BufWritePre <buffer> %s/\s\+$//e

""""""""""""""""""""""""""""""""""
" General key maps
""""""""""""""""""""""""""""""""""
" F2 key to save file
map <F2> :w<CR>
" F3 key to save file and quit
map <F3> :wq<CR>
" F4 key to quit without saving file
map <F4> :q!<CR>


" in order to paste code from other sources into terminal
" When you have auto-indent on, pasting from X will result in crappy
" indenting. To avoid it use F5.
set pastetoggle=<F5>

" Toggle line numbers display.
map <F6> :set invnumber<CR>

" Toggle taglist window
map <F7> :TlistToggle<CR>

" Indent C code automatically
map <F10> <esc>gg=G

" Vertically split the Window
map <F11> :vsplit<CR>
" Horizontally split the Window
map <F12> :split<CR>

" map <F12> nddNp

" Unmap the tab-key in the taglist window.
:autocmd BufEnter __Tag_List__ silent! nunmap <buffer> <Tab>

" Move between split windows
map <TAB> 
:nmap <silent> <A-Up> :wincmd k<CR>
:nmap <silent> <A-Down> :wincmd j<CR>
:nmap <silent> <A-Left> :wincmd h<CR>
:nmap <silent> <A-Right> :wincmd l<CR>

" Reset the colorscheme in case if it is garbled up.
" :let &syntax = &syntax

"set formatoptions=rq " Automatically insert comment leader on return, and let gq format comments
nmap <silent> ,/ :nohlsearch<CR>
""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""
" Taglist configuration
""""""""""""""""""""""""""""""""""
"
" To automatically close the tags tree for inactive files.
" let Tlist_File_Fold_Auto_Close = 1

" Display only one file in taglist.
let Tlist_Show_One_File = 1

" Taglist window size
let Tlist_WinWidth = 30

" Open Taglist by default
let Tlist_Auto_Open = 1

" Close VIM when only taglist window is open
let Tlist_Exit_OnlyWindow = 1
""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""
" Wildmenu
""""""""""""""""""""""""""""""""""
if has("wildmenu")
	set wildignore+=*.a,*.o
	set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
	set wildignore+=.DS_Store,.git,.hg,.svn
	set wildignore+=*~,*.swp,*.tmp
	set wildmenu
	set wildmode=longest,list,full
endif
""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""
" Airline configuration
""""""""""""""""""""""""""""""""""
" let g:airline_theme='papercolor'
let g:airline_theme='wombat'
" let g:airline_theme='molokai'
" let g:airline_theme='base16'
" let g:airline_theme='base16_hopscotch'
" let g:airline_theme='base16_mocha'
" let g:airline_theme='base16_ocean'
" let g:airline_theme='base16_twilight'
" let g:airline_theme='bubblegum'
" let g:airline_theme='cool'
" let g:airline_theme='tomorrow'
" let g:airline_theme='raven'
" let g:airline_theme='serene'
" let g:airline_theme='powerlineish'

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif


" Add host name to the status line
" let hostname=system('hostname -s | tr -d "\n"')
" let g:airline_section_a = '%{hostname}'
""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""

" nnoremap <silent> <C-]> :<C-u>try<Bar>execute 'normal!' (v:count ? v:count : '') . "\<lt>C-]>"<Bar>catch /^Vim\%((\a\+)\)\=:E426:/<Bar>execute 'normal! gd'<Bar>endtry<CR>
" nnoremap <silent> <C-]> :<C-u>let pos = [bufnr('')] + getpos('.')<Bar>execute 'normal!' (v:count ? v:count : '') . "\<lt>C-]>"<CR>:if pos == [bufnr('')] + getpos('.')<Bar>execute 'normal! gd'<Bar>endif<CR>


""""""""""""""""""""""""""""""""""
" Doxygen toolkit configuration
""""""""""""""""""""""""""""""""""
let g:DoxygenToolkit_briefTag_pre="@brief "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@return   "
let g:DoxygenToolkit_authorName="Pranav Tendulkar<pranav.tendulkar@intel.com>"
""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""
" Ctrl-P
""""""""""""""""""""""""""""""""""
"Ignore files to be listed in Ctrl-P
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.ko,*.mod.c,cscope.out,tags
set wildignore+=*.o.cmd,Module.symvers,modules.order,*.ko.cmd,kwinject.out
set wildignore+=.kwlp,.kwps,.tmp_versions

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.git']

""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""
" Buffer Management
""""""""""""""""""""""""""""""""""
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" Save all the buffers
nmap <S-F2> :wa<CR>

" Save all the buffers and exit
nmap <S-F3> :wa<CR>

" Discard all the buffers and exit
nmap <S-F4> :qa!<CR>

" Move to the previous buffer
nmap <S-F5> :bprevious<CR>

" Move to the next buffer
nmap <S-F6> :bnext<CR>

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <S-F7> :enew<cr>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <S-F8> :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>
""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""

