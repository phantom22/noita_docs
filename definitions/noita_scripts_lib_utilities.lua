---@diagnostic disable: missing-return, lowercase-global

---Computes a random value between low and high.
---@param low number
---@param high number
---@return number
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function rand( low, high ) end

---Returns a random value from the given array.
---@param varray table
---@return any random_array_value
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function random_from_array( varray ) end

---Packages the given x-y values into a vec2. Needed to create pseudo-randomness.
---@param x_value number
---@param y_value number
---@return {x:integer, y:integer} { x=x_value, y=y_value }
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function random_create( x_value, y_value ) end

---Computes a new random number between min and max while incrementing by 1 the rnd.y value.
---@param rnd {x:integer, y:integer}
---@param min number
---@param max number
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function random_next( rnd, min, max ) end

---Computes a new random integer between min and max while incrementing by 1 the rnd.y value
---@param rnd {x:integer, y:integer}
---@param min integer
---@param max integer
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function random_nexti( rnd, min, max ) end

---Given an array of tables whose entries each have a chance field and are ordered from most likely to least; basically this method returns a table from this array while giving a change to the least probable outcome.
---@param t table each entry must be a table with a **chance** parameter.
---@param rnd {x:integer, y:integer}
---@return any
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function pick_random_from_table_backwards( t, rnd ) end

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
function pick_random_from_table_weighted( rnd, t ) end


---Returns true if the provided argument is nil or an empty string.
---@param s string
---@return boolean
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function string_isempty( s ) end

---This method iterates over all the components of the same type
---@param component_type_name any
---@param fn function (component_index, component_id) => do_something
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function for_comps( component_type_name, fn ) end

---This method converts a given value to string.
---
---A boolean value is formatted as an integer.
---@param value unknown
---@return string
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function to_string( value ) end

---Returns true if the provided entity_id is not null and different from zero.
---@param entity_id integer
---@return boolean
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function is_valid_entity( entity_id ) end

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
function edit_component( entity_id, component_type_name, fn ) end

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
function edit_component_with_tag( entity_id, component_type_name, tag, fn ) end

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
function edit_all_components( entity_id, component_type_name, fn ) end

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
function edit_nth_component( entity_id, component_type_name, n, fn ) end

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
function component_get_value( entity_id, component_type_name, value_name, default ) end

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
function component_get_value_int( entity_id, component_type_name, value_name, default ) end

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
function component_get_value_float( entity_id, component_type_name, value_name, default ) end

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
function component_get_value_vector2( entity_id, component_type_name, value_name, default_x, default_y ) end

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
---@return integer|nil variable_storage_component_id
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function get_variable_storage_component( entity_id, name ) end

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
function get_stored_perk_pickup_count( entity_id ) end

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
function edit_component2( entity_id, component_type_name, fn ) end

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
function component_readwrite( component_id, component_prototype, fn ) end

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
function component_read( component_id, component_prototype, fn ) end

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
function component_write( component_id, component_keys_and_values ) end

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
function edit_component_with_tag2( entity_id, component_type_name, tag, fn ) end

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
function edit_all_components2( entity_id, component_type_name, fn ) end

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
function edit_nth_component2( entity_id, component_type_name, n, fn ) end

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
function component_get_value2( entity_id, component_type_name, value_name, default ) end

---Returns all the etities with the tag "player_unit".
---@return table player_ids
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function get_players() end

---Returns the GenomeDataComponent id of the specified entity; if no such component exists, return -1.
---@param entity_id integer
---@return integer genome_data_component_id
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function get_herd_id( entity_id ) end

---Creates and 'shoots' the specified projectile on behalf of 'shooter_id'.
---@param shooter_id integer shooter_id
---@param projectile_file string
---@param start_x number
---@param start_y number
---@param vel_x number
---@param vel_y number
---@param send_message boolean?
---@return integer new_projectile_id
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function shoot_projectile( shooter_id, projectile_file, start_x, start_y, vel_x, vel_y, send_message ) end

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
function shoot_projectile_from_projectile( shooter_id, projectile_file, start_x, start_y, vel_x, vel_y ) end

---Returns true if the current LuaComponent running the script can run the script again; if this script was never run before, this will return false.
---@param entity_id integer unused variable.
---@param frames integer wait frames.
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function script_wait_frames( entity_id, frames ) end

