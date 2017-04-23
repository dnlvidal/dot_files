execute pathogen#infect()
syntax  on
filetype plugin indent on

set path+=**

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set number
set relativenumber
set encoding=utf-8
hi CursorLine   cterm=NONE ctermbg=darkgray ctermfg=NONE guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkgray ctermfg=NONE guibg=darkred guifg=white
set cursorline
highlight LineNr term=bold cterm=NONE ctermfg=gray ctermbg=darkgray 
set background=dark
set textwidth=100
set ts=2
set shiftwidth=2 
set smarttab

set autoindent
au BufRead * set et|retab
au BufRead makefile set noet|retab!
au BufRead Makefile set noet|retab!

"set colorcolumn=80
set ruler

if filereadable(".vimrc.proj")
  source .vimrc.proj
endif

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

"
"nnoremap <Leader>c :set cursorcolumn!<CR>
"nnoremap <Leader>n :set number!<CR>
"nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>
"
"map <F11> :set spell! spelllang=en<CR>
"map <F12> :set spell! spelllang=pt<CR>
"
"set foldmethod=indent
"nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
"vnoremap <Space> zf
"
"set foldtext=MyFoldText()
"function! MyFoldText()
"   let line = getline(v:foldstart)
"   if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
"
"      else
"         let sub = line
"         let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
"         if startbrace == '{'
"            let line = getline(v:foldend)
"            let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
"         if endbrace == '}'
"            let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
"         endif
"      endif
"   endif
"   let n = v:foldend - v:foldstart + 1
"   let info = " " . n . " lines"
"   let sub = sub . "                                                                                                                  "
"   let num_w = getwinvar( 0, '&number' ) * getwinvar( 0, '&numberwidth' )
"   let fold_w = getwinvar( 0, '&foldcolumn' )
"   "let sub = strpart( sub, 0, winwidth(0) - strlen( info ) - num_w - fold_w - 1 )
"   "let sub = strpart( sub, 0,  strlen( info ) - num_w - fold_w - 1 )
"   "return sub . info
"   return info
"endfunction
"
"fu! CustomFoldText()
"   "get first non-blank line
"   let fs = v:foldstart
"   while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
"   endwhile
"   if fs > v:foldend
"     let line = getline(v:foldstart)
"   else
"       let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
"   endif
"
"   let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
"   let foldSize = 1 + v:foldend - v:foldstart
"   let foldSizeStr = " " . foldSize . " lines "
"   let foldLevelStr = repeat("+--", v:foldlevel)
"   let lineCount = line("$")
"   let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
"   let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
"   return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
"endf
"set foldtext=MyFoldText()
"
"highlight FoldColumn  ctermfg=darkyellow
"highlight Folded      ctermfg=darkgray  ctermbg=none
"
"let g:languagetool_jar='$HOME/LT/LanguageTool-2.6/languagetool-commandline.jar'
"
"

