-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    ["<leader>w"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
    -- Navigate buffers
    ["<S-l>"] = { ":bnext<CR>", desc = "next buffer" },
    ["<S-h>"] = { ":bprevious<CR>", desc = "prev buffer" },
    ["<leader>v"] = { ":vsplit<CR>", desc = "split vertically" },
    ["<leader>H"] = { ":split<CR>", desc = "split horizontally" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    --move text left and right
    ["H"] = { "<gv" },
    ["L"] = { ">gv" },
    --move text up and down
    ["K"] = { ":move '<-2<CR>gv-gv" },
    ["J"] = { ":move '>+1<CR>gv-gv" },
    ["jk"] = { "<ESC>" },
    ["<leader>c"] = {
      function()
        require("chatgpt").edit_with_instructions()
      end, desc = "Chat with GPT-3" }
  },
  x = {
    --move text left and right
    ["H"] = { "<gv" },
    ["L"] = { ">gv" },
    --move text up and down
    ["K"] = { ":move '<-2<CR>gv-gv" },
    ["J"] = { ":move '>+1<CR>gv-gv" },
    ["jk"] = { "<ESC>" }
  },
  i = {
    ["<C-l>"] = { 'copilot#Accept("<CR>")', silent = true, expr = true },
  }
}
