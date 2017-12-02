package models;
import C;

class Player {
    public function new(){
        locationOnGrid = new Point();
        speed = C.SPEED;
    }

    public var locationOnGrid:Point;
    public var facing:Facing;
    //public var Sprite
    public var speed:Float;
    
}

enum Facing {
    Up;
    Down;
    Left;
    Right;
}
