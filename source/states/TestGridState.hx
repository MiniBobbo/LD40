package states;

import models.GridEntity;
import models.Point;
import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import models.Grid;
import models.Player;
import models.Person;
import models.MoveableObject;
import inputhelper.InputHelper;
import UtilityHelper;

/**
 * ...
 * @author Dave
 */
class TestGridState extends FlxState 
{
	var grid:Grid;
	var gridText:Array<Array<FlxText>>;
	var player:Player;
	var manager:Person;
	var object:GridEntity;
	var coffee:MoveableObject;
	var IH = InputHelper;
	
	override public function create():Void 
	{
		super.create();
		grid = new Grid();
		player = new Player();
		coffee = new MoveableObject(TypeOfObject.Coffee);
		
		player.tryReceive(coffee);
		manager = new Person();
		player.tryGive(manager, coffee);
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
		grid.addGridEntity(manager);
		grid.placeEntity(new Point(5, 5), player);
		grid.placeEntity(new Point(13, 1), player);
		grid.moveEntity(Facing.Up, player);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		InputHelper.updateKeys(elapsed);
		super.update(elapsed);
		for (x in 0...C.GRID_WIDTH) {
			for (y in 0...C.GRID_HEIGHT) {
				gridText[x][y].text = grid.gridCells[x][y] + '';
			}
		}

		player.update(elapsed);

		if(player.actionDelay <= 0 ) {
			getPlayerInput();
		}
		
	}
	
	private function getPlayerInput() {
		if(IH.isButtonPressed("up")){
			grid.moveEntity(Facing.Up, player);
		}
		else if(IH.isButtonPressed("down")){
			grid.moveEntity(Facing.Down, player);
		}
		else if(IH.isButtonPressed("right")){
			grid.moveEntity(Facing.Right, player);
		}
		else if(IH.isButtonPressed("left")){
			grid.moveEntity(Facing.Left, player);
		}
		else if(IH.isButtonPressed("space")){
			var adjacentEntity,
				adjacentPoint;
			adjacentPoint = UtilityHelper.shiftPointInDirection(player.facing, player.locationOnGrid);
			adjacentEntity = grid.getEntityAtPoint(adjacentPoint);
			
		}
	}

}