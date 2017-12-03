package models;
import haxe.ds.IntMap;
import models.GridEntity.Facing;
import UtilityHelper;

class Grid {
    
    public var gridCells:Array<Array<Int>>;
    public var entityMap:IntMap<GridEntity>;

    public function new() {
        entityMap = new IntMap<GridEntity>();
        gridCells = new Array<Array<Int>>();
        for(i in 0...C.GRID_WIDTH) {
            gridCells.push( new Array<Int>() );
            for(j in 0...C.GRID_HEIGHT) {
                gridCells[i].push(0);
            }
        }
    }

    public function addGridEntity(gridEntity:GridEntity){
       entityMap.set(gridEntity.Id, gridEntity);
    }

	/**
	 * Gets the entity at a particular point from the grid.
	 * @param	point	
	 * @return		The entity at that point.  If there is no entity, returns null.
	 */
    public function getEntityAtPoint(point:Point):GridEntity{
        var idAtPoint = gridCells[point.x][point.y];
        if (!entityMap.exists(idAtPoint))
			return null;
		return entityMap.get(idAtPoint);
    }

    public function isValid(point:Point):Bool{
        if (point.x < 0 || point.y < 0 || point.x >= C.GRID_WIDTH || point.y >= C.GRID_HEIGHT) return false;
        else return true; 
    }
    public function isOpen(point:Point):Bool{
        // if out of bounds or space is not empty
        if( isValid(point) && gridCells[point.x][point.y] == 0) return true;
        else return false;
    }

    public function placeEntity(point:Point, gridEntity:GridEntity):Bool{
        if(!isOpen(point)) return false;
        gridCells[point.x][point.y] = gridEntity.Id;
        gridEntity.setNewPosition(point);
        return true;
    }

    public function removeEntity(gridEntity:GridEntity){
        gridCells[gridEntity.locationOnGrid.x][gridEntity.locationOnGrid.y] = 0;
        //TODO: check against actual grid and find if "missing"
    }

    public function moveEntity(direction:Facing, gridEntity:GridEntity){
        var current = gridEntity.locationOnGrid;
        var potentialDestination = UtilityHelper.shiftPointInDirection(direction, current);
        if(isOpen(potentialDestination)){
            removeEntity(gridEntity);
            placeEntity(potentialDestination, gridEntity);
            gridEntity.moved();
			gridEntity.facing = direction;
        }
    }
	
	/**
	 * Makes a particular location on the grid impassable.
	 * Really, just sets the ID of the grid section to 1.
	 * @param	point	The point to make impassable in grid units.
	 * @return 			True if successful.  
	 */
	public function makeImpassable(point:Point):Bool {
		if (!isValid(point))
			return false;
		gridCells[point.x][point.y] = 1;
		return true;
	}
	
	
	public function areEntitiesFacing(e1:GridEntity, e2:GridEntity):Bool {
		var checkPoint = UtilityHelper.shiftPointInDirection(e1.facing, e1.locationOnGrid);
		var checkEnt = getEntityAtPoint(checkPoint);
		if (checkEnt != null && checkEnt == e2) {
			checkPoint = UtilityHelper.shiftPointInDirection(e2.facing, e2.locationOnGrid);
			checkEnt = getEntityAtPoint(checkPoint);
				if (checkEnt != null && checkEnt == e1) {
					return true;
				}
		}
		return false;
	}

	
	/**
	 * Finds the entity that a particular entity is facing, if any.
	 * @param	entityToCheck	
	 * @return		Entity that the checked entity is facing.  Returns null if not facing anything.
	 */
	public function getObjectEntityIsFacing(entityToCheck:GridEntity):GridEntity {
		var checkPoint = UtilityHelper.shiftPointInDirection(entityToCheck.facing, entityToCheck.locationOnGrid);
		return getEntityAtPoint(checkPoint);
	}
}