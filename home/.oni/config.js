const activate = (oni) => {
    console.log("config activated")

    // oni.input.bind("<c-enter>", () => console.log("Control+Enter was pressed"))

    // oni.input.unbind("<c-p>")
}

const deactivate = () => {
    console.log("config deactivated")
}

module.exports = {
    activate,
    deactivate,

    "oni.loadInitVim": true,
    "oni.hideMenu": true,
    "tabs.mode": "hidden",
    "editor.clipboard.enabled": false,
    "ui.animations.enabled": true,

    "ui.colorscheme": "monokai",
    "editor.fontFamily": "Fira Code",
    "editor.fontSize": 14,
    "editor.linePadding": 1,
}
