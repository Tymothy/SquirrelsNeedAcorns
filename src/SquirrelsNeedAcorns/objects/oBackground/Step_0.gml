/// @description Insert description here


//If level type changes, change the background
if(backgroundType != global.levelSelectArray[global.selectedLevel].levelType)
{
	backgroundType = global.levelSelectArray[global.selectedLevel].levelType;
	set_background();

}

switch (backgroundType)
{
	case LEVELTYPE.MOUNTAINS:
	if(room_height < 1500) //Level Select Screen
	{
		var mid1Factor = 1;
		var mid2Factor = 1;
		var mid3Factor = 1;
		
		var mid1Offset = -100;
		var mid2Offset = -80;
		var mid3Offset =  90;
	}
	else //Normal Levels
	{
		var mid1Factor = .95;
		var mid2Factor = .89;
		var mid3Factor = .83;
		
		var mid1Offset = -200;
		var mid2Offset = -130;
		var mid3Offset =  240;
	}
	break;

	case LEVELTYPE.WATER:
		var mid1Offset = -0;
		var mid2Offset = 70;
		var mid3Offset =  250;
	break;
	
	case LEVELTYPE.SPACE:
		var mid1Offset = -0;
		var mid2Offset = 70;
		var mid3Offset =  250;
	break;

}

//Not in game room, just pan slowly right
if(room != global.levelSelectArray[global.selectedLevel].roomName)
{
	x = x - panSpeed;
	layer_x(solidFill_layer, lerp(0, x, .3));
	layer_x(back_layer, lerp(0, x, .3));
	layer_x(middle_layer, lerp(0, x, .5));
	layer_x(foreground_layer, lerp(0, x, .9));
	
	layer_y(back_layer, oCamera.y + mid1Offset);
	layer_y(middle_layer, oCamera.y + mid2Offset);
	layer_y(foreground_layer, oCamera.y + mid3Offset);
}
else //In game room, follow the camera
{
	layer_x(back_layer, lerp(0, oCamera.x, .9));
	layer_x(middle_layer, lerp(0, oCamera.x, .75));
	layer_x(foreground_layer, lerp(0, oCamera.x, .6));
	
	
	layer_y(back_layer, oCamera.y + mid1Offset);
	layer_y(middle_layer, oCamera.y + mid2Offset);
	layer_y(foreground_layer, oCamera.y + mid3Offset);	
}