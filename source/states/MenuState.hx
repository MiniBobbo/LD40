package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxSave.FlxSaveStatus;

/**
 * ...
 * @author Dave
 */
class MenuState extends FlxState 
{

	override public function create():Void 
	{
		super.create();
		level = new PlayState(C.getLevelDef(1));
		
		
		FlxG.switchState(level);
	}
	
}