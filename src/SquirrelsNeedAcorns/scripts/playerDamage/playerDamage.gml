// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerDamage(){
if(global.gameOptions.damage == true)
	{
		oPlayer.playerHealth--;
	}
			if(oPlayer.playerHealth > 0)
			{
				audio_play_sound(soundHit, 10, false);
			}
			else if (oPlayer.alive == true)
			{
				audio_play_sound(soundDead, 10, false);
				oPlayer.alive = false;
			}

	ScreenShake(oCamera, 10, 30);
	flash_player(.8, c_red, oPlayer.invulnTimer);
	oPlayer.invuln = true;
}