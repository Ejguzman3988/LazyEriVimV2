return {
  {
    "jose-elias-alvarez/typescript.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
      -- any options you like; see the plugin README
    },
    -- attach it to the tsserver client
    config = function(_, opts)
      require("typescript").setup(opts)
    end,
  },
}
