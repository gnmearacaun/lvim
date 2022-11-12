lvim.colorscheme = "gruvbox"
lvim.log.level = "warn" -- warn or debug
lvim.format_on_save.enabled = false
lvim.builtin.indentlines.options.enabled = true
lvim.builtin.alpha.active = true
lvim.builtin.illuminate.active = false
lvim.builtin.bufferline.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.breadcrumbs.active = true
lvim.builtin.treesitter.highlight.enabled = true
-- lvim.builtin.telescope.defaults.initial_mode = "insert"
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
lvim.builtin.cmp.cmdline.enable = false
lvim.builtin.cmp.window.documentation = false
lvim.builtin.cmp.window.completion = {
  border = "rounded",
  winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
}
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
  timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  -- undodir = get_cache_dir() .. "/undo" -- set an undo directory
  updatetime = 300, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  laststatus = 3,
  showcmd = false,
  ruler = false,
  relativenumber = true, -- set relative numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = true,                            -- wrap long lines
  linebreak = true,                            -- break lines, not words
  scrolloff = 3,
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

vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.iskeyword:append "-" -- used in searching and recognizing with many commands
vim.opt.whichwrap:append "<,>,[,],h,l" -- let movement keys reach the previous line
vim.opt.shortmess:append "c" -- don't show the dumb matching stuff
-- To stop inserting the current comment leader automatically 
vim.opt.formatoptions:remove("c")	--	Auto-wrapping comments using 'textwidth' 
vim.opt.formatoptions:remove("r")	--	Hitting <Enter> in Insert mode.
vim.opt.formatoptions:remove("o")	--	Hitting 'o' or 'O' in Normal mode.  
vim.filetype.add {  --to get better highlighting for .conf files
  extension = {
    conf = "dosini",
  },
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
