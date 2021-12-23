local configs = require 'lsp.configs'
local util = require 'lsp.util'

local server_name = 'html'
local bin_name = 'vscode-html-language-server'

local root_pattern = util.root_pattern 'package.json'

configs[server_name] = {
  default_config = {
    cmd = { bin_name, '--stdio' },
    filetypes = { 'html' },
    root_dir = function(fname)
      return root_pattern(fname) or vim.loop.os_homedir()
    end,
    settings = {},
    init_options = {
      embeddedLanguages = { css = true, javascript = true },
      configurationSection = { 'html', 'css', 'javascript' },
    },
  },
}

-- vim:et ts=2 sw=2
