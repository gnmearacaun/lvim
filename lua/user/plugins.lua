-- Additional Plugins
lvim.plugins = {
  "ellisonleao/gruvbox.nvim",
  "nvim-treesitter/playground",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "p00f/nvim-ts-rainbow",
  "mfussenegger/nvim-jdtls",
  "karb94/neoscroll.nvim",
  -- "j-hui/fidget.nvim",
  "windwp/nvim-ts-autotag",
  "kylechui/nvim-surround",
  "christianchiarulli/harpoon",
  "MattesGroeger/vim-bookmarks",
  "NvChad/nvim-colorizer.lua",
  "ghillb/cybu.nvim",
  "moll/vim-bbye",
  -- "folke/todo-comments.nvim",
  "windwp/nvim-spectre",
  "f-person/git-blame.nvim",
  "ruifm/gitlinker.nvim",
  "mattn/vim-gist",
  "mattn/webapi-vim",
  "folke/zen-mode.nvim",
  "lvimuser/lsp-inlayhints.nvim",
  "lunarvim/darkplus.nvim",
  "lunarvim/templeos.nvim",
  "kevinhwang91/nvim-bqf",
  "is0n/jaq-nvim",
  "hrsh7th/cmp-emoji",
  "nacro90/numb.nvim",
  "TimUntersberger/neogit",
  "sindrets/diffview.nvim",
  "simrat39/rust-tools.nvim",
  "olexsmir/gopher.nvim",
  "leoluz/nvim-dap-go",
  "mfussenegger/nvim-dap-python",
  "jose-elias-alvarez/typescript.nvim",
  "mxsdev/nvim-dap-vscode-js",
  {
    "saecki/crates.nvim",
    tag = "v0.3.0",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup {
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      }
    end,
  },
  {
    "jinh0/eyeliner.nvim",
    config = function()
      require("eyeliner").setup {
        highlight_on_key = true,
      }
    end,
  },
  { "christianchiarulli/telescope-tabs", branch = "chris" },
  "monaqa/dial.nvim",
  {
    "0x100101/lab.nvim",
    run = "cd js && npm ci",
  },
  -- "MunifTanjim/nui.nvim",
  -- {
  --   "folke/noice.nvim",
  --   event = "VimEnter",
  --   config = function()
  --     require("noice").setup()
  --   end,
  -- },
  -- https://github.com/jose-elias-alvarez/typescript.nvim
  -- "rmagatti/auto-session",
  -- "rmagatti/session-lens"
  --
  -- BOD
  "lunarvim/colorschemes",
  "gnmearacaun/onedarkcomment.nvim",
  {
    "ray-x/starry.nvim",
    setup = function()
  -- see example setup below
-- lua require('starry.functions').change_style("dracula_blood")
     vim.g.starry_italic_comments = true
          -- starry_italic_comments = true
          -- starry_italic_string = false
          -- starry_italic_keywords = false
          -- starry_italic_functions = false
          -- starry_italic_variables = false
          -- starry_contrast = true
          -- starry_borders = false
          -- starry_disable_background = false  "set to true to disable background and allow transparent background
          -- starry_style_fix=v:true  "disable random loading
          -- starry_style="moonlight"  "load moonlight everytime or
          -- starry_darker_contrast=v:true  "darker background
          -- starry_deep_black=false       "OLED deep black
          -- starry_italic_keywords=false
          -- starry_italic_functions=false
          -- starry_set_hl=false " Note: enable for nvim 0.6+, it is faster (loading time down to 4~6s from 7~11s), but it does
          -- " not overwrite old values and may has some side effects
          -- starry_daylight_switch=false  "this allow using brighter color
-- " other themes: dracula, oceanic, dracula_blood, 'deep ocean', darker, palenight, monokai, mariana, emerald, middlenight_blue
    end,
  },
  "vim-scripts/autoscroll.vim",
  "vimwiki/vimwiki",
  "ElPiloto/telescope-vimwiki.nvim",
  {
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end
  },
  -- end BOD
}
