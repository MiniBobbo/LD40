package views;

import flixel.graphics.frames.FlxAtlasFrames;
import models.GridEntity;

/**
 * ...
 * @author Dave
 */
class CopierSprite extends EntitySprite 
{

	public function new(entity:GridEntity) 
	{
		super(entity);
		var atlasFrames  = FlxAtlasFrames.fromTexturePackerJson('assets/data/atlas.png', 'assets/data/atlas.json');
		frames = atlasFrames;
		animation.addByPrefix('copier', 'icons_copier_');
		animation.play('copier');
	}
	
	
}