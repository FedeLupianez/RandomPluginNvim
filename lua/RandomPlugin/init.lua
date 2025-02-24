local M = {}

function M.hello()
	print("Estoy activo")
end

function generateRandomNumber(min, max)
	return math.random(min, max)
end

function generateRandomString(lenght)
	local chars = "abcdefghijklmnopqrstvwxyzABCDEFGHIJKLMNOPQRSTVWXYZ0123456789"
	local str = ""
	for i = 1, lenght do
		local rand_index = math.random(1, #chars)
		str = str .. chars:sub(rand_index, rand_index)
	end
	return str
end

function M.RandomNumber()
	local number = generateRandomNumber(1, 999)
	print("Valor generado : " .. number)
	vim.api.nvim_put({ tostring(number) }, "", true, true)
end

function M.RandomString()
	local str = generateRandomString(14)
	print("String Generado : " .. str)
	vim.api.nvim_put({ str }, "", true, true)
end

vim.keymap.set("n", "<leader>rn", function()
	M.RandomNumber()
end, { desc = "Generate Random number" })

vim.keymap.set("n", "<leader>rs", function()
	M.RandomString()
end, { desc = "Generate Random string" })

return M
