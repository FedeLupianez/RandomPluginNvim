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

function insert_random_string(tableI, length)
	table.insert(tableI, M.generateRandomString(length))
end

function insert_random_number(tableI, min, max)
	table.insert(tableI, M.generateRandomNumber(min, max))
end

function M.formatString(input, default_min, default_max, default_lenght)
	local result = {}

	for column in string.gmatch(input, "([^,]+)") do -- Separo las columnas
		-- Codigo para cuando son solo las letras
		if column == "n" then
			insert_random_number(result, default_min, default_max)
			goto continue
		elseif column == "s" then
			insert_random_string(result, default_lenght)
			goto continue
		end

		-- Cuando cada columna tiene un parámetro
		local key, value = string.match(column, "([^=]+)=([^=]+)") -- Separo las key y los valores
		if key == "s" then
			local length = tonumber(value)
			if not length then
				insert_random_string(result, default_lenght)
				goto continue
			end
			insert_random_string(result, length)
		elseif key == "n" then
			local min_max_table = {}
			local count = 0
			for val in string.gmatch(value, "([^/]+)") do
				local num = tonumber(val)

				if not num then
					if count == 0 then
						table.insert(min_max_table, default_min)
						count = 1
					else
						table.insert(min_max_table, default_max)
						count = 0
					end
					goto continue
				end
				table.insert(min_max_table, tonumber(val))
				::continue::
			end

			if #min_max_table ~= 2 then
				table.insert(result, "error")
				goto continue
			end

			insert_random_number(result, min_max_table[1], min_max_table[2])
		end
		::continue::
	end
	return table.concat(result, ",")
end

return M
