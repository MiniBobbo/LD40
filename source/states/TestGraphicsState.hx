package states;

import defs.LevelDef;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames;
import inputhelper.InputHelper;
import inputhelper.InputHelperMenuState;
import models.Grid;
import models.GridEntity.Facing;
import models.Manager;
import models.Player;
import models.Point;
import views.ManagerSprite;
import views.PlayerSprite;

class TestGraphicsState extends FlxState
{
	var IH = InputHelper;
	var ld:LevelDef;
	
	//Model objects
	var playerEntity:Player;
	var grid:Grid;
	var manager:Manager;
	

	//View objects
	var bg:FlxSprite;
	var player:PlayerSprite;
	var managerSprite:ManagerSprite;
	
	public function new(ld:LevelDef) {
		super();
		this.ld = ld;
	}
	
	override public function create():Void
	{
		super.create();
		createObjects();
		
		add(bg);
		add(player);
		add(managerSprite);
		
	}
	override public function update(elapsed:Float):Void 
	{
		InputHelper.updateKeys(elapsed);
		playerEntity.update(elapsed);
		//manager.update(elapsed);
		super.update(elapsed);

		if(playerEntity.actionDelay <= 0 ) {
			getPlayerInput();
		}
		
	}
	
	private function getPlayerInput() {
		if(IH.isButtonPressed("up")){
			grid.moveEntity(Facing.Up, playerEntity);
		}
		else if(IH.isButtonPressed("down")){
			grid.moveEntity(Facing.Down, playerEntity);
		}
		else if(IH.isButtonPressed("right")){
			grid.moveEntity(Facing.Right, playerEntity);
		}
		else if(IH.isButtonPressed("left")){
			grid.moveEntity(Facing.Left, playerEntity);
		}
		else if(IH.isButtonPressed("space")){
			var adjacentEntity,
				adjacentPoint;
			adjacentPoint = UtilityHelper.shiftPointInDirection(playerEntity.facing, playerEntity.locationOnGrid);
			adjacentEntity = grid.getEntityAtPoint(adjacentPoint);
			adjacentEntity.interact(player.entity);
		}
	}
	
	function createObjects():Void 
	{
		//Create movel objects
		grid = new Grid();
		var atlasFrames  = FlxAtlasFrames.fromTexturePackerJson('assets/data/atlas.png', 'assets/data/atlas.json');
		C.makeGridDefaultLocationsImpassable(grid);
		
		//create view objects
		bg = new FlxSprite();
		bg.frames = atlasFrames;
		bg.animation.addByPrefix('bg', 'level');
		bg.animation.play('bg');
		player = new PlayerSprite(new Player());
		manager = new Manager(ManagerType.CEO);
		managerSprite = new ManagerSprite(manager);
		playerEntity = cast player.entity;
		grid.addGridEntity(manager);
		grid.addGridEntity(playerEntity);
		grid.placeEntity(ld.playerStart, playerEntity);
		grid.placeEntity(new Point(3,3), manager);
		
		var p = C.pointToPixel(playerEntity.locationOnGrid);
		player.reset(p.x, p.y);
		player.resetLastLocation();
		p = C.pointToPixel(manager.locationOnGrid);
		managerSprite.reset(p.x, p.y);
		managerSprite.resetLastLocation();
		
		FlxG.watch.add(playerEntity, 'actionDelay');
		FlxG.watch.add(playerEntity, 'facing');
		FlxG.watch.add(ld, 'playerStart');

	}
}
