" slimv options
let g:slimv_keybindings=1
let g:lisp_rainbow=1
let g:slimv_leader=',s'

" Gist options - put code in clipboard
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Use our user unless we have a sudo user, then is it
let luser = substitute(system('whoami'), '\n', '', '')
if strlen($SUDO_USER)
    let luser = $SUDO_USER
endif

" pathogen
call pathogen#infect()
"silent! call pathogen#runtime_append_all_bundles()
"silent! call pathogen#helptags()

" turn on indent-guides
autocmd VimEnter * IndentGuidesEnable
let g:indent_guides_guide_size=1

set number
set nocompatible

"set wildignore+=*CVS

" snipmate
filetype on
filetype plugin on
filetype indent on

" folding
"let perl_fold=1
"let perl_extended_vars = 1

set laststatus=2

" backspaces over everything in insert mode
set backspace=indent,eol,start

" Indent
set autoindent
set tabstop=2
set shiftwidth=2
set smartindent
set expandtab
syntax on

set textwidth=79
set formatoptions=qrn1
"if version >= 703
if exists('+colorcolumn')
  set colorcolumn=80
endif

" folding
set foldmethod=indent

" mojo
let mojo_highlight_data = 1

" Sidebar folder navigation
let NERDTreeShowLineNumbers=1
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
let NERDTreeWinSize=35
"let NERDTreeIgnore=['CVS']

set incsearch
set ignorecase
set smartcase
set visualbell
set noerrorbells
set hlsearch
set history=500

" scrolling
"set ruler
set scrolloff=10 " Scroll with 10 line buffer

" clear recent search highlighting with space
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>


" save files as root without prior sudo
cmap w!! w !sudo tee % >/dev/null

set nobackup
set noswapfile

" git branch
set statusline=%f\ " tail of the filename
"set statusline=
set statusline+=%{fugitive#statusline()}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ "current highlight
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P\    "percent through file
set laststatus=2        " Always show status line

" warning for mixed indenting
set statusline+=%#error#
set statusline+=%{StatuslineMixedIndentingWarning()}
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype
set statusline+=%r      "read only flag
set statusline+=%m      "modified flag

"set list
"set listchars=tab:.\ ,trail:.,extends:#,nbsp:.

" font
if has("gui_gnome")
  set guifont=Monospace\ 8
  set list
  set listchars=tab:▸\ ,eol:¬,extends:#,nbsp:.,trail:.

elseif has("gui_macvim")
  "set guifont=Menlo:h12
  set guifont=Monaco:h12
  set list
  set listchars=tab:▸\ ,eol:¬,extends:#,nbsp:.,trail:.
endif

if &t_Co >= 256 || has("gui_running")
  set guifont=Monaco:h12
  colorscheme tempire
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

" turn off cursor blinking
set guicursor+=a:blinkon0

function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

" shortcuts
inoremap jj <Esc>

nnoremap ; :

let mapleader = ','
nnoremap <Leader>a :Ack
noremap <Leader>, :NERDTreeToggle<cr>
map <Leader>t :tabnew<cr>
map <Leader>h :tabprevious<cr>
map <Leader>l :tabnext<cr>
map <Leader>w :tabclose<cr>
map <Leader>pd :!perldoc %<cr>
map <Leader>cs :colorscheme sri<cr>
map <Leader>f :TlistToggle<cr>
map <Leader>M :!morbo %<cr>
map <Leader>x :!perl -Ilib %<cr>
map <leader>H :call HexHighlight()<cr>
map <leader>tts :%s/\s\+$//<cr>
map <leader>term :ConqueTerm bash<cr>
map <leader>b :TagbarToggle<cr>
map <leader>sp :setlocal spell! spelllang=en_us<CR> " toggle spellcheck
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

" http://vim.wikia.com/wiki/Redirect_g_search_output
nmap <leader>s :redir @a<cr>:g//<cr>:redir END<cr>:new<cr>:put! a<cr><cr>zRggd<cr>

" Move single lines up-down
nmap <c-up> ddkP
nmap <c-down> ddp
"nmap <c-up [e
"nmap <c-down> ]e

" Resize vertical windows
nmap + <c-w>+
nmap _ <c-w>-

" Resize horizontal windows
nmap > <c-w>>
nmap < <c-w><

" Move multiple lines up-down
vmap <c-up> xkP`[V`]
vmap <c-down> xp`[V`]
"vmap <c-up> [egv
"vmap <c-down> ]egv

"Insert on empty line, with lines above and below (for mojocasts)
nmap oo o<Esc>O

" autocompletion
imap <Leader><Tab> <C-X><C-O>

" Autocomplpop perl autocompletion
"let g:acp_behaviorPerlOmniLength = 4
"let g:acp_completeoptPreview = 0

" local set in perlomni.vim plugin does not work as expected..set globally
"set omnifunc=PerlComplete

" perldoc for module || perl command
noremap K :!perldoc <cword> <bar><bar> perldoc -f <cword><cr>
" Opens nerdtree and puts focus in edited file
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

" file types
au BufRead,BufNewFile *.asd,*.lisp set filetype=lisp
au BufRead,BufNewFile *.t,*.cgi set filetype=perl
au BufRead,BufNewFile *.conf set filetype=apache
au BufRead,BufNewFile *.app set filetype=erlang

