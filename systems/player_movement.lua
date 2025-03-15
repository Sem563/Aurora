local Concord = require("libraries.Concord.concord")
local Vector = require("libraries.brinevector.brinevector")


local PlayerMovementSystem = Concord.system({
	pool = { "player", "player_speed", "direction" },
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
        e.direction.vector = direction.normalized * e.player_speed.value
    end
end

return PlayerMovementSystem