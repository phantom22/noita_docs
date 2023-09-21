---@diagnostic disable: missing-return, lowercase-global

---@param filename string
---@param pos_x number?
---@param pos_y number?
---@return integer entity_id
function EntityLoad( filename, pos_x, pos_y ) end

---@param filename string
---@param pos_x number?
---@param pos_y number?
---@return integer entity_id
function EntityLoadEndGameItem( filename, pos_x, pos_y ) end

---@param filename string
---@param pos_x number?
---@param pos_y number?
function EntityLoadCameraBound( filename, pos_x, pos_y ) end

---Loads components from 'filename' to 'entity'. Does not load tags and other stuff.
---@param filename string
---@param entity integer
function EntityLoadToEntity( filename, entity ) end

---Note: works only in dev builds.
---@param entity_id integer
---@param filename string
function EntitySave( entity_id, filename ) end

---@param name string?
---@return integer entity_id
function EntityCreateNew( name ) end

---@param entity_id integer
function EntityKill( entity_id ) end

---@param entity_id integer
---@return boolean
function EntityGetIsAlive( entity_id ) end

---@param entity_id integer
---@param component_type_name string
---@param table_of_component_values table?
---@return integer component_id
function EntityAddComponent( entity_id, component_type_name, table_of_component_values ) end

---@param entity_id integer
---@param component_id integer
function EntityRemoveComponent( entity_id, component_id ) end

---Returns a table of component ids.
---@param entity_id integer
---@return table
function EntityGetAllComponents( entity_id ) end

---Despite its name, this function actually returns an array, and not a single component.
---@param entity_id integer
---@param component_type_name string
---@param tag string?
---@return table|nil component_array can be nil!
function EntityGetComponent( entity_id, component_type_name, tag ) end

---Does not return components that are disabled, effectively "hiding" components that you might actually want.
---@param entity_id integer
---@param component_type_name string
---@param tag string?
---@return integer|nil first_component can be nil!
function EntityGetFirstComponent( entity_id, component_type_name, tag ) end

---Despite its name, this function actually returns an array, and not a single component.
---@param entity_id integer
---@param component_type_name string
---@param tag string?
---@return table|nil component_array can be nil!
function EntityGetComponentIncludingDisabled( entity_id, component_type_name, tag ) end

---@param entity_id integer
---@param component_type_name string
---@param tag string?
---@return integer|nil first_component can be nil!
function EntityGetFirstComponentIncludingDisabled( entity_id, component_type_name, tag ) end

---@param entity_id integer
---@param x number
---@param y number?
---@param rotation number?
---@param scale_x number?
---@param scale_y number?
function EntitySetTransform( entity_id, x, y, rotation, scale_x, scale_y ) end

---Some components store old positions (and calculates the new one based on those). This tries to refresh those. 
---@param entity_id integer
---@param x number
---@param y number?
---@param rotation number?
---@param scale_x number?
---@param scale_y number?
function EntityApplyTransform( entity_id, x, y, rotation, scale_x, scale_y ) end

---@param entity_id integer
---@return number x
---@return number y
---@return number rotation
---@return number scale_x
---@return number scale_y
function EntityGetTransform( entity_id ) end

---@param parent_id integer
---@param child_id integer
function EntityAddChild( parent_id, child_id ) end

---@param entity_id integer
---@return table|nil children_array can be nil!
function EntityGetAllChildren( entity_id ) end

---@param entity_id integer
---@return integer entity_id
function EntityGetParent( entity_id ) end

---Returns the given entity if it has no parent, otherwise walks up the parent hierarchy to the topmost parent and returns it.
---@param entity_id integer
---@return integer entity_id
function EntityGetRootEntity( entity_id ) end

---@param entity_id integer
function EntityRemoveFromParent( entity_id ) end

---@param entity_id integer
---@param tag string if tag is equal to "LuaComponent" the next argument should specify the custom field
---@param enabled boolean|string
---@param enabled_for_custom_lua_components boolean?
function EntitySetComponentsWithTagEnabled( entity_id, tag, enabled, enabled_for_custom_lua_components ) end

---@param entity_id integer
---@param component_id integer
---@param is_enabled boolean
function EntitySetComponentIsEnabled( entity_id, component_id, is_enabled ) end

---@param entity_id integer
---@return string name
function EntityGetName( entity_id ) end

---@param entity_id integer
---@param name string
function EntitySetName( entity_id, name ) end

---Returns a string where the tags are comma-separated, or nil if 'entity_id' doesn't point to a valid entity.
---@param entity_id integer
---@return string|nil tags can be nil!
function EntityGetTags( entity_id ) end

---Returns all entities with 'tag'.
---@param tag string
---@return table
function EntityGetWithTag( tag ) end

---Returns all entities in 'radius' distance from 'x','y'.
---@param pos_x number
---@param pos_y number
---@param radius number
---@return table
function EntityGetInRadius( pos_x, pos_y, radius ) end

---Returns all entities in 'radius' distance from 'x','y'.
---@param pos_x number
---@param pos_y number
---@param radius number
---@param entity_tag string
---@return table
function EntityGetInRadiusWithTag( pos_x, pos_y, radius, entity_tag ) end

---@param pos_x number
---@param pos_y number
---@return integer entity_id
function EntityGetClosest( pos_x, pos_y ) end

---@param pos_x number
---@param pos_y number
---@param tag string
---@return integer entity_id
function EntityGetClosestWithTag( pos_x, pos_y, tag ) end

---@param name string
---@return integer entity_id
function EntityGetWithName( name ) end

---@param entity_id integer
---@param tag string
function EntityAddTag( entity_id, tag ) end

---@param entity_id integer
---@param tag string
function EntityRemoveTag( entity_id, tag ) end

---@param entity_id integer
---@param tag string
---@return boolean
function EntityHasTag( entity_id, tag ) end

---return value example: 'data/entities/items/flute.xml'
---@param entity_id integer
---@return string full_path
function EntityGetFilename( entity_id ) end

---Deprecated, use ComponentGetValue2() instead.
---@param component_id integer
---@param variable_name string
---@return any|nil value can be nil!
---@deprecated
function ComponentGetValue( component_id, variable_name ) end

---Deprecated, use ComponentGetValue2() instead.
---@param component_id integer
---@param variable_name string
---@return boolean
---@deprecated
function ComponentGetValueBool( component_id, variable_name ) end

---Deprecated, use ComponentGetValue2() instead.
---@param component_id integer
---@param variable_name string
---@return integer
---@deprecated
function ComponentGetValueInt( component_id, variable_name ) end

---Deprecated, use ComponentGetValue2() instead.
---@param component_id integer
---@param variable_name string
---@return number
---@deprecated
function ComponentGetValueFloat( component_id, variable_name ) end

---Deprecated, use ComponentGetValue2() instead.
---@param component_id integer
---@param variable_name string
---@param out_x number? if provided, this will store vectors x value
---@param out_y number? if provided, this will store vectors y value
---@return number x vectors x value
---@return number y vectors y value
---@deprecated
function ComponentGetValueVector2( component_id, variable_name, out_x, out_y ) end

---Deprecated, use ComponentSetValue2() instead.
---@param component_id integer
---@param variable_name string
---@param value any
---@deprecated
function ComponentSetValue( component_id, variable_name, value ) end

---Deprecated, use ComponentSetValue2() instead.
---@param component_id integer
---@param variable_name string
---@param x number
---@param y number
---@deprecated
function ComponentSetValueVector2( component_id, variable_name, x, y ) end

---Deprecated, use ComponentSetValue2() instead.
---@param component_id integer
---@param variable_name string
---@param min number
---@param max number
---@deprecated
function ComponentSetValueValueRange( component_id, variable_name, min, max ) end

---Deprecated, use ComponentSetValue2() instead.
---@param component_id integer
---@param variable_name string
---@param min number
---@param max number
---@deprecated
function ComponentSetValueValueRangeInt( component_id, variable_name, min, max ) end

---Deprecated, use ComponentSetValue2() instead.
---@param component_id integer
---@param variable_name string
---@param value string
---@deprecated
function ComponentSetMetaCustom( component_id, variable_name, value ) end

