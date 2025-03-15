local Vector = require("libraries.brinevector.brinevector")
local Camera = require("libraries.hump.camera")
local Concord = require("libraries.Concord.concord")

-- Create the World
local world = Concord.world()

function love.load()
	-- Register components
	Concord.utils.loadNamespace("components")

	-- Add the Systems
	local Systems = {}
	Concord.utils.loadNamespace("systems", Systems)
	for _,v in next, Systems do
		if Concord.type.isSystemClass(v) then
			world:addSystem(v)
		end
	end
	

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