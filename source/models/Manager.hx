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
		if (itemTypeAwating == TypeOfObject.None)
			return;
		if (sender.type == TypeOfObject.PLAYER) {
			var p:Player = cast sender;
			if (isCarrying()) {
				tryGive(cast (sender,Person));
			}
			//If we are waiting on something, see if the player is trying to supply it.
			if (itemTypeAwating != TypeOfObject.None) {
				if (p.isCarrying() && p._itemCarried.type == itemTypeAwating) {
					p.tryGive(this);
				}
			}
			//FlxG.log.add('Interacted with coffee table');

		}
	}
}

enum ManagerType {
	CEO;
}