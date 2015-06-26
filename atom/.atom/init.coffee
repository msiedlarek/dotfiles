# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

process.env.PATH = [
  "/usr/local/bin",
  "/usr/bin",
  process.env.PATH
].join(":")

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
