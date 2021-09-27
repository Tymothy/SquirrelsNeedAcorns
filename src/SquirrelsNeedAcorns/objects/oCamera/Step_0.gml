/// @desc Insert description here

//camera_set_view_pos(global.cam,oPlayer.x-global.view_w_half,oPlayer.y-global.view_h_half);
if(live_call()) return live_result;
var camID = view_camera[0];
var camWidth = camera_get_view_width(camID);
var camHeight = camera_get_view_height(camID);
//Update Destination

if(instance_exists(oPlayer))
{
	follow = oPlayer;	
}
else
{
	follow = oMenu;	
}
if (instance_exists(follow))
{
		xTo = follow.x;
		yTo = follow.y;
		
}

//Update object position
x += (xTo - x) / 10;
y += (yTo - y) / 10;

x = clamp(x,camWidth/2+buff,room_width-camWidth/2-buff);
y = clamp(y,camHeight/2+buff,room_height-camHeight/2-buff);

//Screen shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain-((1/shake_length)*shake_magnitude));

//Update camera view
camera_set_view_pos(camID,x-camWidth*0.5,y-camHeight*0.5);

//if(layer_exists(bg_5layer))
//{
//	//Find full dimensions of the room
	
//	//Based on where player is in room, display the quadrant of the background
//	var _camX = camera_get_view_x(view_camera[0]);
//	var _roomW = room_width;
//	var _mapvalue = map_value(x/room_width,0,1,0,room_width+bg_5layerW)
//	//Layer followers player exactly, need to find a wa
//	/*
//	At 0, layer should be at far left.
//	At 100, layer should be at far right.
//	*/
//	layer_x(bg_5layer,map_value(x/room_width,0,1,0,room_width+bg_5layerW));
//	//layer_x(bg_5layer,lerp(0, bg_5layerW, (_camX / room_width) ) - 1);	
//	//view_xview/(room_width - view_wview)
	
	
//	layer_y(bg_5layer,lerp(0, room_height - bg_5layerH, (oCamera.y/room_height)) - camHeight * .5 - 1);
//}