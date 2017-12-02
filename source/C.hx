class C{
    // speed in seconds
    public static var SPEED:Float = .5;

    public static var NEXT_ID:Int = 2;

    public static var GRID_WIDTH:Int = 13;

    public static var GRID_HEIGHT:Int = 6;

    public static function getNextId():Int{
        NEXT_ID ++;
        return NEXT_ID - 1;
    }

}