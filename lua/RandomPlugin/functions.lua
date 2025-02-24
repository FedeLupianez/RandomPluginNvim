local M = {}

function M.generateRandomNumber(min, max)
	return math.random(min, max)
end

function M.generateRandomString(lenght)
	local chars = "abcdefghijklmnopqrstvwxyzABCDEFGHIJKLMNOPQRSTVWXYZ0123456789"
	local str = ""
	for i = 1, lenght do
		local rand_index = math.random(1, #chars)
		str = str .. chars:sub(rand_index, rand_index)
	end
	return str
end

return M
