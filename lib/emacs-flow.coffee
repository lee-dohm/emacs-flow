#
# Copyright (c) 2014 by Lifted Studios. All Rights Reserved.
#

module.exports =
class EmacsFlow
  # Auto-indents the current row in the active editor.
  autoIndent: ->
    editor = atom.workspace.getActiveEditor()
    return unless editor?

    [row, _] = editor.getCursorBufferPosition().toArray()
    editor.autoIndentBufferRow(row)
