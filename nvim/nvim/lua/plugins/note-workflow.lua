-- lua/plugins/note-workflow.lua
return {

  -- 1) Better Markdown & queries
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    opts = { ensure_installed = { "markdown", "markdown_inline", "lua" } } },  -- syntax & folds :contentReference[oaicite:0]{index=0}

  -- 2) Super-fast fuzzy search across your Logseq graph
  { "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope" },                                                          -- :contentReference[oaicite:1]{index=1}

  -- 3) Snippets for templates (lec<tab>, atom<tab>, …)
  { "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()   -- picks up markdown snippets
    end },                                                                                         -- 

  -- 4) Highlight TODO / ??? / #card in bright colours
  { "folke/todo-comments.nvim",
    opts = { keywords = { CARD = { icon = "", color = "info" } } } },            -- :contentReference[oaicite:3]{index=3}

  -- 5) Browser-side Markdown preview for polishing concept notes
  { "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = { "markdown" } },                                                       -- :contentReference[oaicite:4]{index=4}

  -- 6) Git gut-checks while capturing
  { "lewis6991/gitsigns.nvim" },                                                 -- :contentReference[oaicite:5]{index=5}
  { "tpope/vim-fugitive", cmd = "Git" },                                         -- :contentReference[oaicite:6]{index=6}

  -- 7) Distraction-free writing for long literature notes
  { "folke/zen-mode.nvim", cmd = "ZenMode" },                                    -- :contentReference[oaicite:7]{index=7}

  -- 8) “Edit block in Neovim” from Logseq
  -- Enable inside Logseq UI (plugin panel) – no Lua spec needed here, but worth noting. :contentReference[oaicite:8]{index=8}

  -- 9) Extra UX sugar (optional but nice)
  { "kylechui/nvim-surround", opts = {} },                                       -- :contentReference[oaicite:9]{index=9}
  { "lukas-reineke/indent-blankline.nvim", opts = {} },                          -- :contentReference[oaicite:10]{index=10}
}

