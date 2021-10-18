/// @description Insert description here
// You can write your code in this editor
if(live_call()) return live_result;
// Inherit the parent event
event_inherited();

if(sprite != -1)
{
	draw_sprite(sprite,0,x,y);
}

draw_text_outline(x,y, string(displayText),c_black, c_ltgray);

switch(completionLevel)
{
	case 0:
		
	break;
	
	case 1:
		draw_sprite_ext(s_pickup_point_acorn, 0, x, y + 25, .5, .5, image_angle, image_blend, image_alpha);
	break;
	
	case 2:
		draw_sprite_ext(s_pickup_point_superAcorn, 0, x, y + 25, .5, .5, image_angle, image_blend, image_alpha);
	break;
	
	case 3:
		draw_sprite_ext(sGoalAcorn, 0, x, y + 25, .5, .5, image_angle, image_blend, image_alpha);
	break;
}

if(global.selectedLevel == level)
{
	var _x = x;
	var _y = y - 25;
	draw_sprite_ext(sPlayer, image_index, _x, _y, .5, .5, image_angle, image_blend, image_alpha);
	draw_sprite_ext(global.playerTopper, image_index, _x, _y, .5, .5, image_angle,image_blend, image_alpha);
	draw_sprite_ext(global.playerShirt, image_index, _x, _y, .5, .5, image_angle,image_blend, image_alpha);
	draw_sprite_ext(global.playerRocket,image_index, _x, _y, .5, .5, image_angle,image_blend, image_alpha);
	draw_sprite_ext(global.playerBelt, image_index, _x, _y, .5, .5, image_angle,image_blend, image_alpha);

}
	
