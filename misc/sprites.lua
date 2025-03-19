return function(image_path, width, height, animation_types)
    local image = love.graphics.newImage(image_path)
	image:setFilter("linear", "nearest")

	local animation = {}
	animation.sprite_sheet = image
	animation.quads = {}

	for i = 1, #animation_types do
		local y = (i-1) * height
		animation.quads[i] = {}
		for j = 1, animation_types[i] do
			local x = (j-1) * width
			table.insert(animation.quads[i], love.graphics.newQuad(x, y, width, height, image:getDimensions()))
		end
	end

	return animation
end