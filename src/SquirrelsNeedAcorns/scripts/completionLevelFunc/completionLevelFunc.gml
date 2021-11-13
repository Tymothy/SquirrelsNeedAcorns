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

		for(var i = 0; i < _arrayLen; i++)
		{			
			//Check if best time has beaten the top score
			if(global.levelSelectArray[i].compLev3 >= global.levelSelectArray[i].highScore[2])
			{
				global.levelSelectArray[i].completionLevel = 4;	//Show the top medal (gemAcorn)
			}
			
			else if(global.levelSelectArray[i].compLev2 >= global.levelSelectArray[i].highScore[2])
			{
				global.levelSelectArray[i].completionLevel = 3;	//Show the 2nd highest medal (goldAcorn)
			}	
			
			else if(global.levelSelectArray[i].compLev1 >= global.levelSelectArray[i].highScore[2])
			{
				global.levelSelectArray[i].completionLevel = 2;	//Show 3rd highest medal (silverAcorn)
			}	
			
			//Check if player has just completed the level at least once
			else if(9997 >= global.levelSelectArray[i].highScore[2])
			{
				global.levelSelectArray[i].completionLevel = 1;	//Show lowest (copperAcorn)
			}
			
			//Should not be needed, but used as a catch in case of funkiness
			else
			{
				global.levelSelectArray[i].completionLevel = 0;	//Show lowest (copperAcorn)	
			}
			
			
			
			
			////If true, at least one level of completion
			//if(global.levelSelectArray[i].compLev1 <= global.levelSelectArray[i].highScore[0])
			//{
			//	global.levelSelectArray[i].completionLevel = 1;
				
			//	if(global.levelSelectArray[i].compLev2 <= global.levelSelectArray[i].highScore[0])
			//	{
			//		global.levelSelectArray[i].completionLevel = 2;
					
			//		//Switch needed as we want to check for lower time, or higher score
			//		switch(global.GOALTYPE)
			//		{
			//			case GOALTYPE.GOAL :
			//				if(global.levelSelectArray[i].compLev3 >= global.levelSelectArray[i].highScore[2])
			//				{
			//					//Player's time is faster
			//					global.levelSelectArray[i].completionLevel = 3;
			//				}
			//			break;
						
			//			case GOALTYPE.COLLECT :
			//				if(global.levelSelectArray[i].compLev3 <= global.levelSelectArray[i].highScore[0])
			//				{
			//					//Player collected enough points for comp level 3
			//					global.levelSelectArray[i].completionLevel = 3;
			//				}
			//			break;
			//		}
			//	}
			//}
		}
}