/// @description Insert description here
if(live_call()) return live_result;
if(fullscreen == true)
{
	if (browser_width != width || browser_height != height || currentRoom != room || runScaling == true)
	{
		width = browser_width;
		height = browser_height;
		
		zoom = Zoom();
	    canvas_fullscreen(base_size, zoom);
		UIScaling();

		global.view_w_half = global.GUIww/2;
		global.view_h_half = global.GUIhh/2;
		
		currentRoom = room;
		runScaling = false;
	}

}