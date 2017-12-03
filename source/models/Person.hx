package models;
import models.GridEntity.TypeOfObject;

class Person extends GridEntity {

    public var itemTypeAwating:TypeOfObject = TypeOfObject.None;
    private var itemCarried:MoveableObject;

    public function new () {
        super();
        canCarry = true;
        canBeCarried = false;
    }

    public function tryReceive(object:MoveableObject):Bool {
        if(itemCarried == null && object.type == itemTypeAwating) {
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
        itemCarried = object;
    }

    private function dropCarriedObject(){
        //TODO: allow objects to relocate to the ground
        itemCarried = null;
    }

}