---Deprecated, use ComponentGetValue2() instead.
---@param component_id integer
---@param variable_name string
---@return string|nil meta_custom_value can be nil!
---@deprecated
function ComponentGetMetaCustom( component_id, variable_name ) end

---Deprecated, use ComponentObjectGetValue2() instead.
---@param component_id integer
---@param object_name string
---@param variable_name string
---@return any|nil value can be nil!
---@deprecated
function ComponentObjectGetValue( component_id, object_name, variable_name ) end

---Deprecated, use ComponentObjectGetValue2() instead.
---@param component_id integer
---@param object_name string
---@param variable_name string
---@return string|boolean|nil value can be nil!
---@deprecated
function ComponentObjectGetValueBool( component_id, object_name, variable_name ) end

---Deprecated, use ComponentObjectGetValue2() instead.
---@param component_id integer
---@param object_name string
---@param variable_name string
---@return string|integer|nil value can be nil!
---@deprecated
function ComponentObjectGetValueInt( component_id, object_name, variable_name ) end

---Deprecated, use ComponentObjectGetValue2() instead.
---@param component_id integer
---@param object_name string
---@param variable_name string
---@return string|number|nil value can be nil!
---@deprecated
function ComponentObjectGetValueFloat( component_id, object_name, variable_name ) end

---Deprecated, use ComponentObjectSetValue2() instead.
---@param component_id integer
---@param object_name string
---@param variable_name string
---@param value any
---@deprecated
function ComponentObjectSetValue( component_id, object_name, variable_name, value ) end

---@param component_id integer
---@param tag string
function ComponentAddTag( component_id, tag ) end

---@param component_id integer
---@param tag string
function ComponentRemoveTag( component_id, tag ) end

---@param component_id integer
---@param tag string
---@return boolean
function ComponentHasTag( component_id, tag ) end

---Returns one or many values matching the type or subtypes of the requested field. Reports error and returns nil if the field type is not supported or field was not found.
---@param component_id integer
---@param field_name string
---@return any|nil value can be nil!
function ComponentGetValue2( component_id, field_name ) end

---Sets the value of a field. Value(s) should have a type matching the field type. Reports error if the values weren't given in correct type, the field type is not supported,or the component does not exist.
---@param component_id integer
---@param field_name string
---@param ... any the values to assign to the field.
function ComponentSetValue2( component_id, field_name, ... ) end

---Returns one or many values matching the type or subtypes of the requested field in a component subobject. Reports error and returns nil if the field type is not supported or 'object_name' is not a metaobject.
---@param component_id integer
---@param object_name string
---@param field_name string
---@return any|nil value can be nil!
function ComponentObjectGetValue2( component_id, object_name, field_name ) end

---Sets the value of a field in a component subobject. Value(s) should have a type matching the field type. Reports error if the values weren't given of the correct type, the field type is not supported or 'object_name' is not a metaobject.
---@param component_id integer
---@param object_name string
---@param field_name string
---@param ... any
function ComponentObjectSetValue2( component_id, object_name, field_name, ... ) end

---@param entity_id integer
---@param component_type_name string
---@param table_of_component_values table?
---@return integer new_component_id
function EntityAddComponent2( entity_id, component_type_name, table_of_component_values ) end

---@param component_id integer
---@param array_member_name string
---@param type_stored_in_vector "int"|"float"|"string"
---@return integer vector_size
function ComponentGetVectorSize( component_id, array_member_name, type_stored_in_vector ) end

---@param component_id integer
---@param array_name string
---@param type_stored_in_vector "int"|"float"|"string"
---@param index integer
---@return integer|number|string|nil value can be nil!
function ComponentGetVectorValue( component_id, array_name, type_stored_in_vector, index ) end

---'type_stored_in_vector' should be "int", "float" or "string".
---@param component_id integer
---@param array_name string
---@param type_stored_in_vector "int"|"float"|"string"
---@return table|nil vector can be nil!
function ComponentGetVector( component_id, array_name, type_stored_in_vector ) end

---Returns true if the given component exists and is enabled, else false.
---@param component_id integer
---@return boolean is_enabled
function ComponentGetIsEnabled( component_id ) end

---Returns a string-indexed table of string.
---@param component_id integer
---@return table|nil
function ComponentGetMembers( component_id ) end

---@param component_id integer
---@param object_name string
---@return table|nil members string-indexed table of string or nil.
function ComponentObjectGetMembers( component_id, object_name ) end

---@param component_id integer
---@return string component_type_name
function ComponentGetTypeName( component_id ) end

---The returned entity_id is the parent of the LuaComponent running the script.
---@return integer entity_id
function GetUpdatedEntityID() end

---The returned component_id belongs to current LuaComponent running the script.
---@return integer component_id
function GetUpdatedComponentID() end

---@param time_to_execute number
---@param file_to_execute string
---@param function_to_call string?
function SetTimeOut( time_to_execute, file_to_execute, function_to_call ) end

---@param color integer
---@param function_name string
function RegisterSpawnFunction( color, function_name ) end

---@param x number
---@param y number
---@param level integer
function SpawnActionItem( x, y, level ) end

---@param x number
---@param y number
---@param level integer
---@param action_count integer
---@return integer entity_id
function SpawnStash( x, y, level, action_count ) end

---@param x number
---@param y number
---@param level integer
---@return integer spawn_state_id
---@return integer entity_id
function SpawnApparition( x, y, level ) end

---@param entity_file string
---@param stash_entity_id integer
function LoadEntityToStash( entity_file, stash_entity_id ) end

---@param entity_id integer
---@param material_name string
---@param count integer
function AddMaterialInventoryMaterial( entity_id, material_name, count ) end

---Returns the id of the material taking the largest part of the first MaterialInventoryComponent in 'entity_id', or 0 if nothing is found.
---@param entity_id integer
---@return integer material_type
function GetMaterialInventoryMainMaterial( entity_id ) end

---@param strength number
---@param x number?
---@param y number?
function GameScreenshake( strength, x, y ) end

function GameOnCompleted() end

---@param id string
function GameGiveAchievement( id ) end

function GameDoEnding2() end

---x = 0 normal world, -1 is first west world, +1 is first east world, if y < 0 it is sky, if y > 0 it is hell 
---@param world_pos_x number
---@param world_pos_y number
---@return number x
---@return number y
function GetParallelWorldPosition( world_pos_x, world_pos_y ) end

---@param filename string
---@param pixel_scenes string?
function BiomeMapLoad_KeepPlayer( filename, pixel_scenes ) end

---Deprecated. Might trigger various bugs. Use BiomeMapLoad_KeepPlayer() instead.
---@param filename string
---@deprecated
function BiomeMapLoad( filename ) end

---Can be used to edit biome configs during initialization. See the nightmare mod for an usage example.
---@param filename string
---@param field_name string
---@param value any
function BiomeSetValue( filename, field_name, value ) end

---Can be used to read biome configs. Returns one or many values matching the type or subtypes of the requested field. Reports error and returns nil if the field type is notsupported or field was not found.
---@param filename string
---@param field_name string
---@return any|nil
function BiomeGetValue( filename, field_name ) end

---Can be used to edit biome configs during initialization. See biome_modifiers.lua for an usage example.
---@param filename string
---@param meta_object_name string
---@param field_name string
---@param value any
function BiomeObjectSetValue( filename, meta_object_name, field_name, value ) end

---Can be used to edit biome config MaterialComponents during initialization. Sets the given value in all found VegetationComponent with matching tree_material. Seebiome_modifiers.lua for an usage example.
---@param filename string
---@param material_name string
---@param field_name string
---@param value any
function BiomeVegetationSetValue( filename, material_name, field_name, value ) end

---Can be used to edit biome config MaterialComponents during initialization. Sets the given value in the first found MaterialComponent with matching material_name. Seebiome_modifiers.lua for an usage example.
---@param filename string
---@param material_name string
---@param field_name string
---@param value any
function BiomeMaterialSetValue( filename, material_name, field_name, value ) end

---Can be used to read biome config MaterialComponents during initialization. Returns the given value in the first found MaterialComponent with matching material_name. Seebiome_modifiers.lua for an usage example.
---@param filename string
---@param material_name string
---@param field_name string
---@return any|nil
function BiomeMaterialGetValue( filename, material_name, field_name ) end

