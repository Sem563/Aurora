local Concord = require("libraries.Concord.concord")
local Vector = require("libraries.brinevector.brinevector")

local PlayerMovementSystem = Concord.system({
	pool = { "facing_right", "player", "player_speed", "direction", "action", "animation_type" },
})

function PlayerMovementSystem:update(dt)
	local direction = Vector(0, 0)

	if love.keyboard.isDown("w") then
		direction.y = direction.y - 1
	end
	if love.keyboard.isDown("a") then
		direction.x = direction.x - 1
	end
	if love.keyboard.isDown("s") then
		direction.y = direction.y + 1
	end
	if love.keyboard.isDown("d") then
		direction.x = direction.x + 1
	end

	for _, e in ipairs(self.pool) do
		if direction.length > 0 and e.action.value == "idle" then
			e.action.value = "walking"
			e.animation_type.value = 2
		elseif direction.length == 0 and e.action.value == "walking" then
			e.action.value = "idle"
			e.animation_type.value = 1
		end

		if direction.length > 0 then
			e.facing_right.value = (direction.x > 0)
		end

		e.direction.vector = direction.normalized * e.player_speed.value
	end
end

return PlayerMovementSystem
