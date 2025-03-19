local Concord = require("libraries.Concord.concord")

local DrawSystem = Concord.system({
	pool = { "position", "drawable", "sprites", "animation_type", "animation_length", "animation_timer", "sprite_scale" },
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

		love.graphics.draw(
			sprites.sprite_sheet,
			sprite,
			e.position.vector.x - (sprites.sprite_sheet:getHeight() / 2),
			e.position.vector.y - (sprites.sprite_sheet:getHeight() / 2),
			0,
			sprite_scale
		)
	end
end

return DrawSystem

