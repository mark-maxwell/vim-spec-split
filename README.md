# **Spec split**

A Lightweight Vim plugin to open the associated spec file, in a split pane, for
the file you are editing in your current buffer. Or... to run the spec for
either the spec associated with the file open in your current buffer, or the
currently open spec (if a spec is open in your current buffer).

**Works for Ruby/RSpec only... For now**

Assumes that if you have a file: `app/models/depth/here.rb`, then your spec
would be: `spec/models/depth/here_spec.rb`<br/>
**AND**<br/>
if you have a file: `lib/depth/here.rb`, then your spec would be:
`spec/lib/depth/here_spec.rb`


##### *Includes Bonus reverse-splitting*
*If you are already in a spec file, the same function that is used to find an
associated spec for a given file can be used to achieve the reverse: finding
the associated file for a given spec.*

## Installation

With Vundle:
```vim
call Vundle#begin()
  Plugin 'mark-maxwell/vim-spec-split'
call Vundle#end()
```
*Installation with pathogen is also an option.*

## Current functionality:

```vim
:call Vspec()
```
If your current buffer contains a file that could possibly have a spec: open
the associated spec in a vertical split pane.<br/>
If your current buffer contains a spec file: open the associated file in a
vertical split pane.

```vim
:call Hspec()
```
Exactly the same functionality as `Vspec()`, except the split panes are opened
horizontally instead.

```vim
:call RunAssocSpec()
```
If your current buffer contains a file that could possibly have a spec: run the
associated spec in your shell.<br/>
If your current buffer contains a spec file: run that spec in your shell.

These functions are available in all buffers, regardless of whether you are
editing a file within a Rails project (this may change in the future).

Vim will echo an error when attempting to execute RunAssocSpec() for file types
that do not have specs (in Rails projects).

-------------------------------------------------------------------------------

### Setting up Custom mappings
Add leader-key mappings to your vimrc file.
```vim
map <Leader>v :call Vspec()<CR>
map <Leader>h :call Hspec()<CR>
map <Leader>t :call RunAssocSpec()<CR>
```
