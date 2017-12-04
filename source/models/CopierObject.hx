package models;
import flixel.FlxG;
import models.GridEntity;
import models.GridEntity.TypeOfObject;

/**
 * ...
 * @author Dave
 */
class CopierObject extends Person 
{

	public function new() 
	{
		super();
		type = TypeOfObject.COPIER;
		itemTypeAwating = TypeOfObject.REPORT;
		facing = Facing.Right;
	}
	
	override public function interact(sender:GridEntity) 
	{
		cast(sender, Person).tryGive(this);
		var g:Grid = EntityHelper.currentLevelGrid;
		var e:Person = cast g.getObjectEntityIsFacing(this);
		if (isCarrying() && !e.isCarrying()) {
			
			try{
				dropCarriedObject();
				var copy = cast EntityHelper.createObject(TypeOfObject.COPIES);
				//FlxG.log.add('Created coffee: ' + coffee.type.getName());
				
				//FlxG.log.add('Trying to give coffee to ' + e.type.getName() + '.  Does it want it? ' );
				tryGive(e, copy);
				
			} catch (err:Dynamic)
			{
				FlxG.log.add(err);
			}
		}

	}
	
	
	
}