local M = {}

M.mappings = require("RandomPlugin.mappings")
M.commands = require("RandomPlugin.commands")
M.config = require("RandomPlugin.config")

function M.setup(opts)
	M.config.setup(opts)
	M.mappings.setup()
	M.commands.setup()
end

return M
