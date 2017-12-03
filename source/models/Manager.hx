package models;
import flixel.FlxG;
import models.GridEntity;
import C;

/**
 * ...
 * @author Dave
 */
class Manager extends Person 
{
	public var managerType:ManagerType;
	public var name:String;
	public var title:String;
	public var happiness:Int = C.MANAGER_STARTING_HAPPINESS;
	public var currentRequest:Request;
	public var requestCountdown:Int;
	
	public function new(managerType:ManagerType) 
	{
		super();
		type = TypeOfObject.MANAGER;
		this.managerType = managerType;
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

enum ManagerType {
	CEO;
}