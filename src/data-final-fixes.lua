local table = require("__flib__.table")

local container_names = {}
for _, container_type in pairs({ "container", "logistic-container" }) do
  for container_name in pairs(data.raw[container_type]) do
    table.insert(container_names, container_name)
  end
end

local inserter_names = {}
for inserter_name in pairs(data.raw["inserter"]) do
  table.insert(inserter_names, inserter_name)
end

for _, crafter_type in pairs({ "assembling-machine", "furnace", "rocket-silo" }) do
  for _, crafter in pairs(data.raw[crafter_type]) do
    crafter.additional_pastable_entities = table.array_merge({
      crafter.additional_pastable_entities or {},
      container_names,
      inserter_names,
    })
  end
end