---@return boolean
function GameIsIntroPlaying() end

---@return boolean
function GameGetIsGamepadConnected() end

---@return integer entity_id
function GameGetWorldStateEntity() end

---@return integer entity_id
function GameGetPlayerStatsEntity() end

---@return integer
function GameGetOrbCountAllTime() end

---@return integer
function GameGetOrbCountThisRun() end

---@param orb_id_zero_based integer
---@return boolean
function GameGetOrbCollectedThisRun( orb_id_zero_based ) end

---@param orb_id_zero_based integer
---@return boolean
function GameGetOrbCollectedAllTime( orb_id_zero_based ) end

function GameClearOrbsFoundThisRun() end

---Returns the number of orbs, picked or not.
---@return integer
function GameGetOrbCountTotal() end

---Converts a numeric material id to the material's strings id.
---@param material_id integer
---@return string
function CellFactory_GetName( material_id ) end

---Returns the id of a material.
---@param material_name string
---@return integer
function CellFactory_GetType( material_name ) end

---Returns the displayed name of a material, or an empty string if 'material_id' is not valid. Might return a text key.
---@param material_id integer
---@return string
function CellFactory_GetUIName( material_id ) end

---@param include_statics boolean?
---@param include_particle_fx_materials boolean?
---@return table
function CellFactory_GetAllLiquids( include_statics, include_particle_fx_materials ) end

---@param include_statics boolean?
---@param include_particle_fx_materials boolean?
---@return table
function CellFactory_GetAllSands( include_statics, include_particle_fx_materials ) end

---@param include_statics boolean?
---@param include_particle_fx_materials boolean?
---@return table
function CellFactory_GetAllGases( include_statics, include_particle_fx_materials ) end

---@param include_statics boolean?
---@param include_particle_fx_materials boolean?
---@return table
function CellFactory_GetAllFires( include_statics, include_particle_fx_materials ) end

---@param include_statics boolean?
---@param include_particle_fx_materials boolean?
---@return table
function CellFactory_GetAllSolids( include_statics, include_particle_fx_materials ) end

---@param material_id integer
---@return table
function CellFactory_GetTags( material_id ) end

---@return number x
---@return number y
function GameGetCameraPos() end

---@param x number
---@param y number
function GameSetCameraPos( x, y ) end

---@param is_free boolean
function GameSetCameraFree( is_free ) end

---Returns the camera rectangle. This may not be 100% pixel perfect with regards to what you see on the screen. 'x','y' = top left corner of the rectangle.
---@return number x
---@return number y
---@return number w
---@return number h
function GameGetCameraBounds() end

---@param entity_id integer
function GameRegenItemAction( entity_id ) end

---@param entity_id integer
function GameRegenItemActionsInContainer( entity_id ) end

---@param entity_id integer
function GameRegenItemActionsInPlayer( entity_id ) end

---@param inventory_owner_entity_id integer
---@param item_entity_id integer
function GameKillInventoryItem( inventory_owner_entity_id, item_entity_id ) end

---@param who_picks_up_entity_id integer
---@param item_entity_id integer
---@param do_pick_up_effects boolean?
function GamePickUpInventoryItem( who_picks_up_entity_id, item_entity_id, do_pick_up_effects ) end

---Returns all the inventory items that entity_id has.
---@param entity_id integer
---@return table|nil
function GameGetAllInventoryItems( entity_id ) end

---@param entity_id integer
function GameDropAllItems( entity_id ) end

---@param entity_id integer
function GameDropPlayerInventoryItems( entity_id ) end

---@param entity_id integer
function GameDestroyInventoryItems( entity_id ) end

---@return boolean
function GameIsInventoryOpen() end

function GameTriggerGameOver() end

---@param materials_filename string
---@param colors_filename string
---@param x number
---@param y number
---@param background_file string?
---@param skip_biome_checks boolean?
---@param skip_edge_textures boolean?
---@param color_to_material_table table?
---@param background_z_index integer?
function LoadPixelScene( materials_filename, colors_filename, x, y, background_file, skip_biome_checks, skip_edge_textures, color_to_material_table, background_z_index ) end

---@param background_file string
---@param x number
---@param y number
---@param background_z_index number?
---@param check_biome_corners boolean?
function LoadBackgroundSprite( background_file, x, y, background_z_index, check_biome_corners ) end

---@param material_name string
---@param x number
---@param y number
---@param how_many integer
---@param xvel number
---@param yvel number
---@param color integer? uint32
---@param lifetime_min number?
---@param lifetime_max number?
---@param force_create boolean?
---@param draw_front boolean?
---@param collide_with_grid boolean?
---@param randomize_velocity boolean?
function GameCreateCosmeticParticle( material_name, x, y, how_many, xvel, yvel, color, lifetime_min, lifetime_max, force_create, draw_front, collide_with_grid,randomize_velocity ) end

---@param material_name string
---@param x number
---@param y number
---@param how_many integer
---@param xvel number
---@param yvel number
---@param just_visual boolean
---@param draw_as_long boolean?
---@param randomize_velocity boolean?
function GameCreateParticle( material_name, x, y, how_many, xvel, yvel, just_visual, draw_as_long, randomize_velocity ) end

---@param filename string
---@param x number
---@param y number
---@param centered boolean?
---@param sprite_offset_x number?
---@param sprite_offset_y number?
---@param frames integer?
---@param emissive boolean?
function GameCreateSpriteForXFrames( filename, x, y, centered, sprite_offset_x, sprite_offset_y, frames, emissive ) end

---Warning: If 'projectile_id' has PhysicsBodyComponent and ItemComponent, components without the "enabled_in_world" tag will be disabled, as if the entity was thrown by player.
---@param shooter_id integer can be 0.
---@param x number
---@param y number
---@param target_x number
---@param target_y number
---@param projectile_id integer
---@param send_message boolean?
---@param verlet_parent_entity integer?
function GameShootProjectile( shooter_id, x, y, target_x, target_y, projectile_id, send_message, verlet_parent_entity ) end

---@param entity integer
---@param amount number
---@param damage_type string
---@param description string
---@param ragdoll_fx string
---@param impulse_x number
---@param impulse_y number
---@param entity_who_is_responsible integer?
---@param world_pos_x number?
---@param world_pos_y number?
---@param knockback_force number?
function EntityInflictDamage( entity, amount, damage_type, description, ragdoll_fx, impulse_x, impulse_y, entity_who_is_responsible, world_pos_x, world_pos_y,knockback_force ) end

---Has the same effects that would occur if 'entity' eats 'amount' number of cells of 'material_type' from the game world. Use this instead of directly modifying IngestionComponent values, if possible. Might not work with non-player entities. Use CellFactory_GetType() to convert a material name to material type.
---@param entity integer
---@param material_type number
---@param amount number
function EntityIngestMaterial( entity, material_type, amount ) end

---@param entity integer
---@param status_type_id string
function EntityRemoveIngestionStatusEffect( entity, status_type_id ) end

---Adds random visible stains of 'material_type' to entity. 'amount' controls the number of stain cells added. Does nothing if 'entity' doesn't have a SpriteStainsComponent.Use CellFactory_GetType() to convert a material name to material type.
---@param entity integer
---@param material_type number
---@param amount number
function EntityAddRandomStains( entity, material_type, amount ) end

---Modifies DamageModelComponents materials_that_damage and materials_how_much_damage variables (and their parsed out data structures)
---@param entity integer
---@param material_name string
---@param damage number
function EntitySetDamageFromMaterial( entity, material_name, damage ) end

---Immediately refreshes the given SpriteComponent. Might be useful with text sprites if you want them to update more often than once a second.
---@param entity integer
---@param sprite_component integer
function EntityRefreshSprite( entity, sprite_component ) end

---Returns the capacity of a wand entity, or 0 if 'entity' doesnt exist.
---@param entity integer
---@return integer
function EntityGetWandCapacity( entity ) end

