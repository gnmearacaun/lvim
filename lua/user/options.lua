-- lvim.colorscheme = "gruvbox"
lvim.colorscheme = "gruvbox"
lvim.log.level = "warn" -- warn or debug
lvim.format_on_save.enabled = false
lvim.builtin.indentlines.options.enabled = true
lvim.builtin.alpha.active = true
-- lvim.builtin.cmp.completion.autocomplete = false --for c-space to work for completion
lvim.builtin.illuminate.active = false
lvim.builtin.bufferline.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.terminal.open_mapping = [[<c-t>]]
lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.nvimtree.setup.view.side = "left"
-- lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.reload_config_on_save = true
lvim.builtin.lir.show_hidden_files = false
lvim.builtin.breadcrumbs.active = true
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.telescope.defaults.initial_mode = "insert"
lvim.builtin.telescope.pickers = {
  find_files = {
    layout_config = {
      width = 0.95,
    },
  },
  live_grep = {
    layout_config = {
      width = 0.95,
    },
  },
}
lvim.builtin.dap.active = true
-- lvim.builtin.cmp.cmdline.enable = false
-- lvim.builtin.cmp.window.documentation = false
-- lvim.builtin.cmp.window.completion = {
--   border = "rounded",
--   winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
-- }

lvim.builtin.cmp.formatting.source_names = {
  nvim_lsp = "",
  emoji = "",
  path = "",
  calc = "",
  vsnip = "",
  luasnip = "",
  buffer = "",
  tmux = "",
  treesitter = "",
}
-- vim.g.netrw_browse_split = 0
-- vim.g.netrw_banner = 0
-- vim.g.netrw_winsize = 25
lvim.transparent_window = true
lvim.builtin.nvimtree.setup.sync_root_with_cwd = false
lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true
lvim.builtin.nvimtree.setup.actions.open_file.resize_window = true
lvim.builtin.project.manual_mode = true -- to set the directory for searching with project.nvim
-- lvim.lsp.diagnostics.float.focusable = true -- focus a popup by pressing gl twice

vim.opt.fixeol = false --not to add a newline at end of file on save. True is the default in vim
-- folding
vim.opt.foldmethod = "expr" --can use za to toggle folds
vim.opt.foldexpr   = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99 -- you probably want that as well

local options = {
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 1, -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 20, -- pop up menu height
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  showtabline = 0, -- always show tabs
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  -- undodir = get_cache_dir() .. "/undo" -- set an undo directory
  updatetime = 300, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  cursorline = false, -- highlight the current line
  number = true, -- set numbered lines
  laststatus = 3,
  showcmd = false,
  ruler = false,
  relativenumber = false, -- set relative numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = true,                   -- wrap long lines
  linebreak = true,              -- break lines, not words
  whichwrap = "bs<>[]hl",        -- which "horizontal" keys are allowed to travel to prev/next line
  scrolloff = 7,
  sidescrolloff = 8,
  guifont = "monospace:h17", -- the font used in graphical neovim applications
  title = true,
  -- colorcolumn = "80",
  -- colorcolumn = "120",
}
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- TODO
	-- Characters to fill the statuslines, vertical separators and special lines in the window.
	-- It is a comma-separated list of items.  Each item has a name, a colon and the value of that item:
-- vim.opt.fillchars.eob = " "
-- vim.opt.fillchars = vim.opt.fillchars + "vertleft: " -- '┤' or '|'	left facing vertical separator
-- vim.opt.fillchars = vim.opt.fillchars + "vertright: " -- '├' or '|'	right facing vertical separator
vim.opt.fillchars = vim.opt.fillchars + "eob: " --  empty lines at the end of a buffer
vim.opt.fillchars:append {
  stl = " ", --  statusline of the current window
	--   fold		'·' or '-'	filling 'foldtext'
	--   foldopen	'-'		mark the beginning of a fold
	--   foldclose	'+'		show a closed fold
	--   foldsep	'│' or '|'      open fold middle marker
	--   diff		'-'		deleted lines of the 'diff' option
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.listchars = "nbsp:␣,space:·,trail:·"
vim.opt.list = true
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
-- vim.opt.shortmess = "ilmnrx"                        -- flags to shorten vim messages, see :help 'shortmess'
vim.opt.iskeyword:append "-"                           -- hyphenated words recognized by searches
vim.opt.shortmess:append "c"                           -- don't give |ins-completion-menu| messages
vim.opt.formatoptions:remove({ "c", "r", "o" })        -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.

vim.filetype.add {  --to get better highlighting for .conf files
  extension = {
    conf = "dosini",
  },
}


vim.api.nvim_clear_autocmds { pattern = { "gitcommit", "markdown" }, group = "_filetype_settings" } -- so that random words aren't underlined in markdown
