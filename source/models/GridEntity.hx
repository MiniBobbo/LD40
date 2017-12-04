package models;

class GridEntity {

    public var Id:Int;
    public var locationOnGrid:Point;
    public var facing:Facing;
    public var canBeCarried:Bool = false;
    public var canCarry:Bool = false;
    public var actionable:Bool = false;
	public var carriedBy:GridEntity;
	
	public var actionDelay:Float = 0;

    
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
	 * This function is called when something interacts with this grid entity.  
	 * Overwrite this for specific actions.  Default is nothing.
	 * @param	sender		The sender of the interaction.
	 */
	public function interact(sender:GridEntity) {
		
	}
	
	/**
	* Determines if this person is carrying anything.
	* @return	True if currently carrying another object.  Otherwise false
	*/
	public function isCarrying():Bool {
		return false;
	}

	public function update(elapsed:Float) {
		actionDelay -= elapsed;
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
	Coffee_Pot;
	Coffee_Table;
    COPIES;
    REPORT;
    Box;
	Box_Button;
	MANAGER;
	PLAYER;
	ANY;
	COPIER;
	COPIER_SPOT;
}


