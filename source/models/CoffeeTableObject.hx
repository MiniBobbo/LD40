package models;
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
		if (isCarrying() && sender.canCarry && !sender.isCarrying()) {
			tryGive(cast (sender,Person));
		}
	}
	
}