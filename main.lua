local Vector = require("libraries.brinevector.brinevector")
local Camera = require("libraries.hump.camera")
local Concord = require("libraries.Concord.concord")
local spawn_entity = require("misc.spawn")

-- Create the World
local world = Concord.world()

function love.load()
	-- Register components
	Concord.utils.loadNamespace("components")

	-- Add the Systems
	local Systems = {}
	Concord.utils.loadNamespace("systems", Systems)
	for _, v in next, Systems do
		if Concord.type.isSystemClass(v) then
			world:addSystem(v)
		end
	end

	--Create player entity
	local player_sprite_info = {
		image_path = "assets/playersheetaurora.png",
		width = 32,
		height = 32,
		animation_length = 1,
		animation_types = {2, 3} --2 sprites row 1, 3 sprites row 2
	} --XML files?

	local player = spawn_entity(world, player_sprite_info, 0, 0, 2)
		:give("player")
		:give("player_speed", 200)
		:give("moveable")
		:give("direction")
		:give("velocity")
end

-- Emit the events
function love.update(dt)
	world:emit("update", dt)
end

function love.draw()
	world:emit("draw")
end

