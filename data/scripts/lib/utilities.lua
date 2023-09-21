---@diagnostic disable: lowercase-global, deprecated, cast-local-type
NULL_ENTITY = 0
ORB_COUNT_IN_WORLD = 11

----------------------------------------------------------------------------------------

---Computes a random value between low and high.
---@param low number
---@param high number
---@return number
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function rand( low, high )
    if low > high then
        local t = low
        low = high
        high = t
    end
    
    return low + Random() * (high - low)
end

----------------------------------------------------------------------------------------

---Returns a random value from the given array
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
---@param varray table
---@return any random_array_value
function random_from_array( varray )
	local r = Random( 1, #varray )
	return varray[ r ]
end

----------------------------------------------------------------------------------------

---Packages the given x-y values into a vec2. Needed to create pseudo-randomness.
---@param x_value number
---@param y_value number
---@return { x:number, y:number } { x=x_value, y=y_value }
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function random_create( x_value, y_value )
	local result = {}
	result.x = x_value
	result.y = y_value
	return result
end

---Computes a new random value between min and max while incrementing by 1 the rnd.y value.
---@param rnd { x:number, y:number } { x=x_value, y=y_value }
---@param min number
---@param max number
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function random_next( rnd, min, max )
	local result = ProceduralRandomf( rnd.x, rnd.y, min, max )
	rnd.y = rnd.y + 1
	return result
end

---Computes a new random integer between min and max while incrementing by 1 the rnd.y value
---@param rnd { x:number, y:number } { x=x_value, y=y_value }
---@param min integer
---@param max integer
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function random_nexti( rnd, min, max )
	local result = ProceduralRandomi( rnd.x, rnd.y, min, max )
	rnd.y = rnd.y + 1
	return result
end

---Given an array of tables whose entries each have a chance field and are ordered from most likely to least; basically this method returns a table from this array while giving a change to the least probable outcome.
---@param t table each entry must be a table with a **chance** parameter.
---@param rnd {x:integer, y:integer}
---@return any
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function pick_random_from_table_backwards( t, rnd )
	local result = nil
	local len = #t

	for i=len,1, -1 do
		if random_next( rnd, 0.0, 1.0 ) <= t[i].chance then
			result = t[i]
			break
		end
	end

	if result == nil then
		result = t[1]
	end

	return result
end

---Given an array of tables whose entries each have a probability field; this function selects a random item from the table based on its probability.
---
---Returns nil if t is an empty table.
---@param rnd {x:integer, y:integer}
---@param t table<unknown> each entry must be a table with a **chance** parameter.
---@return unknown|nil
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function pick_random_from_table_weighted( rnd, t )
	if #t == 0 then return nil end
	
	local weight_sum = 0.0
	for _,it in ipairs(t) do
		it.weight_min = weight_sum
		it.weight_max = weight_sum + it.probability
		weight_sum = it.weight_max
	end

	local val = random_next( rnd, 0.0, weight_sum )
	local result = t[1]
	for _,it in ipairs(t) do
		if val >= it.weight_min and val <= it.weight_max then
			result = it
			break
		end
	end

	return result
end

----------------------------------------------------------------------------------------

---Returns true if the provided argument is nil or an empty string.
---@param s string
---@return boolean
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function string_isempty(s)
  return s == nil or s == ''
end

----------------------------------------------------------------------------------------

---This method iterates over all the components of the same type
---@param component_type_name any
---@param fn function (component_index, component_id) => do_something
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function for_comps( component_type_name, fn )
	local this  = GetUpdatedEntityID()
	local comps = EntityGetComponent( this, component_type_name )
	if( comps ~= nil ) then
		for index,comp in ipairs(comps) do
			fn( index, comp )
		end 
	end
end

----------------------------------------------------------------------------------------

---This method converts a given value to string.
---
---A boolean value is formatted as an integer.
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
---@param value unknown
---@return string
function to_string( value )
	if value == true  then return "1" end
	if value == false then return "0" end
	return tostring(value)
end

----------------------------------------------------------------------------------------

---Returns true if the provided entity_id is not null and different from zero.
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
---@param entity_id integer
---@return boolean
function is_valid_entity( entity_id )
	return entity_id ~= nil and entity_id ~= 0
end

----------------------------------------------------------------------------------------

---Gets the first component with the specified type and modifies some of its variables (whatever fn is specified to do).
---
---To get the specified component uses EntityGetFirstComponent (so doesn't return disabled components).
---@param entity_id integer
---@param component_type_name string
---@param fn function (component_id, modified_vars) => do_something; this function must write all the modified variables to *modified_vars* for the changes to be applied!
---@deprecated
---
---Deprecated, use edit_component2 instead.
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function edit_component( entity_id, component_type_name, fn )
	if not is_valid_entity( entity_id ) then
		return  
	end

	local comp = EntityGetFirstComponent( entity_id, component_type_name )
	if comp ~= nil then
		local modified_vars = { }
		fn( comp, modified_vars )
		for key,value in pairs( modified_vars ) do 
			ComponentSetValue( comp, key, to_string(value) )
		end
	end
end

----------------------------------------------------------------------------------------

---Gets the first component with the specified type and tag and modifies some of its variables (whatever fn is specified to do).
---
---To get the specified component uses EntityGetFirstComponent (so doesn't return disabled components).
---@param entity_id integer
---@param component_type_name string
---@param fn function (component_id, modified_vars) => do_something; this function must write all the modified variables to *modified_vars* for the changes to be applied!
---@deprecated
---
---Deprecated, use edit_component_with_tag2 instead.
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function edit_component_with_tag( entity_id, component_type_name, tag, fn )
	if not is_valid_entity( entity_id ) then
		return  
	end

	local comp = EntityGetFirstComponent( entity_id, component_type_name, tag )
	if comp ~= nil then
		local modified_vars = { }
		fn( comp, modified_vars )
		for key,value in pairs( modified_vars ) do 
			ComponentSetValue( comp, key, to_string(value) )
		end
	end
end

----------------------------------------------------------------------------------------

---Gets all the components of the specified type and modifies some of their variables (whatever fn is specified to do).
---
---To get the specified component uses EntityGetComponent.
---@param entity_id integer
---@param component_type_name string
---@param fn function (component_id, modified_vars) => do_something; this function must write all the modified variables to *modified_vars* for the changes to be applied!
---@deprecated
---
---Deprecated, use edit_all_components2 instead.
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function edit_all_components( entity_id, component_type_name, fn )
	if not is_valid_entity( entity_id ) then  
		return  
	end

	local comps = EntityGetComponent( entity_id, component_type_name )
	if comps ~= nil then
		for i,comp in ipairs(comps) do
			local modified_vars = { }
			fn( comp, modified_vars )
			for key,value in pairs( modified_vars ) do
				ComponentSetValue( comp, key, to_string(value) )
			end
		end
	end
end

----------------------------------------------------------------------------------------

---Gets the n-th component of the specified type and modifies some of its variables (whatever fn is specified to do).
---
---To get the specified component uses EntityGetComponent.
---@param entity_id integer
---@param component_type_name string
---@param n integer
---@param fn function (component_id, modified_vars) => do_something; this function must write all the modified variables to *modified_vars* for the changes to be applied!
---@deprecated
---
---Deprecated, use edit_nth_component2 instead.
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function edit_nth_component( entity_id, component_type_name, n, fn )
	if not is_valid_entity( entity_id ) then  
		return  
	end

	local nn = 0
	local comps = EntityGetComponent( entity_id, component_type_name )
	if comps ~= nil then
		for i,comp in ipairs(comps) do
			if nn == n then
				local modified_vars = { }
				fn( comp, modified_vars )
				for key,value in pairs( modified_vars ) do
					ComponentSetValue( comp, key, to_string(value) )
				end
				break
			end
			nn = nn + 1
		end
	end
end

----------------------------------------------------------------------------------------

---Get the specified variable value of a component; if no such component exist then return the default value.
---@param entity_id integer
---@param component_type_name string
---@param value_name string
---@param default any
---@return any value
---@deprecated
---
---Deprecated, use component_get_value2 instead.
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function component_get_value( entity_id, component_type_name, value_name, default )
	if not is_valid_entity( entity_id ) then  
		return default
	end

	local comp = EntityGetFirstComponent( entity_id, component_type_name )
	if comp ~= nil then
		return ComponentGetValue( comp, value_name )
	end

	return default
end

----------------------------------------------------------------------------------------

---Get the specified integer variable value of a component; if no such component exist then return the default value.
---@param entity_id integer
---@param component_type_name string
---@param value_name string
---@param default integer
---@return integer value
---@deprecated
---
---Deprecated, use component_get_value2 instead.
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function component_get_value_int( entity_id, component_type_name, value_name, default )
	if not is_valid_entity( entity_id ) then  
		return default
	end

	local comp = EntityGetFirstComponent( entity_id, component_type_name )
	if comp ~= nil then
		return ComponentGetValueInt( comp, value_name )
	end

	return default
end

----------------------------------------------------------------------------------------

---Get the specified float variable value of a component; if no such component exist then return the default value.
---@param entity_id integer
---@param component_type_name string
---@param value_name string
---@param default number
---@return number value
---@deprecated
---
---Deprecated, use component_get_value2 instead.
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function component_get_value_float( entity_id, component_type_name, value_name, default )
	if not is_valid_entity( entity_id ) then  
		return default
	end

	local comp = EntityGetFirstComponent( entity_id, component_type_name )
	if comp ~= nil then
		return ComponentGetValueFloat( comp, value_name )
	end

	return default
end

----------------------------------------------------------------------------------------

---Get the specified vec2 variable value of a component; if no such component exist then return the default value.
---@param entity_id integer
---@param component_type_name string
---@param value_name string
---@param default_x number
---@param default_y number
---@return number value_x
---@return number value_y
---@deprecated
---
---Deprecated, use component_get_value2 instead.
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function component_get_value_vector2( entity_id, component_type_name, value_name, default_x, default_y )
	if not is_valid_entity( entity_id ) then  
		return default_x, default_y
	end

	local comp = EntityGetFirstComponent( entity_id, component_type_name )
	if comp ~= nil then
		return ComponentGetValueVector2( comp, value_name, default_x, default_y )
	end

	return default_x, default_y
end

----------------------------------------------------------------------------------------

---Returns the VariableStorageComponent with the specified name value; if no such component was found, returns nil.
---
---If entity_id is invalid, return nil.
---___
---**VariableStorageComponent**
---|member|type|
---|:-------|:------:|
---|name|string|
---|value_string|string|
---|value_int|integer|
---|value_bool|boolean|
---|value_float|number|
---@param entity_id integer
---@param name string
---@return integer|nil
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function get_variable_storage_component( entity_id, name )
	if not is_valid_entity( entity_id ) then  
		return nil
	end

	local components = EntityGetComponent( entity_id, "VariableStorageComponent" )
	if( components ~= nil ) then
		for _,comp_id in pairs(components) do 
			local var_name = ComponentGetValue( comp_id, "name" )
			if( var_name == name) then
				return comp_id
			end
		end
	end

	return nil
end

---Returns the VariableStorageComponent with the **perk_pickup_count** name value; if no such component was found, add such component to the entity and return the default value of 1.
---
---If entity_id is invalid, return nil.
---___
---**VariableStorageComponent:perk_pickup_count**
---|member|type|
---|:-------|:------:|
---|name|perk_pickup_count|
---|value_int|integer|
---@param entity_id integer
---@return integer|nil perk_pickup_count_value
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function get_stored_perk_pickup_count( entity_id )
	if not is_valid_entity( entity_id ) then  
		return nil
	end

	local value = nil
	local storage_comp = get_variable_storage_component(entity_id, "perk_pickup_count")
	if storage_comp ~= nil then
		component_read(storage_comp, { value_int = 0 }, function(comp)
			value = comp.value_int
		end)
	else
		value = 1
		EntityAddComponent( entity_id, "VariableStorageComponent", 
		{ 
			name = "perk_pickup_count",
			value_int = value,
		})
	end

	return value
end

-- component API v2 --------------------------------------------------------------------

---Gets the first component with the specified type and modifies some of its variables (whatever fn is specified to do).
---
---To get the specified component uses EntityGetFirstComponent (so doesn't return disabled components).
---@param entity_id integer
---@param component_type_name string
---@param fn function (component_id, modified_vars) => do_something; this function must put all the modified variables inside of modified_vars for the changes to be applied!
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function edit_component2( entity_id, component_type_name, fn )
	if not is_valid_entity( entity_id ) then
		return  
	end

	local comp = EntityGetFirstComponent( entity_id, component_type_name )
	if comp ~= nil then
		local modified_vars = { }
		fn( comp, modified_vars )
		for key,value in pairs( modified_vars ) do 
			ComponentSetValue2( comp, key, value )
		end
	end
end

---Gets the first component with the specified type and modifies some of its variables (whatever fn is specified to do).
---
---@param component_id integer
---@param component_prototype table this table should contain labels that share name with the members of the specified component; it doesn't matter how they are initialized.
---@param fn function (component_prototype) => do_something; this function must write directly to component_prototype for the changes to be applied!
-- # Example usage
---```lua
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---
---component_readwrite( 
---    EntityGetFirstComponent( GetUpdatedEntityID(), "DamageModelComponent" ), 
---    { hp = 0, max_hp = 0 }, 
---    function( comp )
---        comp.max_hp = comp.max_hp * 1.5
---        comp.hp = comp.max_hp
---    end
---)
---```
function component_readwrite( component_id, component_prototype, fn )
	if component_id ~= nil then
		for key,value in pairs( component_prototype ) do 
			component_prototype[key] = ComponentGetValue2( component_id, key )
		end
		fn( component_prototype )
		for key,value in pairs( component_prototype ) do 
			ComponentSetValue2( component_id, key, value )
		end
	end
end

---Gets the first component with the specified type and reads some of its variables (whatever fn is specified to do).
---
---@param component_id integer
---@param component_prototype table this table should contain labels that share name with the members of the specified component; it doesn't matter how they are initialized.
---@param fn function (component_prototype) => do_something; this function must write directly to component_prototype for the changes to be applied!
-- # Example usage
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua"
---component_read( 
---    EntityGetFirstComponent( GetUpdatedEntityID(), "DamageModelComponent" ), 
---    { max_hp = 0 }, 
---    function(comp)
---        print( comp.max_hp )
---        comp.max_hp = 100 -- this has no effect
---    end
---)
---```
function component_read( component_id, component_prototype, fn )
	if component_id ~= nil then
		for key,value in pairs( component_prototype ) do 
			component_prototype[key] = ComponentGetValue2( component_id, key )
		end
		fn( component_prototype )
	end
end

---Gets the first component with the specified type and overrides all its members with the values specified in *component_keys_and_values*.
---@param component_id integer
---@param component_keys_and_values table this table should contain labels that share name with the members of the specified component; these values will be used to override the original component values.
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---
---component_write( 
---    EntityGetFirstComponent( GetUpdatedEntityID(), "DamageModelComponent" ), 
---    { max_hp = 100 } 
---)
---```
function component_write( component_id, component_keys_and_values )
	if component_id ~= nil then
		for key,value in pairs( component_keys_and_values ) do 
			ComponentSetValue2( component_id, key, value )
		end
	end
end

----------------------------------------------------------------------------------------

---Gets the first component with the specified type and tag and modifies some of its variables (whatever fn is specified to do).
---
---To get the specified component uses EntityGetFirstComponent (so doesn't return disabled components).
---@param entity_id integer
---@param component_type_name string
---@param tag string
---@param fn function (component_id, modified_vars) => do_something; this function must write all the modified variables to *modified_vars* for the changes to be applied!
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function edit_component_with_tag2( entity_id, component_type_name, tag, fn )
	if not is_valid_entity( entity_id ) then
		return  
	end

	local comp = EntityGetFirstComponent( entity_id, component_type_name, tag )
	if comp ~= nil then
		local modified_vars = { }
		fn( comp, modified_vars )
		for key,value in pairs( modified_vars ) do 
			ComponentSetValue2( comp, key, value )
		end
	end
end

----------------------------------------------------------------------------------------

---Gets all the components of the specified type and modifies some of their variables (whatever fn is specified to do).
---
---To get the specified component uses EntityGetComponent.
---@param entity_id integer
---@param component_type_name string
---@param fn function (component_id, modified_vars) => do_something; this function must write all the modified variables to *modified_vars* for the changes to be applied!
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function edit_all_components2( entity_id, component_type_name, fn )
	if not is_valid_entity( entity_id ) then  
		return  
	end

	local comps = EntityGetComponent( entity_id, component_type_name )
	if comps ~= nil then
		for i,comp in ipairs(comps) do
			local modified_vars = { }
			fn( comp, modified_vars )
			for key,value in pairs( modified_vars ) do
				ComponentSetValue2( comp, key, value )
			end
		end
	end
end

----------------------------------------------------------------------------------------

---Gets the n-th component of the specified type and modifies some of its variables (whatever fn is specified to do).
---
---To get the specified component uses EntityGetComponent.
---@param entity_id integer
---@param component_type_name string
---@param n integer
---@param fn function (component_id, modified_vars) => do_something; this function must write all the modified variables to *modified_vars* for the changes to be applied!
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function edit_nth_component2( entity_id, component_type_name, n, fn )
	if not is_valid_entity( entity_id ) then  
		return  
	end

	local nn = 0
	local comps = EntityGetComponent( entity_id, component_type_name )
	if comps ~= nil then
		for i,comp in ipairs(comps) do
			if nn == n then
				local modified_vars = { }
				fn( comp, modified_vars )
				for key,value in pairs( modified_vars ) do
					ComponentSetValue2( comp, key, value )
				end
				break
			end
			nn = nn + 1
		end
	end
end

----------------------------------------------------------------------------------------

---Get the specified variable value of a component; if no such component exist then return the default value.
---@param entity_id integer
---@param component_type_name string
---@param value_name string
---@param default any
---@return any value
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function component_get_value2( entity_id, component_type_name, value_name, default )
	if not is_valid_entity( entity_id ) then  
		return default
	end

	local comp = EntityGetFirstComponent( entity_id, component_type_name )
	if comp ~= nil then
		return ComponentGetValue2( comp, value_name )
	end

	return default
end

-- =====================================================================================

---Returns all the etities with the tag "player_unit".
---@return table player_ids
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function get_players()
	return EntityGetWithTag( "player_unit" )
end

---Returns the GenomeDataComponent id of the specified entity; if no such component exists, return -1.
---@param entity_id integer
---@return integer genome_data_component_id
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function get_herd_id( entity_id )
	return component_get_value_int( entity_id, "GenomeDataComponent", "herd_id", -1 )
end

----------------------------------------------------------------------------------------

---Creates and 'shoots' the specified projectile on behalf of 'shooter_id'.
---@param shooter_id integer shooter_id
---@param projectile_file string
---@param start_x number
---@param start_y number
---@param vel_x number
---@param vel_y number
---@param send_message boolean?
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function shoot_projectile( shooter_id, projectile_file, start_x, start_y, vel_x, vel_y, send_message )
	local entity_id = EntityLoad( projectile_file, start_x, start_y )
	local herd_id   = get_herd_id( shooter_id )
	if( send_message == nil ) then send_message = true end

	GameShootProjectile( shooter_id, start_x, start_y, start_x+vel_x, start_y+vel_y, entity_id, send_message )

	edit_component( entity_id, "ProjectileComponent", function(comp,vars)
		vars.mWhoShot       = shooter_id
		vars.mShooterHerdId = herd_id
	end)

	edit_component( entity_id, "VelocityComponent", function(comp,vars)
		ComponentSetValueVector2( comp, "mVelocity", vel_x, vel_y )
	end)

	return entity_id
end

----------------------------------------------------------------------------------------

---Creates and 'shoots' the specified projectile on behalf of 'shooter_id'.
---
---Automatically deduces if the spawned projectile should have friendly_fire_enabled and what values to assign to mWhoShot and mShooterHerdId.
---@param shooter_id integer shooter_id
---@param projectile_file string
---@param start_x number
---@param start_y number
---@param vel_x number
---@param vel_y number
---@return integer new_projectile_id
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function shoot_projectile_from_projectile( shooter_id, projectile_file, start_x, start_y, vel_x, vel_y )
	local entity_id = EntityLoad( projectile_file, start_x, start_y )
	local entity_that_shot = GetUpdatedEntityID()

	local who_shot_creature = 0
	edit_component( shooter_id, "ProjectileComponent", function(comp,vars)
		who_shot_creature = ComponentGetValue2( comp, "mWhoShot" )
		ComponentSetValue2( comp, "mEntityThatShot", entity_that_shot )
	end)


	GameShootProjectile( who_shot_creature, start_x, start_y, start_x+vel_x, start_y+vel_y, entity_id, true, shooter_id )

	edit_component( entity_id, "ProjectileComponent", function(comp,vars)
		vars.mWhoShot       = component_get_value_int( shooter_id, "ProjectileComponent", "mWhoShot", 0 )
		vars.mShooterHerdId = component_get_value_int( shooter_id, "ProjectileComponent", "mShooterHerdId", 0 )
	end)

	edit_component( entity_id, "VelocityComponent", function(comp,vars)
		ComponentSetValueVector2( comp, "mVelocity", vel_x, vel_y)
	end)
	
	if EntityHasTag( shooter_id, "friendly_fire_enabled" ) then
		EntityAddTag( entity_id, "friendly_fire_enabled" )
		
		edit_component( entity_id, "ProjectileComponent", function(comp,vars)
			ComponentSetValue2( comp, "friendly_fire", true )
			ComponentSetValue2( comp, "collide_with_shooter_frames", 6 )
		end)
	end

	return entity_id
end

----------------------------------------------------------------------------------------

---Returns true if the current LuaComponent running the script can run the script again; if this script was never run before, this will return false.
---@param entity_id integer unused variable.
---@param frames integer wait frames.
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function script_wait_frames( entity_id, frames )
	local frame_now      = GameGetFrameNum()

	local last_execution = ComponentGetValueInt( GetUpdatedComponentID(),  "mLastExecutionFrame" )
	--print(last_execution)
	if( last_execution == nil ) then
		return false
	end

	if last_execution > -1 and (frame_now - last_execution) < frames then 
		return true
	end
	
	return false
end

----------------------------------------------------------------------------------------


---Loads the specified rope with two joints. If the entity specified by *entity_filename* doesn't have a VerletPhysicsComponent this will only print the error to console.
---@param entity_filename string
---@param joint1_x number
---@param joint1_y number
---@param joint2_x number
---@param joint2_y number
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function load_verlet_rope_with_two_joints( entity_filename, joint1_x, joint1_y, joint2_x, joint2_y )
	local entity_id = EntityLoad( entity_filename, joint1_x, joint1_y )

	if is_valid_entity( entity_id ) then
		EntityAddComponent( entity_id, "VerletWorldJointComponent" )
		EntityAddComponent( entity_id, "VerletWorldJointComponent" )
	end

	local verletphysics_comp_found = false
	local last_point_index = 0
	edit_component( entity_id, "VerletPhysicsComponent", function(comp,vars)
		verletphysics_comp_found = true
		last_point_index = ComponentGetValue( comp, "num_points" )
	end)

	if verletphysics_comp_found then
		------
		local index = 0

		edit_all_components( entity_id, "VerletWorldJointComponent", function(comp,vars)
			
			if index == 0 then
				ComponentSetValueVector2( comp, "world_position", joint1_x, joint1_y )
			else
				ComponentSetValueVector2( comp, "world_position", joint2_x, joint2_y )
				vars.verlet_point_index = last_point_index
			end

			index = index + 1
		end)

	else
		------
		print( "load_verlet_rope_with_two_joints() called for an entity with no VerletPhysicsComponent, or invalid entity file(name).")
	end
end

----------------------------------------------------------------------------------------

---Loads the specified rope with one joint. If the entity specified by *entity_filename* doesn't have a VerletPhysicsComponent this will only print the error to console.
---
---The start position of such entity is determined by *joint_x* and *joint_y*, which coincides with the joint position.
---@param entity_filename string
---@param joint_x number
---@param joint_y number
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function load_verlet_rope_with_one_joint( entity_filename, joint_x, joint_y )
   -- print(entity_filename)
	local entity_id = EntityLoad( entity_filename, joint_x, joint_y )

	if is_valid_entity( entity_id ) then
		EntityAddComponent( entity_id, "VerletWorldJointComponent" )
	end

	local verletphysics_comp_found = false

	edit_component( entity_id, "VerletPhysicsComponent", function(comp,vars)
		verletphysics_comp_found = true
	end)

	if verletphysics_comp_found then

		edit_component( entity_id, "VerletWorldJointComponent", function(comp,vars)
			ComponentSetValueVector2( comp, "world_position", joint_x, joint_y )
		end)

	else
		------
		print( "load_verlet_rope_with_one_joint() called for an entity with no VerletPhysicsComponent, or invalid entity file(name).")
	end
end

----------------------------------------------------------------------------------------

---Adds a stack trace for debugging purposes.
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function debug_start_trace()
	local trace = function(event, line)
	      local s = debug.getinfo(2).short_src
	      print(s .. ":" .. line)
	end
   
	debug.sethook(trace, "l")
end

----------------------------------------------------------------------------------------

---This recursive function formats a table to console with the specified *table_depth*.
---@param table_to_print table
---@param table_depth integer
---@param parent_table string current table label
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function debug_print_table( table_to_print, table_depth, parent_table )
	local table_depth_ = table_depth or 1
	local parent_table_ = parent_table or "TABLE"
	local result = parent_table_ .. ": "
	
	if (table_depth_ > 1) then
		for i=1,table_depth_ - 1 do
			result = result .. " - "
		end
	end
	
	local subtables = {}
	
	if (table_to_print ~= nil) and (tostring(type(table_to_print)) == "table") then
		for i,v in pairs(table_to_print) do
			result = result .. tostring(i) .. "(" .. tostring(v) .. "), "
			
			if (tostring(type(v)) == "table") then
				table.insert(subtables, {i, v})
			end
		end
	end
	
	print( result )
	
	for i,v in ipairs( subtables ) do
		debug_print_table( v[2], table_depth_ + 1, "subtable " .. v[1] )
	end
end

-----------------------------------------------------------------------------------------

---Returns the direction (in radians) p1 should use to get to p2.
---
---Given two points p1,p2; the direction is calculated this way:
---p1 is assumed to be looking up (or has the direction value of π/2 radians = 90°).
---to calculate the direction, p1 must start rotating anticlockwise until it sees p2.
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number direction_angle_in_radians
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---``` 
function get_direction( x1, y1, x2, y2 )
	local result = math.pi - math.atan2( ( y2 - y1 ), ( x2 - x1 ) )
	return result
end

-----------------------------------------------------------------------------------------

---Returns the distance between two points.
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number distance
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function get_distance( x1, y1, x2, y2 )
	local result = math.sqrt( ( x2 - x1 ) ^ 2 + ( y2 - y1 ) ^ 2 )
	return result
end

-----------------------------------------------------------------------------------------

---Returns the distance squared between two points.
---
---More performant but does not return accurate distance in actual pixels. Good for comparing relative distances.
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number distance_squared
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function get_distance2( x1, y1, x2, y2 )
	-- Distance squared. More performant but does not return accurate distance in actual pixels. Good for comparing relative distances.
	local result = ( x2 - x1 ) ^ 2 + ( y2 - y1 ) ^ 2
	return result
end

-----------------------------------------------------------------------------------------

---This function computes the directional difference between two angles (in radians), accounting for the shortest rotation needed to go from angle d1 to angle d2.
---@param d1 number angle in radians
---@param d2 number angle in radians
---@return number direction_difference_in_radians
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---
---local angle1 = math.rad(30)
---local angle2 = math.rad(330)
---local diff = get_direction_difference(angle1, angle2)
---print(diff) -- Output: 1.0471975511966 (radians) = 60°
---```
function get_direction_difference( d1, d2 )
	local result = math.atan2( math.sin( d2 - d1 ), math.cos( d2 - d1 ) )
	return result
end

-----------------------------------------------------------------------------------------

---Returns the magnitude (or length) of a given vector.
---@param x number
---@param y number
---@return number magnitude
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function get_magnitude( x, y )
	local result = math.sqrt( x ^ 2 + y ^ 2 )
	return result
end

-----------------------------------------------------------------------------------------

---Computes the direction unit vector of a given angle in radians.
---@param rad number angle in radians
---@return number x math.cos(-rad)
---@return number y math.sin(rad)
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function rad_to_vec( rad )
	local x = math.cos(-rad)
	local y = math.sin(rad)
	return x,y
end

-----------------------------------------------------------------------------------------

---Clamps a given number between a min and a max value.
---@param value number
---@param min number
---@param max number
---@return number clamped_value
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function clamp(value, min, max)
	value = math.max(value, min)
	value = math.min(value, max)
	return value
end

-----------------------------------------------------------------------------------------

---Maps a value from one clamp range to another.
---@param value number
---@param old_min number
---@param old_max number
---@param new_min number
---@param new_max number
---@return number remapped_value
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function map(value, old_min, old_max, new_min, new_max)
	return (value - old_min) * (new_max - new_min) / (old_max - old_min) + new_min;
end

-----------------------------------------------------------------------------------------

---Returns the sign of a given number represented as an integer.
--- - -1: negative sign
--- - 0: zero
--- - 1: positive sign
---@param value number
---@return integer sign
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function sign(value)
	if value > 0 then
		return 1
	elseif value < 0 then
		return -1
	else
		return 0
	end
end

-----------------------------------------------------------------------------------------

---Linearly interpolates between a and b by t.
---@param a number
---@param b number
---@param t number usually t is between 0 and 1
---@return number blend_of_a_and_b
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function lerp(a, b, t)
	return a * t + b * (1 - t)
end

-----------------------------------------------------------------------------------------

---Linearly interpolates between two radian angles, a and b, by t.
---@param a number angle in radians.
---@param b number angle in radians.
---@param t number usually t is between 0 and 1
---@return number blend_of_a_and_b
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function rot_lerp(a, b, t)
    local pi2 = math.pi * 2
    local shortest = ((a-b) + math.pi) % pi2 - math.pi
    return b + (shortest * t) % pi2
end

-----------------------------------------------------------------------------------------

---Performs the addition operation between two vectors.
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number new_x
---@return number new_y
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function vec_add(x1, y1, x2, y2)
	x1 = x1 + x2
	y1 = y1 + y2
	return x1,y1
end

-----------------------------------------------------------------------------------------

---Performs the subtraction operation between two vectors.
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number new_x
---@return number new_y
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function vec_sub(x1, y1, x2, y2)
	x1 = x1 - x2
	y1 = y1 - y2
	return x1,y1
end

-----------------------------------------------------------------------------------------

---Multiplies a vector by a scalar value.
---@param x number
---@param y number
---@param scalar number
---@return number new_x
---@return number new_y
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function vec_mult(x, y, scalar)
	x = x * scalar
	y = y * scalar
	return x,y
end

-----------------------------------------------------------------------------------------

---Divides a vector by a scalar value.
---@param x number
---@param y number
---@param scalar number
---@return number new_x
---@return number new_y
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function vec_div(x, y, scalar)
	x = x / scalar
	y = y / scalar
	return x,y
end

-----------------------------------------------------------------------------------------

---Multiplies two vectors component-wise.
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number new_x
---@return number new_y
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function vec_scale(x1, y1, x2, y2)
	x1 = x1 * x2
	y1 = y1 * y2
	return x1,y1
end

-----------------------------------------------------------------------------------------

---Returns true if two vectors are equal component-wise.
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return boolean are_equal
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function vec_equals(x1, y1, x2, y2)
	return x1 == x2 and y1 == y2
end

-----------------------------------------------------------------------------------------

---Returns a normalized copy of a given vector.
---@param x number
---@param y number
---@return number new_x
---@return number new_y
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function vec_normalize(x, y)
	local m = get_magnitude(x, y)
	if m == 0 then return 0,0 end
	x = x / m
	y = y / m
	return x,y
end

-----------------------------------------------------------------------------------------

---Linearly interpolates between two vectors by t.
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param t number usually t is between 0 and 1
---@return number new_x
---@return number new_y
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function vec_lerp(x1, y1, x2, y2, t)
	local x = lerp(x1, x2, t)
	local y = lerp(y1, y2, t)
	return x,y
end

-----------------------------------------------------------------------------------------

---Performs the dot product between two vectors.
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number dot_product_value
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function vec_dot(x1, y1, x2, y2)
	return x1 * x2 + y1 * y2
end

-----------------------------------------------------------------------------------------

---Rotates a given vector by the specified angle around the origin.
---@param x number
---@param y number
---@param angle number angle in radians.
---@return number new_x
---@return number new_y
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function vec_rotate(x, y, angle)
	local ca = math.cos(angle)
	local sa = math.sin(angle)
	local px = ca * x - sa * y
	local py = sa * x + ca * y
	return px,py
end

teststring = "abcdefghijklmnopqrstuvwxyzdsice_trual_fgoipucrs_sm_t_theme"

---Decodes an obfuscated flag string.
---@param text string
---@return string decoded_flag_name
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function get_flag_name( text )
	local result = ""
	for i=1,#text do
		result = result .. string.sub(teststring, 26 + string.find( teststring, string.sub( text, i, i ) ), 26 + string.find( teststring, string.sub( text, i, i ) ) )
	end
	
	return result
end

-----------------------------------------------------------------------------------------

---Assign a new name and a new description to the specified entity_id.
---@param entity_id integer
---@param new_name string
---@param new_description string
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function change_entity_ingame_name( entity_id, new_name, new_description )
	if ( entity_id ~= nil ) then
		local uiinfo_comps = EntityGetComponent( entity_id, "UIInfoComponent" )
		local uiicon_comps = EntityGetComponent( entity_id, "UIIconComponent" )
		local item_comps = EntityGetComponent( entity_id, "ItemComponent" )
		local ability_comps = EntityGetComponent( entity_id, "AbilityComponent" )
		
		if ( uiinfo_comps ~= nil ) then
			for i,comp in ipairs( uiinfo_comps ) do
				if ( new_name ~= nil ) then
					ComponentSetValue2( comp, "name", new_name )
				end
			end
		end
		
		if ( uiicon_comps ~= nil ) then
			for i,comp in ipairs( uiicon_comps ) do
				if ( new_name ~= nil ) then
					ComponentSetValue2( comp, "name", new_name )
				end
				
				if ( new_description ~= nil ) then
					ComponentSetValue2( comp, "description", new_description )
				end
			end
		end
		
		if ( item_comps ~= nil ) then
			for i,comp in ipairs( item_comps ) do
				if ( new_name ~= nil ) then
					ComponentSetValue2( comp, "item_name", new_name )
				end
				
				if ( new_description ~= nil ) then
					ComponentSetValue2( comp, "ui_description", new_description )
				end
			end
		end
		
		if ( ability_comps ~= nil ) then
			for i,comp in ipairs( ability_comps ) do
				if ( new_name ~= nil ) then
					ComponentSetValue2( comp, "ui_name", new_name )
				end
			end
		end
	end
end

--

---Returns both the current parallel world and the normalized x-coordinate value with respect to the current parallel_world_index.
---@param x number
---@return number parallel_world_index calculated by GetParallelWorldPosition( x, 0 ).
---@return number normalized_x
function check_parallel_pos( x )
	local pw = GetParallelWorldPosition( x, 0 )
	
	local mapwidth = BiomeMapGetSize() * 512
	local half = mapwidth * 0.5
	
	local mx = ( ( x + half ) % mapwidth ) - half
	
	return pw,mx
end

--- Used for secrets
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
alt_notes = {
	a = "f",
	b = "a2",
	c = "a",
	d = "c",
	dis = "b",
	e = "gsharp",
	f = "g",
	g = "dis",
	gsharp = "d",
	a2 = "e",
}

---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
orb_list =
{
	{8,1},
	{1,-3},
	{-9,7},
	{-8,19},
	{-18,28},
	{-20,5},
	{-1,31},
	{20,31},
	{19,5},
	{6,3},
	{19,-3},
}

---Updates the global variable "ORB_MAP_STRING" with the values specified in orb_list.
---
---the default value is "8,1 1,-3 -9,7 -8,19 -18,28 -20,5 -1,31 20,31 19,5 6,3 19,-3" but whenever an orb gets picked up this value changes.
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function orb_map_update()
	local result = ""
	
	for i,v in ipairs( orb_list ) do
		local part = tostring(v[1]) .. "," .. tostring(v[2])
		result = result .. part
		
		if ( i < #orb_list ) then
			result = result .. " "
		end
	end
	
	print( result )
	
	GlobalsSetValue( "ORB_MAP_STRING", result )
end

---Parses the global variable "ORB_MAP_STRING" to get the updated orb_list.
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function orb_map_get()
	local result = {}
	
	local data = GlobalsGetValue( "ORB_MAP_STRING", "" )
	
	if ( #data > 0 ) then
		---@diagnostic disable-next-line: param-type-mismatch
		for word in string.gmatch( data, "%S+" ) do
			local n1,n2
			local i = 1
			for num in string.gmatch( word, "[^,]+" ) do
				if ( i == 1 ) then
					n1 = tonumber( num )
				elseif ( i == 2 ) then
					n2 = tonumber( num )
				end
				
				i = i + 1
			end
			
			if ( n1 ~= nil ) and ( n2 ~= nil ) then
				table.insert( result, {n1,n2})
			end
		end
	end
	
	return result
end

---Returns true if a given x,y position is currently inside the camera bounds (visible by the player).
---@param x number
---@param y number
---@param padding number
---@return boolean is_in_camera_bounds
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function is_in_camera_bounds(x, y, padding)
	local left, up, w, h = GameGetCameraBounds()
	return x >= left - padding and y >= up - padding and x <= left + w + padding and y <= up + h + padding
end

-----------------------------------------------------------------------------------------
-- gui

-- These options are exposed to the modding API due to public demand but are completely unsupported.
-- They don't work and haven't been tested with all widgets.
-- We're aware of many bugs that occur when using these in uninteded ways,
-- but we also probably never have time to fix them (and all the code that has various workarounds to get around the bugs :) ).
-- You just have to live with the fact that the gui library exists mainly to support the game, and we have limited time to work on it.

-- volatile: must be kept in sync with the ImGuiWidgetOptions enum in imgui.h

---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
GUI_OPTION = {
	None = 0,

	IsDraggable = 1, -- you might not want to use this, because there will be various corner cases and bugs, but feel free to try anyway.
	NonInteractive = 2, -- works with GuiButton
	AlwaysClickable = 3,
	ClickCancelsDoubleClick = 4,
	IgnoreContainer = 5,
	NoPositionTween = 6,
	ForceFocusable = 7,
	HandleDoubleClickAsClick = 8,
	GamepadDefaultWidget = 9, -- it's recommended you use this to communicate the widget where gamepad input will focus when entering a new menu

	-- these work as intended (mostly)
	Layout_InsertOutsideLeft = 10,
	Layout_InsertOutsideRight = 11,
	Layout_InsertOutsideAbove = 12,
	Layout_ForceCalculate = 13,
	Layout_NextSameLine = 14,
	Layout_NoLayouting = 15,

	-- these work as intended (mostly)
	Align_HorizontalCenter = 16,
	Align_Left = 17,

	FocusSnapToRightEdge = 18,

	NoPixelSnapY = 19,

	DrawAlwaysVisible = 20,
	DrawNoHoverAnimation = 21,
	DrawWobble = 22,
	DrawFadeIn = 23,
	DrawScaleIn = 24,
	DrawWaveAnimateOpacity = 25,
	DrawSemiTransparent = 26,
	DrawActiveWidgetCursorOnBothSides = 27,
	DrawActiveWidgetCursorOff = 28,

	TextRichRendering = 29,

	NoSound = 47,
	Hack_ForceClick = 48,
	Hack_AllowDuplicateIds = 49,

	ScrollContainer_Smooth = 50,
	IsExtraDraggable = 51,

	_SnapToCenter = 62,
	Disabled = 63,
}

-- volatile: must be kept in sync with the ImGuiRectAnimationPlaybackType enum in imgui.h

---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
GUI_RECT_ANIMATION_PLAYBACK = {
	PlayToEndAndHide = 0,
	PlayToEndAndPause = 1,
	Loop = 2,
}