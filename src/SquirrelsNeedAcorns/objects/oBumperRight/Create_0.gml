/// @description Insert description here
// You can write your code in this editor
if(live_call()) return live_result;
// Inherit the parent event
event_inherited();

oneTimeRunFunc = function() {
	show_debug_message("OneTimeRun - Sending player right.");
		with(oPlayer)
		{
			if(xSpeed < 0)
			{
				xSpeed = xSpeed * -.5;
			}
			else
			{
				ySpeed = 0;
			}
							
			xSpeed += other.attributes.bounceStrength;
			xSpeedTemp = xSpeed;
		}
	oneTimeRun = false;
}