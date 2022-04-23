-- Global stuff
function IsWindows()
  return vim.loop.os_uname().sysname == "Windows_NT"
end

-- set global variable for home path based on os (win/macos)
HOME_PATH = os.getenv("HOME")
if IsWindows() then
  HOME_PATH = os.getenv("USERPROFILE")
end


-- shortcut to set keymaps
Keymap = vim.api.nvim_set_keymap

-- lua set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- impatient to speed things up
require('impatient')
require('packer_compiled')
-- plugins with custom lua config
require("karubin.sets")
require("karubin.netrw")
require("karubin.colors")
require("karubin.harpoon")
require("karubin.emmet")
require("karubin.bufferline")
require("karubin.devicons")
require("karubin.indent-blankline")
require("karubin.lualine")
require("karubin.nvim-autopairs")
require("karubin.nvim-cmp")
require("karubin.nvim-lsp")
-- require("karubin.nvim-tree")
require("karubin.nvim-treesitter")
require("karubin.nvim-ts-autotag")
require("karubin.telescope")
require("karubin.toggleterm")
require("karubin.trouble")
require("karubin.vim-test")
require("karubin.gitsigns")
require("karubin.gitworktree")
require("karubin.zen-mode")
-- plugins using default config
require('Comment').setup()
