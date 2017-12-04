package;
import flixel.FlxG;
import flixel.FlxState;
import models.CoffeePotObject;
import models.CoffeeTableObject;
import models.CopierObject;
import models.CopierSpotObject;
import models.CopiesObject;
import models.Grid;
import models.GridEntity;
import models.Manager;
import models.MoveableObject;
import models.Player;
import models.ReportObject;
import states.PlayState;
import states.TestGraphicsState;
import views.CoffeePotSprite;
import views.CoffeeSprite;
import views.CoffeeTableSprite;
import views.CopierSpotSprite;
import views.CopierSprite;
import views.CopiesSprite;
import views.EntitySprite;
import views.ManagerSprite;
import views.PlayerSprite;
import views.ReportSprite;

/**
 * ...
 * @author Dave
 */
class EntityHelper 
{

	public static var currentLevelGrid:Grid;
	public static var currentLevelState:FlxState;
	public static var createdSprites:Array<EntitySprite>;
	public static var spriteMap:Map<GridEntity, EntitySprite>;
	
	/**
	 * Initializes the stored grid with the current level grid.  Do this at the start
	 * of each level so the UtilityHelper can generate objects.
	 * @param	grid	The current level's grid.
	 */
	public static function initLevel(levelState:FlxState, grid:Grid, sMap:Map<GridEntity, EntitySprite>) {
		FlxG.log.add('initLevel run');
		currentLevelGrid = grid;
		currentLevelState = levelState;
		createdSprites = [];
		spriteMap = sMap;
	}
	
	/**
	 * Gets a sprite model by the model
	 * @param	model
	 * @return	The Entity Sprite.
	 */
	public static function getSpriteByModel(model:GridEntity):EntitySprite {
		//FlxG.log.add('Can we find ' + model.type.getName() + ': ' + spriteMap.exists(model));
		return spriteMap.get(model);
	}
	/**
	 * Clears the level data from the static variables.  Do this after the level is finished 
	 * and we don't need to create new objects.  Make sure to call initLevel() again before 
	 * trying to create new objects.
	 */
	public static function clearLevelData() {
		currentLevelGrid = null;
		currentLevelState = null;
		createdSprites = null;
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
				case TypeOfObject.PLAYER:
					entity = new Player();
				case TypeOfObject.Coffee_Pot:
					entity = new CoffeePotObject();
				case TypeOfObject.Coffee_Table:
					entity = new CoffeeTableObject();
				case TypeOfObject.MANAGER:
					entity = new Manager(ManagerType.CEO);
				case TypeOfObject.COPIER:
					entity = new CopierObject();
				case TypeOfObject.COPIER_SPOT:
					entity = new CopierSpotObject();
				case TypeOfObject.COPIES:
					entity = new CopiesObject();
				case TypeOfObject.REPORT:
					entity = new ReportObject();
					
				default:
					
			}
			currentLevelGrid.addGridEntity(entity);
			var visual = createVisualObject(entity);
			createdSprites.push(visual);
			spriteMap.set(entity, visual);
			
			return entity;
			
		} catch (err:Dynamic)
		{
			throw err;
		}
	}
	
	/**
	 * Creates a visual object from a model object and links them together in the visual object.
	 * @param	ent		Entity to create a visual object from.
	 * @return			The newly created object.  
	 */
	public static function createVisualObject(ent:GridEntity):EntitySprite {
		//TODO:  Make this work.
		var sprite:EntitySprite = null;
		switch (ent.type) 
		{
			case TypeOfObject.PLAYER:
				sprite = new PlayerSprite(cast ent);
			case TypeOfObject.Coffee:
				sprite = new CoffeeSprite(cast ent);
			case TypeOfObject.Coffee_Pot:
				sprite = new CoffeePotSprite(cast ent);
			case TypeOfObject.Coffee_Table:
				sprite = new CoffeeTableSprite(cast ent);
			case TypeOfObject.MANAGER:
				sprite = new ManagerSprite(cast ent);
			case TypeOfObject.COPIER:
				sprite = new CopierSprite(cast ent);
			case TypeOfObject.COPIER_SPOT:
				sprite = new CopierSpotSprite(cast ent);
			case TypeOfObject.COPIES:
				sprite = new CopiesSprite(cast ent);
			case TypeOfObject.REPORT:
				sprite = new ReportSprite(cast ent);
				
			
				
			default:
				return null;
		}
		return sprite;
	}

	
}