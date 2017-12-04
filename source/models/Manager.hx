package models;
import flixel.FlxG;
import models.GridEntity;
import C;
import UtilityHelper;

/**
 * ...
 * @author Dave
 */
class Manager extends Person 
{
	public var managerType:ManagerType;
	public var name:String;
	public var title:String;
	public var happiness:Float = C.MANAGER_STARTING_HAPPINESS;
	public var currentRequest:Request;
	public var requestCountdown:Float; //set per manager type
	public var hasRequest:Bool = false;
	
	public function new(managerType:ManagerType) 
	{
		super();
		type = TypeOfObject.MANAGER;
		this.managerType = managerType;
	}

	public function updateHappiness(mod:Float){
		happiness += mod;
	}

	public function updateReqCountdown(mod:Float){
		requestCountdown += mod;
	}

	override public function update(elapsed:Float){
			// update the managers properties based on elapsed time
			if(hasRequest) updateHappiness(-elapsed); 
			else updateReqCountdown(-elapsed);
			
			// create a request for the player if the countdown timer is 0
			if(requestCountdown == 0){
				hasRequest = true;
				
				currentRequest = new Request(UtilityHelper.getRandomRequestType(););
				itemTypeAwating = currentRequest.getObjectTypeRequested();
				itemTypeCreating = currentRequest.getObjectTypeCreated();
				if(itemTypeCreating != TypeOfItem.None){
					// is it ok if we overwrite the object? because otherwise
					// the whole request is a sham
					set_ItemCarried(new MoveableObject(itemTypeCreating));
				}
				// if the manager is holding something it should be None now
				// that the current request has no item as part of the request
				else dropCarriedObject();
			}

			// fulfill the request if the manager receives the item awaited
			if(get_itemCarried() == itemTypeAwating){
				fullfillRequest();
			}
	}

	public static function fulfillRequest(){
		hasRequest = false;
		happiness += C.HAPPINESS_INCREASE_ON_COMPLETE;
		currentRequest = new Request(RequestType.None);
		requestCountdown = Std.random(6) + 10;
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