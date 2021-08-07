if(live_call()) return live_result;
/// @description Insert description here
// You can write your code in this editor
paused = false;
pauseFont = fEthno18;
touchSelect = false;
margin = 1.15; //How far around text button should be drawn, as a multiplyer.
buttonSprite = s_button_pressable;

button_h = font_get_size(pauseFont)*2.3;
button[0] = "Continue";
button[1] = "Restart";
button[2] = "End Run";
//button[3] = "Exit";

buttons = array_length(button);

menu_index = 0;
last_selected = 0;
menu_x = 0;
menu_y = 0;

draw_set_font(pauseFont); //Required so string height and width can be accurately found
maxWidth = 0;
maxHeight = 0;

maxHeight = string_height_array(button);
maxWidth = string_width_array(button);
maxWidth = maxWidth * margin;
maxHeight = maxHeight * margin;

//Get xscale and yscale values to use in Draw GUI event
buttonXScale = maxWidth/sprite_get_width(buttonSprite);
buttonYScale = maxHeight/sprite_get_height(buttonSprite);