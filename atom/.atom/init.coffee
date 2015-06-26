# Fix PATH with common locations.
process.env.PATH = [
  "/usr/local/bin",
  "/usr/bin",
  process.env.PATH
].join(":")

# Confirm autocompletion automatically if there is only one suggestion. If not,
# iterate through them.
atom.commands.add 'atom-text-editor', 'msiedlarek:autocomplete', ->
  autocomplete = atom.packages.getActivePackage('autocomplete-plus').mainModule
  suggestions = autocomplete.getAutocompleteManager().suggestionList.items
  target = atom.views.getView(atom.workspace).querySelector(
    '.autocomplete-plus'
  )
  if target
    if suggestions and suggestions.length > 1
      atom.commands.dispatch target, "core:move-down"
    else
      atom.commands.dispatch target, "autocomplete-plus:confirm"

# Open tree-view when trying to go left from a leftmost pane.
atom.commands.add 'atom-text-editor', 'msiedlarek:focus-pane-on-left', ->
  treeViewActive = atom.packages.isPackageActive('tree-view')
  workspaceView = atom.views.getView(atom.workspace)
  paneContainerView = atom.views.getView(workspaceView.paneContainer)
  if treeViewActive and !paneContainerView.nearestPaneInDirection('left')
    atom.commands.dispatch workspaceView, "tree-view:toggle-focus"
  else
    atom.commands.dispatch workspaceView, "window:focus-pane-on-left"

atom.packages.onDidActivatePackage (pack) ->
  switch pack.name
    when 'ex-mode'
      # Add ex-mode commands.
      Ex = pack.mainModule.provideEx()
      Ex.registerCommand 'qt', ->
        # Close active pane.
        atom.workspace.getActivePane().destroy()
      Ex.registerCommand 'qa', ->
        # Close active window.
        atom.close()
    when 'tree-view'
      # Hide tree-view by default.
      hideTreeView = ->
        treeView = atom.packages.getActivePackage('tree-view').mainModule.treeView
        if treeView?.isVisible()
          treeView.detach()
      atom.project.onDidChangePaths hideTreeView
      atom.workspace.onDidOpen hideTreeView
