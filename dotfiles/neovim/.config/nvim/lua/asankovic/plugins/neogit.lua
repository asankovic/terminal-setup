return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local neogit = require("neogit")
    neogit.setup()
    local keymap = vim.keymap

    keymap.set("n", "<leader>ng", neogit.open,
      {silent = true, noremap = true}
    )
    
    keymap.set("n", "<leader>fgb", ":Telescope git_branches<CR>",
      {silent = true, noremap = true}
    )
    
    -- TODO: move to fugitive
    keymap.set("n", "<leader>tb", ":G blame<CR>",
      {silent = true, noremap = true}
    )
  end
}
