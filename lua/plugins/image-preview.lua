vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.png", "*.jpg", "*.jpeg", "*.webp", "*.gif" },
  callback = function()
    local file = vim.fn.expand("%:p")
    if vim.fn.executable("viu") == 1 then
      vim.cmd("enew") -- create a new empty buffer
      vim.cmd("setlocal buftype=nofile bufhidden=wipe noswapfile")
      vim.fn.termopen({ "viu", file })
      vim.cmd("startinsert")
    else
      print("viu not found in PATH")
    end
  end,
})
