package states;

import models.BoxButton;
import models.CoffeeObject;
import models.CoffeePotObject;
import models.CoffeeTableObject;
import models.GridEntity;
import models.Manager;
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
	var displayText:FlxText;
	var player:Player;
	var manager:Manager;
	var boxButton:BoxButton;
	var object:GridEntity;
	//var coffee:CoffeeObject;
	var coffeeTable:CoffeeTableObject;
	var coffeePot:CoffeePotObject;
	
	var IH = InputHelper;
	
	var TEST_GRID_SIZE = 38;
	
	override public function create():Void 
	{
		super.create();
		grid = new Grid();
		player = new Player();
		
		EntityHelper.initLevel(this, grid);
		
		//coffee = new CoffeeObject();
		//player.tryReceive(coffee);
		
		manager = new Manager(ManagerType.CEO);
		boxButton = new BoxButton();
		
		coffeePot = new CoffeePotObject();
		coffeeTable = new CoffeeTableObject();
		
		manager.itemTypeAwating = TypeOfObject.Coffee;
		
		//player.tryGive(manager, coffee);
		gridText = [];
		for (x in 0...C.GRID_WIDTH) {
			gridText.push(new Array<FlxText>());
			for (y in 0...C.GRID_HEIGHT) {
				var t = new FlxText(x*TEST_GRID_SIZE, y*TEST_GRID_SIZE, TEST_GRID_SIZE, 'test', 5);
				gridText[x].push(t);
				add(t);
			}
		}

		displayText = new FlxText(0, C.GRID_HEIGHT * TEST_GRID_SIZE, FlxG.width, '');
		add(displayText);
		
		

		grid.addGridEntity(boxButton);
		grid.placeEntity(new Point(0,0), boxButton);
		grid.addGridEntity(player);
		grid.addGridEntity(manager);
		grid.addGridEntity(coffeeTable);
		grid.addGridEntity(coffeePot);
		grid.placeEntity(new Point(5, 1), manager);
		grid.placeEntity(new Point(7, 0), coffeePot);
		grid.placeEntity(new Point(8, 0), coffeeTable);
		
		coffeePot.facing = Facing.Right;
		
		manager.facing = Facing.Left;
		manager.type = TypeOfObject.MANAGER;
		manager.itemTypeAwating = TypeOfObject.Coffee;
		grid.placeEntity(new Point(5, 5), player);
		//grid.placeEntity(new Point(13, 1), player);
		//grid.moveEntity(Facing.Up, player);
		C.makeGridDefaultLocationsImpassable(grid);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		InputHelper.updateKeys(elapsed);
		super.update(elapsed);
		for (x in 0...C.GRID_WIDTH) {
			for (y in 0...C.GRID_HEIGHT) {
				var e = grid.entityMap.get(grid.gridCells[x][y]);
				if (e != null) {
					gridText[x][y].text = e.type.getName();
					if (e.isCarrying())
						gridText[x][y].text += '\nCarrying:\n' + cast (e, Person).get_itemCarried().type.getName();
				} else {
					gridText[x][y].text = grid.gridCells[x][y] + '';
				}
			}
		}

		player.update(elapsed);

		if(player.actionDelay <= 0 ) {
			getPlayerInput();
		}
		
		//displayText.text = 'Player: ' + player.get_itemCarried();
		//displayText.text += '\nManager; ' + manager.get_itemCarried();
		
	}
	
	private function getPlayerInput() {
		if (IH.isButtonPressed("up")){
			player.facing = Facing.Up;
			grid.moveEntity(Facing.Up, player);
		}
		else if(IH.isButtonPressed("down")){
			player.facing = Facing.Down;
			grid.moveEntity(Facing.Down, player);
		}
		else if (IH.isButtonPressed("right")){
			player.facing = Facing.Right;
			grid.moveEntity(Facing.Right, player);
		}
		else if(IH.isButtonPressed("left")){
			player.facing = Facing.Left;
			grid.moveEntity(Facing.Left, player);
		}
		else if(IH.isButtonJustPressed("action")){
			//var adjacentEntity,
				//adjacentPoint;
			//adjacentPoint = UtilityHelper.shiftPointInDirection(player.facing, player.locationOnGrid);
			//adjacentEntity = grid.getEntityAtPoint(adjacentPoint);
			var e = grid.getObjectEntityIsFacing(player);
			if (e != null)
				interactWithObject(e);
		}
	}
	
	private function interactWithObject(object:GridEntity){
		displayText.text = 'Interacting with ' + object.type.getName();
			object.interact(player);
		//if (Std.is(object, Person)){
			//FlxG.log.add('Interacting with a person');
			//var p:Person = cast object;
			//player.tryGive(p);
		//} else {
			//object.interact(player);
			//
		//}
			
		
	}

}