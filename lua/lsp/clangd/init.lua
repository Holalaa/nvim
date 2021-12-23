--local configs = require'lsp.configs'
local util = require'lsp.util'
local root_pattern = util.root_pattern('compile_commands.json', 'compile_flags.txt', '.git')

local function switch_source_header(bufnr)
  bufnr = util.validate_bufnr(bufnr)
  local params = { uri = vim.uri_from_bufnr(bufnr) }
  vim.lsp.buf_request(bufnr, 'textDocument/switchSourceHeader', params, function(err, _, result)
    if err then
      error(tostring(err))
    end
    if not result then
      print 'Corresponding file cannot be determined'
      return
    end
    vim.api.nvim_command('edit' .. vim.uri_to_fname(result))
  end)
end

local default_capabilities = vim.tbl_deep_extend(
  'force',
  util.default_config.capabilities or vim.lsp.protocol.make_client_capabilities(),
  {
    textDocument = {
      completion = {
        editsNearCursor = true,
      },
    },
    offsetEncoding = { 'utf-8', 'utf-16'},
  }
)


require'lspconfig'.clangd.setup{
--configs.clangd = {  
  defauult_config = {
    cmd = { 'clangd', '--background-index'},
    filetypes = {'c', 'cpp', 'bojc', 'objcpp'},
    root_dir = function(fname)
      local filename = util.path.is_absolute(fname) and fname or util.path.join(vim.loop.cwd(), fname)
      return root_pattern(fname) or util.path.dirname(filename)
    end,
    on_init = function(client, result)
      if result.offsetEncoding then
        client.offset_encoding = result.offsetEncoding
      end
    end,
    capabilities = default_capabilities,
  },
  commands = {
    ClangdSwitchSourceHeader = {
      function()
        switch_source_header(0)
      end,
      description = 'Switch between source/header',
    },
  },
}

