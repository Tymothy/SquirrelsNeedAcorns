/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
oneTimeRunFunc = function() {
	show_debug_message("OneTimeRun - Sending player down.");
		with(oPlayer)
		{
			if(ySpeed < 0)
				{
					ySpeed = ySpeed * -.5;
				}
				else
				{
					ySpeed = 0;
				}
							
				ySpeed += other.attributes.bounceStrength;
				ySpeedTemp = ySpeed;
				other.active = false;
		}
	oneTimeRun = false;
}