---Plays animation. Follow up animation ('followup_name') is applied only if 'followup_priority' is given.
---@param entity_id integer
---@param name string
---@param priority integer
---@param followup_name string?
---@param followup_priority integer?
function GamePlayAnimation( entity_id, name, priority, followup_name, followup_priority ) end

---@param entity_id integer
---@return number x
---@return number y
function GameGetVelocityCompVelocity( entity_id ) end

---@param entity_id integer
---@param game_effect_name string
---@return integer component_id
function GameGetGameEffect( entity_id, game_effect_name ) end

---@param entity_id integer
---@param game_effect_name string
---@return integer
function GameGetGameEffectCount( entity_id, game_effect_name ) end

---@param entity_id integer
---@param game_effect_entity_file string
---@return integer effect_entity_id
function LoadGameEffectEntityTo( entity_id, game_effect_entity_file ) end

---@param entity_id integer
---@param game_effect_name string
---@param always_load_new boolean
---@return integer effect_component_id
---@return integer effect_entity_id
function GetGameEffectLoadTo( entity_id, game_effect_name, always_load_new ) end

---@param x number
---@param y number
function SetPlayerSpawnLocation( x, y ) end

---@param action_id string
function UnlockItem( action_id ) end

---@param entity_id integer
---@return integer uint32_color
function GameGetPotionColorUint( entity_id ) end

---Returns the centroid of first enabled HitboxComponent found in entity, the position of the entity if no hitbox is found, or nil if the entity does not exist. All returnedpositions are in world coordinates.
---@param entity_id integer
---@return number (x
---@return number)|nil y
function EntityGetFirstHitboxCenter( entity_id ) end

---Does a raytrace that stops on any cell it hits.
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return boolean did_hit
---@return number hit_x
---@return number hit_y
function Raytrace( x1, y1, x2, y2 ) end

---Does a raytrace that stops on any cell that is not fluid, gas (yes, technically gas is a fluid), or fire.
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return boolean did_hit
---@return number hit_x
---@return number hit_y
function RaytraceSurfaces( x1, y1, x2, y2 ) end

---Does a raytrace that stops on any cell that is not gas or fire.
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return boolean did_hit
---@return number hit_x
---@return number hit_y
function RaytraceSurfacesAndLiquiform( x1, y1, x2, y2 ) end

---Does a raytrace that stops on any cell a character can stand on.
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return boolean did_hit
---@return number hit_x
---@return number hit_y
function RaytracePlatforms( x1, y1, x2, y2 ) end

---@param ideal_pos_x number
---@param idea_pos_y number
---@param velocity_x number
---@param velocity_y number
---@param body_radius number
---@return number x
---@return number y
function FindFreePositionForBody( ideal_pos_x, idea_pos_y, velocity_x, velocity_y, body_radius ) end

---@param pos_x number
---@param pos_y number
---@param ray_length number
---@param ray_count integer
---@return boolean found_normal
---@return number normal_x
---@return number normal_y
---@return number approximate_distance_from_surface
function GetSurfaceNormal( pos_x, pos_y, ray_length, ray_count ) end

---@param min_x integer
---@param min_y integer
---@param max_x integer
---@param max_y integer
---@return boolean
function DoesWorldExistAt( min_x, min_y, max_x, max_y ) end

---@param herd_name string
---@return integer
function StringToHerdId( herd_name ) end

---@param herd_id integer
---@return string
function HerdIdToString( herd_id ) end

---@param herd_id_a integer
---@param herd_id_b integer
---@return number
function GetHerdRelation( herd_id_a, herd_id_b ) end

---@param entity_a integer
---@param entity_b integer
---@return number
function EntityGetHerdRelation( entity_a, entity_b ) end

---does not spam errors, but returns 0 if anything fails
---@param entity_a integer
---@param entity_b integer
---@return number
function EntityGetHerdRelationSafe( entity_a, entity_b ) end

---Deprecated, use GenomeStringToHerdID() and ComponentSetValue2() instead.
---@param entity_id integer
---@param new_herd_id string
---@deprecated
function GenomeSetHerdId( entity_id, new_herd_id ) end

---NOTE: entity_id might be NULL, but pos_x and pos_y could still be valid.
---@param pos_x number
---@param pos_y number
---@return integer entity_id
---@return number _pos_x
---@return number _pos_y
function EntityGetClosestWormAttractor( pos_x, pos_y ) end

---NOTE: entity_id might be NULL, but pos_x and pos_y could still be valid
---@param pos_x number
---@param pos_y number
---@return integer entity_id
---@return number _pos_x
---@return number _pos_y
---@return number _radius
function EntityGetClosestWormDetractor( pos_x, pos_y ) end

---@param log_line string
function GamePrint( log_line ) end

---@param title string
---@param description string?
---@param ui_custom_decoration_file string?
function GamePrintImportant( title, description, ui_custom_decoration_file ) end

---@return number x
---@return number y
function DEBUG_GetMouseWorld() end

---@param x number
---@param y number
---@param message string?
---@param color_r number?
---@param color_g number?
---@param color_b number?
function DEBUG_MARK( x, y, message, color_r, color_g, color_b ) end

---@return integer
function GameGetFrameNum() end

---@return number
function GameGetRealWorldTimeSinceStarted() end

---@param entity_id integer
---@return boolean
function IsPlayer( entity_id ) end

---@param entity_id integer
---@return boolean
function IsInvisible( entity_id ) end

---@return boolean
function GameIsDailyRun() end

---@return boolean
function GameIsDailyRunOrDailyPracticeRun() end

---@return boolean
function GameIsModeFullyDeterministic() end

---Sets a global variable with the specified value.
---@param key string
---@param value string
function GlobalsSetValue( key, value ) end

---@param key string
---@param default_value string?
function GlobalsGetValue( key, default_value ) end

---@param key string
---@return string
function MagicNumbersGetValue( key ) end

---@param new_seed integer
function SetWorldSeed( new_seed ) end

---@param key string
---@return string
function SessionNumbersGetValue( key ) end

---@param key string
---@param value string|number
function SessionNumbersSetValue( key, value ) end

function SessionNumbersSave() end

function AutosaveDisable() end

---@param key string
---@return string|nil
function StatsGetValue( key ) end

---@param key string
---@return string
function StatsGlobalGetValue( key ) end

---@param key string
---@return string
function StatsBiomeGetValue( key ) end

function StatsBiomeReset() end

---@param killed_entity_id integer?
function StatsLogPlayerKill( killed_entity_id ) end

---@param action_id string
---@param x number?
---@param y number?
---@return integer entity_id
function CreateItemActionEntity( action_id, x, y ) end

---@param x number
---@param y number
---@param max_level integer
---@param type integer
---@param i integer?
---@return string
function GetRandomActionWithType( x, y, max_level, type, i ) end

---@param x number
---@param y number
---@param max_level number
---@param i integer?
---@return string
function GetRandomAction( x, y, max_level, i ) end

---@return integer year
---@return integer month
---@return integer day
---@return integer hour
---@return integer minute
---@return integer second
function GameGetDateAndTimeUTC() end

---@return integer ear
---@return integer month
---@return integer day
---@return integer hour
---@return integer minute
---@return integer second
function GameGetDateAndTimeLocal() end

---@param num_particles integer
---@param width_outside_camera number
---@param material_name string
---@param velocity_min number
---@param velocity_max number
---@param gravity number
---@param droplets_bounce boolean
---@param draw_as_long boolean
function GameEmitRainParticles( num_particles, width_outside_camera, material_name, velocity_min, velocity_max, gravity, droplets_bounce, draw_as_long ) end

---Each beam adds a little overhead to things like chunk creation, so please call this sparingly.
---@param x integer
---@param y_min integer
---@param y_max integer
---@param radius number
---@param edge_darkening_width number
function GameCutThroughWorldVertical( x, y_min, y_max, radius, edge_darkening_width ) end

---This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.
---@param width integer
---@param height integer
function BiomeMapSetSize( width, height ) end

---if BIOME_MAP in magic_numbers.xml points to a lua file returns that context, if not will return the biome_map size
---@return integer width
---@return integer height
function BiomeMapGetSize() end

---This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.
---@param x integer
---@param y integer
---@param color_int integer
function BiomeMapSetPixel( x, y, color_int ) end

