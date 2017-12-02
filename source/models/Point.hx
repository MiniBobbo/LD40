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
}