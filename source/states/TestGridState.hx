package states;

import models.GridEntity.Facing;
import models.Point;
import flixel.FlxState;
import flixel.text.FlxText;
import models.Grid;
import models.Player;

/**
 * ...
 * @author Dave
 */
class TestGridState extends FlxState 
{
	var grid:Grid;
	var gridText:Array<Array<FlxText>>;
	
	
	override public function create():Void 
	{
		super.create();
		grid = new Grid();
		var player = new Player();
		gridText = [];
		for (x in 0...C.GRID_WIDTH) {
			gridText.push(new Array<FlxText>());
			for (y in 0...C.GRID_HEIGHT) {
				var t = new FlxText(x*32, y*32, 32, 'test');
				gridText[x].push(t);
				add(t);
				
				
				
			}
		}
		grid.addGridEntity(player);
		grid.placeEntity(new Point(5, 5), player);
		grid.moveEntity(Facing.Up, player);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		for (x in 0...C.GRID_WIDTH) {
			for (y in 0...C.GRID_HEIGHT) {
				gridText[x][y].text = grid.gridCells[x][y] + '';
			}
		}
	}
	
	
}