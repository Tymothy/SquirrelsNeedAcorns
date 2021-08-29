/*
function <NAME>(_var1, _var2, _var3...) {
/// @desc ...
/// @arg ....
/// @arg ....
//CODE
}
*/
function tile_meeting(x, y, _layer){
///@description tile_meeting(x,y,layer)
///@param x
///@param y
///@param layer

//Layer is the layer with collidable tiles
//var _layer = argument2,
    var _tm = layer_tilemap_get_id(_layer);
 
if(!instance_exists(oTileWall)) instance_create_depth(0,0,0,oTileWall);   
 
if(_tm == -1 || layer_get_element_type(_tm) != layerelementtype_tilemap) {
  show_debug_message("Checking collision for non existent layer / tilemap") 
  return false;
}
 
var _x1 = tilemap_get_cell_x_at_pixel(_tm, bbox_left + (argument0 - self.x), self.y),
    _y1 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_top + (argument1 - self.y)),
    _x2 = tilemap_get_cell_x_at_pixel(_tm, bbox_right + (argument0 - self.x), self.y),
    _y2 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_bottom + (argument1 - self.y));
 
for(var _x = _x1; _x <= _x2; _x++){
  for(var _y = _y1; _y <= _y2; _y++){
    var _tile = tilemap_get(_tm, _x, _y);
    if(_tile){
      if(_tile == 1) return true;
 
      oTileWall.x = _x * tilemap_get_tile_width(_tm);
      oTileWall.y = _y * tilemap_get_tile_height(_tm);
      oTileWall.image_index = _tile;
 
      if(place_meeting(argument0,argument1,oTileWall))
        return true;
    }
  }
}
 
return false;
}