package;
import flixel.FlxState;
import models.Grid;
import models.GridEntity;
import models.MoveableObject;
import states.PlayState;
import views.EntitySprite;

/**
 * ...
 * @author Dave
 */
class EntityHelper 
{

	public static var currentLevelGrid:Grid;
	public static var currentLevelState:FlxState;
	
	/**
	 * Initializes the stored grid with the current level grid.  Do this at the start
	 * of each level so the UtilityHelper can generate objects.
	 * @param	grid	The current level's grid.
	 */
	public static function initLevel(levelState:FlxState, grid:Grid) {
		currentLevelGrid = grid;
		currentLevelState = levelState;
	}
	
	/**
	 * Clears the level data from the static variables.  Do this after the level is finished 
	 * and we don't need to create new objects.  Make sure to call initLevel() again before 
	 * trying to create new objects.
	 */
	public static function clearLevelData() {
		currentLevelGrid = null;
		currentLevelState = null;
	}
	
	/**
	 * Creats a new GridEntity object and adds it to the current level grid (supplied in the initLevel
	 * function).  Adds the new object to the grid.
	 * @param	type	The type of object to create.
	 * @return			The object that was created.
	 */
	public static function createObject(type:TypeOfObject):GridEntity {
		try{
			var entity:GridEntity = null;
			switch (type) 
			{
				case TypeOfObject.Coffee:
					entity = new MoveableObject(type);
				default:
					
			}
			
			return entity;
			
		} catch (err:Dynamic)
		{
			throw 'Unable to create object.   Did you remember to call initLevel()?';
		}
	}
	
	/**
	 * Creates a visual object from a model object and links them together in the visual object.
	 * @param	ent		Entity to create a visual object from.
	 * @return			The newly created object.  
	 */
	public static function createVisualObject(ent:GridEntity):EntitySprite {
		//TODO:  Make this work.
		return null;
	}

	
}