package views;

import models.GridEntity;
import models.Manager;

/**
 * ...
 * @author Dave
 */
class ManagerSprite extends EntitySprite 
{
	
	public function new(entity:GridEntity) 
	{
		super(entity);
		//Builds the animations for this sprite
		buildAnimations();
		animation.play('stand_mad');
		carryOffset.set(0,-C.TILE_SIZE);
		
	}
	
	/**
	 * Builds the animations based on the manager type so the correct graphics are displayed.
	 * All the animations will have the same name, but different graphics.
	 */
	private function buildAnimations() {
		var m:Manager = cast entity;
		var prefix = '';
		switch (m.managerType) 
		{
			case ManagerType.CEO:
				prefix = 'CEO_';
				
			default:
				
		}
		
		//Build the animations.
		animation.addByPrefix('stand_happy', prefix + 'stand_happy');
		animation.addByPrefix('stand_unhappy', prefix + 'stand_unhappy');
		animation.addByPrefix('stand_mad', prefix + 'stand_mad');
		
	}
	
	
	
}