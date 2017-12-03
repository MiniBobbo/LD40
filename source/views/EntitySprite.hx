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
	public var entity:GridEntity = null;
	
	//Holds the last variables to tell if something in the model changed.
	var lastLocation:Point;
	
	public function new(?entity:GridEntity) 
	{
		super();
		if(entity != null)
			this.entity = entity;
		var atlasFrames  = FlxAtlasFrames.fromTexturePackerJson('assets/data/atlas.png', 'assets/data/atlas.json');
		frames = atlasFrames;
		lastLocation = entity.locationOnGrid.copy();
	}
	
	/**
	 * Sets the entity.  Use only if the entity wasn't set in the constructor.
	 * @param	entity		The entity to assign to the EntitySprite.
	 * @return				True if successful.  False if this sprite already had an entity.
	 */
	public function setEntity(entity:GridEntity):Bool {
		if (this.entity != null)
			return false;
		this.entity = entity;
		return true;
	}

	
	
}