/// @description Insert description here
// You can write your code in this editor
if(live_call()) return live_result;
layer_id1 = layer_get_id("bg_back");
layer_id2 = layer_get_id("bg_middle");
layer_id3 = layer_get_id("bg_front");

//Set the parallax
backgroundType = global.levelSelectArray[global.selectedLevel].levelType;

//Forest
switch(backgroundType)
{
	case LEVELTYPE.FOREST:
	
		back_layer = layer_create(1099);
		back_layer_bg = layer_background_create(back_layer, s_bg_forest_back);
		layer_background_htiled(back_layer_bg, true);
		layer_background_vtiled(back_layer_bg, true);

		middle_layer = layer_create(1098);
		middle_layer_bg = layer_background_create(middle_layer, s_bg_forest_mountains);
		layer_background_htiled(middle_layer_bg, true);
		layer_y(middle_layer, 000);


		middle2_layer = layer_create(1097);
		middle2_layer_bg = layer_background_create(middle2_layer, s_bg_forest_hills);
		layer_background_htiled(middle2_layer_bg, true);
		layer_y(middle2_layer, -10);


		middle3_layer = layer_create(1096);
		middle3_layer_bg = layer_background_create(middle3_layer, s_bg_forest_grass);
		layer_background_htiled(middle3_layer_bg, true);
		layer_y(middle3_layer, 250);
		
	break;
	
	case LEVELTYPE.WATER:
	
	break;
	

}
