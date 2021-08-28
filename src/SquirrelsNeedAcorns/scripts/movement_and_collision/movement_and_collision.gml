/*
function <NAME>(_var1, _var2, _var3...) {
/// @desc ...
/// @arg ....
/// @arg ....
//CODE
}
*/
function object_movement_and_collision(_mv_dir, _mv_spd, _wall){
	///@function movement_and_collision
	///@arg direction
	///@arg movespeed
	///@arg wall object
	/// returns true if blocked by a wall.

	//#macro no_direction -1  //Comment or Remove this line if you already have it defined elsewhere

	///********************************************************///
	///         PLEASE REPORT ISSUES TO PIXELATED POPE         ///
	/// Twitter: @pixelated_pope  Discord: Pixelated_Pope#7777 ///
	///********************************************************///

	//Settings
	var _max_scan_angle = 75,
	    _inc = 1,
   
	    _mv_dir = argument[0],
	    _mv_spd = argument[1],
	    _wall   = argument[2],
	    _count  = argument_count > 3 ? argument[3]+1 : 1,
	    _limit  = 4;


	if(_mv_dir == no_direction || _mv_spd == 0 || _count > _limit) return false;
 
	var _xtarg = x + lengthdir_x(_mv_spd, _mv_dir),
	    _ytarg = y + lengthdir_y(_mv_spd, _mv_dir);
 
	if(!place_meeting(_xtarg, _ytarg, _wall))
	{ //Nothing in the way, move forward
	  x = _xtarg;
	  y = _ytarg;
	  return false;
	}

	var _x_inc = lengthdir_x(1, _mv_dir),
	    _y_inc = lengthdir_y(1, _mv_dir);
 
	//Move to just inside the wall
	while(!place_meeting(_xtarg, _ytarg, _wall))
	{
	  if(point_distance(x, y, _xtarg + _x_inc, _ytarg + _y_inc) > _mv_spd) break;
	  _xtarg += _x_inc;
	  _ytarg += _y_inc;
	}
 
	//Scan for openings laterally
	var _dist = 0;

	do
	{
	  _dist += _inc;
	  var _sign = 1,
	      _test_dir = _mv_dir;
	  repeat(2)
	  {
	    var _testx = _xtarg + lengthdir_x(_dist, _mv_dir + 90 * _sign);
	    var _testy = _ytarg + lengthdir_y(_dist, _mv_dir + 90 * _sign);
	    _test_dir = point_direction(x, y, _testx, _testy);
	    if(!place_meeting(_testx, _testy, _wall)) //We found an opening.  Go ahead and move towards that.
	        return object_movement_and_collision(_test_dir, _mv_spd, _wall, _count);

	    _sign = -1;
	  }
	} until(abs(angle_difference(_mv_dir, _test_dir)) > _max_scan_angle)
 
	//Face plant into wall
	while(!place_meeting(x + _x_inc, y + _y_inc, _wall))
	{
	    x += _x_inc;
	    y += _y_inc;
	}
 
	return true;
}

function tile_movement_and_collision(_mv_dir, _mv_spd, _layer){
	///@function movement_and_collision
	///@arg direction
	///@arg movespeed
	///@arg layer
	/// returns true if blocked by a wall.

	  //Comment or Remove this line if you already have it defined elsewhere

	///********************************************************///
	///         PLEASE REPORT ISSUES TO PIXELATED POPE         ///
	/// Twitter: @pixelated_pope  Discord: Pixelated_Pope#7777 ///
	///********************************************************///

	//Settings
	var _max_scan_angle = 75,
	    _inc = 1,
   
	    _mv_dir = argument[0],
	    _mv_spd = argument[1],
	    _layer   = argument[2],
	    _count  = argument_count > 3 ? argument[3]+1 : 1,
	    _limit  = 4;


	if(_mv_dir == no_direction || _mv_spd == 0 || _count > _limit) return false;
 
	var _xtarg = x + lengthdir_x(_mv_spd, _mv_dir),
	    _ytarg = y + lengthdir_y(_mv_spd, _mv_dir);
 
	if(!tile_meeting(_xtarg, _ytarg, __layer))
	{ //Nothing in the way, move forward
	  x = _xtarg;
	  y = _ytarg;
	  return false;
	}

	var _x_inc = lengthdir_x(1, _mv_dir),
	    _y_inc = lengthdir_y(1, _mv_dir);
 
	//Move to just inside the wall
	while(!tile_meeting(_xtarg, _ytarg, _layer))
	{
	  if(point_distance(x, y, _xtarg + _x_inc, _ytarg + _y_inc) > _mv_spd) break;
	  _xtarg += _x_inc;
	  _ytarg += _y_inc;
	}
 
	//Scan for openings laterally
	var _dist = 0;

	do
	{
	  _dist += _inc;
	  var _sign = 1,
	      _test_dir = _mv_dir;
	  repeat(2)
	  {
	    var _testx = _xtarg + lengthdir_x(_dist, _mv_dir + 90 * _sign);
	    var _testy = _ytarg + lengthdir_y(_dist, _mv_dir + 90 * _sign);
	    _test_dir = point_direction(x, y, _testx, _testy);
	    if(!tile_meeting(_testx, _testy, _layer)) //We found an opening.  Go ahead and move towards that.
	        return tile_movement_and_collision(_test_dir, _mv_spd, _layer, _count);

	    _sign = -1;
	  }
	} until(abs(angle_difference(_mv_dir, _test_dir)) > _max_scan_angle)
 
	//Face plant into wall
	while(!tile_meeting(x + _x_inc, y + _y_inc, _layer))
	{
	    x += _x_inc;
	    y += _y_inc;
	}
 
	return true;
}
	
function tile_meeting(x, y, _layer){
///@description tile_meeting(x,y,layer)
///@param x
///@param y
///@param layer

//Layer is the layer with collidable tiles
var _layer = argument2,
    _tm = layer_tilemap_get_id(_layer);
 
if(_tm == -1 || layer_get_element_type(_tm) != layerelementtype_tilemap) {
  show_debug_message("Checking collision for non existent layer / tilemap") 
  return false;
}
 
var _x1 = tilemap_get_cell_x_at_pixel(_tm, bbox_left + (argument0 - x), y),
    _y1 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_top + (argument1 - y)),
    _x2 = tilemap_get_cell_x_at_pixel(_tm, bbox_right + (argument0 - x), y),
    _y2 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_bottom + (argument1 - y));
 
for(var _x = _x1; _x <= _x2; _x++){
  for(var _y = _y1; _y <= _y2; _y++){
    if(tilemap_get(_tm, _x, _y)){
      return true;
    }
  }
}
 
return false;

}