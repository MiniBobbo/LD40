

class LevelBuilder{

    public static managerArray:Array<Person>;
    public function buildLevel(levelDef:LevelDef):PlayState{}
    public function InitManagers():Array<Person>{}
    public function InitPlayer():Player{}
    public function InitObjects():Array<MoveableObject>{}


    public function initEntity(type:TypeOfObject){
        
        switch(type){
             
        }
    }

    public static function makeGridDefaultLocationsImpassable(grid:Grid) {

        grid.makeImpassable(new Point(12,5));
        grid.makeImpassable(new Point(11,4));
        grid.makeImpassable(new Point(12,4));
	}
}
