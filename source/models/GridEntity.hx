package models;

class GridEntity{
    public function new(){
        Id = C.getNextId();
        locationOnGrid = new Point();
        facing = Facing.None;
    }

    public var Id:Int;
    public var locationOnGrid:Point;
    public var facing:Facing;

    /**
     *  call from Grid when assigning new position
     *  
     *  @param   point 
     */
    public function setNewPosition(point:Point){
        locationOnGrid.x = point.x;
        locationOnGrid.y = point.y;
    }
}

enum Facing {
    Up;
    Down;
    Left;
    Right;
    None;
}