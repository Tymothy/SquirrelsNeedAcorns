// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function select_level(_increment){
	
	var _arraylength = array_length(global.levelSelectArray);
	var _value = global.selectedLevel + _increment;

	
	if(_value >= 0 && _value < _arraylength)
	{
		global.selectedLevel = _value;
		return 1;
	}
	else
	{
	return 0;
	}
}