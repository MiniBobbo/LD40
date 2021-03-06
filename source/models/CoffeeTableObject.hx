package models;
import flixel.FlxG;
import models.GridEntity;
import models.GridEntity.TypeOfObject;

/**
 * ...
 * @author Dave
 */
class CoffeeTableObject extends Person 
{

	public function new() 
	{
		super();
		type = TypeOfObject.Coffee_Table;
		itemTypeAwating = TypeOfObject.Coffee;
	}
	
	override public function interact(sender:GridEntity) 
	{
		//FlxG.log.add('Interacted with coffee table');
		if (isCarrying()) {
			tryGive(cast (sender,Person));
		}
	}
	
}