/// @description Insert description here
// You can write your code in this editor
my_touch = -1; //The touch id for multitouch
image_speed = 0;
sprite = -1;

font = fTextLarge;
outline = c_white;
color = c_ltgray;

soundSuccess = sound_button_success;
soundFail = sound_button_fail;
sound = soundSuccess;

margin = 1.05;//How far around text to draw

text = "";

buttonSprite = s_button_pressable;
ableToSelect = true;
touchSelect = false;

//Save coords of inital creation
xStart = x/global.GUIww;
yStart = y/global.GUIhh;

draw_set_font(font); //Required so string height and width can be accurately found
maxWidth = 0;
maxHeight = 0;

maxHeight = sprite_get_height(s_logo_challenge); //Set the boundries of clickable area to exact sprite size
maxWidth = sprite_get_width(s_logo_challenge);//Set the boundries of clickable area to exact sprite size
maxWidth = maxWidth * margin; //Expand boundries to allow user to slightly miss the play button on sides
maxHeight = maxHeight * margin; //Expand boundries to allow user to slightly miss play button on top/bottom

//Get xscale and yscale values to use in Draw GUI event
buttonXScale = maxWidth/sprite_get_width(buttonSprite); 
buttonYScale = maxHeight/sprite_get_height(buttonSprite); 

clickTime = current_time;
doubleClick = 500; //time in ms to allow for double tap
doubleClickFlag = false; //Allow double click only when false

activate_button = function() {
	show_debug_message("Default button updated");
}

scale_button = function() {
	maxWidth = buttonXScale * sprite_get_width(buttonSprite);
	maxHeight = buttonYScale * sprite_get_height(buttonSprite);	
}

double_tap = function() {
	show_debug_message("Double tap button updated");
}

play_sound = function() {
	audio_play_sound(sound, 90, false);
}
alarm[0] = 1;