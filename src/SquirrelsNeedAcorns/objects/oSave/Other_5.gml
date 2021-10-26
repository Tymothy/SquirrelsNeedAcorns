/// @description Insert description here
// You can write your code in this editor
global.lastRoom = room;

if(room = rUsername)
{
	save_info();
}
//Save at room end
if(room == global.levelSelectArray[global.selectedLevel].roomName)
{
	show_debug_message("Saving at end of room.");
	//var _checkHighscore = 0;

	if(global.goalReached == true || global.GOALTYPE = GOALTYPE.COLLECT)
		{
		switch(global.gameMode)
		{
			case 0: //Challenge Mode
				save_highscore();
		
			break;
		
			case 1: //Zen Mode
				save_highscore();

			break;
		
			case 2: //Practice mode
		
			break;
		
		}
		//Send high score to server
		scr_send_score(global.playerName, global.points, global.gameMode, global.selectedLevel);

		save_change_money(global.points);
	}
	load_highscore();
}
