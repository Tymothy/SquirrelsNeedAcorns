/// @description Insert description here
// You can write your code in this editor
if(global.debug == true)
{
	for(var i = 0; i < 1; i += .25)
	{
		draw_set_color(c_yellow);
		//draw vertical lines
		draw_line(global.GUIww * i, 0, global.GUIww * i, global.GUIhh);
	
		//draw horizontal lines
		draw_line(0, global.GUIhh * i, global.GUIww, global.GUIhh * i);
	}
}