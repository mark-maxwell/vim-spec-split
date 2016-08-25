function! Vspec()
  call s:OpenSpecInSplit(':vs')
endfunction

function! Hspec()
  call s:OpenSpecInSplit(':sp')
endfunction

function! RunAssocSpec()
  if s:FileCanHaveSpec()
    execute '!rspec ' . s:AssocSpec()
  elseif s:SpecInCurrentBuffer()
    execute '!rspec ' . s:CurrentFilePath()
  else
    return s:FileHasNoSpecError()
  endif
endfunction

" local functions

function! s:OpenSpecInSplit(split_command)
  if s:FileCanHaveSpec()
    execute a:split_command . ' ' . s:AssocSpec()
  elseif s:SpecInCurrentBuffer()
    return s:SpecAlreadyOpenError()
  else
    return s:FileHasNoSpecError()
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
  echoerr 'Current buffer contains a spec file already!'
endfunction

function! s:SpecInCurrentBuffer()
  return s:CurrentFilePath() =~ '^spec/'
endfunction

function! s:FileHasNoSpecError()
  echoerr 'Files of this type have no associated spec!'
endfunction
