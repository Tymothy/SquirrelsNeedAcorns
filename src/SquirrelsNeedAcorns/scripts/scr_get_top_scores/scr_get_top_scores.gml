/*
function <NAME>(_var1, _var2, _var3...) {
/// @desc ...
/// @arg ....
/// @arg ....
//CODE
}
*/
function scr_get_top_scores(name,no_lines,_gamemode,_levelid){
	/// @description scr_get_top_scores(name,no_lines)
	/// @param name            name of the player
	/// @param no_lines        the number of scores you want to display (generally 10 is fine)
	//
	// Script:      Get the highscore list from the database in Altervista, only top scores per player
	// Date:        2020-01-18
	// Copyright:   Appsurd

	var _name = url_encode(base64_encode(string(name)));
	var args = "name="+_name
	+"&no_lines="+string(no_lines)
	+ "&gamemode=" + string(_gamemode)
	+ "&levelid=" + string(_levelid)
	+"&secret_key=3ztrpxIhVyq5";
	get_highscores = http_post_string("https://ftp.squirrelsneedacorns.altervista.org/Highscores/displayTop.php", args);
}