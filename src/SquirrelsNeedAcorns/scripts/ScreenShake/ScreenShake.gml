function ScreenShake(_camInst, _shake_magnitude, _shake_length){
/// @arg Camera object to apply shake to, likely oCamera
/// @arg Magnitude sets the strength of the shake (radius in pixels)
/// @arg Frames sets the length of the shake in frames (60 = 1 second at 60 fps)

	with(_camInst)
	{
		shake_length = _shake_length;
		shake_magnitude = _shake_magnitude;
		shake_remain = _shake_magnitude;
	}
}
