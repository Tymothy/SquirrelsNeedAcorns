/// @description Insert description here
// You can write your code in this editor
if(room = rEndRun)
{

	//var _checkHighscore = 0;

	
	switch(global.gameMode)
	{
		case 0: //Challenge Mode
			save_highscore();
		
			//switch(global.lastGameRoom)
			//{
			//	case rGameIce1:
			//		var _temp = save_highscore("challenge",rGameIce1,global.level1.challengeHighScore);
			//		if (_temp > 0)
			//		{
			//			global.level1.challengeHighScore = _temp;		
			//		}
			//	break;
				
			//	case rGameIce2:
			//		var _temp = save_highscore("challenge",rGameIce2,global.level2.challengeHighScore);
			//		if (_temp > 0)
			//		{
			//			global.level2.challengeHighScore = _temp;		
			//		}
				
			//	case rGameIce3:
			//		var _temp = save_highscore("challenge",rGameIce2,global.level3.challengeHighScore);
			//		if (_temp > 0)
			//		{
			//			global.level3.challengeHighScore = _temp;		
			//		}
			//	break;
			//}
		break;
		
		case 1: //Zen Mode
			save_highscore();
		
			//switch(global.lastGameRoom)
			//{
			//	case rGameIce1:
			//		var _temp = save_highscore("zen",rGameIce1,global.level1.zenHighScore);
			//		if (_temp > 0)
			//		{
			//			global.level1.zenHighScore = _temp;		
			//		}
			//	break;
				
			//	case rGameIce2:
			//		var _temp = save_highscore("zen",rGameIce2,global.level2.zenHighScore);
			//		if (_temp > 0)
			//		{
			//			global.level2.zenHighScore = _temp;		
			//		}
				
			//	case rGameIce3:
			//		var _temp = save_highscore("zen",rGameIce2,global.level3.zenHighScore);
			//		if (_temp > 0)
			//		{
			//			global.level3.zenHighScore = _temp;		
			//		}
			//	break;
				
			//}
		break;
		
		case 2: //Practice mode
		
		break;
		
	}
	
	

	save_change_money(global.points);
}
