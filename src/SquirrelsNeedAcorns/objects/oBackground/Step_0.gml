/// @description Insert description here
if(live_call()) return live_result;

switch (backgroundType)
{
	case LEVELTYPE.FOREST :
	//layer_x(layer_id1, lerp(0, oCamera.x, .9));
	//layer_x(layer_id2, lerp(0, oCamera.x, .7));
	//layer_x(layer_id3, lerp(0, oCamera.x, .5));

	//layer_y(layer_id1, lerp(0, oCamera.y, .9) + 50);
	//layer_y(layer_id2, lerp(0, oCamera.y, .8) + 120);
	//layer_y(layer_id3, lerp(0, oCamera.y, .7) + 480);
	
	layer_x(middle_layer, lerp(0, oCamera.x, .9));
	layer_x(middle2_layer, lerp(0, oCamera.x, .75));
	layer_x(middle3_layer, lerp(0, oCamera.x, .6));

	layer_y(middle_layer, lerp(0, oCamera.y, .95) + 0);
	layer_y(middle2_layer, lerp(0, oCamera.y, .88) + 90);
	layer_y(middle3_layer, lerp(0, oCamera.y, .77) + 550);
	break;
	
	case LEVELTYPE.WATER :
	layer_x(layer_id1, lerp(0, oCamera.x, .9));
	layer_x(layer_id2, lerp(0, oCamera.x, .7));
	layer_x(layer_id3, lerp(0, oCamera.x, .5));

	layer_y(layer_id1, lerp(0, oCamera.y, .9) + 80);
	layer_y(layer_id2, lerp(0, oCamera.y, .8) + 240);
	layer_y(layer_id3, lerp(0, oCamera.y, .7) + 510);
	
	break;
	
	default: 
	show_debug_message("ERROR: NO BACKGROUND SET");
	break;
}

