---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.specs = {
  -- plugin = true,
  n = {
    ["<leader>h"] = {
      function()
        require("specs").show_specs { width = 20, winhl = "Search", delay_ms = 210, inc_ms = 21 }
      end,
      "提示光标位置",
    },
    --
    -- ["<leader>v"] = {
    --   function()
    --     require("nvterm.terminal").new "vertical"
    --   end,
    --   "new vertical term",
    -- },
  },
}

M.fugitive = {
  -- plugin = true,
  n = {
    ["gps"] = { "<cmd>G push<CR>", "git push" },
    ["gpl"] = { "<cmd>G pull<CR>", "git push" },
    ["<leader>G"] = { "<cmd>Git<CR>", "Open git-fugitive" },
  },
}

M.hop = {
  -- plugin = true,
  n = {
    ["<leader>o"] = { "<cmd>HopWord<CR>", "jump: Goto word" },
    ["<leader>j"] = { "<cmd>HopLine<CR>", "jump: Goto line" },
    ["<leader>k"] = { "<cmd>HopChar1<CR>", "jump: Goto char1" },
    ["<leader>kk"] = { "<cmd>HopChar2<CR>", "jump: Goto char2" },
  },
}

M.flutter = {
  plugin = true,
  n = {
    ["<leader><C-P>"] = {
      function()
        require("telescope").extensions.flutter.commands()
      end,
    },
    ["<leader>fm"] = {
      function()
        if vim.bo.filetype == "dart" then
          -- os.execute "dart format %"
        end
        vim.lsp.buf.format { async = true }
      end,
      "lsp formatting",
    },
  },
}
-- more keybinds!

M.lsconfig = {
  n = {
    ["<leader>fdo"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "floating diagnostic",
    },
    ["<leader>fds"] = {
      function()
        vim.diagnostic.show()
      end,
      "floating diagnostic",
    },
    ["<leader>fdh"] = {
      function()
        vim.diagnostic.hide()
      end,
      "floating diagnostic",
    },
  },
}

return M
