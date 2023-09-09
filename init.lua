-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.cmd([[colorscheme catppuccin]])

-- vim.cmd.colorscheme("darcula")
-- vim.cmd.colorscheme("dracula")
vim.cmd.colorscheme("base16-tender")
-- vim.o.termguicolors = true

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require("go.format").goimport()
  end,
  group = format_sync_grp,
})

local lspconfig = require("lspconfig")
lspconfig.gopls.setup({})

-- jk to esc
vim.api.nvim_set_keymap("v", "p", '"0p', { noremap = true })
vim.api.nvim_set_keymap("n", "<space>ge", "<cmd>Lspsaga diagnostic_jump_next<CR>", { noremap = true })
--  vim.api.nvim_set_keymap("c", "jk", "<C-c>", { noremap = true })
-- treesitter
require("nvim-treesitter.configs").setup({
  incremental_selection = {
    enable = true,
    keymaps = {
      node_incremental = "v",
      node_decremental = "<BS>",
    },
  },
})

vim.api.nvim_set_hl(0, "@comment", { fg = "green" })
