#
# Copyright (c) 2014 by Lifted Studios. All Rights Reserved.
#

EmacsFlow = null
emacsFlow = null

# Loads the module on-demand.
loadModule = ->
  EmacsFlow ?= require './emacs-flow'
  emacsFlow ?= new EmacsFlow()

module.exports =
  activate: ->
    atom.workspaceView.command 'emacs-flow:auto-indent', ->
      loadModule()
      emacsFlow.autoIndent()
