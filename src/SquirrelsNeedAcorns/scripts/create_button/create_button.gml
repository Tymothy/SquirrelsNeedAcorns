// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function string_height_array(_button){
/// @desc Get maximum height of text from an array of strings
/// @arg buttons_array
	var _maxHeight = 0;
	var _buttons = array_length(_button);
	for(var i=0; i<_buttons; i++)
	{
		if (string_height(_button[i]) > _maxHeight)
		{
			_maxHeight = string_height(_button[i]);
		}
	}
	return _maxHeight;
}

function string_width_array(_button){
/// @desc Get maximum width of text from an array of strings
/// @arg buttons_array
	var _maxWidth = 0;
	var _buttons = array_length(_button);
	for(var i=0; i<_buttons; i++)
	{
		if (string_width(_button[i]) > _maxWidth)
		{
			_maxWidth = string_width(_button[i]);
		}
	}
	return _maxWidth;
}