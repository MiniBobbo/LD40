package models;
import models.GridEntity.TypeOfObject;

class Person extends GridEntity {

    public var itemTypeAwating:TypeOfObject = TypeOfObject.None;

    private var _itemCarried:MoveableObject;
    public function get_itemCarried(){
        return _itemCarried;
    }
    private function set_itemCarried(object:MoveableObject){
        _itemCarried = object;
    }

    public function new () {
        super();
        canCarry = true;
        canBeCarried = false;
    }

    public dynamic function tryReceive(object:MoveableObject):Bool {
        if(_itemCarried == null && object.type == itemTypeAwating) {
            receive(object);
            return true;
        }
        else return false;
    }

    public function tryGive(recipient:Person, object:MoveableObject){
            var giveSuccess = recipient.tryReceive(object); 
            if(giveSuccess) dropCarriedObject();
    }

    private function receive(object:MoveableObject){
        set_itemCarried(object);
    }

    private function dropCarriedObject(){
        //TODO: allow objects to relocate to the ground
        set_itemCarried(null);
    }

}