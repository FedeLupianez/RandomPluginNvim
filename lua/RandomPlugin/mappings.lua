local M = {}

local Functions = require("RandomPlugin.functions")
local defaults = require("RandomPlugin.config").options.defaults

function M.setup()
	vim.keymap.set("n", "<leader>rn", function()
		local number = Functions.generateRandomNumber(defaults.min_number, defaults.max_number)
		vim.api.nvim_put({ tostring(number) }, "c", true, true)
	end, { desc = "Generate Random number" })

	vim.keymap.set("n", "<leader>rs", function()
		local str = Functions.generateRandomString(defaults.length_string)
		vim.api.nvim_put({ str }, "c", true, true)
	end, { desc = "Generate Random string" })
end
return M
