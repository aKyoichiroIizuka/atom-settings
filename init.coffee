{Directory} = require 'atom'

dir = new Directory("path/to/image/dir")
dir.getEntries((err, etr) ->
    if err is not null
        alert "error! getEntries"
        return

    files = (e for e in etr when e.isFile())
    idx = Math.floor(Math.random() * files.length)

    path = "url(#{files[idx].getPath()})".replace(/\\/g, "/")

    document.getElementsByTagName("atom-workspace")[0].style.backgroundImage = path
)
