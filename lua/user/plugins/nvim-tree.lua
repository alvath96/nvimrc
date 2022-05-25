local list = {
  { key = ">", action = "cd" }, -- TODO dir down
  { key = "<", action = "dir_up" },
  { key = "r", action = "full_rename" },
  { key = "v", action = "vsplit" },
  { key = "s", action = "split" },
  { key = "h", action = "close_node" },
  { key = "o", action = "system_open" },
  { key = "<C-e>", action = "" }, -- disable, used for NvimTreeToggle
}

require 'nvim-tree'.setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  open_on_tab = false,
  hijack_cursor = false,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    mappings = {
      list = list,
    },
  },
  show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
    tree_width = 30,
  },
}
