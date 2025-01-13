vim.g.mapleader = ' '

-- Adds line numbers
vim.opt.number = true

-- Share clipboard between OS and nvim
vim.opt.clipboard = 'unnamedplus'

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { 
	  'nvim-treesitter/nvim-treesitter',
	  build = ':TSUpdate',

main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'cpp' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
     },
  },
  },
  { 
	  'nvim-telescope/telescope.nvim', 
	  tag = '0.1.1', 
	  dependencies = { 
		  'nvim-lua/plenary.nvim' 
	  } 
  },
  { 
	  'neovim/nvim-lspconfig'
  }, 
  { 
	  'hrsh7th/nvim-cmp', 
	  dependencies = { 
		  'hrsh7th/cmp-nvim-lsp' 
	  } 
  },
{
    "OXY2DEV/markview.nvim",
    lazy = false,      -- Recommended

    dependencies = {
	"nvim-treesitter/nvim-treesitter",
	"nvim-tree/nvim-web-devicons"
    },
	
    config = function()

	    local markview = require('markview')

	    local config = {
		    links = {
			    
			    enabled = true,

			    hyperlinks = {
					
				    enabled = true,

				    icon = "󰌷 ",

					hl = "MarkviewHyperlink",
				    },
			    }
		    }


	markview.configuration = vim.tbl_deep_extend('force', markview.configuration, config)
    end
},
{
"edluffy/hologram.nvim",
	auto_display = true,
},
{'Vaisakhkm2625/hologram-math-preview.nvim'},
-- { 'tyru/open-browser.nvim' },
})

-- Keybindings

-- Map j to move up
vim.keymap.set('n', 'j', 'k', { noremap = true, silent = true })

-- Map k to move down
vim.keymap.set('n', 'k', 'j', { noremap = true, silent = true })

-- Make it work for visual mode as well
vim.keymap.set('v', 'j', 'k', { noremap = true, silent = true })
vim.keymap.set('v', 'k', 'j', { noremap = true, silent = true })

-- Map 'gx' to open the URL under the cursor
vim.keymap.set('n', 'gx', '<Plug>(openbrowser-smart-search)', {})

vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {})
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, {})
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, {})
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, {})














