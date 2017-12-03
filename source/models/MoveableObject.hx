package models;
import models.GridEntity.TypeOfObject;

class MoveableObject extends GridEntity {

    public var type:TypeOfObject = TypeOfObject.None;
    public function new (type:TypeOfObject){
        super();
        this.type = type;
        canBeCarried = true;
        canCarry = false;
    }
}