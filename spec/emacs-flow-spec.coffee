path = require 'path'
fs = require 'fs-plus'
{WorkspaceView} = require 'atom'
temp = require 'temp'

describe 'Emacs Flow', ->
  [editor, buffer] = []

  beforeEach ->
    directory = temp.mkdirSync()
    atom.project.setPath(directory)
    atom.workspaceView = new WorkspaceView()
    filePath = path.join(directory, 'emacs-flow.coffee')
    fs.writeFileSync(filePath, '')
    editor = atom.workspace.openSync(filePath)
    buffer = editor.getBuffer()

    waitsForPromise ->
      atom.packages.activatePackage('emacs-flow')

    waitsForPromise ->
      atom.packages.activatePackage('language-coffee-script')

  describe 'auto-indent', ->
    it 'auto-indents the row at the current cursor location', ->
      buffer.setText('foo = ->\nbar = 5')
      editor.setCursorBufferPosition([1, 0])
      atom.workspaceView.trigger('emacs-flow:auto-indent')

      expect(buffer.lineForRow(0)).toBe 'foo = ->'
      expect(buffer.lineForRow(1)).toBe '  bar = 5'
