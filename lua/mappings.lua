require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>cs", function()
  local temp_file = vim.fn.tempname()
  local cmd = "codespell " .. vim.fn.expand "%:p" .. " > " .. temp_file
  vim.fn.system(cmd)

  if vim.fn.filereadable(temp_file) == 1 then
    vim.cmd("e " .. temp_file)
  else
    print "No issues found by codespell"
  end
end, { desc = "Run codespell and display results" })
