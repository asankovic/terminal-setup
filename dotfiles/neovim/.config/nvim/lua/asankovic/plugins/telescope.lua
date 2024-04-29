return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim", 
      build = "make",
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 
      "nvim-telescope/telescope-live-grep-args.nvim" ,
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
    },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    "folke/todo-comments.nvim",
  },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    --todo add trouble
    telescope.setup {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          preview_width = 0.65,     
          horizontal = {
            size = {
              width = "95%",
              height = "95%",
            },
          },
        },
        pickers = {
          find_files = {
            theme = "dropdown",
          }
        },
        mappings = {
          i = {
            ["<C-j>"] = actions.cycle_history_next,
            ["<C-k>"] = actions.cycle_history_prev,
            ["<C-q>"] = actions.delete_buffer,
            ["<C-s>"] = actions.cycle_previewers_next,
            ["<C-a>"] = actions.cycle_previewers_prev,
            ["<esc>"] = actions.close,
          },
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'noice')
    pcall(require('telescope').load_extension, 'live_grep_args')

    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find in Help' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Find in Keymaps' })
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find in Files' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find in Buffers' })
    vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = 'Find in Symbols' })
    --vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Find Word under cursor' })
    vim.keymap.set('n', '<leader>fa', "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { desc = 'Find by Grep' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Find in Diagnositcs' })
    vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Find Resume search' })
    vim.keymap.set('n', '<leader>fe', builtin.oldfiles, { desc = 'Find in Recent files' })
    vim.keymap.set('n', '<leader>fg', builtin.git_status, { desc = 'Find in Git affected files' })
    vim.keymap.set('n', '<leader>fc', builtin.git_bcommits, { desc = 'Find in Git commits for current Buffer' })
    vim.keymap.set('n', '<leader>ft', "<cmd>TodoTelescope<CR>", { desc = 'Find in TODO comments' })
    -- vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
  end,
}
