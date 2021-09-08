// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function flash_player(_flashStrength, _flashColor, _flashFrames){
	/// @arg Strength How strong of an overlay of color, 1 being no transparency, .5 being 50% transparent
	/// @arg Color What color to flash sprite as
	/// @arg Frames sets the length of the shake in frames (60 = 1 second at 60 fps)
	
	oPlayer.flashAlpha = _flashStrength;
	oPlayer.flashColor = _flashColor;
	oPlayer.flashDecrement = _flashStrength/_flashFrames
}