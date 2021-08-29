/// @description Insert description here
// You can write your code in this editor
if(live_call()) return live_result;
if(global.debug == true)
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_set_font(fDebug);
	
	if(instance_exists(oPlayer))
	{
		draw_text(5, 5, "xSpeed: " + string(oPlayer.xSpeed));
		draw_text(5, 15, "ySpeed: " + string(oPlayer.ySpeed));
		draw_text(5, 25, "Speed: " + string(vec2_length(oPlayer.velocity)));
		draw_text(5, 35, "Direction: " +string(oPlayer.dpad_dir));
	}
	
}