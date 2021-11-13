/// @description Insert description here
// You can write your code in this editor

event_inherited();
position = 0;
max_positions = 2; // Number of toggles button can have

activate_button = function() {
	position = (position + 1) mod max_positions;
	update_button();
	if((current_time - clickTime) < doubleClick) //1 sec == 1000
    {
        double_tap();
    }
    clickTime = current_time; // save click time (maybe there's better time keeping source than current_time)
}

update_button = function() {
	show_debug_message("Default button updated");
}