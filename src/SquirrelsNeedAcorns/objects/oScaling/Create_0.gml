/// @description Insert description here
// You can write your code in this editor
if(live_call()) return live_result;
fullscreen = true;
//Window Items
//base_width = room_width;
//base_height = room_height;
//base_width = 1366;
//base_height = 768;

//width = base_width;
//height = base_height;
//xScale = width/base_width;
//yScale = height/base_height;


//Fullscreen items
base_size = 640;
width = browser_width;
height = browser_height;
zoom = Zoom();

canvas_fullscreen(base_size, zoom);
UIScaling();

currentRoom = 0;
runScaling = false;