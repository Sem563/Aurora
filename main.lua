local Vector = require("libraries.brinevector.brinevector")
local Camera = require("libraries.hump.camera")
local Concord = require("libraries.Concord.concord")

-- Create the World
local world = Concord.world()

local function newAnimation(image, width, height, duration)
	local animation = {}
	animation.spriteSheet = image
	animation.quads = {}

	for y = 0, image:getHeight() - height, height do
		for x = 0, image:getWidth() - width, width do
			table.insert(animation.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
		end
	end

	animation.duration = duration or 1
	animation.currentTime = 0

	return animation
end

function love.load()
	-- pls fix abstactions :D
	local image = love.graphics.newImage("assets/playersheetaurora.png")
	image:setFilter("linear", "nearest")
	local animation = newAnimation(image, 32, 32, 1)

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
	Concord.entity(world)
		:give("player")
		:give("player_speed", 200)
		:give("position")
		:give("velocity")
		:give("drawable")
		:give("moveable")
		:give("direction")
		:give("animation", animation)
end

-- Emit the events
function love.update(dt)
	world:emit("update", dt)
end

function love.draw()
	world:emit("draw")
end

