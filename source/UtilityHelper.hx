import models.Grid;
import models.GridEntity;
import models.MoveableObject;
import models.Point;
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
