package models;
import flixel.FlxG;
import models.GridEntity;

/**
 * ...
 * @author Dave
 */
class Manager extends Person 
{
	
	
	public function new() 
	{
		super();
		type = TypeOfObject.MANAGER;
	}

	
	override public function interact(sender:GridEntity) 
	{
		//FlxG.log.add('Manager thinks, "Something is interacting with me."');

		if (sender.type == TypeOfObject.PLAYER) {
			var p:Player = cast sender;
			//FlxG.log.add('Player interacts with the manager.');
			//FlxG.log.add('Player is type ' + Std.instance(sender, Player));
			//If we are waiting on something, see if the player is trying to supply it.
			if (itemTypeAwating != TypeOfObject.None) {
			//FlxG.log.add('Manager wants something.');
				if (p.isCarrying() && p._itemCarried.type == itemTypeAwating) {
					FlxG.log.add('The Player has it.');
					p.tryGive(this);
				}
			}
			
			
		}
	}
}