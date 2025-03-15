local Concord = require("libraries.Concord.concord")
local Vector = require("libraries.brinevector.brinevector")


local EntityPositionUpdateSystem = Concord.system({
	pool = { "moveable", "position", "velocity", "direction" },
})

function EntityPositionUpdateSystem:update(dt)
	for _, e in ipairs(self.pool) do
		e.position.vector = e.position.vector + (e.velocity.vector + e.direction.vector) * dt 
	end
end

return EntityPositionUpdateSystem