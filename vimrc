" pathogen
silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()

set number
set nocompatible

set wildignore+=*CVS

" snipmate
filetype on
filetype plugin on
filetype indent on

set laststatus=2 

" backspaces over everything in insert mode
set backspace=indent,eol,start

" Indent
set autoindent
set tabstop=4 "set tab character to 3 characters"
set shiftwidth=4 "indent width for autoindent"
set smartindent
set expandtab
syntax on

set textwidth=79
set formatoptions=qrn1
if version >= 703
	set colorcolumn=80
endif

" folding
set foldmethod=indent

" Sidebar folder navigation
let NERDTreeShowLineNumbers=1
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
let NERDTreeWinSize=41
let NERDTreeIgnore=['CVS']

let mojo_highlight_data = 1

set incsearch
set ignorecase
set smartcase
set visualbell
set noerrorbells
set hlsearch

" clear recent search highlighting with space
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>


" save files as root without prior sudo
cmap w!! w !sudo tee % >/dev/null

set nobackup
set noswapfile

" git branch
set statusline=%f " tail of the filename

set statusline+=%{fugitive#statusline()}

set statusline+=%=      "left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2        " Always show status line

" warning for mixed indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype
set statusline+=%r      "read only flag
set statusline+=%m      "modified flag

set list
set listchars=tab:.\ ,trail:.,extends:#,nbsp:.

" font
if has("gui_gnome")
	set guifont=Monospace\ 8
	set list
	set listchars=tab:▸\ ,eol:¬,extends:#,nbsp:.,trail:.

elseif has("gui_macvim")
	set guifont=Menlo\ bold:h11
	"set guifont=Menlo:h11
	set list
	set listchars=tab:▸\ ,eol:¬,extends:#,nbsp:.,trail:.
endif

if &t_Co >= 256 || has("gui_running")
	colorscheme sri
	set guioptions-=r
	set go-=L
	set go-=T
else
	colorscheme ir_black
endif

" line tracking
set numberwidth=5
set cursorline
set cursorcolumn

" shortcuts
inoremap jj <Esc>

nnoremap ; :

let mapleader = ","
nnoremap <Leader>a :Ack 
map <Leader>, :NERDTreeToggle<cr>
map <Leader>t :tabnew<cr>
map <Leader>h :tabprevious<cr>
map <Leader>l :tabnext<cr>
map <Leader>w :tabclose<cr>
map <Leader>pd :!perldoc %<cr>
map <Leader>cs :colorscheme sri<cr>
map <Leader>f :TlistToggle<cr>
map <Leader>M :!perl % daemon --reload<cr>
map <Leader>x :!perl -Ilib %<cr>
map <leader><space> :CommandT<cr>
map <leader>H :call HexHighlight()<cr>
"
" cd to directory of current file
map <leader>cd :cd %:p:h<cr>
map <leader>F :NERDTreeFind<cr>
map <leader>R :source ~/.vimrc<cr>

map <leader>pull :silent !sandbox pull %<cr>
map <leader>push :silent !sandbox push %<cr>
map <leader>same :!sandbox same %<cr>
map <leader>rt :!sandbox rtest %<cr>
map <leader>diff :!sandbox diff %<cr>
nnoremap <F5> :GundoToggle<cr>


" Move single lines up-down
"nmap <c-up> ddkP
"nmap <c-down> ddp
nmap <c-up [e
nmap <c-down> ]e

" Move multiple lines up-down
"vmap <c-up> xkP`[V`]
"vmap <c-down> xp`[V`]
vmap <c-up> [egv
vmap <c-down> ]egv

" autocompletion
imap <Leader><Tab> <C-X><C-O>

" perldoc for module || perl command
noremap K :!perldoc <cword> <bar><bar> perldoc -f <cword><cr>
" Opens nerdtree and puts focus in edited file
autocmd VimEnter * exe 'NERDTree' | wincmd l | exe 'NERDTreeToggle'

" file types
au BufRead,BufNewFile *.t,*.cgi set filetype=perl
au BufRead,BufNewFile *.conf set filetype=apache

" save/retrieve folds automatically
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" ,T perl tests
"nmap <Leader>T :let g:testfile = expand("%")<cr>:echo "testfile is now" g:testfile<cr>:call Prove (1,1)<cr>
function! Prove ( verbose, taint )
    if ! exists("g:testfile")
        let g:testfile = "t/*.t"
    endif
    if g:testfile == "t/*.t" || g:testfile =~ "\.t$"
        let s:params = "lrc"
        if a:verbose
            let s:params = s:params . "v"
        endif
"        if a:taint
"            let s:params = s:params . "t"
"        endif
        "execute !HARNESS_PERL_SWITCHES=-MDevel::Cover prove -" . s:params . " " . g:testfile
        execute "!prove --timer --normalize --state=save -" . s:params . " " . g:testfile
		  "TEST_VERBOSE=1 prove -lvc --timer --normalize --state=save
    else
       call Compile ()
    endif
endfunction

function! Compile ()
    if ! exists("g:compilefile")
        let g:compilefile = expand("%")
    endif
    execute "!perl -wc -Ilib " . g:compilefile
endfunction

autocmd BufRead,BufNewFile *.t,*.pl,*.plx,*.pm nmap <Leader>te :let g:testfile = expand("%")<cr>:echo "testfile is now" g:testfile<cr>:call Prove (1,1)<cr>

" perltidy
autocmd BufRead,BufNewFile *.t,*.pl,*.plx,*.pm command! -range=% -nargs=* Tidy <line1>,<line2>!perltidy -q
autocmd BufRead,BufNewFile *.t,*.pl,*.plx,*.pm noremap <Leader>pt :Tidy<CR>

" n perltidy
autocmd BufRead,BufNewFile *.t,*.pl,*.plx,*.pm command! -range=% -nargs=* NTidy <line1>,<line2>!perltidy -pro=/Users/glen/Projects/n/.perltidyrc -q
autocmd BufRead,BufNewFile *.t,*.pl,*.plx,*.pm noremap <Leader>ptn :NTidy<CR>

" python does not like tabs
" tabs are dead everywhere now..autocmd filetype python set expandtab

" xmlfolding
au BufNewFile,BufRead *.xml,*.htm,*.html so bundle/plugin/XMLFolding.vim

" ack shortcut
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" who put this in?
au! Syntax newlang source $VIM/syntax/nt.vim

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

source ~/.vim/plugins/hexHighlight.vim

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" Automagic tabularize
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ ', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction

"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction
