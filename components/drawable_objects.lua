local Concord = require("libraries.Concord.concord")

Concord.component("drawable")
Concord.component("sprites", function(c, sprites)
    c.sprites = sprites
end)
Concord.component("animation_length", function(c, val)
    c.value = val or 1
end)
Concord.component("animation_type", function(c, val)
    c.value = val or 1
end)
Concord.component("animation_timer", function(c, val)
    c.value = val or 0
end)
Concord.component("sprite_scale", function(c, val)
    c.value = val or 0
end)