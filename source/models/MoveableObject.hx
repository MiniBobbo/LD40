package models;

class MoveableObject extends GridEntity {

    public type:TypeOfObject = TypeOfObject.None;
    public function new (type:TypeOfObject){
        super();
        this.type = type;
        canBeCarried = true;
        canCarry = false;
    }

}