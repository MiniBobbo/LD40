package models;
import flixel.FlxG;
import models.GridEntity.TypeOfObject;

class Person extends GridEntity {

    public var itemTypeAwating:TypeOfObject = TypeOfObject.None;
    public var _itemCarried:MoveableObject;
    //public function get_itemCarried(){
        //return _itemCarried;
    //}
    private function set_itemCarried(object:MoveableObject){
		if (object == null)
		return;
        _itemCarried = object;
		FlxG.log.add(this.type.getName() + ' carrying ' + object.type.getName());
		//if(object != null)
			object.carriedBy = this;
    }

	/**
	 * Determines if this person is carrying anything.
	 * @return	True if currently carrying another object.  Otherwise false
	 */
	override public function isCarrying():Bool {
		if (_itemCarried != null)
			return true;
			
		return false;
	}
	
    public function new () {
        super();
        canCarry = true;
        canBeCarried = false;
    }

    public dynamic function tryReceive(object:MoveableObject):Bool {
        if(_itemCarried == null && (object.type == itemTypeAwating || itemTypeAwating == TypeOfObject.ANY)) {
            FlxG.log.add(type.getName() + ' wants the ' + object.type.getName());
			receive(object); 
            return true;
        }
		FlxG.log.add(type.getName() + ' does not want the ' + object.type.getName());
        return false;
    }

	/**
	 * This person tries to give an object to another entity.  If this is successful the other entity
	 * will have the object after this function completes.  This can be either the object
	 * held or another object that this knows about.  
	 * @param	recipient	Who should try to get this object?
	 * @param	object		Which object should be given?  If null, try the held obbject.
	 * @return		True if successful, otherwise false.
	 */
    public function tryGive(recipient:Person, ?object:MoveableObject):Bool{
		FlxG.log.add(type.getName() + ' is trying to give to ' + recipient.type.getName());
		var giveSuccess;
		if (object != null) {
			giveSuccess = recipient.tryReceive(object); 
		}
		else if (object == null && _itemCarried != null) {
			FlxG.log.add('No object was supplied, so trying to give the item carried');
			giveSuccess = recipient.tryReceive(_itemCarried);
		}
		else {
			FlxG.log.add(type.getName() + ' failed to give to ' + recipient.type.getName());
			giveSuccess = false;
		}
			
        if (giveSuccess && object == null) dropCarriedObject();
		
		return giveSuccess;
    }

	public function forceReceive(object:MoveableObject){
		dropCarriedObject();
		receive(object);
	}
	
    private function receive(object:MoveableObject){
        _itemCarried = object;
		object.setCarriedBy(this);
    }

    private function dropCarriedObject(removeCarriedBy:Bool = false){
        //TODO: allow objects to relocate to the ground
		if(removeCarriedBy)
			_itemCarried.carriedBy = null;
        _itemCarried = null;
		
    }

}