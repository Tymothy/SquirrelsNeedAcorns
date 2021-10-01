/// @description Insert description here
if(live_call()) return live_result;

switch (backgroundType)
{
	case LEVELTYPE.FOREST :
	layer_x(layer_id1, lerp(0, oCamera.x, .9));
	layer_x(layer_id2, lerp(0, oCamera.x, .7));
	layer_x(layer_id3, lerp(0, oCamera.x, .5));

	layer_y(layer_id1, lerp(0, oCamera.y, .9) + 50);
	layer_y(layer_id2, lerp(0, oCamera.y, .8) + 120);
	layer_y(layer_id3, lerp(0, oCamera.y, .7) + 480);
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

