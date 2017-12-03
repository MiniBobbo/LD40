import defs.LevelDef;
import flixel.FlxG;
import flixel.math.FlxPoint;
import models.Grid;
import models.Point;
class C{
    // speed in seconds
    public static var SPEED:Float = .5;

    public static var NEXT_ID:Int = 100;

    public static var GRID_WIDTH:Int = 13;

    public static var GRID_HEIGHT:Int = 6;

	//Variables that match the display up to the grid model.
	public static var TILE_SIZE = 32;
	public static var GRID_OFFSET_X:Float = 32;
	public static var GRID_OFFSET_Y:Float = 38;
	
    public static function getNextId():Int{
        NEXT_ID ++;
        return NEXT_ID - 1;
    }
	
	/**
	 * Converts a grid point to a FlxPoint representing the upper left corner of the
	 * grid in world space.  Be careful of offsets if your sprite isn't the same as the 
	 * tile size.
	 * 
	 * @param	p	Point to convert
	 * @return		FlxPoint in grid space.
	 */
	public static function pointToPixel(p:Point):FlxPoint {
		return FlxPoint.weak(p.x*TILE_SIZE + GRID_OFFSET_X, p.y*TILE_SIZE + GRID_OFFSET_Y);
	}
	
	
	public static function getLevelDef(level:Int):LevelDef {
		var ld:LevelDef;
		switch (level) 
		{
			case 1:
				ld = {
					levelID:1,
					levelName:'Getting Started',
					quota:5,
					happinessRequirement:50,
					managerCount:1,
					requestMin:10,
					requestVar:5,
					playerStart:new Point(0,0)
				};				
			default:
				ld = {
					levelID:1,
					levelName:'Getting Started',
					quota:5,
					happinessRequirement:50,
					managerCount:1,
					requestMin:10,
					requestVar:5,
					playerStart:new Point(0,0)
				};
		}
		return ld;

	}

	public static function test(): { x:Float, y:Float } {
		return {x:1.0,y:2.0};
	}
	
	public static function makeGridDefaultLocationsImpassable(grid:Grid) {

		grid.makeImpassable(new Point(12,5));
		grid.makeImpassable(new Point(11,4));
		grid.makeImpassable(new Point(12,4));
	}
	
}