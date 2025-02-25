local M = {}

local Functions = require("RandomPlugin.functions")

function M.setup()
	local config = require("RandomPlugin.config").options

	vim.keymap.set("n", "<leader>rn", function()
		local number = Functions.generateRandomNumber(config.defaults.min_number, config.defaults.max_number)
		vim.api.nvim_put({ tostring(number) }, "c", true, true)
	end, { desc = "Generate Random number" })

	vim.keymap.set("n", "<leader>rs", function()
		local str = Functions.generateRandomString(config.defaults.length_string)
		vim.api.nvim_put({ str }, "c", true, true)
	end, { desc = "Generate Random string" })
end

return M
