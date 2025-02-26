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

	vim.keymap.set("n", "<leader>rn", function()
		local number = Functions.generateRandomNumber(config.defaults.min_number, config.defaults.max_number)
		put_to_buffer(tostring(number))
	end, { desc = "Generate Random number" })

	vim.keymap.set("n", "<leader>rs", function()
		local str = Functions.generateRandomString(config.defaults.length_string)
		put_to_buffer(str)
	end, { desc = "Generate Random string" })

	vim.keymap.set("n", "<leader>rf", "<CMD>RandomFormat<CR>", { desc = "Custom Format" })
end

return M