---This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.
---@param x integer
---@param y integer
---@return integer color
function BiomeMapGetPixel( x, y ) end

---Swaps red and blue channels of 'color'. This can be used make sense of the BiomeMapGetPixel() return values. E.g. if( BiomeMapGetPixel( x, y ) ==BiomeMapConvertPixelFromUintToInt( 0xFF36D517 ) ) then print('hills') end 
---@param color integer
---@return integer
function BiomeMapConvertPixelFromUintToInt( color ) end

---This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.
---@param x integer
---@param y integer
---@param image_filename string
function BiomeMapLoadImage( x, y, image_filename ) end

---This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.
---@param x integer
---@param y integer
---@param image_filename string
---@param image_x integer
---@param image_y integer
---@param image_w integer
---@param image_h integer
function BiomeMapLoadImageCropped( x, y, image_filename, image_x, image_y, image_w, image_h ) end

---@param x number
---@param y number
---@return number
function BiomeMapGetVerticalPositionInsideBiome( x, y ) end

---@param x number?
---@param y number?
---@return string name
function BiomeMapGetName( x, y ) end

---@param x number
---@param y number
function SetRandomSeed( x, y ) end

---This is kinda messy. If given 0 arguments, returns number between 0.0 and 1.0. If given 1 arguments, returns int between 0 and 'a'. If given 2 arguments returns int between'a' and 'b'.
---@param a integer?
---@param b integer?
---@return number|integer
function Random( a, b ) end

---This is kinda messy. If given 0 arguments, returns number between 0.0 and 1.0. If given 1 arguments, returns number between 0.0 and 'a'. If given 2 arguments returns numberbetween 'a' and 'b'.
---@param min number?
---@param max number?
---@return number
function Randomf( min, max ) end

---@param min integer
---@param max integer
---@param mean integer
---@param sharpness number?
---@param baseline number?
---@return integer
function RandomDistribution( min, max, mean, sharpness, baseline ) end

---@param min number
---@param max number
---@param mean number
---@param sharpness number?
---@param baseline number?
---@return number
function RandomDistributionf( min, max, mean, sharpness, baseline ) end

---This is kinda messy. If given 2 arguments, returns number between 0.0 and 1.0. If given 3 arguments, returns int between 0 and 'a'. If given 4 arguments returns a number between 'a' and 'b'.
---@param x number
---@param y number
---@param a integer|number?
---@param b integer|number?
---@return integer|number
function ProceduralRandom( x, y, a, b ) end

---This is kinda messy. If given 2 arguments, returns number between 0.0 and 1.0. If given 3 arguments, returns a number between 0 and 'a'. If given 4 arguments returns a number between 'a' and 'b'.
---@param x number
---@param y number
---@param a number?
---@param b number?
---@return number
function ProceduralRandomf( x, y, a, b ) end

---This is kinda messy. If given 2 arguments, returns 0 or 1. If given 3 arguments, returns an int between 0 and 'a'. If given 4 arguments returns an int between 'a' and 'b'.
---@param x number
---@param y number
---@param a integer?
---@param b integer?
---@return number
function ProceduralRandomi( x, y, a, b ) end

---Does not work with PhysicsBody2Component. Returns the id of the created physics body.
---@param entity_id integer
---@param image_file string
---@param material string?
---@param offset_x number?
---@param offset_y number?
---@param centered boolean?
---@param is_circle boolean?
---@param material_image_file string?
---@param use_image_as_colors boolean?
---@return integer int_body_id
function PhysicsAddBodyImage( entity_id, image_file, material, offset_x, offset_y, centered, is_circle, material_image_file, use_image_as_colors ) end

---Does not work with PhysicsBody2Component. Returns the id of the created physics body.
---@param entity_id integer
---@param material string
---@param offset_x number
---@param offset_y number
---@param width integer
---@param height integer
---@param centered boolean?
---@return integer|nil
function PhysicsAddBodyCreateBox( entity_id, material, offset_x, offset_y, width, height, centered ) end

---Does not work with PhysicsBody2Component. Returns the id of the created joint.
---@param entity_id integer
---@param body_id0 integer
---@param body_id1 integer
---@param offset_x number?
---@param offset_y number?
---@param joint_type string?
---@return integer|nil
function PhysicsAddJoint( entity_id, body_id0, body_id1, offset_x, offset_y, joint_type ) end

---@param entity_id integer
---@param force_x number
---@param force_y number
function PhysicsApplyForce( entity_id, force_x, force_y ) end

---@param entity_id integer
---@param torque number
function PhysicsApplyTorque( entity_id, torque ) end

---@param entity_id integer
---@param component_id integer
---@param torque number
function PhysicsApplyTorqueToComponent( entity_id, component_id, torque ) end

---@param calculate_force_for_body_fn function
---@param ignore_this_entity integer
---@param area_min_x number
---@param area_min_y number
---@param area_max_x number
---@param area_max_y number
function PhysicsApplyForceOnArea( calculate_force_for_body_fn, ignore_this_entity, area_min_x, area_min_y, area_max_x, area_max_y ) end

---@param world_pos_min_x number
---@param world_pos_min_y number
---@param world_pos_max_x number
---@param world_pos_max_y number
function PhysicsRemoveJoints( world_pos_min_x, world_pos_min_y, world_pos_max_x, world_pos_max_y ) end

---@param entity_id integer
---@param is_static boolean
function PhysicsSetStatic( entity_id, is_static ) end

---@param entity_id integer
---@param component_id integer
---@return number vel_x
---@return number vel_y
function PhysicsGetComponentVelocity( entity_id, component_id ) end

---@param entity_id integer
---@param component_id integer
---@return number vel
function PhysicsGetComponentAngularVelocity( entity_id, component_id ) end

---@param entity_id integer
function PhysicsBody2InitFromComponents( entity_id ) end

---@param x number
---@param y number?
---@return number x
---@return number y
function PhysicsVecToGameVec( x, y ) end

---@param x number
---@param y number?
---@return number x
---@return number y
function GameVecToPhysicsVec( x, y ) end

---@param world_pos_x number
---@param world_pos_y number
---@param image_filename string
---@param max_durability integer?
function LooseChunk( world_pos_x, world_pos_y, image_filename, max_durability ) end

---@param key string
---@return boolean bool_is_new
function AddFlagPersistent( key ) end

---@param key string
function RemoveFlagPersistent( key ) end

---@param key string
---@return boolean
function HasFlagPersistent( key ) end

---@param flag string
function GameAddFlagRun( flag ) end

---@param flag string
function GameRemoveFlagRun( flag ) end

---@param flag string
---@return boolean
function GameHasFlagRun( flag ) end

---@param event_path string
---@param can_be_faded boolean
---@param x number
---@param y number
function GameTriggerMusicEvent( event_path, can_be_faded, x, y ) end

---@param name string
function GameTriggerMusicCue( name ) end

---@param relative_fade_speed number?
function GameTriggerMusicFadeOutAndDequeueAll( relative_fade_speed ) end

---@param bank_filename string
---@param event_path string
---@param x number
---@param y number
function GamePlaySound( bank_filename, event_path, x, y ) end

---Plays a sound through all AudioComponents with matching sound in 'entity_id'.
---@param entity_id integer
---@param event_name string
function GameEntityPlaySound( entity_id, event_name ) end

---Plays a sound loop through an AudioLoopComponent tagged with 'component_tag' in 'entity'. 'intensity' affects the intensity passed to the audio event. Must be called everyframe when the sound should play.
---@param entity integer
---@param component_tag string
---@param intensity number
function GameEntityPlaySoundLoop( entity, component_tag, intensity ) end

---Can be used to pass custom parameters to the post_final shader, or override values set by the game code. The shader uniform called 'name' will be set to the latest givenvalues on this and following frames.
---@param name string
---@param x number
---@param y number
---@param z number
---@param w number
function GameSetPostFxParameter( name, x, y, z, w ) end

---Will remove a post_final shader parameter value binding set via game GameSetPostFxParameter().
---@param name string
function GameUnsetPostFxParameter( name ) end

---@param text_or_key string
---@return string
function GameTextGetTranslatedOrNot( text_or_key ) end

