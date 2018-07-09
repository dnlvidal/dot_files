execute pathogen#infect()

set path+=**

set tags+=~/tags/$project,

" ------------------------------------
"   Plugins Settings
" ------------------------------------
"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extensions#branch#use_vcscommand = 1

" load FZF plugin
set rtp+=~/.fzf

"indent-guides
let g:indent_guides_guide_size  = 1
let g:indent_guides_start_level = 2
let g:indent_guides_color_change_percent  = 3
"let g:indent_guides_enable_on_vim_startup = 1

"Schelepp (Visual drag)
"vmap <unique> <up>    <Plug>SchleppUp
"vmap <unique> <down>  <Plug>SchleppDown
"vmap <unique> <left>  <Plug>SchleppLeft
"vmap <unique> <right> <Plug>SchleppRight
"vmap <unique> K       <Plug>SchleppUp
"vmap <unique> J       <Plug>SchleppDown
"vmap <unique> H       <Plug>SchleppLeft
"vmap <unique> L       <Plug>SchleppRight
"vmap <unique> i <Plug>SchleppToggleReindent
"vmap <unique> Dk <Plug>SchleppDupUp
"vmap <unique> Dj <Plug>SchleppDupDown
"vmap <unique> Dh <Plug>SchleppDupLeft
"vmap <unique> Dl <Plug>SchleppDupRight
"
let g:verilog_syntax_fold_lst = "class,function,task"
"let g:verilog_efm_uvm_lst = "fatal,error,warning"
set foldmethod=syntax

" ------------------------------------
"  Layout/Display/Editing
" ------------------------------------
set number
"set relativenumber
set encoding=utf-8
set cursorline
set textwidth=100
set scrolloff=5
set showmatch

"set t_Co=256
"let g:solarized_termcolors=256
"let g:gruvbox_contrast_light='hard'
let g:solarized_contrast="high"
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
colorscheme solarized
set background=light

" Indentation/TAB
set tabstop=2
set shiftwidth=2
set softtabstop=2
set textwidth=100
set smarttab
set autoindent

" Expand tab to space by default
au BufRead * set et

" TAB expansion exceptions
au BufRead makefile   set noet
au BufRead Makefile   set noet
au BufRead makefile.* set noet
au BufRead Makefile.* set noet

"--- special/invisible characters settings

set list
"set list listchars=tab:▶‒,nbsp:∙,trail:∙,extends:▶,precedes:◀
set list listchars=tab:▶▶,nbsp:∙,trail:∙,extends:▶,precedes:◀
let &showbreak = '↳'
"set list listchars=tab:>-,nbsp:.,trail:.,extends:>,precedes:<
"let &showbreak = '^'

"--- Command autocompletion (TAB)
set wildmode=longest,list,full

"--- Visual square selection
set virtualedit=block,onemore

" ------------------------------------
"  Syntax/Completion
" ------------------------------------
syntax  on
filetype plugin indent on

" ------------------------------------
"  Build options and error parsing
" ------------------------------------

"set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter
"Cadence error format
set errorformat+=%.%#:\ *%t\\,%.%#\ %#\(%f\\,%l\|%c\):\ %m
set errorformat+=%.%#:\ *%t\\,%.%#\ %#\(%f\\,%l\):\ %m
"" Multi-line error messages
"set errorformat+=%A%.%#\ *%t\\,%.%#:\ %m,%ZFile:\ %f\\,\ line\ =\ %l\\,\ pos\ =\ %c
"" Ignore Warning level formats
"if (!exists("g:verilog_efm_level") || g:verilog_efm_level == "error")
"  set errorformat^=%-G%.%#\ *W\\,%.%#:\ %m
"endif

" ------------------------------------
"  Buffers
" ------------------------------------
set bufhidden=hide
set hidden

" ------------------------------------
"  Key binding
" ------------------------------------
"
"nnoremap <Leader>c :set cursorcolumn!<CR>
"nnoremap <Leader>n :set number!<CR>
"
"map <F11> :set spell! spelllang=en<CR>
"map <F12> :set spell! spelllang=pt<CR>
"
" source: http://vim.wikia.com/wiki/VimTip102
" Let <Tab> do all the autocompletion
function! Smart_TabComplete()
  let line = getline('.')           " curline
  let substr = strpart(line, -1, col('.'))  " from start to cursor
  let substr = matchstr(substr, "[^ \t]*$") " word till cursor
  if (strlen(substr)==0)            " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1  " position of period, if any
  let has_slash = match(substr, '\/') != -1 " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"         " file matching
  else
    return "\<C-X>\<C-O>"         " plugin matching
  endif
endfunction
"inoremap <tab> <c-r>=Smart_TabComplete()<CR>

"F2: Comment selected Block with #'s
map <F2> :s/^\(.*\)$/#\1/g<CR>

" F3: Uncomment selected Block thats commented with #'s
map <F3> :s/^#//g<CR>

" F4: Buffer list
map <silent> <F4> :BufExplorer<CR>

" F5: Tag list
imap <silent> <F5> :Tlist<CR>
map <silent> <F5> :Tlist<CR>

" F6: File list
map <silent> <F6> :NERDTreeToggle<CR>

" F12: SVN diff 
map <silent> <F12> :VCSVimDiff<CR>

function! Shift_regs()
  let @1=@2
  let @2=@3
  let @3=@4
  let @4=@5
  let @5=@6
  let @6=@7
  let @7=@8
  let @8=@9
  let @9="empty"
endfunction

function! Disp_regs()
  reg 1 2 3 4 5 6 7 8 9
endfunction

nmap <Leader>p "1p :call Shift_regs()<CR> :call Disp_regs() <CR>

