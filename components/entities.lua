local Concord = require("libraries.Concord.concord")
local Vector = require("libraries.brinevector.brinevector")

Concord.component("moveable")
Concord.component("facing_right", function(c, facing_right)
	c.value = facing_right
end)
Concord.component("position", function(c, position)
	c.vector = position or Vector(50, 50)
end)
Concord.component("velocity", function(c, velocity)
	c.vector = velocity or Vector(0, 0)
end)
Concord.component("direction", function(c, direction)
	c.vector = direction or Vector(0, 0)
end)
Concord.component("action", function(c, action)
	c.value = "idle"
end)
Concord.component("aiming", function(c, aiming)
	c.vector = aiming or Vector(0, 0)
end)
