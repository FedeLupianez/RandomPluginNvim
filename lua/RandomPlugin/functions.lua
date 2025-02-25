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

function M.formatString(input, default_min, default_max, default_lenght)
	local result = {}

	for column in string.gmatch(input, "([^,]+)") do -- Separo las columnas
		local key, value = string.match(column, "([^=]+)=([^=]+)")
		if key == "s" then
			local lenght = tonumber(value)
			if lenght then
				table.insert(result, M.generateRandomString(lenght))
			else
				table.insert(result, M.generateRandomString(default_lenght))
			end
		elseif key == "n" then
			local min_max_table = {}
			local count = 0
			for val in string.gmatch(value, "([^/]+)") do
				local num = tonumber(val)
				if num then
					table.insert(min_max_table, tonumber(val))
				else
					if count == 0 then
						table.insert(min_max_table, default_min)
						count = count + 1
					else
						table.insert(min_max_table, default_max)
						count = 0
					end
				end
			end

			if #min_max_table == 2 then
				local number = M.generateRandomNumber(min_max_table[1], min_max_table[2])
				table.insert(result, number)
			end
		end
	end
	return table.concat(result, ",")
end

return M
