local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerCompile
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

-- Khai báo plugin
return packer.startup(function(use)
  use("wbthomason/packer.nvim") -- Quản lý chính Packer

  use("nvim-lua/plenary.nvim")

  use("bluz71/vim-nightfly-guicolors") -- Giao diện màu "nightfly"

  use("christoomey/vim-tmux-navigator")

  use("szw/vim-maximizer")

  use("tpope/vim-surround")

  use("vim-scripts/ReplaceWithRegister")

  use("numToStr/Comment.nvim")

  use("nvim-tree/nvim-tree.lua")

  use("kyazdani42/nvim-web-devicons")
  
  use("nvim-lualine/lualine.nvim")

  use({
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                run = 'make',
            },
        },
        config = function()
            require('telescope').setup({})
        end,
    })

 
  use 'hrsh7th/nvim-cmp' -- Plugin chính cho autocompletion
  use 'hrsh7th/cmp-nvim-lsp' -- Nguồn từ LSP
  use 'hrsh7th/cmp-buffer' -- Nguồn từ buffer hiện tại
  use 'hrsh7th/cmp-path' -- Nguồn từ đường dẫn file
  use 'L3MON4D3/LuaSnip' -- Plugin snippet
  use 'saadparwaiz1/cmp_luasnip' -- Tích hợp LuaSnip với nvim-cmp
  use 'neovim/nvim-lspconfig'  -- Cấu hình LSP
  use 'williamboman/mason.nvim' -- Quản lý LSP và công cụ bổ trợ
  use 'williamboman/mason-lspconfig.nvim' -- Tự động cấu hình LSP từ mason.nvim
  use 'rafamadriz/friendly-snippets'

  use ('otavioschwanck/arrow.nvim')

  use ('folke/tokyonight.nvim')

    if packer_bootstrap then
    require("packer").sync()
  end
end)
