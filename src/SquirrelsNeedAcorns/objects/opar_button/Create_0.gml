/// @description Insert description here
// You can write your code in this editor
my_touch = -1; //The touch id for multitouch
image_speed = 0;
sprite = -1;

font = fEthno18;
outline = c_white;
color = c_ltgray;

margin = 1.15;//How far around text to draw

text = "";
transitionLocation = 0;

buttonSprite = s_button_pressable;
ableToSelect = true;
touchSelect = false;

//Save coords of inital creation
xStart = x/global.GUIww;
yStart = y/global.GUIhh;

draw_set_font(font); //Required so string height and width can be accurately found
maxWidth = 0;
maxHeight = 0;

maxHeight = sprite_get_height(s_logo_challenge);
maxWidth = sprite_get_width(s_logo_challenge);
maxWidth = maxWidth * margin;
maxHeight = maxHeight * margin;

//Get xscale and yscale values to use in Draw GUI event
buttonXScale = maxWidth/sprite_get_width(buttonSprite);
buttonYScale = maxHeight/sprite_get_height(buttonSprite);

activate_button = function() {
	show_debug_message("Default button updated");
}