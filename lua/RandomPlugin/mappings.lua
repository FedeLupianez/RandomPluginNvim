local M = {}

local Functions = require("RandomPlugin.functions")

function M.setup()
	local config = require("RandomPlugin.config").options

	vim.keymap.set("n", "<leader>rn", function()
		local number = Functions.generateRandomNumber(config.defaults.min_number, config.defaults.max_number)

		if vim.bo.modifiable then
			vim.api.nvim_put({ tostring(number) }, "c", true, true)
		else
			vim.notify(tostring(number))
		end
	end, { desc = "Generate Random number" })

	vim.keymap.set("n", "<leader>rs", function()
		local str = Functions.generateRandomString(config.defaults.length_string)

		if vim.bo.modifiable then
			vim.api.nvim_put({ str }, "c", true, true)
		else
			vim.notify(str)
		end
	end, { desc = "Generate Random string" })

	vim.keymap.set("n", "<leader>rf", "<CMD>RandomFormat<CR>")
end

return M
