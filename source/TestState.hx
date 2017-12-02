package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;
import models.Player;

/**
 * ...
 * @author Dave
 */
class TestState extends FlxState 
{

	var s:FlxSprite;
	var player:Player;
	override public function create():Void 
	{
		super.create();

		var people = new FlxGroup();


		player = new Player();
		
		s = new FlxSprite(100,100);
		//s.makeGraphic(32, 32, FlxColor.BLUE);
		var atlasFrames  = FlxAtlasFrames.fromTexturePackerJson('assets/data/atlas.png', 'assets/data/atlas.json');
		s.frames = atlasFrames;
		
		s.animation.addByPrefix('run', 'worker_run', 18, true);
		s.animation.addByPrefix('carry', 'worker_carry', 18, true);
		s.animation.play('carry');
		

		add(s);
		
	}

	override public function update(elapsed:Float){
		player.update(elapsed);	
	}
}