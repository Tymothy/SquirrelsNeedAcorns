/// @description Insert description here
// You can write your code in this editor
if(live_call()) return live_result;
event_inherited();
position = 0;
max_positions = 2; // Number of toggles button can have

activate_button = function() {
	position = (position + 1) mod max_positions;
	update_button();
}

update_button = function() {
	show_debug_message("Default button updated");
}