
function scr_send_score(_name, _score, _gamemode, _levelid){
	/// @description scr_send_score(name,score)
	/// @param name        name of the player
	/// @param score    the achieved score
	//
	// Script:      Sends the player’s score to the database in Altervista
	// Date:        2020-01-18
	// Copyright:   Appsurd
	if(database_enabled == true)
	{
		var name = url_encode(base64_encode(string(_name)));
		var args = "name=" + name 
		+ "&score=" + string(_score) 
		+ "&gamemode=" + string(_gamemode)
		+ "&levelid=" + string(_levelid)
		+ "&secret_key=3ztrpxIhVyq5";
		http_post_string("https://ftp.squirrelsneedacorns.altervista.org/Highscores/addscore.php", args);
	}
}
