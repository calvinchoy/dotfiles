$env:Path += ";C:\Users\Calvin\Tools\lua-language-server\bin"
# Terminal promp  and lists look and feel
Invoke-Expression (&starship init powershell)
Import-Module -Name Terminal-Icons

# PSReadline settings
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Alias function
function gitStatus {
 git status 
}

function folderUp{
  cd ..
}

Set-Alias -Name vim -Value nvim
Set-Alias -Name v -Value nvim
Set-Alias -Name .. -Value folderUp
Set-Alias -Name d -Value z                             
# Git
Set-Alias -Name gst -Value gitStatus 

