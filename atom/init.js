function centerPane() {
  const panes = atom.workspace.getPanes()
    .filter(pane => pane.getContainer().getLocation() === 'center' 
                    && pane.getContainer().getActivePane() === pane)
  if(panes.length !== 1) {
    throw 'No center panel found'
  }
  return panes[0]
}

function isTextEditor(item) {
  return item && item.constructor.name === 'TextEditor'
}

function forceCloseTabs() {
  atom.commands.add('atom-text-editor', 'Custom:Close Active Editor', () => {
    activeItem = centerPane().getActiveItem()
    isTextEditor(activeItem) && activeItem.destroy()
  })
  atom.commands.add('atom-workspace', 'Custom:Close All Editor', () => {
    centerPane().getItems()
      .filter(item => isTextEditor(item))
      .forEach(item => item.destroy())
    centerPane().destroy()
  })
  atom.keymaps.add("user", {"atom-text-editor": {"ctrl-q": "Custom:Close Active Editor"}})
  atom.keymaps.add("user", {"atom-workspace": {"ctrl-shift-Q": "Custom:Close All Editor"}})
}

forceCloseTabs()
