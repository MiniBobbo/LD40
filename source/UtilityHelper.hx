import models.Grid;
import models.GridEntity;
import models.MoveableObject;
import models.Point;
import models.Request;
import states.PlayState;
import views.EntitySprite;

class UtilityHelper{
	public static var currentLevelGrid:Grid;
	public static var currentLevelState:PlayState;
	
	/**
	 * Initializes the stored grid with the current level grid.  Do this at the start
	 * of each level so the UtilityHelper can generate objects.
	 * @param	grid	The current level's grid.
	 */
	public static function initLevel(levelState:PlayState, grid:Grid) {
		currentLevelGrid = grid;
		currentLevelState = levelState;
	}
	
	public static function clearLevelData() {
		currentLevelGrid = null;
		currentLevelState = null;
	}
	
	

	/**
	 * Creates a visual object from a model object and links them together in the visual object.
	 * @param	ent		Entity to create a visual object from.
	 * @return			The newly created object.  
	 */
	public static function createVisualObject(ent:GridEntity):EntitySprite {
		

	}

	public function getRandomRequestType():RequestType{
		//TODO: make this actually maintainable unlike this loser version
		var reqType:RequestType;
		switch (Std.random(2)){
			case 0: reqType = RequestType.Coffee;
			case 1: reqType = RequestType.Copies;
			default:
		}
		return reqType;
	}

	
	
	
    /**
     *  return new point based on change from moving in a direction
     *  
     *  @param   direction 
     *  @param   currentPoint 
     *  @return  Point
     */
    public static function shiftPointInDirection(direction:Facing, currentPoint:Point):Point{
        var point = currentPoint.copy();
        switch(direction){
            case Facing.Up:
                point.y--;
            case Facing.Right:
                point.x++;
            case Facing.Down:
                point.y++;
            case Facing.Left:
                point.x--;   
            default:
        }
        return point;
            
    }
}
