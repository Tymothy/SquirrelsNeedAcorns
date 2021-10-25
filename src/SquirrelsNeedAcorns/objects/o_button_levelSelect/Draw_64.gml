/// @description Insert description here
// You can write your code in this editor
if(live_call()) return live_result;
// Inherit the parent event
event_inherited();

if(sprite != -1)
{
	draw_sprite(sprite,0,x,y);
}
draw_set_valign(fa_center);
draw_set_halign(fa_middle);
draw_text_outline(x - 10,y, string(displayText),c_black, c_ltgray);

switch(completionLevel)
{
	case 0:
		draw_sprite_ext(missing1, 0, x + x1, y + y1, .5, .5, image_angle, image_blend, image_alpha);
		draw_sprite_ext(missing2, 0, x + x2, y + y2, .5, .5, image_angle, image_blend, image_alpha);
		draw_sprite_ext(missing3, 0, x + x3, y + y3, .5, .5, image_angle, image_blend, image_alpha);
	break;
	
	case 1:
		draw_sprite_ext(complete1, 0, x + x1, y + y1, .5, .5, image_angle, image_blend, image_alpha);
		draw_sprite_ext(missing2, 0, x + x2, y + y2, .5, .5, image_angle, image_blend, image_alpha);
		draw_sprite_ext(missing3, 0, x + x3, y + y3, .5, .5, image_angle, image_blend, image_alpha);
	break;
	
	case 2:
		draw_sprite_ext(complete1, 0, x + x1, y + y1, .5, .5, image_angle, image_blend, image_alpha);
		draw_sprite_ext(complete2, 0, x + x2, y + y2, .5, .5, image_angle, image_blend, image_alpha);
		draw_sprite_ext(missing3, 0, x + x3, y + y3, .5, .5, image_angle, image_blend, image_alpha);
	break;
	
	case 3:
		draw_sprite_ext(complete1, 0, x + x1, y + y1, .5, .5, image_angle, image_blend, image_alpha);
		draw_sprite_ext(complete2, 0, x + x2, y + y2, .5, .5, image_angle, image_blend, image_alpha);
		draw_sprite_ext(complete3, 0, x + x3, y + y3, .5, .5, image_angle, image_blend, image_alpha);
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
	