---@param key string
---@param param0 string?
---@param param1 string?
---@param param2 string?
---@return string
function GameTextGet( key, param0, param1, param2 ) end

---@return obj gui
function GuiCreate() end

---@param gui obj
function GuiDestroy( gui ) end

---@param gui obj
function GuiStartFrame( gui ) end



---Sets the options that apply to widgets during this frame. For 'option' use the values in the GUI_OPTION table in "data/scripts/lib/utilities.lua". Values from consecutivecalls will be combined. For example calling this with the values GUI_OPTION.Align_Left and GUI_OPTION.GamepadDefaultWidget will set both options for the next widget. Theoptions will be cleared on next call to GuiStartFrame().
---@param gui obj
---@param option integer
---
---___
---**from "data/scripts/lib/utilities.lua"**
---
---
---GUI_OPTION = {
---
---    None = 0,
---    
---    IsDraggable = 1, -- you might not want to use this, because there will be various corner cases and bugs, but feel free to try anyway.
---    NonInteractive = 2, -- works with GuiButton
---    AlwaysClickable = 3,
---    ClickCancelsDoubleClick = 4,
---    IgnoreContainer = 5,
---    NoPositionTween = 6,
---    ForceFocusable = 7,
---    HandleDoubleClickAsClick = 8,
---    GamepadDefaultWidget = 9, -- it's recommended you use this to communicate the widget where gamepad input will focus when entering a new menu
---    
---    -- these work as intended (mostly)
---    Layout_InsertOutsideLeft = 10,
---    Layout_InsertOutsideRight = 11,
---    Layout_InsertOutsideAbove = 12,
---    Layout_ForceCalculate = 13,
---    Layout_NextSameLine = 14,
---    Layout_NoLayouting = 15,
---    
---    -- these work as intended (mostly)
---    Align_HorizontalCenter = 16,
---    Align_Left = 17,
---    
---    FocusSnapToRightEdge = 18,
---    
---    NoPixelSnapY = 19,
---    
---    DrawAlwaysVisible = 20,
---    DrawNoHoverAnimation = 21,
---    DrawWobble = 22,
---    DrawFadeIn = 23,
---    DrawScaleIn = 24,
---    DrawWaveAnimateOpacity = 25,
---    DrawSemiTransparent = 26,
---    DrawActiveWidgetCursorOnBothSides = 27,
---    DrawActiveWidgetCursorOff = 28,
---    
---    TextRichRendering = 29,
---    
---    NoSound = 47,
---    Hack_ForceClick = 48,
---    Hack_AllowDuplicateIds = 49,
---    
---    ScrollContainer_Smooth = 50,
---    IsExtraDraggable = 51,
---    
---    _SnapToCenter = 62,
---    Disabled = 63,
---}
function GuiOptionsAdd( gui, option ) end

---Sets the options that apply to widgets during this frame. For 'option' use the values in the GUI_OPTION table in "data/scripts/lib/utilities.lua". Values from consecutivecalls will be combined. For example calling this with the values GUI_OPTION.Align_Left and GUI_OPTION.GamepadDefaultWidget will set both options for the next widget. Theoptions will be cleared on next call to GuiStartFrame().
---@param gui obj
---@param option integer
function GuiOptionsRemove( gui, option ) end

---Clears the options that apply to widgets during this frame.
---@param gui obj
function GuiOptionsClear( gui ) end

---@param gui obj
---@param option integer
function GuiOptionsAddForNextWidget( gui, option ) end

---Sets the color of the next widget during this frame. Color components should be in the 0-1 range.
---@param gui obj
---@param red number
---@param green number
---@param blue number
---@param alpha number
function GuiColorSetForNextWidget( gui, red, green, blue, alpha ) end

---Sets the rendering depth ('z') of the widgets following this call. Larger z = deeper. The z will be set to 0 on the next call to GuiStartFrame(). 
---@param gui obj
---@param z float
function GuiZSet( gui, z ) end

---@param gui obj
---@param z float
function GuiZSetForNextWidget( gui, z ) end

---Can be used to solve ID conflicts. All ids given to Gui* functions will be hashed with the ids stacked (and hashed together) using GuiIdPush() and GuiIdPop(). The id stackhas a max size of 1024, and calls to the function will do nothing if the size is exceeded.
---@param gui obj
---@param id integer
function GuiIdPush( gui, id ) end

---Pushes the hash of 'str' as a gui id. See GuiIdPush().
---@param gui obj
---@param str string
function GuiIdPushString( gui, str ) end

---See GuiIdPush().
---@param gui obj
function GuiIdPop( gui ) end

---Starts a scope where animations initiated using GuiAnimateAlphaFadeIn() etc. will be applied to all widgets.
---@param gui obj
function GuiAnimateBegin( gui ) end

---Ends a scope where animations initiated using GuiAnimateAlphaFadeIn() etc. will be applied to all widgets.
---@param gui obj
function GuiAnimateEnd( gui ) end

---Does an alpha tween animation for all widgets inside a scope set using GuiAnimateBegin() and GuiAnimateEnd().
---@param gui obj
---@param id integer
---@param speed number
---@param step number
---@param reset boolean
function GuiAnimateAlphaFadeIn( gui, id, speed, step, reset ) end

---Does a scale tween animation for all widgets inside a scope set using GuiAnimateBegin() and GuiAnimateEnd().
---@param gui obj
---@param id integer
---@param acceleration number
---@param reset boolean
function GuiAnimateScaleIn( gui, id, acceleration, reset ) end

---@param gui_or_string obj|string
---@param x number?
---@param y number?
---@param text string?>
function GuiText( gui_or_string, x, y, text ) end


---Deprecated. Use GuiOptionsAdd() or GuiOptionsAddForNextWidget() with GUI_OPTION.Align_HorizontalCenter and GuiText() instead.
---@param gui obj
---@param x number
---@param y number
---@param text string
---@deprecated
function GuiTextCentered( gui, x, y, text ) end

---'scale' will be used for 'scale_y' if 'scale_y' equals 0.
---@param gui obj
---@param id integer
---@param x number
---@param y number
---@param sprite_filename string
---@param alpha number?
---@param scale number?
---@param scale_y number?
---@param rotation number?
---@param rect_animation_playback_type integer?
---@param rect_animation_name string?
function GuiImage( gui, id, x, y, sprite_filename, alpha, scale, scale_y, rotation, rect_animation_playback_type, rect_animation_name ) end

---@param gui obj
---@param id integer
---@param x number
---@param y number
---@param width number
---@param height number
---@param alpha number?
---@param sprite_filename string?
---@param sprite_highlight_filename string?
function GuiImageNinePiece( gui, id, x, y, width, height, alpha, sprite_filename, sprite_highlight_filename ) end

---The old parameter order where 'id' is the last parameter is still supported. The function dynamically picks the correct order based on the type of the 4th parameter.
---@param gui obj
---@param id integer|number
---@param x number
---@param y number|string
---@param text string|integer
---@return boolean clicked
---@return boolean right_clicked
function GuiButton( gui, id, x, y, text ) end

---@param gui obj
---@param id integer
---@param x number
---@param y number
---@param text string
---@param sprite_filename string
---@return boolean clicked
---@return boolean right_clicked
function GuiImageButton( gui, id, x, y, text, sprite_filename ) end

---This is not intended to be outside mod settings menu, and might bug elsewhere.
---@param gui obj
---@param id integer
---@param x number
---@param y number
---@param text string
---@param value number
---@param value_min number
---@param value_max number
---@param value_default number
---@param value_display_multiplier number
---@param value_formatting string
---@param width number
---@return number new_value
function GuiSlider( gui, id, x, y, text, value, value_min, value_max, value_default, value_display_multiplier, value_formatting, width ) end

---'allowed_characters' should consist only of ASCII characters. This is not intended to be outside mod settings menu, and might bug elsewhere.
---@param gui obj
---@param id integer
---@param x number
---@param y number
---@param text string
---@param width number
---@param max_length integer
---@param allowed_characters string?
---@return string new_text
function GuiTextInput( gui, id, x, y, text, width, max_length, allowed_characters ) end

---@param gui obj
function GuiBeginAutoBox( gui ) end

