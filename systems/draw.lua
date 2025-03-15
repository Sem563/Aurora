local Concord = require("libraries.Concord.concord")

local DrawSystem = Concord.system({
	pool = { "position", "drawable" },
})

function DrawSystem:draw()
	for _, e in ipairs(self.pool) do
		love.graphics.circle("fill", e.position.vector.x, e.position.vector.y, 5)
	end
end

return DrawSystem