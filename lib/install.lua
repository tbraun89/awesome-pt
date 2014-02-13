local install = {}

local config = require "lib/config"

function install.main(arg)
	if #arg > 1 then
		print("TODO // implement installtion")
		for i = 2, #arg do
			print(arg[i])
		end
	else
		error()
	end
end

return install
