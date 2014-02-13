local list = {}

local tsave  = require "lib/ext/tablesave"

local function listavailable(arg, graph)
	if not graph[arg[2]] then
		print("  Package \"" .. arg[2] .. "\" not found in the repository. If")
		print("  you added a new remote source or an existing remote source has")
		print("  changed, run the update command and try it again.")
		return
	end
		
	for i = 1, #graph[arg[2]] do
		for k,v in pairs(graph[arg[2]][i]) do
			print("  ~> " .. k)
		end
	end
end

local function listinstalled()
	print("  TODO implement this function")
end

function list.main(arg)
	print("AwesomeWM Package Tool 0.1-alpha\n")
	
	if not (#arg >= 1) then
		error()
	end
	
	local graph, err = table.load("config/.repository")
	
	if err then
		error()
	end
	
	print("List:")
	
	if #arg == 1 then
		listinstalled()
	else
		listavailable(arg, graph)
	end
end

return list
