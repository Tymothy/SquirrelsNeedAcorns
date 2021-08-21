if(live_call()) return live_result;
if(global.resolutionChanged == true)
{
	var _ww = global.GUIww;
	var _hh = global.GUIhh;
	artX = global.GUIww*.25;
	artY = global.GUIhh*.25;
	levelNameX = global.GUIww*.05;
	levelNameY = global.GUIhh*.05;
	highScoreTitleX = global.GUIww*.95;
	highScoreTitleY = levelNameY;
	modeX = _ww *.9;
	modeY = _hh *.9;
	backX = _ww*.1;
	backY = _hh*.9;
}