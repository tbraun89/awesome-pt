local config = {}

function config.remotelist()
	return io.lines("config/source")
end

return config