---Loads the specified rope with two joints. If the entity specified by *entity_filename* doesn't have a VerletPhysicsComponent this will only print the error to console.
---
---The start position of such entity is determined by *joint1_x* and *joint1_y*.
---@param entity_filename string
---@param joint1_x number
---@param joint1_y number
---@param joint2_x number
---@param joint2_y number
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function load_verlet_rope_with_two_joints( entity_filename, joint1_x, joint1_y, joint2_x, joint2_y ) end

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
function load_verlet_rope_with_one_joint( entity_filename, joint_x, joint_y ) end

---Adds a stack trace for debugging purposes.
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function debug_start_trace() end

---This recursive function formats a table to console with the specified *table_depth*.
---@param table_to_print table
---@param table_depth integer
---@param parent_table string current table label
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function debug_print_table( table_to_print, table_depth, parent_table ) end

---Returns the direction (in radians) p1 should use to get to p2 (the angle between two points).
---
---Given two points p1,p2; the direction is calculated this way:
---p1 is assumed to be looking up (or has the direction value of π/2 radians = 90°).
---to calculate the direction, p1 must start rotating anticlockwise until it sees p2.
---@param x1 number p1_x
---@param y1 number p1_y
---@param x2 number p2_x
---@param y2 number p2_y
---@return number direction_angle_in_radians
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function get_direction( x1, y1, x2, y2 ) end

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
function get_distance( x1, y1, x2, y2 ) end

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
function get_distance2( x1, y1, x2, y2 ) end

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
function get_direction_difference( d1, d2 ) end

---Returns the magnitude (or length) of a given vector.
---@param x number
---@param y number
---@return number magnitude
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function get_magnitude( x, y ) end

---Computes the direction unit vector of a given angle in radians.
---@param rad number angle in radians
---@return number x math.cos(-rad)
---@return number y math.sin(rad)
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function rad_to_vec( rad ) end

---Clamps a given number between a min and a max value.
---@param value number
---@param min number
---@param max number
---@return number clamped_value
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function clamp(value, min, max) end

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
function map(value, old_min, old_max, new_min, new_max) end

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
function sign(value) end

---Linearly interpolates between a and b by t.
---@param a number
---@param b number
---@param t number usually t is between 0 and 1
---@return number blend_of_a_and_b
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function lerp(a, b, t) end

---Linearly interpolates between two radian angles, a and b, by t.
---@param a number angle in radians.
---@param b number angle in radians.
---@param t number usually t is between 0 and 1
---@return number blend_of_a_and_b
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function rot_lerp(a, b, t) end

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
function vec_add(x1, y1, x2, y2) end

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
function vec_sub(x1, y1, x2, y2) end

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
function vec_mult(x, y, scalar) end

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
function vec_div(x, y, scalar) end

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
function vec_scale(x1, y1, x2, y2) end

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
function vec_equals(x1, y1, x2, y2) end

---Returns a normalized copy of a given vector.
---@param x number
---@param y number
---@return number new_x
---@return number new_y
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function vec_normalize(x, y) end

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
function vec_lerp(x1, y1, x2, y2, t) end

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
function vec_dot(x1, y1, x2, y2) end

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
function vec_rotate(x, y, angle) end

---Decodes an obfuscated flag string.
---@param text string
---@return string decoded_flag_name
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function get_flag_name( text ) end

---Assign a new name and a new description to the specified entity_id.
---@param entity_id integer
---@param new_name string
---@param new_description string
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function change_entity_ingame_name( entity_id, new_name, new_description ) end

---Returns both the current parallel world and the normalized x-coordinate value with respect to the current parallel_world_index.
---@param x number
---@return number parallel_world_index calculated by GetParallelWorldPosition( x, 0 ).
---@return number normalized_x
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function check_parallel_pos( x ) end

---Used for secrets
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
function orb_map_update() end

---Parses the global variable "ORB_MAP_STRING" to get the updated orb_list.
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function orb_map_get() end

---Returns true if a given x,y position is currently inside the camera bounds (visible by the player).
---@param x number
---@param y number
---@param padding number
---@return boolean is_in_camera_bounds
---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
function is_in_camera_bounds(x, y, padding) end

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

---```lua 
--- -- must be imported
---dofile_once("data/scripts/lib/utilities.lua")
---```
GUI_RECT_ANIMATION_PLAYBACK = {
	PlayToEndAndHide = 0,
	PlayToEndAndPause = 1,
	Loop = 2,
}