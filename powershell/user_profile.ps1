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

function addCommit{
  git add .
  git commit -a
}

function removeDirectory{
  rm -Recurse -Force
}

function newItem{
  New-Item
}


Set-Alias -Name vim -Value nvim
Set-Alias -Name v -Value nvim
Set-Alias -Name .. -Value folderUp
Set-Alias -Name d -Value z                             
Set-Alias -Name cl -Value clear
Set-Alias -Name cl -Value clear                               
Set-Alias -Name rmd -Value removeDirectory
Set-Alias -Name touch -Value newItem                                          
# Git
Set-Alias -Name gst -Value gitStatus 
Set-Alias -Name gca -Value addCommit                                      

