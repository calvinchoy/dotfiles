lua << EOF
require('lint').linters_by_ft = {
  vue = {'eslint'}
}
EOF

au BufWritePost <buffer> lua require('lint').try_lint()
