/// @desc Insert description here
if(live_call()) return live_result;
//camera_set_view_pos(global.cam,oPlayer.x-global.view_w_half,oPlayer.y-global.view_h_half);
var camID = view_camera[0];
var camWidth = camera_get_view_width(camID);
var camHeight = camera_get_view_height(camID);
//Update Destination
if(global.pause == false)
//if(true)
{
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
		var _lookAheadX = global.GUIww * lookAheadXMulti;
		var _lookAheadY = global.GUIhh * lookAheadYMulti;
	
		//Smooth the look ahead
		//if(abs(_lookAheadX - prevLookAheadX) > 1)
		//{
		//	_lookAheadX = _lookAheadX + 1 * sign(_lookAheadX);	
		//}
	
	
		_lookAheadX = lerp(prevLookAheadX, _lookAheadX, .17);
		_lookAheadY = lerp(prevLookAheadY, _lookAheadY, .03);
	
		if(instance_exists(oPlayer))
		{


			xTo = _lookAheadX * oPlayer.xSpeed;
			xTo = oPlayer.x + xTo;
			
			yTo = _lookAheadY * oPlayer.ySpeed;
			yTo = oPlayer.y + yTo;
				
		
		
		}


		x = lerp(x, xTo, .02);
		y = lerp(y, yTo, .05);

	//Restrict within room
	x = clamp(x,camWidth/2+buff,room_width-camWidth/2-buff);
	y = clamp(y,camHeight/2+buff,room_height-camHeight/2-buff);
	
	//Restrict to ensure player stays in frame
	if(instance_exists(oPlayer))
	{
		x = clamp(x, oPlayer.x - camWidth/2+buff, oPlayer.x + camWidth/2 - buff);
		y = clamp(y, oPlayer.y - camHeight/2+buff, oPlayer.y + camHeight/2 - buff);
	}
	//Screen shake
	x += random_range(-shake_remain, shake_remain);
	y += random_range(-shake_remain, shake_remain);
	shake_remain = max(0, shake_remain-((1/shake_length)*shake_magnitude));

	//Update camera view
	camera_set_view_pos(camID,x-camWidth*0.5,y-camHeight*0.5);


	xPrev = xTo;
	yPrev = yTo;

	prevLookAheadX = _lookAheadX;
	prevLookAheadY = _lookAheadY;
}