# ---------------------------------------------------------------
# String manipulation
# ---------------------------------------------------------------
function split() {
  IFS=$2 read -rA split_result <<<"$1"
}

function explode() {
  IFS=$2 read -rA exploded_result <<<"$1"
}

function trim() {
  local var="$*"
  # remove leading whitespace characters
  var="${var#"${var%%[![:space:]]*}"}"
  # remove trailing whitespace characters
  var="${var%"${var##*[![:space:]]}"}"
  echo -n "$var"
}

function capitalize() {
  tempString=$1
  echo "$(tr '[:lower:]' '[:upper:]' <<<${tempString:0:1})${tempString:1}"
}
alias firstUpper="capitalize"
alias firstUpperCase="capitalize"

function firstLowerCase() {
  tempString=$1
  echo "$(tr '[:upper:]' '[:lower:]' <<<${tempString:0:1})${tempString:1}"
}
alias firstLower="firstLowerCase"

function toUpperCase() {
  tempString=$1
  echo "$tempString" | tr '[:lower:]' '[:upper:]'
}
alias toUpper="toUpperCase"

function toLowerCase() {
  tempString=$1
  echo "$tempString" | tr '[:upper:]' '[:lower:]'
}
alias toLower="toLowerCase"

function replaceCharWith() {
  echo $1 | tr $2 $3
}

# ---------------------------------------------------------------
# File and paths
# ---------------------------------------------------------------
function getFileNameFromPath() {
  filePath=$1
  fullName=$(basename -- "$filePath")

  echo $fullName
}
alias getFileName="getFileNameFromPath"

function getFileNameWithoutExtension() {
  filePath=$1
  fullName=$(basename -- "$filePath")
  fileExtension="${fullName##*.}"
  fileName="${fullName%.*}"

  echo $fileName
}

function getFileExtension() {
  filePath=$1
  fullName=$(basename -- "$filePath")
  fileExtension="${fullName##*.}"
  fileName="${fullName%.*}"

  echo $fileExtension
}

function getOsByFileName() {
  typeset -A OS_BY_EXT
  OS_BY_EXT[ipa]="ios"
  OS_BY_EXT[apk]="android"

  filePath=$1
  fullName=$(basename -- "$filePath")
  fileExtension="${fullName##*.}"
  fileName="${fullName%.*}"

  os=${OS_BY_EXT[$fileExtension]}

  echo $os
}

# ---------------------------------------------------------------
# Resets & fixes
# ---------------------------------------------------------------
function disableAdobe() {
  launchctl unload -w /Library/LaunchAgents/com.adobe.AdobeCreativeCloud.plist
}

function reset-audio() {
  sudo kextunload /System/Library/Extensions/AppleHDA.kext
  sudo kextload /System/Library/Extensions/AppleHDA.kext
}