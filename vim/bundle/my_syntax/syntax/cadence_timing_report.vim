" Vim syntax file
" file type: Cadence timing report files
" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
finish
endif
syn match header "^#.\+"
syn match  met "MET"
syn match  viol "VIOLATED"
syn match clock "\'.\+\'"
syn match  keywords "^\w.\+:"
syn match path_def "^Path \d\+:"
syn match time_sum1 "^[-+].\+" 
syn match time_sum2 "^=.\+\|^Other.\+" 
syn match slack_negative "^= Slack Time.\+-.\+"

"syn region timing_path start="Timing Path" end="\d\+.\+\n\s\++" fold transparent keepend 
"syn region timing_path start="+---" end="/|\s\+\n\s\++-\++" fold 

" Highlight colors for log levels.
hi header   ctermfg=Cyan ctermbg=Black
hi path_def cterm=underline ctermfg=Magenta ctermbg=Black
hi met      cterm=bold ctermfg=Green ctermbg=Black
hi viol     cterm=bold ctermfg=white ctermbg=red
hi clock    cterm=bold ctermfg=Yellow ctermbg=black
hi keywords ctermfg=Yellow ctermbg=black
hi time_sum1 cterm=underline ctermfg=Gray ctermbg=Black
hi time_sum2 cterm=underline 
hi slack_negative cterm=underline ctermfg=Red ctermbg=Black

let b:current_syntax = "timing_report"

" vim: ts=2 sw=2 
