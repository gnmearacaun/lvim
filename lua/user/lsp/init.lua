require("user.lsp.languages.rust")
require("user.lsp.languages.go")
require("user.lsp.languages.python")
require("user.lsp.languages.js-ts")
lvim.format_on_save = false
lvim.lsp.diagnostics.virtual_text = false
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls" })

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "java",
}
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })

local capabilities = require("lvim.lsp").common_capabilities()

require("typescript").setup {
  -- disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  go_to_source_definition = {
    fallback = true, -- fall back to standard LSP definition on failure
  },
  sources = {
    require "typescript.extensions.null-ls.code-actions",
  },
  server = {
    -- pass options to lspconfig's setup method
    on_attach = require("lvim.lsp").common_on_attach,
    on_init = require("lvim.lsp").common_on_init,
    capabilities = capabilities,
    settings = {
      typescript = {
        inlayHints = {
          includeInlayEnumMemberValueHints = false,
          includeInlayFunctionLikeReturnTypeHints = false,
          includeInlayFunctionParameterTypeHints = false,
          includeInlayParameterNameHints = "none", -- 'none' | 'literals' | 'all';
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = false,
          includeInlayVariableTypeHints = false,
        },
      },
    },
  },
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "stylua", filetypes = { "lua" } },
  { command = "shfmt", filetypes = { "sh", "zsh" } },
  { command = "prettier", filetypes = { "css", "javascript", "javascriptreact", "typescript", "typescriptreact" } },
}

-- lvim.lsp.on_attach_callback = function(client, bufnr)
-- end

-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "eslint_d", filetypes = { "javascript" } },
-- }

-- from lost_neophyte and dngray
-- local linters = require("lvim.lsp.null-ls.linters")
-- linters.setup({
--   {
--     command = "markdownlint-cli2",
--     args = { "$FILENAME" },
--   },
-- })
-- instead of above, use this to remedy bug in null-ls
require("null-ls").register{
  require("null-ls").builtins.diagnostics.markdownlint_cli2.with { args = { ":$FILENAME" }, generator_opts ={
        command = "markdownlint-cli2",
        from_stderr = true,
        format = "line",
        multiple_files = false,
        on_output = require("null-ls.helpers").diagnostics.from_patterns({
            {
                pattern = [[(%g+):(%d+):(%d+) ([%w-/]+) (.*)]],
                groups = { "filename", "row", "col", "code", "message" },
            },
            {
                pattern = [[(%g+):(%d+) ([%w-/]+) (.*)]],
                groups = { "filename", "row", "code", "message" },
            },
        }),
    },
 },
}

-- from https://github.com/jose-elias-alvarez/null-ls.nvim/issues/1256 
-- local null_ls_config = function()
--     local null_ls = require("null-ls")
--     -- add only what you need to reproduce your issue
--     null_ls.setup({
--         sources = {null_ls.builtins.diagnostics.markdownlint_cli2},
--         debug = true,
--     })
-- end

-- require("lvim.lsp.null-ls.formatters").setup({
--   { name = "stylua" },
--   { name = "prettier" },
-- })

require("lvim.lsp.null-ls.linters").setup({
  { name = "cspell", filetypes = { "markdown" } },
})
require("lvim.lsp.null-ls.code_actions").setup({
  { name = "cspell", filetypes = { "markdown" } },
} 
