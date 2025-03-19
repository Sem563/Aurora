local Concord = require("libraries.Concord.concord")

local AnimationSystem = Concord.system({
	pool = { "animation_length", "animation_timer" },
})

function AnimationSystem:update(dt)
	for _, e in ipairs(self.pool) do
		local animation_length = e.animation_length.value
		local animation_timer = e.animation_timer.value

		animation_timer = animation_timer + dt
		if animation_timer >= animation_length then
			animation_timer = animation_timer - animation_length
		end

		e.animation_timer.value = animation_timer
	end
end

return AnimationSystem
