package models;

class Point {
    public var x:Int;
    public var y:Int;

    public function copy(){
        return new Point(x,y);
    }
    public function new(x:Int = -1, y:Int = -1){
        this.x=x;
        this.y=y;
    }
	
	/**
	 * Compares two points.  
	 * @param	p1
	 * @param	p2
	 * @return			True if the points both point to the same spot.  Otherwise false.
	 */
	public static function comparePoints(p1:Point, p2:Point):Bool {
		return (p1.x==p2.x && p1.y == p2.y);
	}
}