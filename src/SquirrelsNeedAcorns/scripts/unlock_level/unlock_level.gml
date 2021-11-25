/*
function <NAME>(_var1, _var2, _var3...) {
/// @desc ...
/// @arg ....
/// @arg ....
//CODE
}
*/
function unlock_level(){
	var _arrayLen = array_length(global.levelSelectArray);

	for(var i = 0; i < _arrayLen; i++)
	{			
		if(global.acornsCollected >= global.levelSelectArray[i].unlockPoints)
		{	
			//Level is unlocked
			global.levelSelectArray[i].unlocked = true;
		}
		else
		{
			//Level is locked
			global.levelSelectArray[i].unlocked = false;	
		}
		
	}
}