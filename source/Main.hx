package;

import flixel.FlxGame;
import inputhelper.InputHelper;
import openfl.display.Sprite;
import states.PlayState;
import states.MenuState;
import states.TestGridState;

class Main extends Sprite
{
	public function new()
	{
		super();
		super(); 
		InputHelper.init();
		InputHelper.addButton('action');
		InputHelper.assignKeyToButton('SPACE', 'action');
		InputHelper.allowArrowKeys();
		InputHelper.allowWASD();
		addChild(new FlxGame(480, 270, MenuState));
	}
}
