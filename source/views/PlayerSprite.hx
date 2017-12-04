package views;

import flixel.tweens.FlxTween;
import models.GridEntity;
import models.Player;
import models.Point;
import views.EntitySprite.DisplayFlags;

enum PlayerDisplayState {
	MOVING;
	STANDING;
	PICKING_UP;
	ACTION;
}

/**
 * ...
 * @author Dave
 */
class PlayerSprite extends EntitySprite 
{

	var DEFAULT_FPS = 12;
	var ps:PlayerDisplayState = PlayerDisplayState.STANDING;
	
	
	public function new(entity:Player) 
	{
		super(entity);
		animation.addByPrefix('carry', 'worker_carry', DEFAULT_FPS, true);
		animation.addByPrefix('run', 'worker_run', DEFAULT_FPS, true);
		animation.addByPrefix('stand', 'worker_stand', DEFAULT_FPS, true);
		animation.addByPrefix('hold', 'worker_hold', DEFAULT_FPS, true);
		animation.addByPrefix('press', 'worker_press', DEFAULT_FPS, true);
		animation.addByPrefix('start_pickup', 'worker_start_pickup', DEFAULT_FPS, true);
		animation.addByPrefix('mid_pickup', 'worker_mid_pickup', DEFAULT_FPS, true);
		animation.addByPrefix('end_pickup', 'worker_end_pickup', DEFAULT_FPS, true);
		animation.play('stand');
		carryOffset.set(0,-C.TILE_SIZE);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		
		if (dispFlags[DisplayFlags.LOCATION_CHANGED.getIndex()]) {
			var newLoc = C.pointToPixel(entity.locationOnGrid);
			FlxTween.tween(this, {x:newLoc.x, y:newLoc.y}, C.SPEED, {onComplete: function(_) {ps = PlayerDisplayState.STANDING; }});
			lastLocation = entity.locationOnGrid.copy();
			ps = PlayerDisplayState.MOVING;
		}
		
		//Set the anmiation after we determine the state of the player to avoid little strange things like
		//the player changing animations for a single frame.
		setAnimation();

	}
	
	/**
	 * Determines what animation should be playing based on the game state.
	 */
	private function setAnimation() {
		if (entity.facing == Facing.Left)
			flipX = false;
		else if (entity.facing == Facing.Right)
			flipX = true;
		
		switch (ps) 
		{
			case PlayerDisplayState.STANDING:
				if (entity.isCarrying())
					animation.play('hold');
				else
					animation.play('stand');
			case PlayerDisplayState.MOVING:
				if (entity.isCarrying())
					animation.play('carry');
				else
					animation.play('run');
				
			default:
				
		}
		
	}
	
}