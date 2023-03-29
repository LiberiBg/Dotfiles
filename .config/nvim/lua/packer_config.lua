--Dont forget to run PackerSync in nvim for update packages

-- Ensure that packer is installed on computer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

--Ensure packer is properly import, without this try catch nvim can crash at starting
local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
	return
end

--Same for packer.util
local packer_util_ok, packer_util = pcall(require, "packer.util")
if not packer_util_ok then
  return
end

--Plugins
packer.startup({
  function(use)
    -- Packer mananger
    use("wbthomason/packer.nvim")

    -- Colorscheme
    use("folke/tokyonight.nvim")
    
   --Nvim tree
    use({
     "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
        }
      })
     
    -- StatusLine  
    use({
      "nvim-lualine/lualine.nvim",
      event = "BufEnter",
      config = function()
        require("configs.lualine")
      end,
      requires = { "nvim-web-devicons" },
    })

    -- Treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = function()
        require("configs.treesitter")
      end,
    })

    use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter"})



  -- Display PackerSync result different
  end,
  config = {
    display = {
      open_fn = function()
        return packer_util.float({ border = "single" })
      end,
    },
  },
})

