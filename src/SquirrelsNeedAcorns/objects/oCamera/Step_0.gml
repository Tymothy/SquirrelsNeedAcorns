/// @desc Insert description here
if(live_call()) return live_result;
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
		////If player is farther away than buffer, slowly move towards player
		//if(	point_distance(x, y, follow.x, follow.y) > playerBuffer)
		//{
		//	moveCam = true;
		//}
		//else
		//{
		//	moveCam = false;	
		//}
			
		

		//Move camera towards where the player is going.  
		//The faster the player is going, the farther to move camera
		//xTo = follow.x + follow.xSpeed * 5;
		//yTo = follow.y + follow.ySpeed * 5;
		//var _dir = point_direction(follow.x, follow.y, follow.x + follow.xSpeed, follow.y + follow.ySpeed);
		//xTo = follow.x + lengthdir_x(camDist, _dir);
		//yTo = follow. y + lengthdir_y(camDist, _dir);
		
		
}



	//if(moveCam == true)
	//{

	//}
	if(instance_exists(oPlayer))
	{
		xTo = follow.x;
		yTo = follow.y;
	}
		//Look ahead cam
		//xTo = xTo + follow.xSpeed;
		//yTo = yTo + follow.ySpeed;

		//Speed up Cam
		x = floor(lerp(x, xTo, min(1, abs(x - xTo) / maxBuff)));
		y = floor(lerp(y, yTo, min(1, abs(y - yTo) / maxBuff)));
		




		//y = lerp(y, yTo, .15);
		//x += (xTo - x) / 10;
		//y += (yTo - y) / 10;
//Update object position


x = clamp(x,camWidth/2+buff,room_width-camWidth/2-buff);
y = clamp(y,camHeight/2+buff,room_height-camHeight/2-buff);

//Screen shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain-((1/shake_length)*shake_magnitude));

//Update camera view
camera_set_view_pos(camID,x-camWidth*0.5,y-camHeight*0.5);


