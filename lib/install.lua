local install = {}

local config = require "lib/config"

function install.main(arg)
	if not (#arg > 1) then
		error()
	end
	
	print("TODO // implement installtion")
	for i = 2, #arg do
		print(arg[i])
	end
end

return install
