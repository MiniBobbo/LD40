package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxColor;

/**
 * ...
 * @author Dave
 */
class TestState extends FlxState 
{

	var s:FlxSprite;
	override public function create():Void 
	{
		super.create();
		s = new FlxSprite(100,100);
		//s.makeGraphic(32, 32, FlxColor.BLUE);
		var atlasFrames  = FlxAtlasFrames.fromTexturePackerJson('assets/data/atlas.png', 'assets/data/atlas.json');
		s.frames = atlasFrames;
		
		s.animation.addByPrefix('run', 'worker_run', 18, true);
		s.animation.addByPrefix('carry', 'worker_carry', 18, true);
		s.animation.play('carry');
		
		add(s);
	}
}