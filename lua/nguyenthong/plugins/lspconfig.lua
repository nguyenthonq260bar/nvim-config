local mason = require('mason')
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local mason_lspconfig = require("mason-lspconfig")



mason.setup()
-- Cấu hình Mason LSP
mason_lspconfig.setup({
  ensure_installed = { 'html', 'cssls' },
})


-- Cấu hình LSP cho Python
lspconfig.pyright.setup{
  capabilities = capabilities,
  settings = {
    python = {
      pythonPath = "/Library/Frameworks/Python.framework/Versions/3.13/bin/python3",
    },
  },
}

-- Cấu hình LSP cho HTML
lspconfig.html.setup{
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    -- Bật auto-formatting khi lưu file HTML
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
  end,
}

-- Cấu hình LSP cho CSS
lspconfig.cssls.setup{
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    -- Bật auto-formatting khi lưu file CSS
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
  end,
}
