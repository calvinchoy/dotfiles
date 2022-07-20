-- -- Reference plugins setup:
-- https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/plugins.lua
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	profile = {
		enable = false,
	},
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Start plugin installation here
return packer.startup({
	function(use)
		use("lewis6991/impatient.nvim")
		use("nathom/filetype.nvim")
		use("wbthomason/packer.nvim")
		use({ "dstein64/vim-startuptime", cmd = { "StartupTime" } })
		-- Theme/UI
		use("nvim-lualine/lualine.nvim")
		use("lewis6991/gitsigns.nvim")
		use("lukas-reineke/indent-blankline.nvim")
		use({"folke/tokyonight.nvim"})
		use({'EdenEast/nightfox.nvim'})
		use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup({ "*" }, { names = false })
			end,
		})
		use("kyazdani42/nvim-web-devicons")
		use("kyazdani42/nvim-tree.lua")
		-- Telescope
		use("nvim-lua/popup.nvim")
		use("nvim-lua/plenary.nvim")
		use("ThePrimeagen/git-worktree.nvim")
		use("nvim-telescope/telescope.nvim")
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
		use("nvim-telescope/telescope-file-browser.nvim")
		-- Tree shitter and LSP
		use("nvim-treesitter/nvim-treesitter")
		use("neovim/nvim-lspconfig")
		use("onsails/lspkind-nvim")
		-- use("folke/trouble.nvim")
		use("bellini666/trouble.nvim")
		use({ "glepnir/lspsaga.nvim", branch = "main" })
		-- Autocomplete
		use("hrsh7th/nvim-cmp")
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		use("saadparwaiz1/cmp_luasnip")
		use("hrsh7th/cmp-nvim-lsp-signature-help")
		use("l3mon4d3/luasnip")
		use("rafamadriz/friendly-snippets")
		-- Code formatting and linting
		use({ "sbdchd/neoformat", cmd = { "Neoformat" } })
		-- Tools and motion
		use({ "numToStr/Comment.nvim" })
		use("ThePrimeagen/harpoon")
		use("machakann/vim-sandwich")
		use("wellle/targets.vim")
		use("windwp/nvim-autopairs")
		use("windwp/nvim-ts-autotag")
		use("ggandor/lightspeed.nvim")
		use({ "mattn/emmet-vim", ft = { "html, vue" } })
		use("akinsho/toggleterm.nvim")
		use({ "tpope/vim-fugitive", cmd = { "G", "Gstatus", "G diff", "Gdiffsplit" } })
		use({ "sindrets/diffview.nvim" })
		use({ "vim-test/vim-test", cmd = { "TestFile", "TestNearest", "TestSuite", "TestLast", ",TestVisit" } })
		use({ "folke/zen-mode.nvim" })
		use({ "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim" })
		use({ "VonHeikemen/searchbox.nvim", requires = { { "MunifTanjim/nui.nvim" } } })
		use({ "abecodes/tabout.nvim" })
		use({ "dhruvmanila/telescope-bookmarks.nvim" })
		-- Automatically set up your configuration after cloning packer.nvim
		-- Put this at the end after all plugins
		if PACKER_BOOTSTRAP then
			require("packer").sync()
		end
	end,
})
