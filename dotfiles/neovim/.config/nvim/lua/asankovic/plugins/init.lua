return {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use
  "christoomey/vim-tmux-navigator", -- tmux & split window navigation
  {
    'numToStr/Comment.nvim',
    event = { "BufReadPre", "BufNewFile" },
    lazy = false,
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = {
      indent = { char = "┊" },
    },
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        stages = "fade",
      })
    end
  },
  {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = true,
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "szw/vim-maximizer",
    keys = {
      { "<C-w>m", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    opts = {},
  }
}
