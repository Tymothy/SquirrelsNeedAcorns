// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_text_outline(_x, _y, _string, _color1, _color2){
/// @desc Draw text with an outline
/// @arg X coordinate to draw text to
/// @arg Y coordinate to draw text to
/// @arg String
/// @arg Outline_Color
/// @arg Text_Color

stringoutline = string(_string);
var _size = 1;

draw_set_color(_color1);
draw_text(_x+_size, _y+_size, stringoutline);
draw_text(_x-_size, _y-_size, stringoutline);
draw_text(_x, _y+_size, stringoutline);
draw_text(_x+_size, _y, stringoutline);
draw_text(_x, _y-_size, stringoutline);
draw_text(_x-_size, _y, stringoutline);
draw_text(_x-_size, _y+_size, stringoutline);
draw_text(_x+_size, _y-_size, stringoutline);

draw_set_color(_color2);
draw_text(_x, _y, stringoutline);
}