---@param gui obj
---@param margin number?
---@param size_min_x number?
---@param size_min_y number?
---@param mirrorize_over_x_axis boolean?
---@param x_axis number?
---@param sprite_filename string?
---@param sprite_highlight_filename string?
function GuiEndAutoBoxNinePiece( gui, margin, size_min_x, size_min_y, mirrorize_over_x_axis, x_axis, sprite_filename, sprite_highlight_filename ) end

---@param gui obj
---@param text string
---@param description string
function GuiTooltip( gui, text, description ) end

---This can be used to create a container with a vertical scroll bar. Widgets between GuiBeginScrollContainer() and GuiEndScrollContainer() will be positioned relative to thecontainer.
---@param gui obj
---@param id integer
---@param x number
---@param y number
---@param width number
---@param height number
---@param scrollbar_gamepad_focusable boolean?
---@param margin_x number?
---@param margin_y number?
function GuiBeginScrollContainer( gui, id, x, y, width, height, scrollbar_gamepad_focusable, margin_x, margin_y ) end

---@param gui obj
function GuiEndScrollContainer( gui ) end

---If 'position_in_ui_scale' is 1, x and y will be in the same scale as other gui positions, otherwise x and y are given as a percentage (0-100) of the gui screen size.
---@param gui obj
---@param x number
---@param y number
---@param position_in_ui_scale boolean?
---@param margin_x number?
---@param margin_y number?
function GuiLayoutBeginHorizontal( gui, x, y, position_in_ui_scale, margin_x, margin_y ) end

---If 'position_in_ui_scale' is 1, x and y will be in the same scale as other gui positions, otherwise x and y are given as a percentage (0-100) of the gui screen size.
---@param gui obj
---@param x number
---@param y number
---@param position_in_ui_scale boolean?
---@param margin_x number?
---@param margin_y number?
function GuiLayoutBeginVertical( gui, x, y, position_in_ui_scale, margin_x, margin_y ) end

---Will use the horizontal margin from current layout if amount is not set.
---@param gui obj
---@param amount number?
function GuiLayoutAddHorizontalSpacing( gui, amount ) end

---Will use the vertical margin from current layout if amount is not set.
---@param gui obj
---@param amount number?
function GuiLayoutAddVerticalSpacing( gui, amount ) end

---@param gui obj
function GuiLayoutEnd( gui ) end

---Puts following things to a new layout layer. Can be used to create non-layouted widgets inside a layout.
---@param gui obj
function GuiLayoutBeginLayer( gui ) end

---@param gui obj
function GuiLayoutEndLayer( gui ) end

---Returns dimensions of viewport in the gui coordinate system (which is equal to the coordinates of the screen bottom right corner in gui coordinates). The values returnedmay change depending on the game resolution because the UI is scaled for pixel-perfect text rendering.
---@param gui obj
---@return number width
---@return number height
function GuiGetScreenDimensions( gui ) end

---Returns size of the given text in the gui coordinate system.
---@param gui obj
---@param text string
---@param scale number?
---@param line_spacing number?
---@return number width
---@return number height
function GuiGetTextDimensions( gui, text, scale, line_spacing ) end

---Returns size of the given image in the gui coordinate system.
---@param gui obj
---@param image_filename string
---@param scale number?
---@return number width
---@return number height
function GuiGetImageDimensions( gui, image_filename, scale ) end

---Returns the final position, size etc calculated for a widget. Some values aren't supported by all widgets.
---@param gui obj
---@return boolean clicked
---@return boolean _right_clicked
---@return boolean _hovered
---@return number _x
---@return number _y
---@return number _width
---@return number _height
---@return number _draw_x
---@return number _draw_y
---@return number _draw_width
---@return number _draw_height
function GuiGetPreviousWidgetInfo( gui ) end

---@return boolean
function GameIsBetaBuild() end

---@return boolean
function DebugGetIsDevBuild() end

function DebugEnableTrailerMode() end

---@return boolean
function GameGetIsTrailerModeEnabled() end

---This doesn't do anything at the moment.
function Debug_SaveTestPlayer() end

---@param x number?
---@param y number?
---@return string
function DebugBiomeMapGetFilename( x, y ) end

---@param entity_id integer
---@param material string
function EntityConvertToMaterial( entity_id, material ) end

---@param material_dynamic string?
---@param material_static string?
function ConvertEverythingToGold( material_dynamic, material_static ) end

---Converts 'material_from' to 'material_to' everwhere in the game world, replaces 'material_from_type' to 'material_to_type' in the material (CellData) global table, andmarks 'material_from' as a "Transformed" material. Every call will add a new entry to WorldStateComponent which serializes these changes, so please call sparingly. Thematerial conversion will be spread over multiple frames. 'material_from' will still retain the original name id and wang color. Use CellFactory_GetType() to convert a materialname to material type.
---@param material_from_type integer
---@param material_to_type integer
function ConvertMaterialEverywhere( material_from_type, material_to_type ) end

---Converts cells of 'material_from_type' to 'material_to_type' in the given area. If 'box2d_trim' is true, will attempt to trim the created cells where they might otherwisecause physics glitching. 'update_edge_graphics_dummy' is not yet supported.
---@param area_x integer
---@param area_y integer
---@param area_w integer
---@param area_h integer
---@param material_from_type integer
---@param material_to_type integer
---@param trim_box2d boolean
---@param update_edge_graphics_dummy boolean
function ConvertMaterialOnAreaInstantly( area_x, area_y, area_w, area_h, material_from_type, material_to_type, trim_box2d, update_edge_graphics_dummy ) end

---@return integer
function GetDailyPracticeRunSeed() end

---Returns true if a mod with the id 'mod_id' is currently active. For example mod_id = "nightmare". 
---@param mod_id string
---@return boolean
function ModIsEnabled( mod_id ) end

---Returns a table filled with the IDs of currently active mods.
---@return table
function ModGetActiveModIDs() end

---@return integer
function ModGetAPIVersion() end

---Returns the value of a mod setting. 'id' should normally be in the format 'mod_name.setting_id'. Cache the returned value in your lua context if possible.
---@param id string
---@return boolean|number|string|nil
function ModSettingGet( id ) end

---@param id string
---@param value boolean|number|string
function ModSettingSet( id, value ) end

---Returns the latest value set by the user, which might not be equal to the value that is used in the game (depending on the 'scope' value selected for the setting).
---@param id string
---@return boolean|number|string|nil
function ModSettingGetNextValue( id ) end

---Sets the latest value set by the user, which might not be equal to the value that is displayed to the game (depending on the 'scope' value selected for the setting).
---@param id string
---@param value boolean|number|string
---@param is_default boolean
function ModSettingSetNextValue( id, value, is_default ) end

---@param id string
---@return boolean was_removed
function ModSettingRemove( id ) end

---Returns the number of mod settings defined. Use ModSettingGetAtIndex to enumerate the settings.
---@return integer
function ModSettingGetCount() end

---'index' should be 0-based index. Returns nil if 'index' is invalid.
---@param index integer
---@return string (name
---@return boolean|number|string|nil _value
---@return boolean|number|string|nil)_|_nil _value_next
function ModSettingGetAtIndex( index ) end

---@return boolean
function StreamingGetIsConnected() end

---@return string
function StreamingGetConnectedChannelName() end

---@return integer
function StreamingGetVotingCycleDurationFrames() end

---@return string
function StreamingGetRandomViewerName() end

---@return boolean
function StreamingGetSettingsGhostsNamedAfterViewers() end

---Sets the duration of the next wait and voting phases. Use -1 for default duration.
---@param time_between_votes_seconds number
---@param time_voting_seconds number
function StreamingSetCustomPhaseDurations( time_between_votes_seconds, time_voting_seconds ) end

---Cancels whatever is currently going on, and starts a new voting. _streaming_on_vote_start() and _streaming_get_event_for_vote() will be called as usually.
function StreamingForceNewVoting() end

---Turns the voting UI on or off.
---@param enabled boolean
function StreamingSetVotingEnabled( enabled ) end

---Basically calls dofile(from_filename) at the end of 'to_filename'. Available only during mod initialization.
---@param to_filename string
---@param from_filename string
function ModLuaFileAppend( to_filename, from_filename ) end

