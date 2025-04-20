local keys = {}

-- INFO:
-- Plugin specific keymaps are under their respective file in plugins/*
function keys.init()
  -- Leader key est déjà défini dans init.lua

  -- Clear search with <esc>
  vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch", silent = true })

  -- Save and quit
  vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file", silent = true })
  vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w<CR>", { desc = "Save without autocommands", silent = true })
  vim.keymap.set("n", "<C-q>", "<cmd>q<CR>", { desc = "Quit", silent = true })

  -- Window cursor movement
  vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", silent = true })
  vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", silent = true })
  vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", silent = true })
  vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", silent = true })

  -- Resize window (combinaison des deux approches)
  vim.keymap.set("n", "<S-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height", silent = true })
  vim.keymap.set("n", "<S-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height", silent = true })
  vim.keymap.set("n", "<S-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width", silent = true })
  vim.keymap.set("n", "<S-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width", silent = true })

  -- Windows management
  vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window", silent = true })
  vim.keymap.set("n", "<leader>v", "<C-w>v", { desc = "Split window right", silent = true })
  vim.keymap.set("n", "<leader>h", "<C-w>s", { desc = "Split window below", silent = true })
  vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equal window width", silent = true })
  vim.keymap.set("n", "<leader>xs", "<cmd>close<CR>", { desc = "Close split", silent = true })

  -- Tab management
  vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "New Tab", silent = true })
  vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close Tab", silent = true })
  vim.keymap.set("n", "<leader>tn", "<cmd>tabnext<CR>", { desc = "Next tab", silent = true })
  vim.keymap.set("n", "<leader>tp", "<cmd>tabprev<CR>", { desc = "Prev tab", silent = true })

  -- Buffer navigation
  vim.keymap.set("n", "<S-h>", "<cmd>bprev<CR>", { desc = "Prev buffer", silent = true })
  vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer", silent = true })
  vim.keymap.set("n", "<leader>x", "<cmd>bdelete!<CR>", { desc = "Close buffer", silent = true })
  vim.keymap.set("n", "<leader>b", "<cmd>enew<CR>", { desc = "New buffer", silent = true })

  -- Movement and editing improvements from your config
  vim.keymap.set("n", "x", '"_x', { desc = "Delete without yanking", silent = true })
  vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down and center", silent = true })
  vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up and center", silent = true })
  vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center", silent = true })
  vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center", silent = true })

  -- Visual mode improvements
  vim.keymap.set("v", "<", "<gv", { desc = "Indent left and keep selection", silent = true })
  vim.keymap.set("v", ">", ">gv", { desc = "Indent right and keep selection", silent = true })
  vim.keymap.set("v", "p", '"_dP', { desc = "Paste without yanking selection", silent = true })

  -- Move lines in visual mode (de sa config)
  vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })
  vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })

  -- Toggle wrap
  vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", { desc = "Toggle line wrap", silent = true })

  -- Diagnostic navigation
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
  vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
  vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

  -- Search and replace
  vim.keymap.set("n", "<leader>si", [[:%s/]], { noremap = true, silent = false, desc = "Start search and replace" })

  -- Open URL
  vim.keymap.set("n", "<leader>à", function()
    local line = vim.fn.getline(".")
    local url = string.match(line, "https?://[%w-_%.%?%.:/%+=&]+")
    if url then
      vim.fn.jobstart({ "open", url }, { detach = true })
      print("Opening URL: " .. url)
    else
      print("No URL found on the current line")
    end
  end, { noremap = true, silent = true, desc = "Open URL on the current line" })

  -- LeetCode (de votre config, gardé pour compatibilité)
  vim.keymap.set("n", "<leader>ll", "<cmd>Leet list<CR>", { desc = "LeetCode list", silent = true })
  vim.keymap.set("n", "<leader>ld", "<cmd>Leet daily<CR>", { desc = "LeetCode daily", silent = true })
  vim.keymap.set("n", "<leader>lr", "<cmd>Leet random<CR>", { desc = "LeetCode random", silent = true })
  vim.keymap.set("n", "<leader>ls", "<cmd>Leet submit<CR>", { desc = "LeetCode submit", silent = true })
  vim.keymap.set("n", "<leader>lt", "<cmd>Leet test<CR>", { desc = "LeetCode test", silent = true })
end

return keys
