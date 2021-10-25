if(live_call()) return live_result;
if(global.resolutionChanged == true)
{
	var _ww = global.GUIww;
	var _hh = global.GUIhh;
	artX = global.GUIww*.25;
	artY = global.GUIhh*.25;
	levelNameX = global.GUIww*.5;
	levelNameY = global.GUIhh*.07;
	modeStringX = levelNameX;
	modeStringY = levelNameY+margin;
	modeX = _ww *.9;
	modeY = _hh *.9;
	backX = _ww*.1;
	backY = _hh*.9;
	usernameX = _ww*.5;
	usernameY = _hh*.9;
}

if(world != global.selectedWorld)
{
	var _selectedLevelPresent = false;
		
		world = global.selectedWorld;
			show_debug_message("Generating new buttons with the world");
		//Loop through levels to find which levels are in the correct world

		var _arrayLen = array_length(global.levelSelectArray);
		worldArr[0] = 0; //Will hold the level IDs for the selected world
		worldArrInc = 0; //Increments to be able to store the ids in order

		//Fill worldArr with all levels that match the level's world
		for(var i = 0; i < _arrayLen; i++)
		{
			//If true, levels are part of the selected world
			if(global.levelSelectArray[i].world == global.selectedWorld) 
			{
				worldArr[worldArrInc] = i;
				if(global.selectedLevel == worldArr[worldArrInc])
				{
					_selectedLevelPresent = true;
				}
				worldArrInc++;
			}
		}
		
		if(_selectedLevelPresent == false)
		{
			global.selectedLevel = worldArr[0];	
		}
		//Create the level buttons on screen
		_arrayLen = array_length(worldArr);
		var _width = 5; //How many levels wide in a row
		var _numRows = (_arrayLen / _width);

		var _xMargin = (rightLevelX - leftLevelX) / _width; //Gives the space for each level selection
		var _yMargin = (botLevelY - topLevelY) / _numRows;
		
		for(var _row = 0; _row < _numRows; _row++)
		{
			for(var _column = 0; _column < _width; _column++)
			{
				arrayVal = _column + (_row * _width);				
				if(arrayVal < _arrayLen)
				{

					var _inst = instance_create_layer(leftLevelX + _xMargin * _column + _xMargin / 2,
											topLevelY + _yMargin * _row, 
											"Levels",
											o_button_levelSelect);
					with(_inst)
					{
						level = other.worldArr[other.arrayVal];
					}
				}
			}
		//global.selectedLevel = worldArr[0];
		}
	array_delete(worldArr, 0, _arrayLen);
	
}