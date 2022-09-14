local status, mason = pcall(require, 'mason')
if (not status) then return end

local status2, mason_lspconfig = pcall(require, 'mason-lspconfig')
if (not status2) then return end

local status3, lsp_signature = pcall(require, 'lsp_signature')
if (not status3) then return end

local status4, lspconfig = pcall(require, 'lspconfig')
if (not status4) then return end

-- modify icons
local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end


vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = 'rounded' }
)

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  },
  keymaps = {
    -- Keymap to expand a package
    toggle_package_expand = "<CR>",
    -- Keymap to install the package under the current cursor position
    install_package = "i",
    -- Keymap to reinstall/update the package under the current cursor position
    update_package = "u",
    -- Keymap to check for new version for the package under the current cursor position
    check_package_version = "c",
    -- Keymap to update all installed packages
    update_all_packages = "U",
    -- Keymap to check which installed packages are outdated
    check_outdated_packages = "C",
    -- Keymap to uninstall a package
    uninstall_package = "X",
    -- Keymap to cancel a package installation
    cancel_installation = "<C-c>",
    -- Keymap to apply language filter
    apply_language_filter = "<C-f>",
  },
})

mason_lspconfig.setup({})

lsp_signature.setup({
  debug = false, -- set to true to enable debug logging
  log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
  -- default is  ~/.cache/nvim/lsp_signature.log
  verbose = false, -- show debug line number

  bind = true, -- This is mandatory, otherwise border config won't get registered.
  -- If you want to hook lspsaga or other signature handler, pls set to false
  doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
  -- set to 0 if you DO NOT want any API comments be shown
  -- This setting only take effect in insert mode, it does not affect signature help in normal
  -- mode, 10 by default

  max_height = 12, -- max height of signature floating_window
  max_width = 80, -- max_width of signature floating_window
  wrap = true, -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long

  floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

  floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
  -- will set to true when fully tested, set to false will use whichever side has more space
  -- this setting will be helpful if you do not want the PUM and floating win overlap

  floating_window_off_x = 1, -- adjust float windows x position.
  floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines

  close_timeout = 4000, -- close floating window after ms when laster parameter is entered
  fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
  hint_enable = true, -- virtual hint enable
  hint_prefix = "🐼 ", -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
  hint_scheme = "String",
  hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
  handler_opts = {
    border = "rounded" -- double, rounded, single, shadow, none
  },

  always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

  auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
  extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
  zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

  padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc

  transparency = nil, -- disabled by default, allow floating win transparent value 1~100
  shadow_blend = 36, -- if you using shadow as border use this set the opacity
  shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
  timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
  toggle_key = nil, -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'

  select_signature_key = nil, -- cycle to next signature, e.g. '<M-n>' function overloading
  move_cursor_key = nil, -- imap, use nvim_set_current_win to move cursor between current win and floating
})

lspconfig.util.default_config = vim.tbl_deep_extend(
  'force',
  lspconfig.util.default_config,
  {
    on_attach = function(client, bufnr)
      lsp_signature.on_attach(client, bufnr)
    end,
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    flags = {
      debounce_text_changes = 300,
    },
  }
)

-- lspconfig
require('user.lsp.go')
require('user.lsp.lua')
