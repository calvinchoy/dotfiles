-- global stuff
function IsWindows()
  return vim.loop.os_uname().sysname == "Windows_NT"
end

-- set global variable for home path based on os (win/macos)
HOME_PATH = os.getenv("HOME")
if IsWindows() then
  HOME_PATH = os.getenv("USERPROFILE")
end

require("karubin.telescope")
require("karubin.nvim-lsp")
require("karubin.nvim-tree")
require("karubin.nvim-treesitter")
-- require("karubin.local")
