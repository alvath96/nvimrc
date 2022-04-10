local options = {
  -- file
  encoding = "utf-8",
  fileencoding = "utf-8",                  -- the encoding written to a file

  -- spell check (disabled, working but a bit annoying)
  -- spell = true,
  -- spelllang = "en,cjk",
  -- spellsuggest = "best,5",

  -- line numbers
  number = true,                           -- set numbered lines
  relativenumber = false,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time

  -- text & indent
  wrap = true,                             -- display lines as one long line
  iskeyword = vim.opt.iskeyword + "-",     -- words separated by hyphens ("test-test") will be treated as one word
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  expandtab = true,                        -- convert tabs to spaces
  tabstop = 2,                             -- insert 2 spaces for a tab
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation

  -- splits
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window

  -- movement
  whichwrap = vim.opt.whichwrap + "<,>,[,],h,l",    -- allow cursor keys to move to previous/next lines 
  -- TODO this makes copy-paste with mouse does not work
  -- mouse = "a",                                   -- allow the mouse to be used in neovim

  -- swap & clipboard
  backup = false,                          -- creates a backup file
  clipboard = "unnamed,unnamedplus",               -- allows neovim to access the system clipboard
  undofile = true,                         -- enable persistent undo
  swapfile = false,                        -- creates a swapfile
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

  -- search in file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns

  -- interface
  showtabline = 1,                         -- show tabline only if there are at least two tab pages
  cursorline = true,                       -- highlight the current line
  conceallevel = 0,                        -- so that `` is visible in markdown files
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  shortmess = vim.opt.shortmess + "c",     -- avoid messages prompt from neovim
  guifont = "Hack Nerd Font 12",

  -- timeouts
  updatetime = 300,                        -- faster completion (4000ms default)

  -- TODO check what's this
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp

  -- TODO check what is this
  scrolloff = 8,
  sidescrolloff = 8,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

