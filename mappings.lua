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

-- more keybinds!

return M
