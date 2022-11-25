M = {}
lvim.leader = "space"
lvim.localleader = ""
local opts = { noremap = true, silent = true }
-- For the description on keymaps, I have a function getOptions(desc) which returns noremap=true, silent=true and desc=desc. Then call: keymap(mode, keymap, command, getOptions("some randome desc")
local keymap = vim.keymap.set
-- Insert --
-- Move the cursor
-- keymap("i", "<A-h>", "<Left>", opts)
-- keymap("i", "<A-l>", "<Right>", opts)
-- Normal --

-- Tabs --
-- keymap("n", "\\", ":tabnew %<cr>", opts)
-- keymap("n", "\\", ":tabnew %<cr>", opts)
-- keymap("n", "<s-\\>", ":tabclose<cr>", opts)
-- keymap("n", "<s-\\>", ":tabonly<cr>", opts)

-- start BOD
-- Don't reach for tab
keymap("n", "<C-i>", "<C-i>", opts)
-- Insert --
-- Move the cursor
-- keymap("i", "<A-h>", "<Left>", opts)
-- keymap("i", "<A-l>", "<Right>", opts)
-- Normal --

-- Easy colon, shift not needed
keymap("n", ";", ":", opts)
keymap("v", ";", ":", opts)
keymap("n", ":", ";", opts)
keymap("v", ":", ";", opts)
-- Get the haul out of dodge
keymap("i", "kj", "<ESC>", opts)
-- lvim.keys.insert_mode["jk"] = "<ESC>"
-- Page down/up
keymap("n", "[d", "<PageUp>", opts)
keymap("n", "]d", "<PageDown>", opts)
-- Navigating buffers
keymap("n", "to", ":<C-u>tabnew<CR>", opts)
lvim.keys.normal_mode["tj"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["tl"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["tk"] = "<cmd>Bdelete!<CR>"
-- keymap("n", "tj", ":BufferLineCyclePrev<CR>", opts)
-- keymap("n", "tl", ":BufferLineCycleNext<CR>", opts)
-- keymap("n", "tk", "<cmd>Bdelete!<CR>", opts)
-- " Toggle between last 2 buffers
-- keymap("n", "tt", "<C-^>", opts)
keymap("n", "tq", ":tabonly<cr>", opts)

--keymap("n", "<C-w>", "<cmd>Bdelete!<CR>", opts)
-- unknown functions
-- keymap("n", "tx", ":<C-u>call BufferEmpty()<CR>", opts)
-- keymap("n", "td", ":call CloseBuffer()<CR>", opts)
keymap("n", "q", "<Nop>", opts)
keymap("n", "q", "<C-w>q", opts)
-- lvim.keys.normal_mode["<C-q>"] = false
-- keymap("n", "<C-q>", "<cmd>quit<CR>", opts)
-- keymap("n", "<C-q>", ":call SmartQuit()<CR>", opts)

-- Record Macros with 'Q'. Use 'q' for quitting rapidly.
-- keymap("n", "Q", "q`]", opts)
keymap("n", "Q", "<Nop>", opts)
keymap("n", "Q", "q", opts)
-- Fast saving
keymap("n", "<C-s>", ":write<CR>", opts)
keymap("i", "<C-s>", "<C-o>:w<CR>", opts)
-- Save file and quit insert-mode
keymap("i", "<C-s>", "<Esc><cmd>w<CR>", opts)
-- Y yank until the end of line
keymap("n", "Y", "y$", opts)
keymap("n", "Y", "y$", opts)
-- Move to end of text after yank or paste
keymap('v', 'p', 'p`]', opts)
-- Navigating word wrap
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
-- Autoscroll plugin
keymap("n", "ts", "<cmd>ScrollDown<CR>", opts)
keymap("n", "tu", "<cmd>ScrollUp<CR>", opts)
keymap("n", "te", "<cmd>StopScrolling<CR>", opts)
-- Markdown Preview keybindings
keymap("n", "ms", "<cmd>MarkdownPreview<CR>", opts)
keymap("n", "tm", "<Plug>MarkdownPreviewToggle", opts)
lvim.keys.normal_mode["<M-{>"] = ":bp<cr>"
lvim.keys.normal_mode["<M-}>"] = ":bn<cr>"
-- Consistent `*` behaviour
keymap("n", "*", [[*N]], opts)
keymap("v", "*", [[y/\V<c-r>=escape(@",'/\')<cr><cr>N]], opts)
-- Here be errors
-- keymap("n", "<F5>", "<cmd>=strftime("\%c")<CR>P", opts)
-- keymap("i", "<F5>", "<cmd><C-R>=strftime("\%c")<CR>", opts)
-- Other keymappings
lvim.keys.normal_mode["s"] = false
lvim.keys.normal_mode["ss"] = false

lvim.keys.normal_mode["O"] = "O <Esc>"
-- for indentation to be respected 
lvim.keys.normal_mode["o"] = "o <BS><Esc>"
lvim.keys.normal_mode.d = [["_d]]

vim.cmd([[
nnoremap <F5> "=strftime("%c")<CR>P
inoremap <F5> <C-R>=strftime("%c")<CR>
" Save with sudo
cmap W!! w !sudo tee % >/dev/null
" Start an external command with a single she-bang
nnoremap ! :!
" Move to beginning or end of line
nnoremap B ^
nnoremap E $
" So x doesn't clobber paste buffer"
nnoremap x "_x
" Change next match in a repeatable manner
nnoremap cn *``cgn
nnoremap cN *``cgN
vnoremap <expr> cn "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgn"
vnoremap <expr> cN "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgN"
nnoremap <leader>a =ip    " Indent a paragraph
" Center highlighted search
nnoremap n nzz
nnoremap N Nzz
" Move to end of yanked text after yank
vnoremap y y`]
" Move to end of text after paste
nnoremap p p`]
vnoremap p p`]
" Replace current work with last yanked selection
nnoremap <Leader>. viw"0p
nnoremap cp yap<S-}>p
" Quick substitute within a selected area
" xnoremap s :s//g<Left><Left>
" Select last paste. Except interferes with vimdiff!!
nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'
" Paste line(s) at the bottom of the file
" nnoremap tb :mark '<cr>:$put<cr>`'
let g:AutoScrollSpeed = 1300
nnoremap <leader>wv <cmd>lua require('telescope').extensions.vw.vw()<cr>
nnoremap <leader>wg <cmd>lua require('telescope').extensions.vw.live_grep()<cr>
]])


keymap("n", "<C-Space>", "<cmd>WhichKey \\<space><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)

-- Better window navigation
keymap("n", "<M-h>", "<C-w>h", opts)
keymap("n", "<M-j>", "<C-w>j", opts)
keymap("n", "<M-k>", "<C-w>k", opts)
keymap("n", "<M-l>", "<C-w>l", opts)
keymap("n", "<M-tab>", "<C-6>", opts)

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  -- vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<m-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<m-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<m-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<m-l>", [[<C-\><C-n><C-W>l]], opts)
end

-- Normal --
vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

-- Tabs --
-- keymap("n", "\\", ":tabnew %<cr>", opts)
-- keymap("n", "\\", ":tabnew %<cr>", opts)
-- keymap("n", "<s-\\>", ":tabclose<cr>", opts)
-- keymap("n", "<s-\\>", ":tabonly<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("v", "p", '"_dP', opts)
-- keymap("v", "P", '"_dP', opts)

-- keymap("n", "q", "<cmd>Bdelete!<CR>", opts)

keymap(
  "n",
  "<F6>",
  [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>]],
  opts
)
keymap("n", "<F7>", "<cmd>TSHighlightCapturesUnderCursor<cr>", opts)
keymap("n", "<C-z>", "<cmd>ZenMode<cr>", opts)
keymap("n", "-", ":lua require'lir.float'.toggle()<cr>", opts)
keymap("n", "gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)
-- keymap("n", "<m-v>", "<cmd>lua require('lsp_lines').toggle()<cr>", opts)

-- keymap("n", "<m-/>", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<m-/>", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', opts)

vim.api.nvim_set_keymap(
  "n",
  "<tab>",
  "<cmd>lua require('telescope').extensions.harpoon.marks(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Harpoon'})<cr>",
  opts
)
vim.api.nvim_set_keymap(
  "n",
  "<s-tab>",
  "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = true, initial_mode='normal'})<cr>",
  opts
)

-- is this used anywhere?
vim.cmd [[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
]]

M.show_documentation = function()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ "vim", "help" }, filetype) then
    vim.cmd("h " .. vim.fn.expand "<cword>")
  elseif vim.tbl_contains({ "man" }, filetype) then
    vim.cmd("Man " .. vim.fn.expand "<cword>")
  elseif vim.fn.expand "%:t" == "Cargo.toml" then
    require("crates").show_popup()
  else
    vim.lsp.buf.hover()
  end
end

vim.api.nvim_set_keymap("n", "K", ":lua require('user.keymaps').show_documentation()<CR>", opts)

return M
