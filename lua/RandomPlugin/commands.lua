local M = {}

local Functions = require("RandomPlugin.functions")
local defaults = require("RandomPlugin.config").options.defaults

function M.setup()
	vim.api.nvim_create_user_command("RandomNumber", function()
		local min = vim.fn.input("min : ")
		local max = vim.fn.input("max : ")
		local result = Functions.generateRandomNumber(min, max)

		if vim.bo.modifiable then
			vim.api.nvim_put({ tostring(result) }, "c", true, true)
		else
			vim.notify(tostring(result))
		end
	end, {})

	vim.api.nvim_create_user_command("RandomString", function()
		local length = vim.fn.input("Longitud : ")
		local result = Functions.generateRandomString(length)

		if vim.bo.modifiable then
			vim.api.nvim_put({ result }, "c", true, true)
		else
			vim.notify(result)
		end
	end, {})

	vim.api.nvim_create_user_command("RandomFormat", function()
		local format = vim.fn.input("Formato : ")
		local result = Functions.formatString(format, defaults.min_number, defaults.max_number, defaults.length_string)

		if vim.bo.modifiable then
			vim.api.nvim_put({ result }, "l", true, true)
		else
			vim.notify(result)
		end
	end, {})
end

return M
