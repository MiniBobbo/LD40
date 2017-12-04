package views;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxColor;
import models.GridEntity;

/**
 * ...
 * @author Dave
 */
class CoffeeSprite extends EntitySprite 
{

	public function new(entity:GridEntity) 
	{
		super(entity);
		var atlasFrames  = FlxAtlasFrames.fromTexturePackerJson('assets/data/atlas.png', 'assets/data/atlas.json');
		frames = atlasFrames;
		animation.addByPrefix('cup', 'icons_coffee');
		animation.play('cup');
	}
	
}