/*
function <NAME>(_var1, _var2, _var3...) {
/// @desc ...
/// @arg ....
/// @arg ....
//CODE
}
*/
function completionLevelFunc(){
/// @desc Updates the completion level for all levels
		var _arrayLen = array_length(global.levelSelectArray);
		
		worldArr[0] = 0; //Will hold the level IDs for the selected world
		worldArrInc = 0; //Increments to be able to store the ids in order

		//Fill worldArr with all levels that match the level's world
		for(var i = 0; i < _arrayLen; i++)
		{
			//If true, at least one level of completion
			if(global.levelSelectArray[i].compLev1 <= global.levelSelectArray[i].highScore[0])
			{
				global.levelSelectArray[i].completionLevel = 1;
				
				if(global.levelSelectArray[i].compLev2 <= global.levelSelectArray[i].highScore[0])
				{
					global.levelSelectArray[i].completionLevel = 2;
					
					//Switch needed as we want to check for lower time, or higher score
					switch(global.GOALTYPE)
					{
						case GOALTYPE.GOAL :
							if(global.levelSelectArray[i].compLev3 >= global.levelSelectArray[i].highScore[2])
							{
								//Player's time is faster
								global.levelSelectArray[i].completionLevel = 3;
							}
						break;
						
						case GOALTYPE.COLLECT :
							if(global.levelSelectArray[i].compLev3 <= global.levelSelectArray[i].highScore[0])
							{
								//Player collected enough points for comp level 3
								global.levelSelectArray[i].completionLevel = 3;
							}
						break;
					}
				}
			}
		}
}