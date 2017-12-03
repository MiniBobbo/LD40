package models;

class GridEntity {

    public var Id:Int;
    public var locationOnGrid:Point;
    public var facing:Facing;
    public var canBeCarried:Bool = false;
    public var canCarry:Bool = false;
    public var actionable:Bool = false;
    
    public var type:TypeOfObject = TypeOfObject.None;
	
    public function new(){
        Id = C.getNextId();
        locationOnGrid = new Point();
        facing = Facing.None;
    }

    /**
     *  call from Grid when assigning new position
     *  
     *  @param   point 
     */
    public function setNewPosition(point:Point){
        locationOnGrid.x = point.x;
        locationOnGrid.y = point.y;
    }

    public function moved(){

    }
	
	/**
	* Determines if this person is carrying anything.
	* @return	True if currently carrying another object.  Otherwise false
	*/
	public function isCarrying():Bool {
		return false;
	}


}

enum Facing {
    Up;
    Down;
    Left;
    Right;
    None;
}

enum TypeOfObject {
    None;
    Coffee;
    Copies;
    Report;
    Box;
	Box_Button;
	Manager;
}


