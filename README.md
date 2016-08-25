# Spec split

Lightweight Vim plugin to open the associated spec file, in a split pane, for
the file you are editing in your current buffer. Or... to run the spec that is
associated with the file in your current buffer.

##Installation

With Vundle:
```vim
call Vundle#begin()
  Plugin 'mark-maxwell/vim-spec-split'
call Vundle#end()
```
*Installation with pathogen is also an option.*

###Custom mappings
Add leader-key mappings to your vimrc file.
```vim
map <Leader>v :call Vspec()<CR>
map <Leader>h :call Hspec()<CR>
map <Leader>t :call RunAssocSpec()<CR>
```

##Current behaviour:

```vim
:call Vspec() " Opens the associated spec file in a vertical split pane.
```

```vim
:call Hspec() " Opens the associated spec file in a horizontal split pane.
```

```vim
:call RunAssocSpec() " Run associated spec, or current spec if in current buffer.
```

These functions are available in all buffers, regardless of whether you are
editing a file within a Rails project (this may change in the future).

Vim will echo an error when attempting to execute `Vspec()` or `Hspec()` when
the current buffer contains a spec file already, and when attempting to execute
RunAssocSpec() for file types that do not have specs (in Rails projects).
