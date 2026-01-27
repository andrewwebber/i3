local status, telescope = pcall(require, "telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
-- local open_with_trouble = require("trouble.sources.telescope").open
--
local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end
--
-- local fb_actions = require "telescope".extensions.file_browser.actions
--
-- telescope.setup {
--     defaults = {
--         mappings = {
--             n = {
--                 ["q"] = actions.close,
--                 ["<c-t>"] = open_with_trouble,
--             },
--         },
--     },
--     extensions = {
--         file_browser = {
--             theme = "dropdown",
--             -- disables netrw and use telescope-file-browser in its place
--             hijack_netrw = true,
--             mappings = {
--                 -- your custom insert mode mappings
--                 ["i"] = {
--                     ["<C-w>"] = function() vim.cmd('normal vbd') end,
--                 },
--                 ["n"] = {
--                     -- your custom normal mode mappings
--                     ["N"] = fb_actions.create,
--                     ["h"] = fb_actions.goto_parent_dir,
--                     ["/"] = function()
--                         vim.cmd('startinsert')
--                     end
--                 },
--             },
--         },
--     },
-- }
--
-- telescope.load_extension("file_browser")

vim.keymap.set("n", "<leader><leader>", function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end)
vim.keymap.set("n", "\\\\", function()
	builtin.live_grep()
end)
vim.keymap.set("n", "\\b", function()
	builtin.buffers()
end)
vim.keymap.set("n", "/t", function()
	builtin.help_tags()
end)
vim.keymap.set("n", "?/", function()
	builtin.resume()
end)
vim.keymap.set("n", "\\e", function()
	builtin.diagnostics()
end)
vim.keymap.set("n", "\\f", function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		-- cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		previewer = false,
		initial_mode = "normal",
		layout_config = { height = 40 },
	})
end)
