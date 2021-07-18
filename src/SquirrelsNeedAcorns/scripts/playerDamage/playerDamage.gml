// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerDamage(){
			self.playerHealth--;
			//ScreenShake(oCamera, 10, 30);
				if(self.playerHealth > 0)
				{
					audio_play_sound(soundHit, 10, false);
				}
				else if (alive == true)
				{
					audio_play_sound(soundDead, 10, false);
					alive = false;
				}
			self.invuln = true;
}