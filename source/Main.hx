package;

import flixel.FlxGame;
import inputhelper.InputHelper;
import openfl.display.Sprite;
import states.PlayState;

class Main extends Sprite
{
	public function new()
	{
		super();
		InputHelper.init();
		InputHelper.allowArrowKeys();
		InputHelper.allowWASD();
		addChild(new FlxGame(480, 270, TestState));
	}
}
