package views;

import flixel.tweens.FlxTween;
import models.GridEntity;
import models.Point;

/**
 * ...
 * @author Dave
 */
class PlayerSprite extends EntitySprite 
{

	var DEFAULT_FPS = 12;
	
	public function new(entity:GridEntity) 
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
	}
	
		override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (entity.facing == Facing.Left)
			flipX = false;
		else if (entity.facing == Facing.Right)
			flipX = true;

		
		if (!Point.comparePoints(lastLocation, entity.locationOnGrid)) {
			var newLoc = C.pointToPixel(entity.locationOnGrid);
			FlxTween.tween(this, {x:newLoc.x, y:newLoc.y}, C.SPEED);
			lastLocation = entity.locationOnGrid.copy();
		}
		
		
	}
	
}