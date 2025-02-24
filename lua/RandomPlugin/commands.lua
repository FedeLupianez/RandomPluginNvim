local M = {}

local Functions = require("RandomPlugin.functions")

function M.setup()
	vim.api.nvim_create_user_command("RandomNumber", function()
		local min = vim.fn.input("min : ")
		local max = vim.fn.input("max : ")
		local result = Functions.generateRandomNumber(min, max)
		vim.api.nvim_put({ tostring(result) }, "c", true, true)
	end, {})

	vim.api.nvim_create_user_command("RandomString", function()
		local length = vim.fn.input("Longitud : ")
		local result = Functions.generateRandomString(length)
		vim.api.nvim_put({ result }, "c", true, true)
	end, {})
end

return M
