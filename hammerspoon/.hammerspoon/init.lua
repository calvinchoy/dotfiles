hs.hotkey.bind({"cmd"}, "`", function()
  alacritty = hs.application.get('Alacritty')
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