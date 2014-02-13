local update = {}

local config = require "lib/config"
local http   = require "socket.http"
local ltn12  = require "ltn12"
local cjson  = require "cjson"
local tsave  = require "lib/ext/tablesave"

function update.main(arg)
	print("AwesomeWM Package Tool 0.1-alpha\n")
	
	local graph = {}
	
	print("Updating sources:")
	for line in config.remotelist() do
		local result = {}
		local resp, stat, hdr = http.request {
			url    = line,
			sink   = ltn12.sink.table(result)
		}

		if hdr then
			print("  ✔ " .. line)
			result = cjson.decode(table.concat(result))

			for i = 1, #result do
				local deps = {}
				
				for j = 1, #result[i]["dep"] do
					local deplist = {}
					
					table.insert(deplist, result[i]["dep"][j][1])
					table.insert(deplist, result[i]["dep"][j][2])
					table.insert(deps,    deplist)
				end
				
				local packageversion = {}
				local packagedata    = {}
				
				packagedata["file"] = result[i]["package"]
				packagedata["deps"] = deps
				
				packageversion[result[i]["version"]] = packagedata
				
				if not graph[result[i]["name"]] then
					graph[result[i]["name"]] = {}
				end
				
				table.insert(graph[result[i]["name"]], packageversion)
			end
		else
			print("  ✘ " .. line)
		end
	end

	table.save(graph, "config/.repository")
end

return update
