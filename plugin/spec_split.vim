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
    execute a:split_command . ' ' . s:AssocFile()
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

function! s:AssocFile()
  let s:partial_match = matchstr(s:CurrentFilePath(), '\(/[a-z_]*\)\+_spec.rb')
  let s:substituted_match = substitute(s:partial_match, '_spec.rb', '.rb', '')
  let s:assoc_file_path = 'app' .s:substituted_match
  "TODO need to handle spec/lib/... in the future

  return s:assoc_file_path
endfunction

function! s:CurrentFilePath()
  return @%
endfunction

function! s:SpecInCurrentBuffer()
  return s:CurrentFilePath() =~ '^spec/'
endfunction

function! s:FileHasNoSpecError()
  echoerr 'Files of this type have no associated spec!'
endfunction
