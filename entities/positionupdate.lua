local Concord = require("libraries.Concord.concord")
local Vector = require("libraries.brinevector.brinevector")

Concord.component("moveable")
Concord.component("position", function(c, position)
	c.vector = position or Vector(0, 0)
end)
Concord.component("velocity", function(c, velocity)
	c.vector = velocity or Vector(0, 0)
end)
Concord.component("direction", function(c, direction)
    c.vector = direction or Vector(0, 0)
end)


local EntityPositionUpdateSystem = Concord.system({
	pool = { "moveable", "position", "velocity", "direction" },
})

function EntityPositionUpdateSystem:update(dt)
	for _, e in ipairs(self.pool) do
		e.position.vector = e.position.vector + (e.velocity.vector + e.direction.vector) * dt 
	end
end

return EntityPositionUpdateSystem