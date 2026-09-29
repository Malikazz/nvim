-- holds the splash buffer id (nil = none)
local splash_buf

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function(args)
    local buf = args.buf
    if vim.bo[buf].buftype ~= "" or buf ~= 1
       or vim.api.nvim_buf_get_name(buf) ~= "" then
      return
    end

    local lines = {
" __ _                                _           ",
"/ _\\ | ___  ___ _ __  _   _   /\\   /(_)_ __ ___  ",
"\\ \\| |/ _ \\/ _ \\ '_ \\| | | |  \\ \\ / / | '_ ` _ \\ ",
"_\\ \\ |  __/  __/ |_) | |_| |   \\ V /| | | | | | |",
"\\__/_|\\___|\\___| .__/ \\__, |    \\_/ |_|_| |_| |_|",
"     	 	      |_|    |___/                         ",
"",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⣉⣙⣷⡦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢤⣴⠖⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣉⠛⠓⠶⢤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣽⡿⠟⠁⠀⠀⠀⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠙⠛⠷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣤⣤⣤⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⡶⠶⠛⠉⠉⠉⠉⠁⠀⠀⠀⠀⠉⠙⠿⠓⠒⠶⢺⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⢶⡶⠶⠶⠶⠖⠖⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠘⣧⡀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠈⠻⢤⣼⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⢻⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡀⢀⣿⡿⠶⠶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⢸⡇⠀⣀⣀⠀⢀⣀⣤⡀⠀⠀⠀⠀⠸⠶⠶⠚⠛⠋⢹⣿⣿⣟⣉⠉⠒⠀⠻⣦⣠⣤⣤⣤⣄⣀⠀⠀",
"⠀⢀⣤⢾⣿⣷⣶⡍⠙⠙⠛⠋⠉⠀⠀⢴⡶⠀⠀⠀⠀⢀⣠⡶⠟⠛⠛⣷⠀⠉⠁⠀⠀⠈⣧⡀⠀⠩⣀⠈⢹⣆",
"⠀⣠⠔⢉⡴⢿⣿⡟⠛⠛⠛⠶⣤⣀⠀⠀⠀⠀⠀⠀⣴⡿⠋⠀⠀⠀⢀⡉⠀⠀⠀⠀⢀⣼⠛⠛⢛⣿⡿⠀⣾⡟",
"⠀⠁⣰⠋⢀⡿⠁⠀⠀⠀⠀⠀⠀⠉⠻⣦⡀⠀⠀⣼⠟⠀⠀⠀⢀⣠⣾⢁⣀⣤⣴⡶⠟⣁⣴⠞⠋⠉⢀⣼⣿⠁",
"⠀⠀⠉⠀⠈⠷⣄⡀⠀⠀⠀⠀⠀⠀⠀⠈⢿⡗⠚⡏⠀⢀⣤⡶⠛⠋⠉⠉⠉⠉⠀⣠⣾⠟⢁⣀⣤⣶⣿⠟⠁⠀",
"⠀⠀⠀⠀⠀⠀⠀⠈⠉⠑⠲⠤⣄⣦⣤⡴⠞⠁⠀⠉⠙⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠹⠿⠾⠾⠟⠛⠁⠀⠀⠀⠀",
    }

    -- horizontal centering
    local width = vim.api.nvim_win_get_width(0)
    local strdisplaywidth = vim.fn.strdisplaywidth
    local centered = {}
    for _, line in ipairs(lines) do
      local pad = math.floor((width - strdisplaywidth(line)) / 2)
      table.insert(centered, string.rep(" ", math.max(pad, 0)) .. line)
    end

    -- vertical centering
    local height = vim.api.nvim_win_get_height(0)
    local top_pad = math.floor((height - #centered) / 2)
    for _ = 1, math.max(top_pad - 1, 0) do
      table.insert(centered, 1, "")
    end

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, centered)

    vim.bo[buf].buftype    = "nofile"
    vim.bo[buf].swapfile   = false
    vim.bo[buf].modifiable = false
    vim.bo[buf].modified   = false

    -- remember it so we can clean it up later
    splash_buf = buf
  end,
})

-- wipe the splash buffer as soon as a real file is opened
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  callback = function(args)
    if splash_buf
       and vim.api.nvim_buf_is_valid(splash_buf)
       and args.buf ~= splash_buf then
      vim.api.nvim_buf_delete(splash_buf, { force = true })
      splash_buf = nil
    end
  end,
})

