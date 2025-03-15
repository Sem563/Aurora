local Concord = require("libraries.Concord.concord")

local AnimationSystem = Concord.system({
	pool = { "animation" },
})

function AnimationSystem:update(dt)
	for _, e in ipairs(self.pool) do
		local animation = e.animation.animation
		animation.currentTime = animation.currentTime + dt
		if animation.currentTime >= animation.duration then
			animation.currentTime = animation.currentTime - animation.duration
		end
	end
end

return AnimationSystem
