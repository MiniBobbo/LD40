package models;
import flixel.FlxG;
import models.GridEntity;
import models.GridEntity.TypeOfObject;

/**
 * The coffee pot always places a cup of coffee to the right if that spot is available.
 * @author Dave
 */
class CoffeePotObject extends Person 
{
	//This is the number of cups of coffee this pot can generate before it needs to be refreshed.
	public var coffeeCount:Int = 3;
	
	public function new() 
	{
		super();
		type = TypeOfObject.Coffee_Pot;
		itemTypeAwating = TypeOfObject.Coffee;
		facing = Facing.Right;
	}
	
	override public function interact(sender:GridEntity) 
	{
		var g:Grid = EntityHelper.currentLevelGrid;
		var e:Person = cast g.getObjectEntityIsFacing(this);
		if (!isCarrying() && !e.isCarrying()) {
			var coffee:CoffeeObject = cast EntityHelper.createObject(TypeOfObject.Coffee);
			//FlxG.log.add('Created coffee: ' + coffee.type.getName());
			tryReceive(coffee);
			//FlxG.log.add('Trying to give coffee to ' + e.type.getName() + '.  Does it want it? ' );
			tryGive(e);
		}
	}
	
}