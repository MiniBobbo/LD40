package models;
import models.GridEntity.TypeOfObject;

class MoveableObject extends GridEntity {

    public function new (type:TypeOfObject){
        super();
        this.type = type;
        canBeCarried = true;
        canCarry = false;
    }
	
	public function setCarriedBy(person:Person) {
		carriedBy = person;
	}

}