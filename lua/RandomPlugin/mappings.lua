local M = {}

local Functions = require("RandomPlugin.functions")

function put_to_buffer(value)
	if vim.bo.modifiable then
		vim.api.nvim_put({ value }, "c", true, true)
		return
	end
	vim.notify(value)
end

function M.setup()
	local config = require("RandomPlugin.config").options
	local keymaps = require("RandomPlugin.config").options.keymaps

	vim.keymap.set("n", keymaps.random_number, function()
		local number = Functions.generateRandomNumber(config.defaults.min_number, config.defaults.max_number)
		put_to_buffer(tostring(number))
	end, { desc = "Generate Random number" })

	vim.keymap.set("n", keymaps.random_string, function()
		local str = Functions.generateRandomString(config.defaults.length_string)
		put_to_buffer(str)
	end, { desc = "Generate Random string" })

	vim.keymap.set("n", keymaps.random_format, "<CMD>RandomFormat<CR>", { desc = "Custom Format" })
end

return M
