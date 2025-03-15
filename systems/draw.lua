local Concord = require("libraries.Concord.concord")

local DrawSystem = Concord.system({
	pool = { "position", "drawable", "animation" },
})

function DrawSystem:draw()
	for _, e in ipairs(self.pool) do
		local animation = e.animation.animation
		local spriteNum = math.floor(animation.currentTime / animation.duration * #animation.quads) + 1
		love.graphics.draw(
			animation.spriteSheet,
			animation.quads[spriteNum],
			e.position.vector.x - (e.animation.animation.spriteSheet:getHeight() / 2),
			e.position.vector.y - (e.animation.animation.spriteSheet:getHeight() / 2),
			0,
			2
		)
	end
end

return DrawSystem

