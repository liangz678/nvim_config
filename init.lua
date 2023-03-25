-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
vim.g.loaded_python3_provider = 1
vim.g.python_host_prog = "C:/ProgramData/miniconda3/envs/neovim/python.exe"
vim.g.python3_host_prog = "C:/ProgramData/miniconda3/envs/neovim/python.exe"


local enable_providers = {
  "python3_provider",
  "node_provider",
  -- and so on
}

for _, plugin in pairs(enable_providers) do
  vim.g["loaded_" .. plugin] = nil
  vim.cmd("runtime " .. plugin)
end

vim.wo.relativenumber = true


