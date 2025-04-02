-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {
        -- Configuration here, or leave empty to use defaults
        move_cursor = 'sticky',
      }
    end,
  },
  {
    'rmagatti/auto-session',
    lazy = false,
    keys = {
      -- Will use Telescope if installed or a vim.ui.select picker otherwise
      { '<leader>wr', '<cmd>SessionSearch<CR>', desc = '[R]estore session' },
    },

    config = function()
      require('auto-session').setup {
        suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
        save_extra_cmds = {
          function()
            -- Remember enable_format_on_save setting for each session
            return 'let g:enable_format_on_save = v:' .. tostring(vim.g.enable_format_on_save)
          end,
        },
      }
    end,
  },
  {
    'akinsho/git-conflict.nvim',
    version = '*',
    config = true,
  },
  {
    'nvim-telescope/telescope-frecency.nvim',
    -- install the latest stable version
    version = '*',
    config = function()
      require('telescope').load_extension 'frecency'
      vim.keymap.set('n', '<leader>p', require('telescope').extensions.frecency.frecency, { desc = 'Recent files' })
    end,
  },
}
