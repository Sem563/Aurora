local Concord = require("libraries.Concord.concord")
local Vector = require("libraries.brinevector.brinevector")

Concord.component("player")
Concord.component("player_speed", function(c, speed)
	c.value = speed or 0
end)

