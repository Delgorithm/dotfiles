local opts = {}

function opts.init()
  vim.wo.number = true -- Make line numbers default
  vim.o.relativenumber = true -- Set relative numbered lines
  vim.o.clipboard = "unnamedplus" -- Sync clipboard between OS and Neovim
  vim.o.wrap = false -- Display lines as one long line
  vim.o.linebreak = true -- Companion to wrap, don't split words
  vim.o.mouse = "a" -- Enable mouse mode
  vim.o.autoindent = true -- Copy indent from current line when starting new one
  vim.o.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search
  vim.o.smartcase = true -- Smart case
  vim.o.shiftwidth = 2 -- The number of spaces inserted for each indentation
  vim.o.tabstop = 2 -- Insert n spaces for a tab
  vim.o.softtabstop = 2 -- Number of spaces that a tab counts for while performing editing operations
  vim.o.expandtab = true -- Convert tabs to spaces
  vim.o.scrolloff = 4 -- Minimal number of screen lines to keep above and below the cursor
  vim.o.sidescrolloff = 8 -- Minimal number of screen columns either side of cursor if wrap is `false`
  vim.o.cursorline = true -- Highlight the current line (changed to true comme sa config)
  vim.o.splitbelow = true -- Force all horizontal splits to go below current window
  vim.o.splitright = true -- Force all vertical splits to go to the right of current window
  vim.o.hlsearch = false -- Set highlight on search
  vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore
  vim.opt.termguicolors = true -- Set termguicolors to enable highlight groups
  vim.o.whichwrap = "bs<>[]hl" -- Which "horizontal" keys are allowed to travel to prev/next line
  vim.o.numberwidth = 4 -- Set number column width
  vim.o.swapfile = false -- Creates a swapfile
  vim.o.smartindent = true -- Make indenting smarter again
  vim.o.showtabline = 2 -- Always show tabs
  vim.o.backspace = "indent,eol,start" -- Allow backspace on
  vim.o.pumheight = 10 -- Pop up menu height
  vim.o.conceallevel = 0 -- So that `` is visible in markdown files
  vim.wo.signcolumn = "yes" -- Keep signcolumn on by default
  vim.o.fileencoding = "utf-8" -- The encoding written to a file
  vim.o.cmdheight = 1 -- More space in the Neovim command line for displaying messages
  vim.o.breakindent = true -- Enable break indent
  vim.o.updatetime = 250 -- Decrease update time
  vim.o.timeoutlen = 300 -- Time to wait for a mapped sequence to complete (in milliseconds)
  vim.o.backup = false -- Creates a backup file
  vim.o.writebackup = false -- If a file is being edited by another program, it is not allowed to be edited
  vim.o.undofile = true -- Save undo history
  vim.o.completeopt = "menuone,noselect,preview" -- Set completeopt to have a better completion experience
  vim.opt.shortmess:append("c") -- Don't give completion messages
  vim.opt.iskeyword:append("-") -- Hyphenated words recognized by searches
  vim.opt.formatoptions:remove({ "c", "r", "o" }) -- Don't insert the current comment leader automatically
  vim.opt.runtimepath:remove("/usr/share/vim/vimfiles") -- Separate Vim plugins from Neovim
  vim.opt.list = true -- Show space, line breaks, spaces, tabs...
  vim.opt.listchars:append("eol:↴") -- Set the sign for the EOL
  vim.opt.confirm = true -- Confirm before closing an unsaved buffer
  vim.opt.mousescroll = "ver:3,hor:0" -- Disable horizontal mouse scrolling
  vim.opt.autoread = true -- Read a file when it was changed outside of nvim
  vim.opt.autowrite = true -- Automatically write file when it was changed
  vim.opt.winbar = "" -- Disable winbar
end

return opts
