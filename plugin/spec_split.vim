function! Vspec()
  let s:current_file = @%
  let s:partial_match = matchstr(s:current_file, '\(/[a-z_]*\)\+')
  let s:assoc_spec_file = 'spec' . s:partial_match . '_spec.rb'

  execute ":vs " . s:assoc_spec_file
endfunction
