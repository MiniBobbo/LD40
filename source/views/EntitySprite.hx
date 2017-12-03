package views;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.system.FlxAssets.FlxGraphicAsset;
import models.GridEntity;
import models.Point;

/**
 * This is a visual object that links the graphics to the game object.
 * @author Dave
 */
class EntitySprite extends FlxSprite 
{
	//The grid entity that this Entity Sprite represents.
	public var entity:GridEntity;
	
	//Holds the last variables to tell if something in the model changed.
	var lastLocation:Point;
	
	public function new(entity:GridEntity) 
	{
		super();
		this.entity = entity;
		var atlasFrames  = FlxAtlasFrames.fromTexturePackerJson('assets/data/atlas.png', 'assets/data/atlas.json');
		frames = atlasFrames;
		lastLocation = entity.locationOnGrid.copy();
	}
	

	
	
}