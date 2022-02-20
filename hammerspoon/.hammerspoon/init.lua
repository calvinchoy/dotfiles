hs.hotkey.bind({"cmd"}, "`", function()
  local alacritty = hs.application.get('Alacritty')
  if alacritty ~= nil and alacritty:isFrontmost() then
    alacritty:hide()
  else
    hs.application.launchOrFocus("/Applications/Alacritty.app")
    local alacritty = hs.application.get('Alacritty')
    alacritty.setFrontmost(alacritty)
    alacritty.activate(alacritty)
  end
end
)

hs.hotkey.bind({"cmd", "alt"}, "h", function()
  local current = hs.window.frontmostWindow()
  current.focusWindowWest()
end
)


hs.hotkey.bind({"cmd", "alt"}, "j", function()
  local current = hs.window.frontmostWindow()
  current.focusWindowSouth()
end
)

hs.hotkey.bind({"cmd", "alt"}, "k", function()
  local current = hs.window.frontmostWindow()
  current.focusWindowNorth()
end
)
hs.hotkey.bind({"cmd", "alt"}, "l", function()
  local current = hs.window.frontmostWindow()
  current.focusWindowEast()
end
)