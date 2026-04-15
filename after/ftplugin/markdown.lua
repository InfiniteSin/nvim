-- Auto Format on Save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.md",
  callback = function()
    vim.lsp.buf.format({
      async = false,
      filter = function(client) return client.name == "rumdl" end,
    })
  end,
})
