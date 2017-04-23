if version < 600
   syntax clear
elseif exists("b:current_syntax")
   finish
endif

" Set the local value of the 'iskeyword' option
if version >= 600
   setlocal iskeyword=@,48-57,_,192-255
else
   set iskeyword=@,48-57,_,192-255
endif

" Annex B.1 'All keywords'
syn keyword libertyStatement library cell pin 
syn keyword libertyStatement pg_pin internal_power rise_power fall_power leakage_power
syn keyword libertyStatement timing cell_rise cell_fall rise_transition fall_transition
syn keyword libertyStatement wire_load 
"syn keyword libertyStatement 
"syn keyword libertyStatement 
"syn keyword libertyStatement 
"syn keyword libertyStatement 
syn keyword libertyType      "variable_\d*"  
syn keyword libertyType      related_pin when timing_sense sdf_cond 
syn keyword libertyType      cell_footprint voltage_name pg_type  
syn keyword libertyType      area direction related_power_pin related_ground_pin 
syn keyword libertyType      resistance capacitance slope fanout_length 
syn keyword libertyType      function  equal_or_opposite_output 
syn keyword libertyType     values index_1 index_2 index_3 
" syn keyword libertyType      
" syn keyword libertyType      
" syn keyword libertyType      
" syn keyword libertyType      
syn keyword libertyRepeat    forever repeat while for
syn keyword libertyLabel     begin end
syn keyword libertyConditional if else case casex casez default endcase
syn match   libertyConstant  "-inf"lc=1

syn match   libertyOperator  "[&|~><!)(*#%@+/=?:;}{,.\^\-\[\]]"
"syn match   libertyOperator  "<+"
"syn match   libertyStatement "[vV]("me=e-1
"syn match   libertyStatement "[iI]("me=e-1

syn region  libertyComment start="/\*" end="\*/" contains=libertyTodo
syn match   libertyComment "//.*" contains=libertyTodo

syn match libertyGlobal "`celldefine"
syn match libertyGlobal "`default_nettype"
syn match libertyGlobal "`define"
syn match libertyGlobal "`else"
syn match libertyGlobal "`elsif"
syn match libertyGlobal "`endcelldefine"
syn match libertySystask "$[a-zA-Z0-9_]\+\>"

syn match libertyConstant "\<[A-Z][A-Z0-9_]\+\>"

syn match   libertyNumber "\(\<\d\+\|\)'[bB]\s*[0-1_xXzZ?]\+\>"
syn match   libertyNumber "\(\<\d\+\|\)'[oO]\s*[0-7_xXzZ?]\+\>"
syn match   libertyNumber "\(\<\d\+\|\)'[dD]\s*[0-9_xXzZ?]\+\>"
syn match   libertyNumber "\(\<\d\+\|\)'[hH]\s*[0-9a-fA-F_xXzZ?]\+\>"
syn match   libertyNumber "\<[+-]\=[0-9_]\+\(\.[0-9_]*\|\)\(e[0-9_]*\|\)\>"

syn region  libertyString start=+"+ skip=+\\"+ end=+"+ contains=libertyEscape
"syn match   libertyEscape +\\[nt"\\]+ contained
"syn match   libertyEscape "\\\o\o\=\o\=" contained

"Modify the following as needed.  The trade-off is performance versus
"functionality.
syn sync lines=50

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_liberty_syn_inits")
   if version < 508
      let did_liberty_syn_inits = 1
      command -nargs=+ HiLink hi link <args>
   else
      command -nargs=+ HiLink hi def link <args>
   endif

   " The default highlighting.
   HiLink libertyCharacter    Character
   HiLink libertyConditional  Conditional
   HiLink libertyRepeat       Repeat
   HiLink libertyString       String
   HiLink libertyComment      Comment
   HiLink libertyConstant     Constant
   HiLink libertyLabel        Label
   HiLink libertyNumber       Number
   HiLink libertyOperator     Special
   HiLink libertyStatement    Statement
   HiLink libertyGlobal       Define
   HiLink libertyDirective    SpecialComment
   HiLink libertyEscape       Special
   HiLink libertyType         Type
   HiLink libertySystask      Function

   delcommand HiLink
endif

let b:current_syntax = "liberty"

" vim: ts=8
