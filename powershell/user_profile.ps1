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

# Alias
function gitStatus {
 git status 
}

Set-Alias -Name vim -Value nvim
Set-Alias -Name v -Value nvim
Set-Alias -Name d -Value z                             
Set-Alias -Name gst -Value gitStatus 

