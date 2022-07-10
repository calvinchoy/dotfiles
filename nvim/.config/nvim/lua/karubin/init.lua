-- Global stuff
function IsWindows()
	return vim.loop.os_uname().sysname == "Windows_NT"
end

-- set global variable for home path based on os (win/macos)
HOME_PATH = os.getenv("HOME")
if IsWindows() then
	HOME_PATH = os.getenv("USERPROFILE")
end

function Keymap(mode, l, r, opts)
  opts = opts or {}
  vim.keymap.set(mode, l, r, opts)
end

function Map(mode, l, r, opts)
	opts = opts or {}
	vim.keymap.set(mode, l, r, opts)
end
-- lua set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- plugins with custom lua config
require("karubin.plugins")
require("karubin.sets")
require("karubin.netrw")
require("karubin.colors")
require("karubin.emmet")
require("karubin.winbar")
require("karubin.comment")
require("karubin.devicons")
require("karubin.lightspeed")
require("karubin.sandwich")
require("karubin.toggle-diagnostics")
require("karubin.indent-blankline")
require("karubin.lualine")
require("karubin.nvim-autopairs")
require("karubin.nvim-cmp")
require("karubin.nvim-lsp")
require("karubin.lsp-saga")
require("karubin.nvim-tree")
require("karubin.nvim-treesitter")
require("karubin.nvim-ts-autotag")
require("karubin.telescope")
require("karubin.toggleterm")
require("karubin.trouble")
require("karubin.vim-test")
require("karubin.gitsigns")
require("karubin.gitworktree")
require("karubin.which-key")
require("karubin.searchbox")
require("karubin.zen-mode")
require("karubin.diffview")
require("karubin.tabout")
