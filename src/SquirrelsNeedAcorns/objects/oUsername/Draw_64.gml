var _ww = global.GUIww;
var _hh = global.GUIhh;

draw_set_valign(fa_middle);
draw_set_halign(fa_center);

draw_set_font(fMenu26);
draw_set_color(c_ltgray);
draw_text(_ww*.5, _hh*.2, "Enter Username:");

draw_set_font(fMenu18);
draw_set_color(c_aqua);
draw_text(_ww*.5, _hh*.3, string(playerName));