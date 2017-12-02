package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxColor;
import haxe.ds.IntMap;

/**
 * ...
 * @author Dave
 */
class TestState extends FlxState 
{

	var s:FlxSprite;
	var bg:FlxSprite;
	
	override public function create():Void 
	{
		super.create();
		s = new FlxSprite(100,100);
		s.makeGraphic(32, 32, FlxColor.BLUE);
		bg = new FlxSprite();
		//bg.makeGraphic(100,100,FlxColor.BLUE);
		var atlasFrames  = FlxAtlasFrames.fromTexturePackerJson('assets/data/atlas.png', 'assets/data/atlas.json');
		bg.frames = atlasFrames;
		bg.animation.addByPrefix('bg', 'levelMockup');
		bg.animation.play('bg');
		
		var map:IntMap = new IntMap();
		map.set();
		
		
		add(s);
		add(bg);
	}
}