local Vector = require("libraries.brinevector.brinevector")
local Camera = require("libraries.hump.camera")
local Concord = require("libraries.Concord.concord")
local EntityPositionUpdateSystem = require("entities.positionupdate")
local PlayerMovementSystem = require("player.movement")

local Drawable = Concord.component("drawable")

local DrawSystem = Concord.system({
	pool = { "position", "drawable" },
})

function DrawSystem:draw()
	for _, e in ipairs(self.pool) do
		love.graphics.circle("fill", e.position.vector.x, e.position.vector.y, 5)
	end
end

-- Create the World
local world = Concord.world()

function love.load()
	 -- Add the Systems
	world:addSystems(PlayerMovementSystem, DrawSystem, EntityPositionUpdateSystem)

	--Create player entity
	Concord.entity(world)
		:give("player")
		:give("player_speed", 200)
		:give("position")
		:give("velocity")
		:give("drawable")
		:give("moveable")
		:give("direction")
end

-- Emit the events
function love.update(dt)
	world:emit("update", dt)
end

function love.draw()
	world:emit("draw")
end