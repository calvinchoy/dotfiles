-- -- Reference plugins setup: 
-- https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/plugins.lua
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Start plugin installation here
return packer.startup(function(use)
use "wbthomason/packer.nvim"
-- Theme/UI
use 'nvim-lualine/lualine.nvim'
use 'akinsho/bufferline.nvim'
use 'lewis6991/gitsigns.nvim'
use 'lukas-reineke/indent-blankline.nvim'
use 'folke/tokyonight.nvim'
use 'norcalli/nvim-colorizer.lua'
use 'kyazdani42/nvim-web-devicons'
use 'kyazdani42/nvim-tree.lua'
-- Telescope
use 'nvim-lua/popup.nvim'
use 'nvim-lua/plenary.nvim'
use 'ThePrimeagen/harpoon'
use 'nvim-telescope/telescope.nvim'
use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
use 'nvim-telescope/telescope-file-browser.nvim'
use 'tknightz/telescope-termfinder.nvim'
-- Tree shitter and LSP
use 'nvim-treesitter/nvim-treesitter'
use 'neovim/nvim-lspconfig'
use 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
use 'onsails/lspkind-nvim'
use 'folke/trouble.nvim'
-- Autocomplete
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'saadparwaiz1/cmp_luasnip'
 -- Snippets to make nvim-cmp actually do something
use 'l3mon4d3/luasnip'
use 'rafamadriz/friendly-snippets'
-- Code formatting and linting
use 'sbdchd/neoformat'
-- Tools and motion
use 'lewis6991/impatient.nvim'
use 'szw/vim-maximizer'
use 'famiu/bufdelete.nvim'
use 'numToStr/Comment.nvim'
use 'tpope/vim-fugitive'
use 'machakann/vim-sandwich'
use 'wellle/targets.vim'
use 'windwp/nvim-autopairs'
use 'windwp/nvim-ts-autotag'
use 'justinmk/vim-sneak'
use 'mattn/emmet-vim'
use 'akinsho/toggleterm.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
