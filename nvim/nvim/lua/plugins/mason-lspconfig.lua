return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "clangd",      -- C/C++
        "pyright",     -- Python
        "html",        -- HTML
        "emmet_ls",    -- Emmet for HTML/CSS
        "texlab",      -- LaTeX
      },
    })
  end,
}
