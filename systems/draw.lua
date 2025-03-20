local Concord = require("libraries.Concord.concord")
local Vector = require("libraries.brinevector.brinevector")

local DrawSystem = Concord.system({
	pool = {
		"position",
		"drawable",
		"sprites",
		"animation_type",
		"animation_length",
		"animation_timer",
		"sprite_scale",
		"facing_right",
		-- "aiming",
	},
})

function DrawSystem:draw()
	for _, e in ipairs(self.pool) do
		local sprites = e.sprites.sprites
		local animation_type = e.animation_type.value
		local animation_length = e.animation_length.value
		local animation_timer = e.animation_timer.value
		local sprite_scale = e.sprite_scale.value

		local animation_sprites = sprites.quads[animation_type]

		local sprite_select = math.floor(animation_timer / animation_length * #animation_sprites) + 1
		local sprite = sprites.quads[animation_type][sprite_select]

		love.graphics.circle("line", e.position.vector.x, e.position.vector.y, 64)

		-- local arrow_end = e.position.vector + e.aiming.vector * 100
		-- local arrowHeadSize = 10
		-- local perp = Vector(-e.aiming.vector.y, e.aiming.vector.x)
		--
		-- love.graphics.draw(
		-- 	sprites.sprite_sheet,
		-- 	sprite,
		-- 	arrow_end.x,
		-- 	arrow_end.y,
		-- 	arrow_end.x - e.aiming.vector.x * arrowHeadSize + perp.x * arrowHeadSize / 2,
		-- 	arrow_end.y - e.aiming.vector.y * arrowHeadSize + perp.y * arrowHeadSize / 2,
		-- 	arrow_end.x - e.aiming.vector.x * arrowHeadSize - perp.x * arrowHeadSize / 2,
		-- 	arrow_end.y - e.aiming.vector.y * arrowHeadSize - perp.y * arrowHeadSize / 2
		-- )

		love.graphics.draw(
			sprites.sprite_sheet,
			sprite,
			e.position.vector.x,
			e.position.vector.y,
			0,
			e.facing_right.value and sprite_scale or -sprite_scale,
			sprite_scale,
			sprites.quad_size / 2,
			sprites.quad_size / 2
		)
	end
end

return DrawSystem
