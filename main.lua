local Vector = require("libraries.brinevector.brinevector")
local Camera = require("libraries.hump.camera")
local Concord = require("libraries.Concord.concord")
local Entity = Concord.entity
local Component = Concord.component
local System = Concord.system
local World = Concord.world
local Components = Concord.components

function love.load() end

-- Defining components
Concord.component("player")

Concord.component("speed", function(c, speed)
	c.value = speed
end)

Concord.component("position", function(c, position)
	c.vector = position
end)

Concord.component("velocity", function(c, velocity)
	c.vector = velocity
end)

local Drawable = Concord.component("drawable")

-- Defining Systems
local MovePlayerSystem = Concord.system({
	pool = { "player", "position", "velocity", "speed" },
})

function MovePlayerSystem:update(dt)
	local direction = Vector(0, 0)

	-- Handle player input for movement
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
		direction = direction.normalized * dt * e.speed.value
		local finalMovement = direction + e.velocity.vector * dt
		e.position.vector = e.position.vector + finalMovement
	end
end

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

-- Add the Systems
world:addSystems(MovePlayerSystem, DrawSystem)

Concord.entity(world)
	:give("player")
	:give("speed", 200)
	:give("position", Vector(50, 50))
	:give("velocity", Vector(0, 0))
	:give("drawable")

-- Emit the events
function love.update(dt)
	world:emit("update", dt)
end

function love.draw()
	world:emit("draw")
end
