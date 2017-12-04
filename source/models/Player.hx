package models;
import C;
import models.GridEntity.TypeOfObject;

class Player extends Person {
    
    //public var Sprite
    private var speed:Float;

    public function new(){
        super();
        speed = C.SPEED;
		type = TypeOfObject.PLAYER;
		itemTypeAwating = TypeOfObject.ANY;
    }

    // player always receives an item if they have hands free
    //public override function tryReceive(object:MoveableObject):Bool {
        //if(!isCarrying()) {
            //receive(object);
            //return true;
        //}
        //else return false;
    //}

    override public function interact(gridEntity:GridEntity){
        if(!gridEntity.actionable) return;
        //TODO: handle the interaction between entity and player
        
    }

    override public function update(elapsedTime:Float){
        // when we listen for keyboard input, we don't let the player
        // act unless the action delay is 0
        actionDelay -= elapsedTime;
    }    

    public override function moved(){
        actionDelay = speed; 
    }
}



