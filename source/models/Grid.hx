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

    public function getEntityAtPoint(point:Point):GridEntity{
        var idAtPoint = gridCells[point.x][point.y];
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
        }
    }
}