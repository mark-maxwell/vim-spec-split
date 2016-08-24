function! Vspec()
  let s:current_file = @%
  let s:partial_match = matchstr(s:current_file, '\(/[a-z_]*\)\+')

  if s:current_file =~ '^app/'
    let s:assoc_spec_file = 'spec' . s:partial_match . '_spec.rb'
  elseif s:current_file =~ '^lib/'
    let s:assoc_spec_file = 'spec/lib' . s:partial_match . '_spec.rb'
  endif

  execute ":vs " . s:assoc_spec_file
endfunction
