" Vim syntax file
" file type: log files
" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
finish
endif
syn match error ".*ERR.*"
syn match error "^ERR.*"
syn match error ".*Err.*"
syn match error "^Err.*"
syn match warn ".*WARN.*"
syn match warn "^WARN.*"
syn match warn ".*Warn.*"
syn match warn "^Warn.*"
syn match warn "^MISMATCH.*"
syn match info ".*INFO.*"
syn match info "^INFO.*"
syn match info "^Info.*"
syn match info ".*Info.*"
syn match info "^Info.*"

" Highlight colors for log levels.
hi error ctermfg=Red ctermbg=Black
hi warn ctermfg=Yellow ctermbg=Black
hi info ctermfg=Green ctermbg=Black

let b:current_syntax = "log"

" vim: ts=2 sw=2 
