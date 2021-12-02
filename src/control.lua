local event = require("__flib__.event")
local migration = require("__flib__.migration")

local migrations = require("scripts.migrations")

event.on_init(function()
  global.players = {}
end)

event.on_configuration_changed(function(e)
  if migration.on_config_changed(migrations, e) then
  end
end)

--- @param e on_entity_settings_pasted
event.on_entity_settings_pasted(function(e)
  if not e.source.valid or not e.destination.valid then
    return
  end

  rendering.draw_circle({
    color = { r = 0.5, a = 0.5 },
    filled = true,
    radius = 0.15,
    target = e.source,
    players = { 1 },
    surface = e.source.surface,
    time_to_live = 60,
  })

  rendering.draw_circle({
    color = { g = 0.5, a = 0.5 },
    filled = true,
    radius = 0.15,
    target = e.destination,
    players = { 1 },
    surface = e.destination.surface,
    time_to_live = 60,
  })
end)
