package models;
import models.GridEntity;
import models.GridEntity.TypeOfObject;

/**
 * The coffee pot always places a cup of coffee to the right if that spot is available.
 * @author Dave
 */
class CoffeePotObject extends GridEntity 
{
	
	
	public function new() 
	{
		super();
		type = TypeOfObject.Coffee_Pot;
	}
	
	override public function interact(sender:GridEntity) 
	{
		
	}
	
}