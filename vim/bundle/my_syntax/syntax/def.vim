" Vim syntax file
" file type: log files
" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
finish
endif
syn keyword key1 VERSION NAMESCASESENSITIVE  DIVIDERCHAR  BUSBITCHARS  DESIGN iris  UNITS DISTANCE MICRONS 
syn keyword key1 PROPERTYDEFINITIONS END DIEAREA ROW  STEP GCELLGRID TRACKS VIAS RECT  
syn keyword key2 FS S N FN
syn keyword key1 NETS USE ROUTED WEIGHT CLOCK LAYER
syn match coord "(.\+\d\+\s\+\d\+.\+)"
syn match special "[-+;]\D"
syn match comment "#.*"

" Highlight colors for log levels.
hi error ctermfg=Red ctermbg=Black
hi warn ctermfg=Yellow ctermbg=Black
hi comment ctermfg=Cyan
hi special ctermfg=Red ctermbg=Black
hi key1 ctermfg=yellow ctermbg=Black
hi key2 ctermfg=green
hi coord ctermfg=magenta ctermbg=Black

let b:current_syntax = "def"

" vim: ts=2 sw=2 
