# Spec split

Lightweight Vim plugin to open the associated spec file, in a split pane, for
the file you are editing in your current buffer.

##Installation

With Vundle:
```
call Vundle#begin()
  Plugin 'mark-maxwell/vim-spec-split'
call Vundle#end()
```

###Custom mappings
Add leader-key mappings to your vimrc file.
```
map <Leader>v :call VSpec()<CR>
map <Leader>h :call HSpec()<CR>
```

##Current behaviour:
This plugin is in the very early stages. As such, very minimal functionality has
been implemented.

Currently, support is only available for opening the related spec for files
within a Rails project structure.

`VSpec()` - Opens the associated spec file in a vertical split pane.
`HSpec()` - Opens the associated spec file in a horizontal split pane.

These functions are available in all buffers, regardless of whether you are
editing a file within a Rails project (this may change in the future).

There will be *interesting* results when calling `VSpec()` on non-Rails files.
