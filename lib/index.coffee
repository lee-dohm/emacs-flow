#
# Copyright (c) 2014 by Lifted Studios. All Rights Reserved.
#

EmacsFlow = null
emacsFlow = null

module.exports =
  # Public: Activates the package.
  activate: ->
    @disposable = atom.commands.add 'atom-text-editor',
      'emacs-flow:auto-indent': =>
        @loadModule()
        emacsFlow.autoIndent()

  # Public: Deactivates the package.
  deactivate: ->
    @disposable.dispose()

  # Private: Loads the rest of the package on-demand.
  loadModule: ->
    EmacsFlow ?= require './emacs-flow'
    emacsFlow ?= new EmacsFlow()
