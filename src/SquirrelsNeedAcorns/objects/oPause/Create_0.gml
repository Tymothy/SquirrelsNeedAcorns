/// @description Insert description here
// You can write your code in this editor
paused = false;
pauseFont = fEthno18;
touchSelect = false;

button_h = font_get_size(pauseFont)*1.5;
button[0] = "Continue";
button[1] = "Restart";
button[2] = "End Run";
//button[3] = "Exit";

buttons = array_length(button);

menu_index = 0;
last_selected = 0;
menu_x = 0;
menu_y = 0;