" haskell support (vim2hs)
let g:haskell_conceal_wide = 1
let g:neocomplcache_enable_at_startup = 1
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"au FileType haskell nmap <Leader>gt :GhcModType<cr>
"au FileType haskell nmap <Leader>gc :GhcModTypeClear<cr>
au FileType haskell nmap gt :GhcModType<cr>
au FileType haskell nmap gc :GhcModTypeClear<cr>
"autocmd BufWritePost *.hs call s:check_and_lint()
"autocmd BufWritePost *.hs GhcModCheckAsync
"let &l:statusline = '%{empty(getqflist()) ? "[No Errors]" : "[Errors Found]"}' . (empty(&l:statusline) ? &statusline : &l:statusline)

" markdown support - turn-on distraction free writing mode for markdown files
au BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} call DistractionFreeWriting()
au BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown

" compile erlang files
autocmd BufRead,BufNewFile *.erl nmap <Leader>C :!erlc %<cr>

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

" markdown
"augroup mkd
"autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
"augroup END

" open installed perl modules
au FileType perl command! -nargs=1 PerlModuleSource :tabnew `perldoc -lm <args>`
au FileType perl setlocal iskeyword+=:
au FileType perl noremap <leader>P :PerlModuleSource <cword><cr>zR<cr>

" perltidy
au FileType perl command! -range=% -nargs=* Tidy <line1>,<line2>!perltidy
au FileType perl nmap <Leader>pt mz:Tidy<cr>'z:delmarks z<cr> " normal mode
au FileType perl vmap <Leader>pt :Tidy<cr> " visual mode

" js, css, & html tidy config (vim-jsbeautify)
let g:jsbeautify = {'indent_size': 2, 'indent_char': ' ', 'max_char': 5}
let g:htmlbeautify = {'indent_size': 2, 'indent_char': ' ', 'max_char': 80, 'brace_style': 'expand', 'unformatted': ['a', 'sub', 'sup', 'b', 'i', 'u']}
let g:csseautify = {'indent_size': 2, 'indent_char': ' ', 'max_char': 80, 'brace_style': 'expand'}

" js
"au FileType javascript command! -range=% -nargs=* Tidy <line1>,<line2> :call JsBeautify()
"au FileType javascript nmap <Leader>pt mz:Tidy<cr>'z:delmarks z<cr> " normal mode
"au FileType javascript vmap <Leader>pt :Tidy<cr> " visual mode
au FileType javascript noremap <buffer> <leader>pt :call JsBeautify()<cr>
"au FileType html noremap <buffer> <leader>pt :call HtmlBeautify()<cr>
"au FileType css noremap <buffer> <leader>pt :call CSSBeautify()<cr>

" csstidy
"au FileType css command! -range=% -nargs=* Tidy <line1>,<line2>!csstidy
"au FileType css nmap <Leader>pt mz:Tidy<cr>'z:delmarks z<cr> " normal mode
"au FileType css vmap <Leader>pt :Tidy<cr> " visual mode

" json tidy
"au FileType json set filetype=javascript foldmethod=syntax
"au FileType json command! -range=% -nargs=* Tidy <line1>,<line2>!json_xs -f json -t json-pretty
"au FileType json nmap <Leader>pt :Tidy<cr> " normal mode
"au FileType json vmap <Leader>pt :Tidy<cr> " visual mode

" xmlfolding
"au BufNewFile,BufRead *.xml,*.htm,*.html so bundle/plugin/XMLFolding.vim

" ack shortcut
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Show syntax highlighting groups for word under cursor
"nmap <C-S-P> :call <SID>SynStack()<CR>
"function! <SID>SynStack()
  "if !exists("*synstack")
    "return
  "endif
  "echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
"endfunc

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" Automatic tabularize with pipes |
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

function! StatuslineMixedIndentingWarning()
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

" return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

function! ScreencastPrep()
  " disable blinking cursor
  set guicursor+=n:hor10-blinkon0 
  " disable autocomplete
  AcpDisable
  " disable colorcolumn
  set colorcolumn=0
  "set guifont=Menlo:h14
  set guifont=Monaco:h14
  set ts=2
  set sw=2
  NoMatchParen "opposite: DoMatchParen
endfunction

function! ScreencastPrep1080()
  " disable blinking cursor
  set guicursor+=n:hor10-blinkon0 
  " disable autocomplete
  AcpDisable
  " disable colorcolumn
  set colorcolumn=0
  "set guifont=Menlo:h20
  "set guifont=Monaco:h26
  set guifont=Consolas:h29
  set ts=2
  set sw=2
  NoMatchParen "opposite: DoMatchParen
endfunction

function! s:check_and_lint()
  let l:qflist = ghcmod#make('check')
  call extend(l:qflist, ghcmod#make('lint'))
  call setqflist(l:qflist)
  cwindow
  if empty(l:qflist)
    echo "No errors found"
  endif
endfunction

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
"command! PrettyXML call DoPrettyXML()


function DistractionFreeWriting()
    colorscheme iawriter
    set background=light
    set gfn=Cousine:h14                " font to use
    set lines=40 columns=120           " size of the editable area
    set listchars=tab:▸\ ,extends:#,nbsp:.,trail:.
    set guioptions-=r                  " remove right scrollbar
    set laststatus=0                   " don't show status line
    set noruler                        " don't show ruler
    set linebreak                      " break the lines on words
    set nocursorline
    set nocursorcolumn
    set nonumber
    set cc=

    if has("gui_macvim")
      set fuoptions=background:#00f5f6f6 " macvim specific setting for editor's background color 
      set fullscreen                     " go to fullscreen editing mode
    endif
endfunction
