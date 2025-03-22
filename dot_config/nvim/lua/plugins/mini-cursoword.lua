return {
  "echasnovski/mini.cursorword",
  version = false,
  event = "VeryLazy",
  opts = {
    -- Delay (in ms) between when cursor rests on a word and when highlighting
    -- starts
    delay = 200,

    -- Whether to highlight word under cursor (i.e. cursor is directly on a
    -- symbol from `word` character group)
    highlight_word_under_cursor = true,
  },
}
