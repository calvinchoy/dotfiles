lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'kanagawa',
    section_separators = { left = '', right = ''},
    component_separators = { left = '', right = ''}
  }
}
EOF
