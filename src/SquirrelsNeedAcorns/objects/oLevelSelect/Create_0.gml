
levelSelectFont = fTextLarge;
infoFont = fTextNormal;
margin = font_get_size(levelSelectFont)*1.9;


	var _ww = global.GUIww;
	var _hh = global.GUIhh;
	artX = global.GUIww*.25;
	artY = global.GUIhh*.25;
	levelNameX = global.GUIww*.5;
	levelNameY = global.GUIhh*.07;
	modeStringX = levelNameX;
	modeStringY = levelNameY+margin;
	
	modeStringY = levelNameY;
	
	modeX = _ww * .9;
	modeY = _hh * .8;
	backX = _ww * .1;
	backY = _hh * .8;
	nextWorldX = _ww * .75;
	nextWorldY = _hh * .8;
	prevWorldX = _ww * .25;
	prevWorldY = _hh * .8;
	playX = _ww * .5;
	playY = _hh * .8;
	usernameX = _ww * .5;
	usernameY = _hh*  .8;
	
	compLvlX = _ww * .87;
	compLvlY = _hh * .05;
	compLvlYMax = _hh * .23;
	xStringOffset = _ww * .037;
	
	//Place to show selected acorns collected
	acornsX = _ww * .08;
	acornsY = _hh * .08;

	//Create the area for the levelselection
	topLevelY = _hh * .4;
	botLevelY = _hh * .75;
	leftLevelX = _ww * .05;
	rightLevelX = _ww * .95;

	complete1 = spr_copperAcorn;
	complete2 = spr_silverAcorn;
	complete3 = spr_goldAcorn;
	complete4 = spr_gemAcorn;

	
	world = -1;
	
	completionLevelFunc();
	unlock_level();

if(practice_button == true)
{
	instance_create_layer(modeX, modeY, "UI_Buttons",o_button_mode);
}
instance_create_layer(backX, backY, "UI_Buttons",o_button_back);
instance_create_layer(nextWorldX, nextWorldY, "UI_Buttons", o_button_nextWorld);
instance_create_layer(prevWorldX, prevWorldY, "UI_Buttons", o_button_prevWorld);
instance_create_layer(playX, playY, "UI_Buttons", o_button_play);
//TODO: Put this in a method to be able to call
//Place levels on screen

//generateButtons = function() {
//	show_debug_message("Generating new buttons with the world");
//	//Loop through levels to find which levels are in the correct world

//	var _arrayLen = array_length(global.levelSelectArray);
//	worldArr[0] = 0; //Will hold the level IDs for the selected world
//	worldArrInc = 0; //Increments to be able to store the ids in order

//	//Fill worldArr with all levels that match the level's world
//	for(var i = 0; i < _arrayLen; i++)
//	{
//		//If true, levels are part of the selected world
//		if(global.levelSelectArray[i].world == global.selectedWorld) 
//		{
//			worldArr[worldArrInc] = i;
//			worldArrInc++;
//		}
//	}

//	//Create the level buttons on screen
//	_arrayLen = array_length(worldArr);
//	var _width = 5; //How many levels wide in a row
//	var _numRows = (_arrayLen / _width);

//	var _xMargin = (rightLevelX - leftLevelX) / _width; //Gives the space for each level selection
//	var _yMargin = (botLevelY - topLevelY) / _numRows;

//	for(var _row = 0; _row < _numRows; _row++)
//	{
//		for(var _column = 0; _column < _width; _column++)
//		{
//			arrayVal = _column + (_row * _width);
//			var _inst = instance_create_layer(leftLevelX + _xMargin * _column + _xMargin / 2,
//									topLevelY + _yMargin * _row, 
//									"Levels",
//									o_button_levelSelect);
//			with(_inst)
//			{
//				level = other.worldArr[other.arrayVal];
			
//			}

//		}

//	}

//}















