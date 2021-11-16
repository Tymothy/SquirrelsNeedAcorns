/// @description Insert description here
// You can write your code in this editor
global.lastRoom = room;

if(room = rUsername)
{
	ini_open(global.saveFile);
	save_info();
	ini_close();
}
//Save at room end

if(room == global.levelSelectArray[global.selectedLevel].roomName)
{
	//Available Points saving
	ini_open(global.saveFile);
	show_debug_message("Saving at end of room.");
	
	var _availablePoints = ini_read_real("AvailablePoints",  string(global.levelSelectArray[global.selectedLevel].saveNum), 0);
	if(check_availablePoints(_availablePoints) == true)
		{
			save_availablePoints(_availablePoints);	
		}
	
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
	ini_close();
}

if(room == rLevelSelect)
{
	ini_open(global.saveFile);
	show_debug_message("Doing level select saves");
	save_level();
	ini_close();
}