local Concord = require("libraries.Concord.concord")
local Vector = require("libraries.brinevector.brinevector")
local generateSprites = require("misc.sprites")

function spawn_entity(world, sprite_info, x, y, size)
    local entity = Concord.entity(world)

    entity:give("drawable")
    entity:give("position", Vector(x, y))
    
    entity:give("sprites", generateSprites(sprite_info.image_path, sprite_info.width, sprite_info.height, sprite_info.animation_types))
    entity:give("sprite_scale", size or 1)
    entity:give("animation_timer", 0)
    entity:give("animation_length", sprite_info.animation_length)
    entity:give("animation_type", 1)
    entity:give("action", "idle")

    return entity
end

return spawn_entity