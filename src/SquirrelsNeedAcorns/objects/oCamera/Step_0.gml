/// @desc Insert description here

//camera_set_view_pos(global.cam,oPlayer.x-global.view_w_half,oPlayer.y-global.view_h_half);
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


