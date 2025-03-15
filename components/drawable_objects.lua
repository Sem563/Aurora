local Concord = require("libraries.Concord.concord")

Concord.component("drawable")
Concord.component("sprites", function(c, sprites)
    c.sprites = sprites or {} --anim?
end)