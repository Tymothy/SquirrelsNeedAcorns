/*
function <NAME>(_var1, _var2, _var3...) {
/// @desc ...
/// @arg ....
/// @arg ....
//CODE
}
*/
function check_highscore(_savedHighscore){
	show_debug_message("Checking to see if highscore was broken.");	
	
	if(_savedHighscore < global.points) //If high score is reached, set it
	{
		show_debug_message("New high score!");		
		return true; //Player beat high score

	}
	else 
	{
		show_debug_message("No new high score.");		
		return false; //Player did not beat high score

	}
		
}