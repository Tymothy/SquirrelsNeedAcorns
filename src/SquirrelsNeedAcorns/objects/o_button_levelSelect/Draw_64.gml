/// @description Insert description here
// You can write your code in this editor
if(live_call()) return live_result;
// Inherit the parent event
event_inherited();

if(sprite != -1)
{
	draw_sprite(sprite,0,x,y);
}
if(global.selectedLevel == level)
{
	draw_sprite_ext(s_button_pressable,1,x,y,buttonXScale,buttonYScale,0,-1,1);
	var _x = x;
	var _y = y - 20;
	draw_sprite_ext(sPlayer, image_index, _x, _y, .5, .5, image_angle, image_blend, image_alpha);
	draw_sprite_ext(global.playerTopper, image_index, _x, _y, .5, .5, image_angle,image_blend, image_alpha);
	draw_sprite_ext(global.playerShirt, image_index, _x, _y, .5, .5, image_angle,image_blend, image_alpha);
	draw_sprite_ext(global.playerRocket,image_index, _x, _y, .5, .5, image_angle,image_blend, image_alpha);
	draw_sprite_ext(global.playerBelt, image_index, _x, _y, .5, .5, image_angle,image_blend, image_alpha);

}

draw_set_valign(fa_center);
draw_set_halign(fa_middle);
draw_text_outline(x ,y, string(displayText),c_black, c_ltgray);

switch(completionLevel)
{
	case 0:
		//draw_sprite_ext(complete1, 0, x + x1, y + y1, .5, .5, image_angle, image_blend, image_alpha);
		//draw_sprite_ext(missing2, 0, x + x2, y + y2, .5, .5, image_angle, image_blend, image_alpha);
		//draw_sprite_ext(missing3, 0, x + x3, y + y3, .5, .5, image_angle, image_blend, image_alpha);
	break;
	
	case 1:
		draw_sprite_ext(complete1, 0, x + x1, y, 1, 1, image_angle, image_blend, image_alpha);	
		//draw_sprite_ext(complete1, 0, x + x1, y + y1, .5, .5, image_angle, image_blend, image_alpha);
		//draw_sprite_ext(missing2, 0, x + x2, y + y2, .5, .5, image_angle, image_blend, image_alpha);
		//draw_sprite_ext(missing3, 0, x + x3, y + y3, .5, .5, image_angle, image_blend, image_alpha);
	break;
	
	case 2:
		draw_sprite_ext(complete2, 0, x + x1, y, 1, 1, image_angle, image_blend, image_alpha);	
		//draw_sprite_ext(complete1, 0, x + x1, y + y1, .5, .5, image_angle, image_blend, image_alpha);
		//draw_sprite_ext(complete2, 0, x + x2, y + y2, .5, .5, image_angle, image_blend, image_alpha);
		//draw_sprite_ext(missing3, 0, x + x3, y + y3, .5, .5, image_angle, image_blend, image_alpha);
	break;
	
	case 3:
		draw_sprite_ext(complete3, 0, x + x1, y, 1, 1, image_angle, image_blend, image_alpha);	
		//draw_sprite_ext(complete1, 0, x + x1, y + y1, .5, .5, image_angle, image_blend, image_alpha);
		//draw_sprite_ext(complete2, 0, x + x2, y + y2, .5, .5, image_angle, image_blend, image_alpha);
		//draw_sprite_ext(complete3, 0, x + x3, y + y3, .5, .5, image_angle, image_blend, image_alpha);
	break;
	
	case 4:
		draw_sprite_ext(complete4, 0, x + x1, y, 1, 1, image_angle, image_blend, image_alpha);	
		//draw_sprite_ext(complete1, 0, x + x1, y + y1, .5, .5, image_angle, image_blend, image_alpha);
		//draw_sprite_ext(complete2, 0, x + x2, y + y2, .5, .5, image_angle, image_blend, image_alpha);
		//draw_sprite_ext(complete3, 0, x + x3, y + y3, .5, .5, image_angle, image_blend, image_alpha);
	break;	
}


switch(unlockedStatus)
{
	case true:
		//Level is unlocked and playable
	break;
	
	case false:
		//Level is locked and not playable
		draw_set_font(fTextNormal);
		draw_sprite_ext(sChainLink, image_index, x, y - 10, .5, .5, image_angle,image_blend, image_alpha);		
		draw_text_outline(x ,y+20, string(global.levelSelectArray[level].unlockPoints),c_black, c_yellow);
	break;
	
}
//if(global.selectedLevel == level)
//{
//	draw_sprite_ext(s_button_pressable,1,x,y,buttonXScale,buttonYScale,0,-1,1);
//	var _x = x;
//	var _y = y - 25;
//	draw_sprite_ext(sPlayer, image_index, _x, _y, .5, .5, image_angle, image_blend, image_alpha);
//	draw_sprite_ext(global.playerTopper, image_index, _x, _y, .5, .5, image_angle,image_blend, image_alpha);
//	draw_sprite_ext(global.playerShirt, image_index, _x, _y, .5, .5, image_angle,image_blend, image_alpha);
//	draw_sprite_ext(global.playerRocket,image_index, _x, _y, .5, .5, image_angle,image_blend, image_alpha);
//	draw_sprite_ext(global.playerBelt, image_index, _x, _y, .5, .5, image_angle,image_blend, image_alpha);

//}
	
