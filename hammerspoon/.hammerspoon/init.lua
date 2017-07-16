hs.window.animationDuration = 0

local oldIdXYWH = {}

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  oldIdXYWH = {win:id(), f.x, f.y, f.w, f.h}

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  oldIdXYWH = {win:id(), f.x, f.y, f.w, f.h}

  f.x = max.w / 2
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "F", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  oldIdXYWH = {win:id(), f.x, f.y, f.w, f.h}

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "C", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  oldIdXYWH = {win:id(), f.x, f.y, f.w, f.h}

  f.x = max.x + (max.w / 2 - f.w / 2)
  f.y = max.y + (max.h / 2 - f.h / 2)
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "U", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  if win:id() ~= oldIdXYWH[1] then
	  return
  end

  f.x = oldIdXYWH[2]
  f.y = oldIdXYWH[3]
  f.w = oldIdXYWH[4]
  f.h = oldIdXYWH[5]
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "=", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  oldIdXYWH = {win:id(), f.x, f.y, f.w, f.h}

  f.x = f.x - 25
  f.y = f.y - 25
  f.w = f.w + 50
  f.h = f.h + 50
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "-", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  oldIdXYWH = {win:id(), f.x, f.y, f.w, f.h}

  f.x = f.x + 25
  f.y = f.y + 25
  f.w = f.w - 50
  f.h = f.h - 50
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "m", function()
  hs.application.launchOrFocus("MacVim")
end)

-- Reload config when config file changes
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
local myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")


ctrlDoublePress = require("ctrlDoublePress")
ctrlDoublePress.timeFrame = 0.5
ctrlDoublePress.action = function()
   -- hs.alert.show("Ctrl pressed twice")
   -- hs.eventtap.keyStroke({"ctrl"}, "`")
   -- hs.eventtap.keyStroke("", "3")
   -- hs.eventtap.keyStroke("", "2")
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "p", function()
  local success, result = hs.osascript.javascript([[
    let spotify = Application('Spotify')
    ;`${spotify.currentTrack.artist()}: ${spotify.currentTrack.name()} (${spotify.playerState()})`
  ]])

  if success then
    hs.alert.show(result)
  else
    hs.alert.show("Unable to fetch song information.")
  end
end)
