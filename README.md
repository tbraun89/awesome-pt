Awesome Package Tool
==========

A small test widget example:

```lua
local test = {}

local wibox   = require("wibox")

function test.init()
	local t = wibox.widget.textbox()
	t:set_text("T")
	
	rcext_get_right_layout():add(t)
end

return test
```
