return {
  "akinsho/git-conflict.nvim",
  version = "*",
  event = "BufReadPre",
  config = function()
    require("git-conflict").setup({
      default_mappings = false,
      default_commands = true,
      disable_diagnostics = false,
      list_opener = "copen",
      highlights = {
        incoming = "DiffAdd",
        current = "DiffText",
      },
      debug = false,
    })

    -- Automatically add conflict keymaps when merge markers are found
    vim.api.nvim_create_autocmd("BufReadPost", {
      callback = function()
        if vim.fn.search("<<<<<<<", "nw") ~= 0 then
          local buf = vim.api.nvim_get_current_buf()

          vim.keymap.set(
            "n",
            "<leader>co",
            "<cmd>GitConflictChooseOurs<CR>",
            { buffer = buf, desc = "[G conflict] Choose Ours" }
          )
          vim.keymap.set(
            "n",
            "<leader>ct",
            "<cmd>GitConflictChooseTheirs<CR>",
            { buffer = buf, desc = "[G conflict] Choose Theirs" }
          )
          vim.keymap.set(
            "n",
            "<leader>c0",
            "<cmd>GitConflictChooseNone<CR>",
            { buffer = buf, desc = "[G conflict] Choose None" }
          )
          vim.keymap.set(
            "n",
            "<leader>cb",
            "<cmd>GitConflictChooseBoth<CR>",
            { buffer = buf, desc = "[G conflict] Choose Both" }
          )
          vim.keymap.set(
            "n",
            "<leader>cn",
            "<cmd>GitConflictNextConflict<CR>",
            { buffer = buf, desc = "[G conflict] Next Conflict" }
          )
          vim.keymap.set(
            "n",
            "<leader>cp",
            "<cmd>GitConflictPrevConflict<CR>",
            { buffer = buf, desc = "[G conflict] Previous Conflict" }
          )
        end
      end,
    })
  end,
  keys = {
    {
      "<leader>gC",
      function()
        local results = vim.fn.systemlist("git grep -n '<<<<<<<\\|>>>>>>>'")

        if vim.v.shell_error ~= 0 or #results == 0 then
          vim.notify("No merge conflicts found in project", vim.log.levels.INFO)
          return
        end

        local qf_list = {}
        for _, line in ipairs(results) do
          local filename, lnum, text = line:match("^([^:]+):(%d+):(.*)$")
          if filename then
            table.insert(qf_list, {
              filename = filename,
              lnum = tonumber(lnum),
              text = text,
            })
          end
        end

        vim.fn.setqflist(qf_list, "r")
        vim.cmd("copen")
      end,
      desc = "Project-wide Merge Conflicts",
      mode = "n",
    },
    {
      "<leader>g",
      name = "+git",
    },
  },
}
