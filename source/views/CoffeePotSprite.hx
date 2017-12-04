package views;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxColor;
import models.GridEntity;

/**
 * ...
 * @author Dave
 */
class CoffeePotSprite extends EntitySprite 
{

	public function new(entity:GridEntity) 
	{
		super(entity);
		var atlasFrames  = FlxAtlasFrames.fromTexturePackerJson('assets/data/atlas.png', 'assets/data/atlas.json');
		frames = atlasFrames;
		animation.addByPrefix('copier', 'coffeepot_coffeepot');
		animation.play('copier');
		offset.y = 32;
	}
	
}