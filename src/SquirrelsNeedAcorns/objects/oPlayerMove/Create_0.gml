/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Left push

camID = view_camera[0];
camWidth = camera_get_view_width(camID);
camHeight = camera_get_view_height(camID);
topMargin = camHeight * .25; //Top quarter of screen does not provide power to player
moveLeft = 0;
moveRight = 0;