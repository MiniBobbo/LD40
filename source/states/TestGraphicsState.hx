package states;

import defs.LevelDef;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames;
import inputhelper.InputHelper;
import inputhelper.InputHelperMenuState;
import models.CoffeeObject;
import models.CoffeePotObject;
import models.CoffeeTableObject;
import models.Grid;
import models.GridEntity;
import models.GridEntity.Facing;
import models.GridEntity.TypeOfObject;
import models.Manager;
import models.Player;
import models.Point;
import views.CoffeePotSprite;
import views.CoffeeSprite;
import views.CoffeeTableSprite;
import views.EntitySprite;
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
	
	var allObjects:Array<EntitySprite>;
	var spriteMap:Map<GridEntity, EntitySprite>; 
	
	public function new(ld:LevelDef) {
		super();
		this.ld = ld;
	}
	
	override public function create():Void
	{
		super.create();
		AfterCreate();
	}
	override public function update(elapsed:Float):Void 
	{
		var createdSprites = EntityHelper.createdSprites;
		for (i in 0...createdSprites.length) {
			var c = createdSprites.pop();
			spriteMap.set(c.entity, c);
			setSpriteToEntityLocation(c);
		}
		
		InputHelper.updateKeys(elapsed);
		playerEntity.update(elapsed);
		//manager.update(elapsed);
		super.update(elapsed);

		if(playerEntity.actionDelay <= 0 ) {
			getPlayerInput();
		}
		
		//FlxG.log.add('Carried object: ' + player.entity.isCarrying());
		//if (player.entity.isCarrying()) {
			//FlxG.log.add('Carried object: ' + cast(player.entity, Player)._itemCarried);
			//FlxG.log.add(cast (player.entity, Player)._itemCarried.carriedBy);
		//}
		
	}
	
	private function getPlayerInput() {
		if (IH.isButtonPressed("up")){
			playerEntity.facing = Facing.Up;
			grid.moveEntity(Facing.Up, playerEntity);
		}
		else if(IH.isButtonPressed("down")){
			playerEntity.facing = Facing.Down;
			grid.moveEntity(Facing.Down, playerEntity);
		}
		else if(IH.isButtonPressed("right")){
			playerEntity.facing = Facing.Right;
			grid.moveEntity(Facing.Right, playerEntity);
		}
		else if(IH.isButtonPressed("left")){
			playerEntity.facing = Facing.Left;
			grid.moveEntity(Facing.Left, playerEntity);
		}
		if (IH.isButtonJustPressed("action")){
			//var o = EntityHelper.createObject(TypeOfObject.Coffee);
			//grid.placeEntity(new Point(11, 3), o);
			var adjacentEntity,
				adjacentPoint;
			adjacentPoint = UtilityHelper.shiftPointInDirection(playerEntity.facing, playerEntity.locationOnGrid);
			adjacentEntity = grid.getEntityAtPoint(adjacentPoint);
			//FlxG.log.add('Interacting with ' + adjacentEntity);
			if(adjacentEntity!=null)
				adjacentEntity.interact(player.entity);
		}
	}
	
	function createObjects():Void 
	{
		//Create movel objects
		grid = new Grid();
		EntityHelper.initLevel(this,grid, spriteMap);

		var atlasFrames  = FlxAtlasFrames.fromTexturePackerJson('assets/data/atlas.png', 'assets/data/atlas.json');
		C.makeGridDefaultLocationsImpassable(grid);
		
		//create view objects
		bg = new FlxSprite();
		bg.frames = atlasFrames;
		bg.animation.addByPrefix('bg', 'level');
		bg.animation.play('bg');
		add(bg);
		playerEntity = cast EntityHelper.createObject(TypeOfObject.PLAYER);
		player = cast EntityHelper.spriteMap.get(playerEntity);
		manager = cast EntityHelper.createObject(TypeOfObject.MANAGER);
		managerSprite = cast EntityHelper.spriteMap.get(manager);
		manager.itemTypeAwating = TypeOfObject.COPIES;

		makeThing(TypeOfObject.COPIER, new Point(4,4)).facing = Facing.Right;
		makeThing(TypeOfObject.COPIER_SPOT, new Point(5,4)).facing = Facing.Right;
		var report = makeThing(TypeOfObject.REPORT, new Point(-2,-2));
		manager.forceReceive(cast report);
		
		playerEntity = cast player.entity;
		//grid.addGridEntity(manager);
		grid.addGridEntity(playerEntity);
		grid.placeEntity(new Point(7,0), playerEntity);
		grid.placeEntity(new Point(3,3), manager);
		
		//Create models
		var coffeePot:CoffeePotObject = cast EntityHelper.createObject(TypeOfObject.Coffee_Pot);
		var coffeeTable:CoffeeTableObject = cast EntityHelper.createObject(TypeOfObject.Coffee_Table);
		coffeePot.facing = Facing.Right;
		grid.placeEntity(new Point(8,0), coffeePot);
		grid.placeEntity(new Point(9, 0), coffeeTable);
		//grid.addGridEntity(coffee);
		//grid.placeEntity(new Point(9,2), coffee);
		//var cs = new CoffeeSprite(coffee);
		//setSpriteToEntityLocation(cs);
		
		//Create views
		var cPotSprite = cast EntityHelper.spriteMap.get(coffeePot);
		var cTableSprite = cast EntityHelper.spriteMap.get(coffeeTable);
		setSpriteToEntityLocation(cPotSprite);
		setSpriteToEntityLocation(cTableSprite);
		setSpriteToEntityLocation(managerSprite);
		setSpriteToEntityLocation(player);


		
		//var p = C.pointToPixel(playerEntity.locationOnGrid);
		//player.reset(p.x, p.y);
		//player.resetLastLocation();
		//p = C.pointToPixel(manager.locationOnGrid);
		//managerSprite.reset(p.x, p.y);
		//managerSprite.resetLastLocation();
		
		FlxG.watch.add(playerEntity, 'actionDelay');
		FlxG.watch.add(playerEntity, 'facing');
		FlxG.watch.add(playerEntity, '_itemCarried');
		FlxG.watch.add(ld, 'playerStart');

	}
	
	private function setSpriteToEntityLocation(s:EntitySprite) {
		var p = C.pointToPixel(s.entity.locationOnGrid);
		s.reset(p.x, p.y);
		s.resetLastLocation();
		add(s);
	}
	
	/**
	 * After the super.Create call run these.
	 */
	function AfterCreate():Void 
	{
		spriteMap = new Map<GridEntity, EntitySprite>();
		
		allObjects = [];
		createObjects();
		
		//FlxG.log.add('Map: ' + EntityHelper.spriteMap);
	}
	
	function makeThing(type:TypeOfObject, location:Point):GridEntity 
	{
		var report= EntityHelper.createObject(type);
		var reportSprite = cast EntityHelper.spriteMap.get(report);
		grid.placeEntity(location, report);
		return report;
	}
}
