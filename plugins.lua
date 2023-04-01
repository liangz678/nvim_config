local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  -- 自动切换输入法
  {
    "brglng/vim-im-select",
    lazy = false,
    config = function()
      vim.g.im_select_command = "im-select.exe"
      vim.g.im_select_default = "1033"
      vim.g.im_select_enable_focus_events = 0
    end,
  },

  {
    "zbirenbaum/neodim",
    lazy = false,
    event = "LspAttach",
    config = function()
      require("neodim").setup {
        alpha = 0.75,
        blend_color = "#000000",
        update_in_insert = {
          enable = true,
          delay = 100,
        },
        hide = {
          virtual_text = true,
          signs = true,
          underline = true,
        },
      }
    end,
  },

  {
    "karb94/neoscroll.nvim",
    lazy = false,
    config = function()
      require("neoscroll").setup {
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil, -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
        performance_mode = false, -- Disable "Performance Mode" on all buffers.
      }
    end,
  },

  {
    "rainbowhxch/accelerated-jk.nvim",
    lazy = false,
    config = function()
      vim.api.nvim_set_keymap("n", "j", "<Plug>(accelerated_jk_gj)", {})
      vim.api.nvim_set_keymap("n", "k", "<Plug>(accelerated_jk_gk)", {})
    end,
  },

  {
    "edluffy/specs.nvim",
    lazy = false,
    config = function()
      require("specs").setup {
        show_jumps = true,
        min_jump = 30,
        popup = {
          delay_ms = 0, -- delay before popup displays
          inc_ms = 10, -- time increments used for fade/resize effects
          blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
          width = 10,
          winhl = "PMenu",
          fader = require("specs").linear_fader,
          resizer = require("specs").shrink_resizer,
        },
        ignore_filetypes = {},
        ignore_buftypes = {
          nofile = true,
        },
      }
    end,
  },

  {
    "rhysd/clever-f.vim",
    lazy = false,
  },

  {
    "tpope/vim-fugitive",
    lazy = true,
    cmd = { "Git", "G" },
  },

  {
    "gelguy/wilder.nvim",
    lazy = false,
    event = "CmdlineEnter",
    dependencies = {
      "romgrk/fzy-lua-native",
    },
    config = function()
      local wilder = require "wilder"
      wilder.setup { modes = { ":", "/", "?" } }

      wilder.set_option("use_python_remote_plugin", 0)
      wilder.set_option("pipeline", {
        wilder.branch(
          wilder.cmdline_pipeline { use_python = 0, fuzzy = 1, fuzzy_filter = wilder.lua_fzy_filter() },
          wilder.vim_search_pipeline(),
          {
            wilder.check(function(_, x)
              return x == ""
            end),
            wilder.history(),
          }
        ),
      })

      wilder.set_option(
        "renderer",
        wilder.wildmenu_renderer {
          highlighter = wilder.basic_highlighter(),
        }
      )
    end,
  },

  {
    "phaazon/hop.nvim",
    lazy = false,
    branch = "v2", -- optional but strongly recommended
    config = function()
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end,
  },

  {
    "codota/tabnine-nvim",
    lazy = false,
    build = "pwsh.exe -file .\\dl_binaries.ps1",
    config = function()
      require("tabnine").setup {
        disable_auto_comment = true,
        accept_keymap = "<Tab>",
        dismiss_keymap = "<C-]>",
        debounce_ms = 800,
        suggestion_color = { gui = "#808080", cterm = 244 },
        exclude_filetypes = { "TelescopePrompt" },
      }
    end,
  },

  {
    "p00f/clangd_extensions.nvim",
    lazy = false,
    config = function()
      -- require "custom.configs.clangd_extensions"
    end,
  },

  {
    "akinsho/flutter-tools.nvim",
    init = require("core.utils").load_mappings "flutter",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
      require "custom.configs.flutter"
    end,
  },

  {
    "dart-lang/dart-vim-plugin",
    lazy = false,
    config = function()
      vim.g.dart_format_on_save = 1
    end,
  },
  ---------------------------------------
  -- Override plugin definition options
  ---------------------------------------

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- Uncomment if you want to re-enable which-key
  -- {
  --   "folke/which-key.nvim",
  --   enabled = true,
  -- },
}

return plugins
