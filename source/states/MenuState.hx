package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxSave.FlxSaveStatus;
import states.TestGraphicsState;

/**
 * ...
 * @author Dave
 */
class MenuState extends FlxState 
{

	override public function create():Void 
	{
		super.create();
		
		var level = new states.TestGraphicsState(C.getLevelDef(1));
		FlxG.switchState(level);
	}
	
}