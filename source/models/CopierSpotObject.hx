package models;
import models.GridEntity;
import models.GridEntity.TypeOfObject;

/**
 * ...
 * @author Dave
 */
class CopierSpotObject extends Person 
{

	public function new() 
	{
		super();
		type = TypeOfObject.COPIER_SPOT;
		itemTypeAwating = TypeOfObject.COPIES;
	}
	
	override public function interact(sender:GridEntity) 
	{
		//FlxG.log.add('Interacted with coffee table');
		if (isCarrying()) {
			tryGive(cast (sender,Person));
		}
	}
	
}