---Returns the current (modded or not) content of the data file 'filename'. Allows access only to data files and files from enabled mods. Available only during modinitialization.
---@param filename string
---@return string
function ModTextFileGetContent( filename ) end

---Sets the content the game sees for the file 'filename'. Allows access only to mod and data files. Available only during mod initialization.
---@param filename string
---@param new_content string
function ModTextFileSetContent( filename, new_content ) end

---Returns the id of the last mod that called ModTextFileSetContent with 'filename', or "". Available only during mod initialization.
---@param filename string
---@return string
function ModTextFileWhoSetContent( filename ) end

---Available only during mod initialization.
---@param filename string
function ModMagicNumbersFileAdd( filename ) end

---Available only during mod initialization.
---@param filename string
function ModMaterialsFileAdd( filename ) end

---Available only during mod initialization.
---@param filename string
function ModRegisterAudioEventMappings( filename ) end

---Please supply a path starting with "mods/YOUR_MOD_HERE/" or "data/". If override_existing is true, will always generate new maps, overriding existing files. UV maps aregenerated when you start or continue a game with your mod enabled. Available only during mod initialization via noita_dev.exe
---@param directory_path string
---@param override_existing boolean?
function ModDevGenerateSpriteUVsForDirectory( directory_path, override_existing ) end

---@param entity_filename string
function BeginProjectile( entity_filename ) end

function EndProjectile() end

---@param timeout_frames integer
function BeginTriggerTimer( timeout_frames ) end

function BeginTriggerHitWorld() end

function BeginTriggerDeath() end

function EndTrigger() end

function SetProjectileConfigs() end

---@param reload_time integer
function StartReload( reload_time ) end

---@param inventoryitem_id integer
---@param uses_remaining integer
---@return boolean uses_remaining_reduced
function ActionUsesRemainingChanged( inventoryitem_id, uses_remaining ) end

---@param inventoryitem_id integer
function ActionUsed( inventoryitem_id ) end

---@param action_name string
function LogAction( action_name ) end

---@param action_id string
function OnActionPlayed( action_id ) end

function OnNotEnoughManaForAction() end

---@param name string
function BaabInstruction( name ) end

---@param key string
---@param value number
function SetValueNumber( key, value ) end

---@param key string
---@param default_value number
---@return number
function GetValueNumber( key, default_value ) end

---@param key string
---@param value integer
function SetValueInteger( key, value ) end

---@param key string
---@param default_value integer
---@return integer
function GetValueInteger( key, default_value ) end

---@param key string
---@param value number
function SetValueBool( key, value ) end

---@param key string
---@param default_value number
---@return boolean
function GetValueBool( key, default_value ) end

---Returns the script's return value, if any. Returns nil,error_string if the script had errors.
---@param filename string
---@return any script_return_value
---@return string script_error_value
function dofile( filename ) end

---Runs the script only once per lua context, returns the script's return value, if any. Returns nil,error_string if the script had errors. For performance reasons it isrecommended scripts use dofile_once(), unless the standard dofile behaviour is required.
---@param filename string
---@return any script_return_value
---@return string script_error_value
function dofile_once( filename ) end

---First this is called for all mods
function OnModPreInit() end

---After that this is called for all mods
function OnModInit() end

---Then this is called for all mods
function OnModPostInit() end

---This runs when player entity has been created
---@param player_entity integer player entity id
function OnPlayerSpawned( player_entity ) end

---This is called once the game world is initialized. Doesn't ensure any world chunks actually exist. Use OnPlayerSpawned to ensure the chunks around player have been loaded or created.
function OnWorldInitialized() end

---This is called every time the game is about to start updating the world
function OnWorldPreUpdate() end

---This is called every time the game has finished updating the world
function OnWorldPostUpdate() end

---this is the last point where the Mod* API is available. after this materials.xml will be loaded.
function OnMagicNumbersAndWorldSeedInitialized() end

---Available only in data/scripts/gun/gun.lua
---
---Found in data/scripts/gun/gun_generated.lua
---@param actions_per_round integer
---@param shuffle_deck_when_empty integer
---@param reload_time integer
---@param deck_capacity integer
function RegisterGun( actions_per_round, shuffle_deck_when_empty, reload_time, deck_capacity) end

---Available only in data/scripts/gun/gun.lua
---@param entity_filename string
function RegisterProjectile( entity_filename ) end

---Available only in data/scripts/gun/gun.lua
---
---Found in data/scripts/gun/gunshoteffects_generated.lua
---@param recoil_knockback number
function RegisterGunShotEffects( recoil_knockback ) end

---Available only in data/scripts/gun/gun.lua
---@param entity_filename string
function Reflection_RegisterProjectile( entity_filename ) end

---Available only in data/scripts/gun/gun.lua
---
---Found in data/scripts/gun/gunaction_generated.lua
---@param action_id integer
---@param action_name string
---@param action_description string
---@param action_sprite_filename string
---@param action_unidentified_sprite_filename string
---@param action_type string
---@param action_spawn_level integer
---@param action_spawn_probability number
---@param action_spawn_requires_flag boolean
---@param action_spawn_manual_unlock boolean
---@param action_max_uses integer
---@param custom_xml_file boolean
---@param action_mana_drain integer
---@param action_is_dangerous_blast boolean
---@param action_draw_many_count any
---@param action_ai_never_uses boolean
---@param action_never_unlimited boolean
---@param state_shuffled boolean
---@param state_cards_drawn boolean
---@param state_discarded_action boolean
---@param state_destroyed_action boolean
---@param fire_rate_wait integer
---@param speed_multiplier number
---@param child_speed_multiplier number
---@param dampening number
---@param explosion_radius number
---@param spread_degrees number
---@param pattern_degrees number
---@param screenshake number
---@param recoil number
---@param damage_melee_add number
---@param damage_projectile_add number
---@param damage_electricity_add number
---@param damage_fire_add number
---@param damage_explosion_add number
---@param damage_ice_add number
---@param damage_slice_add number
---@param damage_healing_add number
---@param damage_curse_add number
---@param damage_drill_add number
---@param damage_critical_chance number
---@param damage_critical_multiplier number
---@param explosion_damage_to_materials number
---@param knockback_force number
---@param reload_time integer
---@param lightning_count integer
---@param material integer
---@param material_amount integer
---@param trail_material integer
---@param trail_material_amount integer
---@param bounces integer
---@param gravity number
---@param light number
---@param blood_count_multiplier number
---@param gore_particles integer
---@param ragdoll_fx string
---@param friendly_fire integer
---@param physics_impulse_coeff number
---@param lifetime_add number
---@param sprite integer
---@param extra_entities table<string>
---@param game_effect_entities table<string>
---@param sound_loop_tag string
---@param projectile_file string
function RegisterGunAction(action_id, action_name, action_description, action_sprite_filename, action_unidentified_sprite_filename, action_type, action_spawn_level, action_spawn_probability, action_spawn_requires_flag, action_spawn_manual_unlock, action_max_uses, custom_xml_file, action_mana_drain, action_is_dangerous_blast, action_draw_many_count, action_ai_never_uses, action_never_unlimited, state_shuffled, state_cards_drawn, state_discarded_action, state_destroyed_action, fire_rate_wait, speed_multiplier, child_speed_multiplier, dampening, explosion_radius, spread_degrees, pattern_degrees, screenshake, recoil, damage_melee_add, damage_projectile_add, damage_electricity_add, damage_fire_add, damage_explosion_add, damage_ice_add, damage_slice_add, damage_healing_add, damage_curse_add, damage_drill_add, damage_critical_chance, damage_critical_multiplier, explosion_damage_to_materials, knockback_force, reload_time, lightning_count, material, material_amount, trail_material, trail_material_amount, bounces, gravity, light, blood_count_multiplier, gore_particles, ragdoll_fx, friendly_fire, physics_impulse_coeff, lifetime_add, sprite, extra_entities, game_effect_entities, sound_loop_tag, projectile_file) end

---@param msg string
function print_error( msg ) end

---Found in data/entities/_debug/game_reset.lua
function DEBUG_GameReset() end