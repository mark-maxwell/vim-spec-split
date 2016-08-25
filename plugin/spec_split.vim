function! Vspec()
  call s:OpenSpecInSplit(':vs')
endfunction

function! Hspec()
  call s:OpenSpecInSplit(':sp')
endfunction

" local functions

function! s:OpenSpecInSplit(split_command)
  if s:FileCanHaveSpec()
    execute a:split_command . ' ' . s:AssocSpec()
  else
    return s:SpecAlreadyOpenError()
  endif
endfunction

function! s:FileCanHaveSpec()
  return s:CurrentFilePath() =~ '^\(app\|lib\)/'
endfunction

function! s:AssocSpec()
  let s:partial_match = matchstr(s:CurrentFilePath(), '\(/[a-z_]*\)\+')

  if s:CurrentFilePath() =~ '^app/'
    let s:assoc_spec_path = 'spec' . s:partial_match . '_spec.rb'
  elseif s:CurrentFilePath() =~ '^lib/'
    let s:assoc_spec_path = 'spec/lib' . s:partial_match . '_spec.rb'
  endif

  return s:assoc_spec_path
endfunction

function! s:CurrentFilePath()
  return @%
endfunction

function! s:SpecAlreadyOpenError()
  echoerr "Current buffer contains a spec file already!"
endfunction
