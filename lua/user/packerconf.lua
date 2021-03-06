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

-- Autocommand that reloads neovim whenever you save the packer file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packerconf.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
-- TODO PackerSync progress in lualine
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

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "lewis6991/impatient.nvim" -- improve startup time
  use "kyazdani42/nvim-web-devicons"

  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  use "folke/tokyonight.nvim" -- color scheme
  use "joshdick/onedark.vim" -- color scheme
  use "nvim-lualine/lualine.nvim" -- status line
  use "akinsho/bufferline.nvim" -- bufferline
  use "kyazdani42/nvim-tree.lua" -- file explorer
  use "moll/vim-bbye" -- keep window layout when closing buffer

  use "numToStr/Comment.nvim" -- comment/uncomment stuff
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "lukas-reineke/indent-blankline.nvim" -- add indentation guide

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "arkav/lualine-lsp-progress" -- show lsp server progress in lualine
  use "ray-x/lsp_signature.nvim" -- function signature
  use "weilbith/nvim-code-action-menu" -- show code actions in menu
  use "kosayoda/nvim-lightbulb" -- notify if a line has code actions

  use 'RishabhRD/popfix'
  use 'RishabhRD/nvim-lsputils'

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp-signature-help"
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  use "folke/trouble.nvim" -- fancy diagnostic

  use "norcalli/nvim-colorizer.lua" -- colorizer #8080ff

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
