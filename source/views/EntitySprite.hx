package views;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import models.GridEntity;
import models.MoveableObject;
import models.Point;

/**
 * This is a visual object that links the graphics to the game object.
 * @author Dave
 */
class EntitySprite extends FlxSprite 
{
	//The grid entity that this Entity Sprite represents.
	public var entity:GridEntity = null;
	
	//Holds the carry location of this entity, which is just an offset of their origin.
	public var carryOffset:FlxPoint;
	public var speechOffset:FlxPoint;
	
	//Holds the last variables to tell if something in the model changed.
	var dispFlags:Array<Bool>;
	var lastLocation:Point;
	var lastCarry:Bool;
	
	
	
	
	public function new(entity:GridEntity) 
	{
		super();
		this.entity = entity;
		var atlasFrames  = FlxAtlasFrames.fromTexturePackerJson('assets/data/atlas.png', 'assets/data/atlas.json');
		frames = atlasFrames;
		lastLocation = entity.locationOnGrid.copy();
		lastCarry = null;
		dispFlags = [];
		
		//Default the carry offset to the right of the cell.
		speechOffset = new FlxPoint(C.TILE_SIZE, 0);
		carryOffset = new FlxPoint(0, 0);
		
		for (i in 0...DisplayFlags.createAll().length) {
			dispFlags.push(false);
		}
		
		//FlxG.watch.add(this, 'dispFlags');
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		calculateDisplayFlags();
		resetDispayVariables();
		
		//If the sprite is being carried, move it to the correct place.
		if (entity.carriedBy != null) {
			//FlxG.log.add('carried');
			var parent = EntityHelper.getSpriteByModel(entity.carriedBy);
			x = parent.x + parent.carryOffset.x;
			y = parent.y + parent.carryOffset.y;
		}
	}
	
	function resetDispayVariables() 
	{
		lastCarry = entity.isCarrying();
		resetLastLocation();
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

	/**
	 * Sets the last location to the current location.  Basically jsut makes the animation not think that
	 * this entity moved.  Useful when first creating the entities.
	 */
	public function resetLastLocation() {
		lastLocation = entity.locationOnGrid.copy();
	}
	
	/**
	 * Goes through and sets all the display flags based on the entity model state.
	 */
	private function calculateDisplayFlags() {
		for (d in 0...dispFlags.length) {
			dispFlags[d] = false;
		}
		
		//Does the entity have any action delay?
		if (entity.actionDelay > 0)
			dispFlags[DisplayFlags.ACTION_DELAY.getIndex()] = true;
		//Did the entity change locations?
		if (!Point.comparePoints(entity.locationOnGrid, lastLocation))
			dispFlags[DisplayFlags.LOCATION_CHANGED.getIndex()] = true;
		//Did the entity carry or drop something?
		if (entity.isCarrying() != lastCarry){
			if (entity.isCarrying())
				dispFlags[DisplayFlags.OBJECT_CARRIED.getIndex()] = true;
			else
				dispFlags[DisplayFlags.OBJECT_LOST.getIndex()] = true;
		}
		if (entity.carriedBy != null)
			dispFlags[DisplayFlags.LOCATION_CHANGED.getIndex()] = true;
			
	}
	
	
}

enum DisplayFlags {
	LOCATION_CHANGED;
	OBJECT_CARRIED;
	OBJECT_LOST;
	ACTION_DELAY;
	IS_CARRIED;
}