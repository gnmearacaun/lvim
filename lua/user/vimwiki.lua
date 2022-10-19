-- === credit goes here: https://github.com/dgiacomo/Neovim-from-scratch/blob/master/lua/user/vimwiki.lua 
vim.g.vimwiki_list = {
  {
    path = '~/scripts/vimwiki/notewiki',
    syntax = 'markdown',
    ext = '.md',
  },
}
vim.g.vimwiki_ext2syntax = {
  ['.md'] = 'markdown',
  ['.markdown'] = 'markdown',
  ['.mdown'] = 'markdown',
}
vim.g.vimwiki_global_ext = 0 -- don't treat all md files as vimwiki
vim.g.vimwiki_folding = "list"
vim.g.vimwiki_hl_headers = 1  -- use alternating colours for different heading levels
vim.g.vimwiki_markdown_link_ext = 1 -- add markdown file extension when generating links
vim.g.taskwiki_markdown_syntax = "markdown"
vim.g.indentLine_conceallevel = 2 -- indentline controlls concel
--vim.set.o.conceallevel = 1 -- so that I can see `` and full urls in markdown files

vim.api.nvim_set_keymap("n", "<F3>", ":VimwikiDiaryPrevDay<CR>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "<F4>", ":VimwikiDiaryNextDay<CR>", { noremap = true, silent = true, nowait = true })

vim.cmd [[
 autocmd BufNewFile */diary/????-??-??.md call New_vimwiki_diary_template()

function New_vimwiki_diary_template()
"" If it's Friday, open a end of week lookback template
   if system('date +%u') == 5
        read ~/vimwiki/Diary\ TemplateEndOfWeek.md | execute "normal ggdd"
    else
        read  ~/vimwiki/Diary\ Template.md | execute "normal ggdd"
    end
 endfunction
]]

-- Function to create taskwiki   
function vimwikiSubtask(text)
  local pos = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  -- Lua string concat is done via .. instead of + : "text" .. var is equiv to "text" + var in most languages
  local txt = "##" .. text .. " || project:" .. text
  local nline = line:sub(0, pos) .. txt .. line:sub(pos + 1)
  vim.api.nvim_set_current_line(nline)
end

-- This was pretty hard to find - how to pass an argument to a vim function : https://stackoverflow.com/questions/3213657/vim-how-to-pass-arguments-to-functions-from-user-commands
-- Also need to use a syntax like command! <commandName> lua <lua function>() as the generic way to map a lua function to a vim cmd
vim.cmd([[command! -nargs=1 VimWikiSubTask lua vimwikiSubtask(<f-args>)]])

--   ===Ye old Vimwiki config=== 
-- 	-- { "vimwiki/vimwiki", event = "BufWinEnter" },
--   -- use {
--   --     'vimwiki/vimwiki',
--   --     config = function()
--   --         vim.g.vimwiki_list = {
--   --             {
--   --                 path = '/home/briain/scripts/vimwiki/',
--   --                 syntax = 'markdown',
--   --                 ext = '.md',
--   --             }
--   --         }
--   --     end
--   -- }
-- -- " Vimwiki 
-- -- function! OpenNoteWiki()
-- --   call vimwiki#base#goto_index(2)
-- -- "  execute ':Calendar'
-- -- endfunction
-- -- nnoremap t2 :call OpenNoteWiki()<cr>
-- -- function! OpenThisWiki()
-- --   call vimwiki#base#goto_index(3)
-- -- endfunction
-- -- nnoremap t3 :call OpenThisWiki()<cr>
-- -- function! OpenTechWiki()
-- --   call vimwiki#base#goto_index(4)
-- -- endfunction
-- -- nnoremap t4 :call OpenTechWiki()<cr>
-- -- let g:vimwiki_list = [{
-- --           \ 'path': '~/scripts/vimwiki',
-- --           \ 'template_path': '~/scripts/vimwiki/templates/',
-- --           \ 'template_default': 'default',
-- --           \ 'syntax': 'markdown', 
-- --           \ 'ext': '.md',
-- --           \ 'path_html': '~/scripts/vimwiki/site_html/',
-- --           \ 'custom_wiki2html': 'vimwiki_markdown',
-- --           \ 'template_ext': '.tpl'
-- --           \ },
-- --           \ {
-- --               \ 'path': '~/scripts/vimwiki/notewiki',
-- --               \ 'template_path': '~/scripts/vimwiki/templates/',
-- --               \ 'template_default': 'default',
-- --               \ 'syntax': 'markdown',
-- --               \ 'ext': '.md',
-- --               \ 'path_html': '~/scripts/vimwiki/notewiki/site_html/',
-- --               \ 'custom_wiki2html': 'vimwiki_markdown',
-- --               \ 'template_ext': '.tpl'},
-- --               \ {'path': '~/scripts/vimwiki/thiswiki'},
-- --               \ {'path': '~/scripts/vimwiki/techwiki'}
-- --               \]
-- -- ]])

