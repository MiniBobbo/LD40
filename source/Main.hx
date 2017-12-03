package;

import flixel.FlxGame;
import inputhelper.InputHelper;
import openfl.display.Sprite;
<<<<<<< HEAD
import states.PlayState;
=======
import states.MenuState;
import states.TestGridState;
>>>>>>> models

class Main extends Sprite
{
	public function new()
	{
<<<<<<< HEAD
		super();
=======
		super(); 
>>>>>>> models
		InputHelper.init();
		InputHelper.allowArrowKeys();
		InputHelper.allowWASD();
		addChild(new FlxGame(480, 270, MenuState));
		//fewafew
	}
}
