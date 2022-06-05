require("lightspeed").setup({
  jump_to_unique_chars = false,
  safe_labels = {}
})

vim.cmd([[
  nmap s <Plug>Lightspeed_omni_s
]])
