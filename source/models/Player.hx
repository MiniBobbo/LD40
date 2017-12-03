package models;
import C;

class Player extends Person {
    
    //public var Sprite
    private var speed:Float;
    public var actionDelay:Float = 0;

    public function new(){
        super();
        speed = C.SPEED;
    }

    // player always receives an item if they have hands free
    public override function tryReceive(object:MoveableObject):Bool {
        if(get_itemCarried() == null) {
            receive(object);
            return true;
        }
        else return false;
    }

    public function update(elapsedTime:Float){
        // when we listen for keyboard input, we don't let the player
        // act unless the action delay is 0
        actionDelay -= elapsedTime;
    }    

    public override function moved(){
        actionDelay = speed; 
    }
}



