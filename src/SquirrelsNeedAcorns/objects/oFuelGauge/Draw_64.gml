/// @description Insert description here
// You can write your code in this editor
if(live_call()) return live_result;
_x = global.GUIww * .02;
_y = global.GUIhh * .02;

//var _frameNum = max(0, floor(sprite_get_number(sprite) * _fuelPercent));//Reverse to display frames in right order
var _frameNum = max(0, sprite_get_number(sprite) - ceil(oPlayer.fuel / tickInc));

if(oPlayer.fuel < 1)
{
	_frameNum = sprite_get_number(sprite) - 1;	
}

draw_sprite_ext(sprite, _frameNum, _x, _y, 2, 2, image_angle,image_blend, image_alpha);