-- 
-- ===Stuff to try later:=== 

-- https://dev.to/psiho/vimwiki-how-to-automate-wikis-per-project-folder-neovim-3k72

-- Mirko Vukušić
-- Mirko Vukušić

-- Posted on Feb 11
-- VimWiki: how to automate wikis per project folder (Neovim)
-- #linux
-- #vim

-- Neovim is grabbing more and more pieces of my workflow from other systems, and last two pieces are notes and tasks.
-- Org-mode plugins are great, but focused more on tasks.

-- However, one small thing almost made me adopt org-mode instead of VimWiki. That is ease of creating .org files anywhere, and that usually means in many of my project folders. I like to have all my project related stuff inside individual project folders, leave it or hide it from source control, backup, sync, ... I don't like scattered files.

-- Of course, VimWiki can have multiple wikis... just add them to your config. Ah, not my preferred way of managing any list. Who wants to edit wiki config manually every time there is a new project.

-- So this is what I did to automate it. Please note it requires Neovim (script is written in Lua), Linux (or better to say find which I use for searching folders, and optionally Fzf (but this can be easily changed).

-- General idea
-- ... is to use find to search for a wiki folder recursively in projects_folder. Then, result list is used to dynamically populate VimWiki global variable containing list of wikis (g:vimwiki_list) and tell VimWiki to refresh the list. Now, VimWiki's <Leader>ws is populated with project wikis! Wikis defined in config are there too, so you can still manually add wikis outside of projects folder if you want.
-- Using VimWiki's original wiki search feature

-- Minimal code for the above is:

-- -- configuration
-- local config = {
--     projectsFolder = '/home/your_user/work/', --full path without ~
--     maxDepth = 3,
--     ignoreFolders = { 'node_modules', '.git' },
--     rootWikiFolder = '_wiki',
--     wikiConfig = { syntax='markdown', ext='.md' }
-- }

-- -- store original vimwiki_list config, we will need it later
-- -- !!!make sure vimwiki plugin is loaded before running this!!!
-- if vim.g.vimwiki_list == nil then
--     error('VimWiki not loaded yet! make sure VimWiki is initialized before my-projects-wiki')
-- else
--     _G.vimwiki_list_orig = vim.fn.copy(vim.g.vimwiki_list) or {}
-- end

-- -- function to update g:vimwiki_list config item from list of subfolder names (append project wikis)
-- --   this way, orginal <Leader>ws will get new project wikis in the list and also keep ones from config
-- local function updateVimwikiList(folders)
--     local new_list = vim.fn.copy(vimwiki_list_orig)
--     for _, f in ipairs(folders) do
--         local item = {
--             path = config.projectsFolder..f,
--             syntax = config.wikiConfig.syntax,
--             ext = config.wikiConfig.ext
--         }
--         table.insert(new_list, item)
--     end
--     vim.g.vimwiki_list = new_list
--     vim.api.nvim_call_function('vimwiki#vars#init',{})
-- end

-- -- function to search project folders for root wiki folders (returns system list)
-- local function searchForWikis()
--     local command = 'find ' .. config.projectsFolder ..
--         ' -maxdepth ' .. config.maxDepth
--     if #config.ignoreFolders > 0 then command = command .. " \\(" end
--     for _, f in ipairs(config.ignoreFolders) do
--         command = command .. " -path '*/"..f.."/*' -prune"
--         if next(config.ignoreFolders,_) == nil then
--             command = command .. " \\) -o"
--         else
--             command = command .. " -o"
--         end
--     end
--     command = command .. ' -type d -name ' .. config.rootWikiFolder
--     command = command .. ' -print | '
--     command = command .. ' sed s#' .. config.projectsFolder .. '##'
--     local list = vim.api.nvim_call_function('systemlist', {command})
--     return list
-- end

-- Now, you just have to call updateVimwikiList(searchForWikis()) somewhere to populate VimWiki with project wikis. There are so many options to do this. You can define a new command to do it manually, you can remap VimWiki's <Leader>ws to execute it before displaying a list of wikis, or you can simply call it at the bottom of the script to refresh the list on Neovim start (downside of this method is that new _wiki folders will not be detected till you restart).

-- Extend it with Fzf fuzzy-find menu

-- However, I took a different approach. Script is really fast, so I don't mind running it every time I'm searching for wikis. Also, I use Fzf fuzzy-finder. So I decided to feed the list to Fzf for a nice fuzzy-find menu. This will replace default VimWiki's wiki select feature which is not very nice, especially for larger number of projects.

-- Here is the additional code, just below the above code:

-- -- wrapper for Vimwiki's goto_index() to bypass :VimWikiUISelect and use FZF instead
-- -- if wiki is passed to the function, index page is opened directly, bypassing FZF
-- function _G.ProjectWikiOpen(name)
--     -- show fzf wiki search if no wiki passed
--     if not name then
--         local wikis = searchForWikis()
--         updateVimwikiList(searchForWikis())
--         for _,f in ipairs(vimwiki_list_orig) do table.insert(wikis,f.path) end
--         local options = {
--             sink = function(selected) ProjectWikiOpen(selected) end,
--             source = wikis,
--             options = '--ansi --reverse --no-preview',
--             window = {
--                 width = 0.3,
--                 height = 0.6,
--                 border = 'sharp'
--             }
--         }
--         vim.fn.call('fzf#run', {options})
--     else
--         for i, v in ipairs(vim.g.vimwiki_list) do
--             if v.path == name or v.path == config.projectsFolder..name then
--                 vim.fn.call('vimwiki#base#goto_index',{i})
--                 return
--             end
--         end
--         print("Error. Selected project wiki not found")
--     end
-- end


-- -- add commands
-- vim.api.nvim_command([[command! -nargs=? ProjectWikiOpen lua ProjectWikiOpen(<f-args>)]])

-- -- add keybindings
-- vim.api.nvim_set_keymap("n", "<Leader>wp", ":ProjectWikiOpen<CR>", { noremap=true })

-- So, a new :ProjectWikiOpen command is registered and mapped to wp. I like this key combo better than original <Leader>ws. This leaves you with a very simple workflow... just add _wiki folder to any project and hit <Leader>wp. Fzf menu will open and it will already be there. Just select it and VimWiki takes over.
-- todo

-- 1) Finish Project/Session switcher script - For me, everything is a project and everything project related is in a project folder. That's why I also have a few scripts to easily manage/switch my projects in Neovim. Those integrate project sessions (using mksession), automatic fuzzy-finder for projects (using find to search for .git folders to find roots), and Kitty terminal project launcher integrated in Dmenu which starts project environment using Kitty terminal: opens few Kitty windows and tabs with Neovim (session preloaded), LazyGit, few terminals, etc. It's almost done so hopefully I find the time to publish that too.

-- 2) Finish synchronization with mobile phone - I want my wikis on the go too. This is almost done with Syncthing client on my laptop, server (Nextcloud) and mobile phone. Wikis are pushed and synchronized on all devices. Currently trying Obsidian Android app to read/manage wikis on the mobile side.

-- 3) Integrate VimWiki tasks and taskwarrior (or similar)
-- Discussion (0) 
