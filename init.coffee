{Directory} = require 'atom'

dir = new Directory("path/to/image/dir")
intervalTime = 1000 * 60 * 60 * 6 # 6 hours
resetTime = new Date()

setBack = ->
    dir.getEntries((err, etr) ->
        if err is not null
            alert "error! getEntries"
            return

        files = (e for e in etr when e.isFile())
        idx = Math.floor(Math.random() * files.length)

        path = "url(#{files[idx].getPath()})".replace(/\\/g, "/")

        document.getElementsByTagName("atom-workspace")[0].style.backgroundImage = path
    )
    return

isOverRestTime = ->
    now = new Date()
    if now.getDate() != resetTime.getDate()
        resetTime = now
        return true
    return false

setBack()
timer = setInterval ->
    if isOverRestTime()
        setBack()
, intervalTime
