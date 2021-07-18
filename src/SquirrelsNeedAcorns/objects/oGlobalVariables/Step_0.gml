/// @desc Insert description here
if (countDown > 0)
{
	countDown = max(0,countDown - delta_time/1000000);
	showCountDown = max(0,ceil(countDown));
}

else
{
	SlideTransition(TRANS_MODE.GOTO,rMainMenu);
}

