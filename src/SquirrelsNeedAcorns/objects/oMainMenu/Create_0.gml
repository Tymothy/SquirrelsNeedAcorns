/// @description Insert description here
// You can write your code in this edito
levelSelectFont = fTextLarge;
margin = font_get_size(levelSelectFont)*2.3;

var _ww = global.GUIww;
var _hh = global.GUIhh;
musicX = _ww*.9;
musicY = _hh*.9;
thankX = _ww * .9;
thankY = _hh * .1;

instance_create_layer(musicX, musicY, "Instances",o_button_music);
instance_create_layer(thankX, thankY, "Instances",o_button_thankYou);