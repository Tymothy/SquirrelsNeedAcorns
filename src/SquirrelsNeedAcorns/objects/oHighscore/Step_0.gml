//See if user has changed the level/gamemode.  If so, get the new high scores
if(global.gameMode != currentGameMode || global.selectedLevel != currentSelectedLevel)
{
	scr_get_top_scores(player_name, lines, global.gameMode, global.selectedLevel);
	currentGameMode = global.gameMode;
	currentSelectedLevel = global.selectedLevel;
	show_debug_message("Getting new top scores...");
}