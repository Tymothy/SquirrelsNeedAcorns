/// @description Insert description here
// You can write your code in this edito
levelSelectFont = fMenu;
margin = font_get_size(levelSelectFont)*2.3;

var _ww = global.GUIww;
var _hh = global.GUIhh;
musicX = _ww*.9;
musicY = _hh*.9;

instance_create_layer(musicX, musicY, "Instances",o_button_music);