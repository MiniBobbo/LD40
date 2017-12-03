import models.GridEntity;
import models.Point;

class UtilityHelper{
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
