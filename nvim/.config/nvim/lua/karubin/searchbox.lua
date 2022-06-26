require('searchbox').setup({
  popup = {
    relative = 'win',
    position = {
      row = '5%',
      col = '95%',
    },
    size = 30,
    border = {
      style = 'single',
      highlight = 'conceal',
      text = {
        top = ' Search ',
        top_align = 'left',
      },
    },
    win_options = {
      winhighlight = 'Normal:Normal',
    },
  },
  hooks = {
    before_mount = function(input)
      -- code
    end,
    after_mount = function(input)
      -- code
    end,
    on_done = function(value, search_type)
      -- code
    end
  }
})

-- keymaps for searchbox
Map('n', '<C-f>', ':SearchBoxMatchAll clear_matches=true <CR>')
Map('n', '<M-f>', ':SearchBoxMatchAll clear_matches=true exact=true <CR>')
Map('n', '<C-r>', ':SearchBoxReplace clear_matches=true confirm=menu <CR>')
Map('n', '<M-r>', ':SearchBoxReplace clear_matches=true exact=true confirm=menu <CR>')
