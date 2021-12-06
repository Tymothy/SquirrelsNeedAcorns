/// @description Insert description here
// You can write your code in this editor



//Set the parallax
backgroundType = global.levelSelectArray[global.selectedLevel].levelType;
solidFill_layer = layer_create(1099);
back_layer = layer_create(1098);
middle_layer = layer_create(1097);
foreground_layer = layer_create(1096);
panSpeed = 2;

//Set the inital sprites on create
solidFill_layer_bg = layer_background_create(solidFill_layer, s_bg_mountains_back);
back_layer_bg = layer_background_create(back_layer, s_bg_mountains_mountains);
middle_layer_bg = layer_background_create(middle_layer, s_bg_mountains_hills);
foreground_layer_bg = layer_background_create(foreground_layer, s_bg_mountains_grass);

//Mountains
set_background = function()
{
	switch(backgroundType)
	{
		case LEVELTYPE.MOUNTAINS:
			layer_background_sprite(solidFill_layer_bg, s_bg_mountains_back);
			layer_background_sprite(back_layer_bg, s_bg_mountains_mountains);
			layer_background_sprite(middle_layer_bg, s_bg_mountains_hills);
			layer_background_sprite(foreground_layer_bg, s_bg_mountains_grass);
		
		break;
	
		case LEVELTYPE.WATER:
			layer_background_sprite(solidFill_layer_bg, s_bg_underwater_fill);
			layer_background_sprite(back_layer_bg, s_bg_underwater_back);
			layer_background_sprite(middle_layer_bg, s_bg_underwater_midground);
			layer_background_sprite(foreground_layer_bg, s_bg_underwater_foreground);	
		break;
		
		case LEVELTYPE.SPACE:
			layer_background_sprite(solidFill_layer_bg, sStarfieldBackground);
			layer_background_sprite(back_layer_bg, sStarfieldBackground);
			layer_background_sprite(middle_layer_bg, sEmpty);
			layer_background_sprite(foreground_layer_bg, sEmpty);	
		break;
	}

	layer_background_htiled(solidFill_layer_bg, true);
	layer_background_vtiled(solidFill_layer_bg, true);

	layer_background_htiled(back_layer_bg, true);
	layer_y(back_layer, 0);

	layer_background_htiled(middle_layer_bg, true);
	layer_y(middle_layer, 0);

	layer_background_htiled(foreground_layer_bg, true);
	layer_y(foreground_layer, 0);

	//If the middle layer is empty, back layer needs to be fully tiled
	if(layer_background_get_sprite(middle_layer_bg) == sEmpty)
	{
		layer_background_vtiled(back_layer_bg, true);
	}
	else
	{
		layer_background_vtiled(back_layer_bg, false);		
	}
	
}
set_background();



//If we are not in a game room, make background smaller
if(room != global.levelSelectArray[global.selectedLevel].roomName)
{
	show_debug_message("Scaling background");
	layer_background_xscale(back_layer_bg, .5);
	layer_background_yscale(back_layer_bg, .5);
	layer_background_xscale(middle_layer_bg, .5);
	layer_background_yscale(middle_layer_bg, .5);
	layer_background_xscale(foreground_layer_bg, .5);
	layer_background_yscale(foreground_layer_bg, .5);		
}