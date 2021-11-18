/// @description Insert description here
// You can write your code in this editor
if(live_call()) return live_result;
_x = oFuelGauge._x;
_y = oFuelGauge._y + 42;

draw_sprite_ext(sprite, oPlayer.playerHealth, _x, _y, 2, 2, image_angle,image_blend, image_alpha);
			draw_text_transformed_color(_x + 32, _y + 35,
			string(oPlayer.pointsOnPlayer), 
			1, 1, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);