if(live_call()) return live_result;
levelSelectFont = fMenu;
margin = font_get_size(levelSelectFont)*2.3;

var _ww = global.GUIww;
var _hh = global.GUIhh;

artX = global.GUIww*.25;
artY = global.GUIhh*.25;
levelNameX = global.GUIww*.25;
levelNameY = global.GUIhh*.15;

highScoreTitleX = global.GUIww*.75;
highScoreTitleY = levelNameY;

modeX = _ww *.9;
modeY = _hh *.9;

backX = _ww*.1;
backY = _hh*.9;

instance_create_layer(modeX, modeY, "Instances",o_button_mode);
instance_create_layer(backX, backY, "Instances",o_button_back);
