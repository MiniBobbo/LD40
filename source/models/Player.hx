package models;
import C;

class Player extends GridEntity{
    public function new(){
        super();
        speed = C.SPEED;
    }

    
    //public var Sprite
    private var speed:Float;
    private var actionDelay:Float;
    public function update(elapsedTime:Float){
        // when we listen for keyboard input, we don't let the player
        // act unless the action delay is 0
        actionDelay -= elapsedTime;
    }    
}



