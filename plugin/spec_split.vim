function! Vspec()
  call s:OpenSpecInSplit(':vs')
endfunction

function! Hspec()
  call s:OpenSpecInSplit(':sp')
endfunction

" local functions

function! s:OpenSpecInSplit(split_command)
  execute a:split_command . ' ' . s:AssocSpec()
endfunction

function! s:AssocSpec()
  let s:current_file = @%
  let s:partial_match = matchstr(s:current_file, '\(/[a-z_]*\)\+')

  if s:current_file =~ '^app/'
    let s:assoc_spec_path = 'spec' . s:partial_match . '_spec.rb'
  elseif s:current_file =~ '^lib/'
    let s:assoc_spec_path = 'spec/lib' . s:partial_match . '_spec.rb'
  endif

  return s:assoc_spec_path
endfunction
