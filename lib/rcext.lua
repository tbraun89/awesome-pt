local lfs = require("lfs")

function rcext_set_left_layout(container)
	layout_left = container
end

function rcext_set_right_layout(container)
	layout_right = container
end

function rcext_get_left_layout()
	return left_layout
end

function rcext_get_right_layout()
	return layout_right
end

-- TODO implement widget path more dynamically
function load_widgets()
	local widgetsdir = lfs.currentdir() .. "/widgets/"

	for file in lfs.dir(widgetsdir) do
		if file ~= "." and file ~= ".." then
			local attr = lfs.attributes (widgetsdir .. file)
			if attr.mode == "file" and string.match(file, "lua$") then
				local widget = require("widgets/" .. string.sub(file, 1, -5))
				widget.init()
			end
		end
	end
end
