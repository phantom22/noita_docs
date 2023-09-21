---@diagnostic disable: missing-return, lowercase-global

---@param t any
---```lua
--- -- must be imported
---dofile_once("data/scripts/biome_modifiers.lua")
---```
function table_clear(t) end

---@param list any
---@param probability_mult any
---@param new_spawn any
---```lua
--- -- must be imported
---dofile_once("data/scripts/biome_modifiers.lua")
---```
function inject_spawn(list, probability_mult, new_spawn) end

---@param biome_name any
---```lua
--- -- must be imported
---dofile_once("data/scripts/biome_modifiers.lua")
---```
function biome_modifiers_inject_spawns( biome_name ) end

---@param biome_filename any
---@param material_name any
---@param field_name any
---@param multiplier any
---```lua
--- -- must be imported
---dofile_once("data/scripts/biome_modifiers.lua")
---```
function biome_material_multiply_value( biome_filename, material_name, field_name, multiplier ) end

---@param modifier any
---@param biome_name any
---```lua
--- -- must be imported
---dofile_once("data/scripts/biome_modifiers.lua")
---```
function biome_modifier_applies_to_biome( modifier, biome_name ) end

---@param biome_name any
---@param modifier any
---```lua
--- -- must be imported
---dofile_once("data/scripts/biome_modifiers.lua")
---```
function apply_modifier_from_data( biome_name, modifier ) end

---@param biome_name any
---@param modifier_id any
---```lua
--- -- must be imported
---dofile_once("data/scripts/biome_modifiers.lua")
---```
function apply_modifier( biome_name, modifier_id ) end

---@param modifier_id any
---```lua
--- -- must be imported
---dofile_once("data/scripts/biome_modifiers.lua")
---```
function get_modifier( modifier_id ) end

---@param biome_name any
---@param modifier_id any
---```lua
--- -- must be imported
---dofile_once("data/scripts/biome_modifiers.lua")
---```
function apply_modifier_if_has_none( biome_name, modifier_id ) end

---@param biome_name any
---@param ctx any
---```lua
--- -- must be imported
---dofile_once("data/scripts/biome_modifiers.lua")
---```
function has_modifiers(biome_name,ctx) end

---```lua
--- -- must be imported
---dofile_once("data/scripts/biome_modifiers.lua")
---```
function get_modifier_mappings() end

---```lua
--- -- must be imported
---dofile_once("data/scripts/biome_modifiers.lua")
---```
function init_biome_modifiers() end