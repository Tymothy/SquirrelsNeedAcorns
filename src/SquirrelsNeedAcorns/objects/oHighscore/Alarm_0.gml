/// @description  When the scores haven’t loaded, try again once per second
if (text2 == "")
{
    scr_get_top_scores(player_name, 5);
    text1 = "Please check your internet connection...";
    alarm[1] = room_speed;
}