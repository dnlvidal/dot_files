execute pathogen#infect()
set path+=**

" ------------------------------------
"   Plugins
" ------------------------------------
"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ------------------------------------
"  Layout/Display
" ------------------------------------
set number
set relativenumber
set encoding=utf-8
set cursorline

set t_Co=256
let g:solarized_termcolors=256
let g:gruvbox_contrast_light='hard'
colorscheme solarized
set background=light

"-- Editing
set textwidth=100
set ts=2
set shiftwidth=2 
set smarttab
set showmatch
set scrolloff=5

set autoindent
au BufRead * set et|retab
au BufRead makefile set noet|retab!
au BufRead Makefile set noet|retab!


if filereadable(".vimrc.proj")
  source .vimrc.proj
endif


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
" Multi-line error messages
set errorformat+=%A%.%#\ *%t\\,%.%#:\ %m,%ZFile:\ %f\\,\ line\ =\ %l\\,\ pos\ =\ %c
" Ignore Warning level formats
if (!exists("g:verilog_efm_level") || g:verilog_efm_level == "error")
  set errorformat^=%-G%.%#\ *W\\,%.%#:\ %m
endif

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
inoremap <tab> <c-r>=Smart_TabComplete()<CR>


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

