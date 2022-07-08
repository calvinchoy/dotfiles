local M = {}

vim.api.nvim_create_autocmd({ "BufWinEnter", "BufFilePost" }, {
	callback = function()
		local winbar_filetype_exclude = {
			"help",
			"startify",
			"dashboard",
			"packer",
			"NvimTree",
			"Trouble",
			"toggleterm",
		}

		if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
			vim.opt_local.winbar = nil
			return
		end

		local value = require("karubin.winbar").filename()

		vim.opt_local.winbar = value
	end,
})

local function isempty(s)
	return s == nil or s == ""
end

M.filename = function()
	local filename = vim.fn.expand("%:t")
	local extension = ""
	local file_icon = ""
	local file_icon_color = ""
	local default_file_icon = ""
	local default_file_icon_color = ""

	if not isempty(filename) then
		extension = vim.fn.expand("%:e")

		local default = false

		if isempty(extension) then
			extension = ""
			default = true
		end

		file_icon, file_icon_color =
			require("nvim-web-devicons").get_icon_color(filename, extension, { default = default })

		local hl_group = "FileIconColor" .. extension

		vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })
		if file_icon == nil then
			file_icon = default_file_icon
			file_icon_color = default_file_icon_color
		end

		return "%="
			.. "%#"
			.. hl_group
			.. "#"
			.. file_icon
			.. "%*"
			.. " "
			.. "%#Normal#"
			.. "%f"
			.. "%*"
			.. " "
			.. "%#String#"
			.. "%m"
			.. "%*"
			.. "%="
	end
end

return M
