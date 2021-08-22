/*
function <NAME>(_var1, _var2, _var3...) {
/// @desc ...
/// @arg ....
/// @arg ....
//CODE
}
*/
function scr_get_all_scores(name,no_lines){
	/// @description scr_get_scores(name,no_lines)
	/// @param name            name of the player
	/// @param no_lines        the number of scores you want to display (generally 10 is fine)
	//
	// Script:      Get the highscore list from the database in Altervista
	// Date:        2020-01-18
	// Copyright:   Appsurd

	var _name = url_encode(base64_encode(string(name)));
	var args = "name="+_name+"&no_lines="+string(no_lines)+"&secret_key=3ztrpxIhVyq5";
	get_highscores = http_post_string("https://ftp.squirrelsneedacorns.altervista.org/Highscores/displayAll.php", args);
}