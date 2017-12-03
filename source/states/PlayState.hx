package states;

import defs.LevelDef;
import flixel.FlxG;
import flixel.FlxState;
import inputhelper.InputHelperMenuState;
import models.Grid;
import models.Player;
import views.PlayerSprite;

class PlayState extends FlxState
{
	var ld:LevelDef;
	var player:PlayerSprite;
	var grid:Grid;
	
	public function new(ld:LevelDef) {
		super();
		this.ld = ld;
	}
	
	override public function create():Void
	{
		super.create();
		
<<<<<<< HEAD
		switch () 
		{
			case :
				
			default:
				
		}
=======
		createDisplayObjects();
		
		add(player);
>>>>>>> models
		
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	function createDisplayObjects():Void 
	{
		grid = new Grid();
		player = new PlayerSprite(new Player());
		grid.addGridEntity(player.entity);
		grid.placeEntity(ld.playerStart, player.entity);
		
		var p = C.pointToPixel(player.entity.locationOnGrid);
		player.reset(p.x, p.y);
	}
}
