local keys = {}

function keys.init()
  vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch", silent = true })

  vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file", silent = true })
  vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w<CR>", { desc = "Save without autocommands", silent = true })
  vim.keymap.set("n", "<C-q>", "<cmd>q<CR>", { desc = "Quit", silent = true })

  vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", silent = true })
  vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", silent = true })
  vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", silent = true })
  vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", silent = true })

  vim.keymap.set("n", "<S-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height", silent = true })
  vim.keymap.set("n", "<S-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height", silent = true })
  vim.keymap.set("n", "<S-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width", silent = true })
  vim.keymap.set("n", "<S-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width", silent = true })

  vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window", silent = true })
  vim.keymap.set("n", "<leader>v", "<C-w>v", { desc = "Split window right", silent = true })
  vim.keymap.set("n", "<leader>h", "<C-w>s", { desc = "Split window below", silent = true })
  vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equal window width", silent = true })
  vim.keymap.set("n", "<leader>xs", "<cmd>close<CR>", { desc = "Close split", silent = true })

  vim.keymap.set("n", "<S-h>", "<cmd>bprev<CR>", { desc = "Prev buffer", silent = true })
  vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer", silent = true })
  vim.keymap.set("n", "<leader>x", "<cmd>bdelete!<CR>", { desc = "Close buffer", silent = true })
  vim.keymap.set("n", "<leader>b", "<cmd>enew<CR>", { desc = "New buffer", silent = true })

  vim.keymap.set("n", "x", '"_x', { desc = "Delete without yanking", silent = true })
  vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down and center", silent = true })
  vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up and center", silent = true })
  vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center", silent = true })
  vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center", silent = true })

  vim.keymap.set("v", "<", "<gv", { desc = "Indent left and keep selection", silent = true })
  vim.keymap.set("v", ">", ">gv", { desc = "Indent right and keep selection", silent = true })
  vim.keymap.set("v", "p", '"_dP', { desc = "Paste without yanking selection", silent = true })

  vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })
  vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })

  vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", { desc = "Toggle line wrap", silent = true })

  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
  vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
  vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

  vim.keymap.set("n", "<leader>ll", "<cmd>Leet list<CR>", { desc = "LeetCode list", silent = true })
  vim.keymap.set("n", "<leader>ld", "<cmd>Leet daily<CR>", { desc = "LeetCode daily", silent = true })
  vim.keymap.set("n", "<leader>lr", "<cmd>Leet random<CR>", { desc = "LeetCode random", silent = true })
  vim.keymap.set("n", "<leader>ls", "<cmd>Leet submit<CR>", { desc = "LeetCode submit", silent = true })
  vim.keymap.set("n", "<leader>lt", "<cmd>Leet test<CR>", { desc = "LeetCode test", silent = true })

  vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })
  vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close current tab" })
  vim.keymap.set("n", "<leader>to", ":tabonly<CR>", { desc = "Close all tabs excpet current one" })
  vim.keymap.set("n", "<leader>tl", ":tabnext<CR>", { desc = "Go back to the future my g" })
  vim.keymap.set("n", "<leader>th", ":tabprevious<CR>", { desc = "Reverse moonwalk tab" })
end

return keys
