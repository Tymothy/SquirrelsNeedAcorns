/// @description Insert description here
if(live_call()) return live_result;

//If level type changes, change the background
if(backgroundType != global.levelSelectArray[global.selectedLevel].levelType)
{
	backgroundType = global.levelSelectArray[global.selectedLevel].levelType;
	set_background();

}

switch (backgroundType)
{
	case LEVELTYPE.FOREST:
	if(room_height < 1500) //Level Select Screen
	{
		var mid1Factor = 1;
		var mid2Factor = 1;
		var mid3Factor = 1;
		
		var mid1Offset = -1 * (room_height/ 3);
		var mid2Offset = -1 * (room_height/ 2.2);
		var mid3Offset =  1 * room_height / 3;
	}
	else if(room_height < 2500) //Normal Levels
	{
		var mid1Factor = .95;
		var mid2Factor = .89;
		var mid3Factor = .83;
		
		var mid1Offset = -1 * (room_height/40);
		var mid2Offset = 1 * (room_height/120);
		var mid3Offset =  1 * room_height / 5.5;
	}
	else //Huge Levels
	{
		var mid1Factor = .97;
		var mid2Factor = .95;
		var mid3Factor = .92;
		
		var mid1Offset = -1 * (room_height/50);
		var mid2Offset = 1 * (room_height/120);
		var mid3Offset =  1 * room_height / 10.5;
	}
	break;

	case LEVELTYPE.WATER:
	if(room_height < 1500) //Level Select Screen
	{
		var mid1Factor = 1;
		var mid2Factor = 1;
		var mid3Factor = 1;
		
		var mid1Offset = -1 * (room_height/ 1.2);
		var mid2Offset = -1 * (room_height/ 1.2);
		var mid3Offset =  -1 * room_height / 2.4;
	}
	else if(room_height < 2500) //Normal Levels
	{
		var mid1Factor = .95;
		var mid2Factor = .89;
		var mid3Factor = .83;
		
		var mid1Offset = - 1 * (room_height/12);
		var mid2Offset = - 1 * (room_height/60);
		var mid3Offset =  1 * room_height / 10;
	}
	else //Huge Levels
	{
		var mid1Factor = .97;
		var mid2Factor = .95;
		var mid3Factor = .92;
		
		var mid1Offset = -1 * (room_height/50);
		var mid2Offset = 1 * (room_height/120);
		var mid3Offset =  1 * room_height / 10.5;
	}	
	break;

}
	
	layer_x(back_layer, lerp(0, oCamera.x, .9));
	layer_x(middle_layer, lerp(0, oCamera.x, .75));
	layer_x(foreground_layer, lerp(0, oCamera.x, .6));

	layer_y(back_layer, lerp(0, oCamera.y, mid1Factor) + mid1Offset);
	layer_y(middle_layer, lerp(0, oCamera.y, mid2Factor) + mid2Offset);
	layer_y(foreground_layer, lerp(0, oCamera.y, mid3Factor) + mid3Offset);
	
//	break;
	
//	case LEVELTYPE.WATER :
//	layer_x(layer_id1, lerp(0, oCamera.x, .9));
//	layer_x(layer_id2, lerp(0, oCamera.x, .7));
//	layer_x(layer_id3, lerp(0, oCamera.x, .5));

//	layer_y(layer_id1, lerp(0, oCamera.y, .9) + 80);
//	layer_y(layer_id2, lerp(0, oCamera.y, .8) + 240);
//	layer_y(layer_id3, lerp(0, oCamera.y, .7) + 510);
	
//	break;
	
//	default: 
//	show_debug_message("ERROR: NO BACKGROUND SET");
//	break;
//}

