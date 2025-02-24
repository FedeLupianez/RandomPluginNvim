local M = {}

M.mappings = require("RandomPlugin.mappings")
M.commands = require("RandomPlugin.commands")
function M.setup()
	M.mappings.setup()
	M.commands.setup()
end

return M
